import sys
import can
import time

can_bus = can.interface.Bus(channel='can0', bustype='socketcan')

boards = [0x201, 0x202, 0x203]

while True:
    packet = bytearray([140,140,140,140,140,140,140,140])
    for cid in boards:
	can_tx = can.Message(arbitration_id=cid, data=packet, extended_id=False)

	can_bus.send(can_tx, timeout=0.001)

	print(cid, list(packet))
    time.sleep(0.3)

    packet = bytearray([140,140,140,140,127,127,127,127])
    for cid in boards:
	can_tx = can.Message(arbitration_id=cid, data=packet, extended_id=False)
        can_bus.send(can_tx, timeout=0.001)

	print(cid, list(packet))
    time.sleep(0.3)
