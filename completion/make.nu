def 'complete function' [] {
	if ('Makefile' | path exists) {(open --raw Makefile | lines | parse -r '^(?P<fn>[^\t:]+):').fn}
}

export extern main [
	--always-make(-B) # Unconditionally make all targets.
	--directory(-C): path
	-d # print debug infos
	--debug: string  # Print debugging information in addition to normal processing.
	--environment-overrides(-e)  # env-vars override files env-vars
	--file(-f): path # Read FILE as a makefile.
	--makefile: path # Read FILE as a makefile.
	--ignore-errors(-i)
	--include-dir(-I): path # Search DIRECTORY for included makefiles.
	--jobs(-j): int  # number of jobs (commands) to run simultaneously
	--jobserver-fds: string
	--keep-going(-k) # Keep going when some targets can't be made.
	--load-average(-l): string  # (int)
	--check-symlink-times(-L) # Use the latest mtime between symlinks and target
	--just-print(-n)  # dry-run
	--dry-run         # dry-run
	--recon           # dry-run
	--old-file(-o): path  # Do not remake the file file even if it is older than its dependencies
	--assume-old: path    # Do not remake the file file even if it is older than its dependencies
	--output-sync(-O): string  # When running multiple jobs in parallel with -j, ensure the output of each job is collected
	--print-data-base(-p) # Print make's internal database
	--question(-q) # Run no recipe; exit status says if up to date
	--no-builtin-rules(-r) # Disable the built-in implicit rules
	--no-builtin-variables(-R)
	--silent(-s)
	--quiet
	--no-keep-going # Turns off -k
	--stop(-S)      # Turns off -k
	--touch(-t) # Touch targets instead of remaking them
	--trace  # Information about the disposition of each target is printed
	--version(-v)
	--print-directory(-w) # Print the current directory
	--no-print-directory  # Turn off -w
	--what-if(-W): path  # Pretend  that  the  target  file  has just been modified.
	--new-file: path  # Pretend  that  the  target  file  has just been modified.
	--assume-new: path  # Pretend  that  the  target  file  has just been modified.
	--warn-undefined-variables # Warn when an undefined variable is referenced
	...function: string@'complete function'
]
