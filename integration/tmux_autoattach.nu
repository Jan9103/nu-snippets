export-env {
	if not (TMUX in $env) {
		^tmux -2u new -As0
		exit
	}
}
