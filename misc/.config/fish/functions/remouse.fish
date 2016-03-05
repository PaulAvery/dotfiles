function remouse
	sudo rmmod psmouse
	sudo modprobe psmouse resetafter=0
end;
