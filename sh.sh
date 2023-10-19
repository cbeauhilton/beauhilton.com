# for non-Nix systems:
# running sh.sh will make a nice dev env with preview and auto-rebuild
# for Nix systems, 
# just cd into the directory and the enterShell command takes care of it
$TERMINAL -e caretaker &>/dev/null & disown
$TERMINAL -e python3 -m http.server --directory build &>/dev/null & disown
$TERMINAL -e $BROWSER http://localhost:8000 &>/dev/null & disown
