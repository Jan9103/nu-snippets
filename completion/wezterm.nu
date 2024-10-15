# Start the GUI, optionally running an alternative program
export extern start [
	--no-auto-connect # If true, do not connect to domains marked as connect_automatically in your wezterm configuration file
	--always-new-process # If enabled, don't try to ask an existing wezterm GUI instance to start the command.  Instead, always start the GUI in this invocation of wezterm so that you can wait for the command to complete by waiting for this wezterm process to finish
	--cwd: path # Specify the current working directory for the initially spawned program
	--class: string # Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs
	--workspace: string # Override the default workspace with the provided name. The default is "default"
	--position: string # Override the position for the initial window launched by this process. (examples: "10,20" "screen:10,20" "main:10,20" "active:10,20" "HDMI-1:10,20")
	--help(-h) # Print help information (use `-h` for a summary)
	...prog: string
]

# Establish an ssh session
export extern ssh [
	--ssh-option(-o): string # <name=value> Override specific SSH configuration options. `wezterm ssh` is able to parse some (but not all!) options from your `~/.ssh/config` and `/etc/ssh/ssh_config` files. This command line switch allows you to override or otherwise specify ssh_config style options.
	-v # Enable verbose ssh protocol tracing. The trace information is printed to the stderr stream of the process
	--class: string # Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs
	--position: string # Override the position for the initial window launched by this process. (example: "10,20" "screen:10,20")
	--help(-h) # Print help information (use `-h` for a summary)
	user_at_host_and_port: string
	...prog: string
]

# Open a serial port
export extern serial [
	--baud: string # Set the baud rate.  The default is 9600 baud
	--class: string # Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs
	--position: string # Override the position for the initial window launched by this process. (example: "10,20" "screen:10,20")
	--help(-h) # Print help information (use `-h` for a summary)
	port: string # Specifies the serial device name. On Windows systems this can be a name like `COM0`. On posix systems this will be something like `/dev/ttyUSB0`
]

# Connect to wezterm multiplexer
export extern connect [
	--class: string # Override the default windowing system class. The default is "org.wezfurlong.wezterm". Under X11 and Windows this changes the window class. Under Wayland this changes the app_id. This changes the class for all windows spawned by this instance of wezterm, including error, update and ssh authentication dialogs
	--workspace: string # Override the default workspace with the provided name. The default is "default"
	--position: string # Override the position for the initial window launched by this process. (example: "10,20" "screen:10,20")
	domain_name: string # Name of the multiplexer domain section from the configuration to which you'd like to connect
	...prog: string # Instead of executing your shell, run PROG. For example: `wezterm start -- bash -l` will spawn bash as if it were a login shell
]

# Display information about fonts
export extern ls-fonts [
	--list-system # Whether to list all fonts available to the system
	--text: string # Explain which fonts are used to render the supplied text string
	--codepoints: string # Explain which fonts are used to render the specified unicode code point sequence. Code points are comma separated hex values
	--rasterize-ascii # Show rasterized glyphs for the text in --text or --codepoints using ascii blocks
	--help(-h) # Print help information
]

# Show key assignments
export extern show-keys [
	--lua # Show the keys as lua config statements
	--key-table: string # In lua mode, show only the named key table
	--help(-h) # Print help information
]

# TODO: wezterm cli

# Output an image to the terminal
export extern imgcat [
	--width: string # Specify the display width; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal width
	--height: string # Specify the display height; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal height
	--no-preserve-aspect-ratio # Do not respect the aspect ratio.  The default is to respect the aspect ratio
	--help(-h) # Print help information
	file: path
]

# Advise the terminal of the current working directory by emitting an OSC 7 escape sequence
export extern set-working-directory [
	--help(-h) # Print help information
	cwd?: path # The directory to specify. If omitted, will use the current directory of the process itself
	host?: string # The hostname to use in the constructed file:// URL. If omitted, the system hostname will be used
]

# Record a terminal session as an asciicast
export extern record [
	--help(-h) # Print help information
	...prog: string
]

# Replay an asciicast terminal session
export extern replay [
	--explain # Explain what is being sent/received
	--help(-h) # Print help information
	cast_file: path
]
