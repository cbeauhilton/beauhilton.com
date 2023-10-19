# for non-Nix systems:
# running sh.sh will make a nice dev env with preview and auto-rebuild.
# for Nix systems, this script isn't necessary -
# cd'ing into the directory will set up the server,
# and "autorebuild" will start the rebuild process in the background
$TERMINAL -e caretaker &>/dev/null & disown
$TERMINAL -e python3 -m http.server --directory build &>/dev/null & disown
$TERMINAL -e $BROWSER http://localhost:8000 &>/dev/null & disown
