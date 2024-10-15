# based on: https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/src/shell/scripts/omp.nu

export-env {
  $env.POWERLINE_COMMAND = 'oh-my-posh'
  $env.POSH_PID = (random uuid)
  $env.NU_VERSION = (version | get version)

	if POSH_THEME in $env {
	  $env.PROMPT_INDICATOR = ''
	  $env.PROMPT_COMMAND_RIGHT = {|| ''}
	  $env.PROMPT_MULTILINE_INDICATOR = (^oh-my-posh print secondary $"--config=($env.POSH_THEME)" --shell=nu $"--shell-version=($env.NU_VERSION)")
	  $env.PROMPT_COMMAND = {||
	    let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS }
	    let clear = (history | last | get command) == "clear"
	    let width = ((term size).columns | into string)
	    ^oh-my-posh print primary $"--config=($env.POSH_THEME)" --shell=nu $"--shell-version=($env.NU_VERSION)" $"--execution-time=($cmd_duration)" $"--error=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)" $"--cleared=($clear)"
	  }
	} else {
		print --stderr $"(ansi red)[oh-my-posh]: Failed to enable OMP: $env.POSH_THEME is not set."
	}
}
