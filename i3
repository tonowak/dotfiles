exec --no-startup-id feh --randomize --bg-scale ~/.config/wall/*
exec --no-startup-id redshift
exec --no-startup-id compton
exec --no-startup-id polybar top
exec --no-startup-id dunst
exec --no-startup-id greenglip daemon
exec --no-startup-id sudo ldm -u tonowak

# Binding keys to scripts
bindsym XF86MonBrightnessDown exec "light -U 10"
bindsym XF86MonBrightnessUp exec "light -A 10"
bindsym XF86AudioMute exec pulseaudio-ctl mute
bindsym XF86AudioLowerVolume exec pulseaudio-ctl down
bindsym XF86AudioRaiseVolume exec pulseaudio-ctl up
bindsym XF86AudioPlay exec ~/.config/spotify-script play
bindsym XF86AudioPrev exec ~/.config/spotify-script prev
bindsym XF86AudioNext exec ~/.config/spotify-script next
bindsym Print exec gnome-screenshot

# colors         border  backgr  text    indic   child_border
client.focused   #3d4148 #000000 #abb2bf #98c379 #3d4148
client.unfocused #282c34 #000000 #abb2bf #98c379 #282c34

# border sizes
smart_borders on
for_window [class="^.*"] border pixel 3
gaps inner 20

assign [class="Chromium"] "2: web"
assign [class="Messenger"] "3: messenger"
assign [class="discord"] "4: discord"
assign [class="spotify"] "4: discord"

exec termite
exec chromium
exec /opt/messengerfordesktop/messengerfordesktop
exec discord
exec spotify

set $mod mod4

bindsym $mod+t exec i3lock-fancy

# Font for window titles
font pango:Ubuntu Mono Regular 16
font pango:DejaVu Sans Mono 16
font pango:Font Awesome 5 Free Solid 16
font pango:Wuncon Siji Regular 16

focus_follows_mouse no

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec termite

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
# bindsym $mod+d exec rofi -show run -config ~/.config/rofi/config
bindsym $mod+d exec ~/.config/rofi/scripts/main_menu.sh

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+g split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+p floating toggle

# change focus between tiling / floating windows
bindsym $mod+p focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace "1: code"
bindsym $mod+2 workspace "2: web"
bindsym $mod+3 workspace "3: messenger"
bindsym $mod+4 workspace "4: discord"
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace "1: code"
bindsym $mod+Shift+2 move container to workspace "2: web"
bindsym $mod+Shift+3 move container to workspace "3: messenger"
bindsym $mod+Shift+4 move container to workspace "4: discord"
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

