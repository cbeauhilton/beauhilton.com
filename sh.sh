$TERMINAL -e caretaker &>/dev/null & disown
$TERMINAL -e python3 -m http.server --directory build &>/dev/null & disown
$TERMINAL -e $BROWSER http://localhost:8000 &>/dev/null & disown
