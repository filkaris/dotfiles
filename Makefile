install:
	./setup/install
update:
	./setup/update
status:
	./setup/status
xbindkeys-restart:
	pkill xbindkeys && xbindkeys -f ~/.config/xbindkeys/config
