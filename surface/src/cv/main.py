#!/usr/bin/python
'''
	Author: Igor Maculan - n3wtron@gmail.com
	A Simple mjpg stream http server

	Thanks bb
'''
import cv2
from PIL import Image
import threading
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
from SocketServer import ThreadingMixIn
import StringIO
import time
import atexit


capture = None
server = None
face_cascade = cv2.CascadeClassifier('/home/ivan/ROV/X12-Core/surface/src/cv/haarcascade_frontalface_default.xml')

def exit_handler():
	capture.release()
	server.socket.close()


class StreamHandler(BaseHTTPRequestHandler):
	def do_GET(self):
		if self.path.endswith('.mjpg'):
			self.send_response(200)
			self.send_header('Content-type','multipart/x-mixed-replace; boundary=--jpgboundary')
			self.end_headers()
			while True:
				try:
					rc, img = capture.read()
					if not rc:
						continue

					# CV Process
					gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
					faces = face_cascade.detectMultiScale(gray, 1.1, 4)
					
					imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
					imgRGB = cv2.putText(imgRGB, 'I am the code', (10,450), cv2.FONT_HERSHEY_SIMPLEX, 3, (0, 255, 0), 2, cv2.LINE_AA)

					for x, y, w, h in faces:
						imgRGB = cv2.rectangle(imgRGB, (x, y), (x+w, y+h), (255, 0, 0), 2)

					# Output to server
					jpg = Image.fromarray(imgRGB)
					tmpFile = StringIO.StringIO()
					jpg.save(tmpFile,'JPEG')
					self.wfile.write("--jpgboundary")
					self.send_header('Content-type','image/jpeg')
					self.send_header('Content-length', str(tmpFile.len))
					self.end_headers()
					jpg.save(self.wfile,'JPEG')
					time.sleep(0.05)
				except KeyboardInterrupt:
					break
			return


class ThreadedHTTPServer(ThreadingMixIn, HTTPServer):
	"""Handle requests in a separate thread."""

def main():
	global capture
	global img

	atexit.register(exit_handler)
	capture = cv2.VideoCapture('http://192.168.1.6:8090/test.mjpg')
	try:
		server = ThreadedHTTPServer(('localhost', 8080), StreamHandler)
		print 'Camera Stream Started'
		server.serve_forever()
	except KeyboardInterrupt:
		capture.release()
		server.socket.close()

if __name__ == '__main__':
	main()