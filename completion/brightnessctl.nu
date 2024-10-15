def 'complete class' [] {
	['backlight', 'leds']
}

def 'complete device' [] {
	brightnessctl -l
	| lines
	| parse "Device '{device}' of class '{class}':"
	| get device
}

def 'complete operation' [] {
	['i', 'info', 'g', 'get', 'm', 'max', 's', 'set']
}

# Control the brightness of the screen, led's, etc
# operations:
# - : list devices
# - info / i: get device info
# - get  / g: get current brightness of the device
# - max  / m: get maximum brightness of the device
# - set  / s  VALUE: set brightness of the device
#   valid values:
#   - a number   (ex: 500 or 1000)
#   - percentage (ex: 50% or 73%)
#   - a delta    (ex: 50- or +10)
#   - percentage delta (ex: 50%- or +10%)
export extern main [
	--list(-l)
	--quiet(-q)
	--pretend(-p)  # do not perform write operations
	--machine-readable(-m)
	--min-value(-n): int = 1  # set minimum brightness
	--exponent(-e): int  # changes percentage curve to exponential
	--save(-s)  # save previous state in a temporary file
	--restore(-r)  # restore previous saved state
	--class(-c): string@'complete class'  # specify device class
	--version(-V)
	--device(-d): string@'complete device'
	operation?: string@'complete operation'
	value?: string  # the value for the 'set' operation
]
