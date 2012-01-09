#!/usr/bin/python3
# Created by Pathogen @ www.hakhub.tk

import datetime
import subprocess 
import re, os
import pyinotify

class MyEventHandler(pyinotify.ProcessEvent):
	lastlog=datetime.datetime.now()
	fallidos=0
	validos=0
	def process_IN_MODIFY(self, event):
		cat = subprocess.check_output("cat /var/log/messages| grep -i sshd",shell=True)
		for line in cat.split(b'\n'):
			d=str(datetime.datetime.now().year)+" " + line[:-len(line)+15].decode('UTF-8')
			if line.find(b'pam_unix(sshd:auth): authentication failure')!=-1:
				try:
					nueva=datetime.datetime.strptime(d, '%Y %b %d %H:%M:%S')
				except:
					print("error parsing date")
				if self.lastlog<nueva:
					self.fallidos=self.fallidos+1
					os.system("espeak -v es 'Conexión remota fallida número {0}' >& /dev/null".format(self.fallidos))
					self.lastlog=nueva
					print (line[:-1])
			elif line.find(b'pam_unix(sshd:session): session opened for user ')!=-1:
				try:
					nueva=datetime.datetime.strptime(d, '%Y %b %d %H:%M:%S')
				except:
					print("error parsing date")
				if self.lastlog<nueva:
					self.validos=self.validos+1
					os.system("espeak -v es 'Conexión remota aceptada número {0}' >& /dev/null".format(self.validos))
					self.lastlog=nueva
					print (line[:-1])

def main():

	# watch manager
	wm = pyinotify.WatchManager()
	wm.add_watch('/var/log/messages', pyinotify.ALL_EVENTS, rec=True)

	# event handler
	eh = MyEventHandler()

	# notifier
	notifier = pyinotify.Notifier(wm, eh)
	notifier.loop()


main()
