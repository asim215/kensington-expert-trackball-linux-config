#!/usr/bin/env bash

## Desirable Buttons Map
# LClick MClick
#
# Back RClick
#
# P - Position
# B - Button
# P: 1 2 3 4 5 6 7 8 9
# B: 8 1 3 4 5 6 7 2 9
## get current button map
## xinput --get-button-map 10

## Buttons meaning:
# 1 - LClick
# 2 - MClick
# 3 - RClick
# 8 - Back

## Position of buttons on device
# 2   8
#
# 1   3

## Acceleration
## 3 modes available: (0, 0), (0, 1), (1, 0)
### Acceleration ON => ACC, NORMAL
### xinput set-prop 10 "libinput Accel Profile Enabled" 0, 0
### Acceleration OFF => NO ACC, SLOW
### xinput set-prop 10 "libinput Accel Profile Enabled" 0, 1
### Acceleration ON => ACC, FAST
### xinput set-prop 10 "libinput Accel Profile Enabled" 1, 0

mouse_name="Kensington Expert Mouse"

check=$(xinput | grep "$mouse_name")

if [[ ! -z "$check" ]]; then
  # get id
	mouse_id=$(xinput | grep "$mouse_name" | sed 's/^.*id=\([0-9]*\)[ \t].*$/\1/')

  # set layout 
	xinput set-button-map $mouse_id 8 1 3 4 5 6 7 2 9

  # set on acceleration
  xinput set-prop $mouse_id "libinput Accel Profile Enabled" 0, 0

  # Scroll Button
  ### allow speed scrolling by moving ball and at holding chosen button position
  ### enable scroll button+ball
	xinput set-prop $mouse_id "libinput Scroll Method Enabled" 0, 0, 1

  ## set to position 3:
  ### for my usage trackball is on the left of keyboard, so I pressing
  ### position 3 by thumb
	# xinput set-prop $mouse_id "libinput Button Scrolling Button" 3

  ## If needed you can place scroll lock button on position 1 where now Back.
  ## So no need to press and hold button. 
  ### I use Back and Forward on keyboard.
  ### Back REPLACE TO Scroll lock (position 1)
  ## set scroll button to position 1
	xinput set-prop $mouse_id "libinput Button Scrolling Button" 1
  ## turn on scroll lock
  xinput set-prop $mouse_id "libinput Button Scrolling Button Lock Enabled" 1 

  # Natural scrolling (change direction of scroll)
  ### Enabled (TrackPad emulation): Ball forward -> Scroll Down, Ball backward -> Scroll Up
  ### Disabled (Mouse Scroll emulation): Ball forward -> Scroll Up, Ball backward -> Scroll Down
  xinput set-prop $mouse_id "libinput Natural Scrolling Enabled" 1

  # Scrolling Pixel Distance
  ### Sets speed of scroll by ball+button
  ### Range 10 - 50. 10 - Fastest, 50 - Slowest. 15 (default)
  # xinput set-prop $mouse_id "libinput Scrolling Pixel Distance" 15
fi

# read more here https://askubuntu.com/questions/492744/how-do-i-automatically-remap-buttons-on-my-mouse-at-startup

################ Device 'Kensington      Kensington Expert Mouse':
# ❯ xinput list-props 10
# Device 'Kensington      Kensington Expert Mouse':
  # Device Enabled (154):	1
  # Coordinate Transformation Matrix (156):	1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
  # libinput Natural Scrolling Enabled (291):	0
  # libinput Natural Scrolling Enabled Default (292):	0
  # libinput Scroll Methods Available (296):	0, 0, 1
  # libinput Scroll Method Enabled (297):	0, 0, 0
  # libinput Scroll Method Enabled Default (298):	0, 0, 0
  # libinput Button Scrolling Button (299):	2
  # libinput Button Scrolling Button Default (300):	2
  # libinput Button Scrolling Button Lock Enabled (301):	0
  # libinput Button Scrolling Button Lock Enabled Default (302):	0
  # libinput Middle Emulation Enabled (688):	0
  # libinput Middle Emulation Enabled Default (689):	0
  # libinput Rotation Angle (303):	0.000000
  # libinput Rotation Angle Default (304):	0.000000
  # libinput Accel Speed (305):	0.000000
  # libinput Accel Speed Default (306):	0.000000
  # libinput Accel Profiles Available (307):	1, 1
  # libinput Accel Profile Enabled (308):	1, 0
  # libinput Accel Profile Enabled Default (309):	1, 0
  # libinput Left Handed Enabled (310):	0
  # libinput Left Handed Enabled Default (311):	0
  # libinput Send Events Modes Available (276):	1, 0
  # libinput Send Events Mode Enabled (277):	0, 0
  # libinput Send Events Mode Enabled Default (278):	0, 0
  # Device Node (279):	"/dev/input/event2"
  # Device Product ID (280):	1149, 4128
  # libinput Drag Lock Buttons (293):	<no items>
  # libinput Horizontal Scroll Enabled (294):	1
  # libinput Scrolling Pixel Distance (312):	15
  # libinput Scrolling Pixel Distance Default (313):	15
  # libinput High Resolution Wheel Scroll Enabled (295):	1
