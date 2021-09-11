#!/bin/env python3

import os
import binascii
import subprocess
from evdev import InputDevice, categorize, ecodes

# In case it changes, run this
# cat /proc/bus/input/devices | grep HCT -A 4
# and find the appropriate eventXX number
command = "cat /proc/bus/input/devices | grep HCT -A 4 | head -5 | tail -1 | cut -d' ' -f 5"
eventNum = subprocess.check_output([command],shell=True).decode("utf-8").rstrip()

# No HCT device
if not eventNum:
    print("No HCT Device found")
    quit()

dev = InputDevice('/dev/input/'+eventNum)
dev.grab()

print("Listening for Input")
for event in dev.read_loop():
    if event.type == ecodes.EV_KEY:
        key = categorize(event)
        if key.keystate == key.key_down:
            # Dev fund4all
            if key.keycode == "KEY_NUMLOCK":
                # os.system('i3-msg workspace 1 && i3-msg exec alacritty && sleep 0.5 && xdotool type "dev fund4all\n" && firefox http://localhost:8080 &')
                os.system('/usr/bin/notify-send TODO')
            if key.keycode == "KEY_KPSLASH":
                os.system('pacmd set-default-sink alsa_output.pci-0000_07_00.6.analog-stereo')
                os.system('notify-send "Default Audio: SPEAKERS"')
            if key.keycode == "KEY_KPASTERISK":
                os.system('pacmd set-default-sink alsa_output.usb-audio-technica_AT2020USB_-00.analog-stereo')
                os.system('notify-send "Default Audio: HEADSET"')
            if key.keycode == "KEY_KPMINUS":
                os.system('crypto-status')

            if key.keycode == "KEY_KP7":
                os.system('screen-landscape')
            if key.keycode == "KEY_KP8":
                os.system('screen-portrait')
            if key.keycode == "KEY_KP9":
                os.system('screen-select')
            if key.keycode == "KEY_KPPLUS":
                os.system('/usr/bin/notify-send TODO')

            if key.keycode == "KEY_KP4":
                os.system('curl desktimer/on && notify-send "Timer set: 25min"')
            if key.keycode == "KEY_KP5":
                os.system('curl desktimer/off && notify-send "Clear Timer"')
            if key.keycode == "KEY_KP6":
                os.system('/usr/bin/notify-send TODO')
            if key.keycode == "KEY_BACKSPACE":
                os.system('/usr/bin/notify-send TODO')

            if key.keycode == "KEY_KP1":
                # TODO ICON
                os.system('xdotool mousedown 3')
            if key.keycode == "KEY_KP2":
                # TODO ICON
                os.system('xdotool mouseup 3')
            if key.keycode == "KEY_KP3":
                os.system('setxkbmap -layout us,gr -option grp:alt_shift_toggle; setxkbmap -option caps:escape ')

            if key.keycode == "KEY_KP0":
                os.system('xdotool type "fil\tphil.230+'+binascii.b2a_hex(os.urandom(3)).decode()+'@gmail.com\tasdfasdf\tasdfasdf\t "')
            # WARNING, 000 just presses KEY_0 3 times. hard to map a macro here
            if key.keycode == "KEY_0":
                os.system('/usr/bin/notify-send TODO')
            if key.keycode == "KEY_KPDOT":
                os.system('/usr/bin/notify-send TODO')
            # Kill all open apps
            if key.keycode == "KEY_KPENTER":
                # os.system('i3-msg [class=".*"] kill')
                os.system('/usr/bin/notify-send TODO')


# Ways to call OS commands
# os.system('/usr/bin/notify-send '+key.keycode)
# subprocess.call(['/usr/bin/notify-send','hi'])
# subprocess.Popen(['/usr/bin/notify-send','hi'])

# Key Reference
# KEY_NUMLOCK
# KEY_KPSLASH
# KEY_KPASTERISK
# KEY_KPMINUS

# KEY_KP7
# KEY_KP8
# KEY_KP9
# KEY_KPPLUS

# KEY_KP4
# KEY_KP5
# KEY_KP6
# KEY_BACKSPACE

# KEY_KP1
# KEY_KP2
# KEY_KP3

# KEY_KP0
# KEY_KPDOT
# KEY_KPENTER

