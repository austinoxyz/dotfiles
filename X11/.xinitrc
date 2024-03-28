# ~/.xinitrc

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

[ -f ~/.local/state/redshift ] && echo "off" > ~/.local/state/redshift


exec i3 
#    && [ -f ~/Scripts/utility/random-wallpaper.sh ] && ~/Scripts/utility/random-wallpaper.sh ;
