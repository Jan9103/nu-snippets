export-env {
  $env.config = (
    $env.config?
		| default {}
    | upsert hooks.pre_prompt {|config|
      $config
      | get -i hooks.pre_prompt
      | default []
      | append {|| ^zoxide add -- $env.PWD }
    }
  )
}

# Jump to a directory using only keywords.
export def --env __zoxide_z [...rest: string] {
	let arg0 = ($rest | append '~').0
	let path = (if ($arg0 | path expand | path type) == dir {
		$arg0
	} else {
		^zoxide query --exclude $env.PWD -- $rest | str trim -r -c "\n"
	})
	cd $path
}

# Jump to a directory using interactive search.
export def --env __zoxide_zi  [...rest: string] {
	cd (^zoxide query -i -- $rest | str trim -r -c "\n")
}

export alias z = __zoxide_z
export alias zi = __zoxide_zi
