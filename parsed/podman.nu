# WARNING: some of the data in here is not parsed since podman outputs nonsense.
#   example: "CreatedAt" is "4 weeks ago", "ExitedAt" is "-62135596800", and "StartedAt" is "1730141469". what is the format here???
export def 'parsed podman ps' []: nothing -> table {
  ^podman ps -a --format json
  | from json
  | update CreatedAt {|i| $i.CreatedAt | into datetime }
}

# NOTE: i would recommend using classic "podman ls" for interactive usage since this one is a information overload
export def 'parsed podman image ls' []: nothing -> table {
  ^podman image ls --format json
  | from json
  | update CreatedAt {|i| $i.CreatedAt | into datetime }
  | update Size {|i| $i.Size | into filesize }
  | update SharedSize {|i| $i.SharedSize | into filesize }
  | update VirtualSize {|i| $i.VirtualSize | into filesize }
}

export def 'parsed podman top' [container: string]: nothing -> table<user: string, pid: int, ppid: int, cpu: float, elapsed: duration, tty: string, time: duration, command: string> {
  # podman for some reason has no `--format json` for this one -> manual parsing
  ^podman top $container user pid ppid pcpu etime tty time comm  # <- explicitly define the format to be identical to the default in case the default changes
  | from ssv
  | update '%CPU' {|i| $i."%CPU" | into float }
  | update 'PPID' {|i| $i."PPID" | into int }
  | update 'PID' {|i| $i."PID" | into int }
  | update ELAPSED {|i|
    $i.ELAPSED
    | str replace 'h' 'h '  # "into duration" is a bit picky with the formatting
    | str replace 's' 'sec'
    | str replace 'm' 'min '
    | into duration
  }
  | update TIME {|i|
    $i.TIME
    | str replace 'h' 'h '
    | str replace 's' 'sec'
    | str replace 'm' 'min '
    | into duration
  }
  | rename -c {
    "USER": "user",
    "PID": "pid",
    "PPID": "ppid",
    "%CPU": "cpu",
    "ELAPSED": "elapsed",
    "TTY": "tty",
    "TIME": "time",
    "COMMAND": "command",
  }
}
