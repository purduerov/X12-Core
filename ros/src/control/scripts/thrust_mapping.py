from numpy import linalg
import numpy as np

# Measurements ripped from Complex_1.py. We'll probably need to remeasure and calibrate a lot of these,
# then this comment should be updated describing our process and where all the numbers came from.
#
# All measurements are based on:
#	X: LEFT/RIGHT MOTION OF THE ROV. LEFT = +X
#	Y: FORWARD/BACK. FORWARD = +Y = SIDE THE ROV CLAW IS ON
#	Z: UP/DOWN. UP = +Z
#
#	PITCH: TILT FORWARD/BACK. +PITCH TILTS FORWARD (LOOK DOWN). USE RIGHT HAND RULE ON X AXIS.
#	ROLL: ROLL LEFT/RIGHT. +ROLL ROLLS LEFT. USE NEGATIVE RIGHT HAND RULE ON Y AXIS.
#	YAW: ROTATE LEFT/RIGHT. +YAW ROTATES RIGHT. USE NEGATIVE RIGHT HAND RULE ON Z AXIS.
#

# When a percent power is requested, this direction scale is used to calculate the output vector. The reason
# for scaling this is that when xxx motion is requested in one direction and yyy motion is requested in another,
# the ROV might be much stronger in one of those directions. e.g., the ROV can move up/down very fast, so if we
# request 100% forward and 100% up, the ROV will move almost entirely upward. This can get real wonky with rotation
# too. To make a direction stronger, increase its number here, and to make it weaker, decrease its number here.
# Keep them all real numbers >= 1.
# 			X	Y	Z	P	R	Y
DIRECTION_SCALE = [	10, 	10, 	5, 	5, 	5, 	5]

# How similar desired and output vectors must be. If a desired force is not possible, algo will pump out as much power
# as possible in the exact direction. Then, it will add in additional force if possible, as long as any additional force
# is close enough to the needed additional force. Value is scaled from 0 to 1, 1 for exact vectors only, and 0 for
# fuckit let's go places.
SIMILARITY_MINIMUM = .9
# If we already yield >= this amount of the desired force, then break
PERCENT_DESIRED_FORCE_YIELDED = .95
# Values beneath this are assumed to be zero because of double rounding
ZERO_ROUND_THRESHOLD = .0001
# Thruster thrust limits. THRUST_MIN is max reverse thrust
THRUST_MIN = -5.2646999999999995
THRUST_MAX = 6.0633750000000015

# Center of mass coordinates relative to our measurement point
COM_X = 0.0#0.056 * 0.0254
COM_Y = 0.0#-0.1256 * 0.0254
COM_Z = 5.198 * 0.0254

# Thruster locations relative to the measurement point of the ROV.
#				X	Y	Z
location = np.matrix([	[	6.75,	-6.25,	5.58], # Thruster 1
			[	6.75,	6.25,	5.58], # Thruster 2
			[	-6.75,	6.25,	5.58], # Thruster 3
			[	-6.75,	-6.25,	5.58], # Thruster 4
			[	4,	-7,	12.45], # Thruster 5
			[	4,	7,	12.45], # Thruster 6
			[	-4,	7,	12.45], # Thruster 7
			[	-4,	-7,	12.45]]) # Thruster 8
location *=  0.0254

# Directions the thrust forces point. MUST BE UNIT VECTORS.
# NOTE
# THIS IS NOT THE DIRECTIONS THE THRUSTERS POINT. IT IS THE DIRECTION IN WHICH POSITIVE FORCE IS DEFINED FOR A THRUSTER.

XCOMP = np.sin(7 * np.pi / 18)
YCOMP = np.cos(7 * np.pi / 18)

#				X	Y	Z
direction = np.matrix([	[	XCOMP,	YCOMP,	0], # Thruster 1
			[	XCOMP,	-YCOMP,	0], # Thruster 2
			[	-XCOMP,	-YCOMP,	0], # Thruster 3
			[	-XCOMP,	YCOMP,	0], # Thruster 4
			[	0,	0,	1], # Thruster 5
			[	0,	0,	1], # Thruster 6
			[	0,	0,	1], # Thruster 7
			[	0,	0,	1]]) # Thruster 8

# Assert all direction vectors are unit vectors (+- 1% for rounding)
for vector in direction:
	assert abs(vector[0,0] ** 2 + vector[0,1] ** 2 + vector[0,2] ** 2 - 1) < .01, 'DIRECTION VECTORS MUST BE UNIT VECTORS'


class ThrustMapper():
	def __init__(self):
		self.location = np.copy(location)
		self.direction = np.copy(direction)
		self.torque = None
		self.changeOriginLocation(COM_X, COM_Y, COM_Z)
		self.thrusterForceMap = None
		self.createThruserForceMap()

	# Changes the origin location to the given location.
	# relX = the new X origin relative to the current X origin
	# relY = the new Y origin relative to the current Y origin
	# relZ = the new Z origin relative to the current Z origin
	def changeOriginLocation(self, relX, relY, relZ):
		for i in range(0, len(self.location)):
			self.location[i][0] = self.location[i][0] - relX
			self.location[i][1] = self.location[i][1] - relY
			self.location[i][2] = self.location[i][2] - relZ

		self.calcTorqueValues()

	# Calculates the torque matrix using the location matrix and the direction matrix.
	# Resulting torque values be an 3x8 array with a [pitch, roll, yaw] entry for each thruster.
	def calcTorqueValues(self):
		torque = []
		for i in range(0, len(self.location)):
			# PITCH = Ly * Dz - Lz * Dy
			# ROLL = -Lx * Dz + Lz * Dx
			# YAW   = Lx * Dy - Ly * Dx
			torque.append(-np.cross(self.location[i], self.direction[i]))
		self.torque = np.matrix(torque)

	# Concatenates the direction and torque vectors into a single array
	# Result is an 6x8 array. One column per thruster, one row per direction/torque. Rows are ordered x, y, z, pitch, roll, yaw.
	# Columns are ordered by thruster
	def createThruserForceMap(self):
		assert len(self.direction) == len(self.torque), 'Initialize direction and torque first!'
		self.thrusterForceMap = np.concatenate((np.transpose(self.direction), np.transpose(self.torque)))

	# Calculates thruster output. Desired force should be a 6-dimensional vector, x, y, z, pitch, roll, yaw
	# Output is an 8-d vector of the thrust of each thruster
	def calculateThrusterOutput(self, desiredForce):
		thrustLeft = np.copy(self.thrusterForceMap)
		outputNeeded = np.transpose(np.matrix((desiredForce,), dtype=np.float))
		outputThrust = np.transpose(np.matrix(np.zeros((len(location))), dtype=np.float))
		#for i in range(0, len(desiredForce)):

		##print(outputThrust)
		while thrustLeft.size > 0:
			# Calculate least-squares thrust map to output using linear algebra
			#print('Thrust left: ')
			#print(thrustLeft)
			psuedoInv = linalg.pinv(thrustLeft)
			#print('Pinv:')
			#print(psuedoInv)
			#print('Output still needed:')
			#print(outputNeeded)
			#print('Current output:')
			#print(np.matmul(self.thrusterForceMap, outputThrust))
			thrusterForceIteration = np.matmul(psuedoInv, outputNeeded)
			##print('Thruster force iteration:')
			##print(thrusterForceIteration)
			additionalOutput = np.matmul(self.thrusterForceMap, thrusterForceIteration)
			if np.linalg.norm(outputNeeded) < ZERO_ROUND_THRESHOLD:
				break
			##print(additionalOutput)
			# If accurate additional force not possible, break
			similarity = np.dot(np.transpose(outputNeeded), additionalOutput) \
				     / (np.linalg.norm(outputNeeded) * np.linalg.norm(additionalOutput))
			#print('Vector similarity: %s' % str(similarity))
			if similarity < SIMILARITY_MINIMUM:
				break

			# Scale down force if overloading a thruster
			scaleDownMultiplier = 1
			scaleDownIndex = -1
			for i in range(0, thrusterForceIteration.size):
				currentOutput = outputThrust[i]
				additionalOutput = thrusterForceIteration[i]
				#print('Current output for thruster %d: %s. Additional: %s' % (i, currentOutput, additionalOutput))
				if abs(additionalOutput) <= ZERO_ROUND_THRESHOLD:
					continue
				thrusterScale = 1
				if currentOutput + additionalOutput > THRUST_MAX:
					thrusterScale = (THRUST_MAX - currentOutput) / additionalOutput
				if currentOutput + additionalOutput < THRUST_MIN:
					thrusterScale = (THRUST_MIN - currentOutput) / additionalOutput
				if thrusterScale < scaleDownMultiplier:
					#print('Scaling down to %f' % thrusterScale)
					scaleDownMultiplier = thrusterScale
					scaleDownIndex = i

			# If a thruster is maxed, disable it in further calculation
			if scaleDownIndex != -1:
				#print('Scaling down by multiplier %d' % scaleDownMultiplier)
				thrusterForceIteration *= scaleDownMultiplier
				#print('Thrust left: ')
				#print(thrustLeft)
				#print('Zeroing column %d' % scaleDownIndex)
				thrustLeft[:, scaleDownIndex] = 0
				#print('New thrust left:' )
				#print(thrustLeft)

			outputThrust += thrusterForceIteration
			outputNeeded -= np.matmul(self.thrusterForceMap, thrusterForceIteration)
			#print('Thrust calculated: ')
			#print(outputThrust)
			#print('Output still needed: ')
			#print(outputNeeded)
			if np.linalg.norm(outputNeeded) < np.linalg.norm(desiredForce) * (1 - PERCENT_DESIRED_FORCE_YIELDED):
				break
			#print('Restarting!!!!!!!!!!!!!!!!')

		return np.transpose(outputThrust).tolist()[0]

	# Have all percents 0-1. 6-d vector, just like calculateThrusterOutput
	# Converts desired percent into a weighted thrust vector in the desired direction. To find 100% thrust
	# in that direction, multiply desired by a huge constant then calcualate thrust. Once the 100% thrust vector
	# is found, multiply by the desired percent in each direction
	def calculateThrusterOutputFromPercent(self, desiredPercent):
		BIG_CONSTANT = 1000000
		scaledThrust = []
		for i in range(0, len(desiredPercent)):
			scaledThrust.append(desiredPercent[i] * DIRECTION_SCALE[i] * BIG_CONSTANT)
		maxThrustInDirection = self.calculateThrusterOutput(scaledThrust)

		# Assume the largest percent is leading the direction, scale down by largest percent in vector
		for i in range(0, len(maxThrustInDirection)):
			maxThrustInDirection *= max(desiredPercent)

		return maxThrustInDirection

	def thrusterOutputToNetForce(self, output):
		return np.matmul(self.thrusterForceMap, np.transpose(np.array(output))).tolist()

	def thrustToTotalForce(self, thrust):
		return np.matmul(self.thrusterForceMap, thrust)

	# Blindly copied from Complex_1. Check these values at some point please
	def thrustToPWM(self, thrustVal):
		if thrustVal < -ZERO_ROUND_THRESHOLD:
		    pwm = 0.0021 * (thrustVal ** 3) + 0.0298 * (thrustVal ** 2) + 0.2426 * thrustVal - 0.0775
		elif thrustVal > ZERO_ROUND_THRESHOLD:
		    pwm = 0.0017 * (thrustVal ** 3) - 0.025 * (thrustVal ** 2) + 0.213 * thrustVal + 0.0675
		else:
		    # assume 0 even though dead band has range of pwm values
		    pwm = 0
		return pwm

	def thrustVectorToPWM(self, thrustVector):
		return list(self.thrustToPWM(i) for i in thrustVector)
