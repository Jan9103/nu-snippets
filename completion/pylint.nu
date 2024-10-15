def 'complete yn' [] { ['y' 'n'] }
def 'complete confidence' [] { ['HIGH' 'INFERENCE' 'INFERENCE_FAILURE' 'UNDEFINED'] }
def 'complete output format' [] { ['text' 'parseable' 'colorized' 'json' 'msvs'] }

# Check that module(s) satisfy a coding standard (and more !).
export extern main [
	--version # show program's version number and exit
	--help(-h)
	--long-help
	--rcfile: path # Specify a configuration file
	--errors-only(-E) # In error mode, checkers without error messages are disabled and for others, only the ERROR messages are displayed, and no reports are done by default.
	--py3k # In Python 3 porting mode, all checkers will be disabled and only messages emitted by the porting checker will be displayed.
	--verbose(-v) # In verbose mode, extra non-checker-related info will be displayed.
	--ignore: path # Add files or directories to the blacklist. They should be base names, not paths.
	--ignore-patterns: string # Add files or directories matching the regex patterns to the blacklist. The regex matches against base names, not paths.
	--persistent: string@'complete yn'
	--load-plugins: string # List of plugins (as comma separated values of pythonmodule names) to load, usually to register additional checkers.
	--jobs(-j): int # Use multiple processes to speed up Pylint. Specifying 0 will auto-detect the number of processors available to use.
	--limit-inference-results: int # Control the amount of potential inferred values when inferring a single object. This can help the performance when dealing with large functions or complex, nested conditions.
	--extension-pkg-whitelist: string # A comma-separated list of package or module names from where C extensions may be loaded. Extensions are loading into the active Python interpreter and may run arbitrary code.
	--suggestion-mode: string@'complete yn' # When enabled, pylint would attempt to guess common misconfiguration and emit user-friendly hints instead of false-positive error messages.
	--exit-zero # Always return a 0 (non-error) status code, even if lint errors are found. This is primarily useful in continuous integration scripts.
	--from-stdin # Interpret the stdin as a python script, whose filename needs to be passed as the module_or_package argument.
	--help-msg: string # Display a help message for the given message id and exit. The value may be a comma separated list of message ids.
	--list-msgs # Generate pylint's messages.
	--list-msgs-enabled # Display a list of what messages are enabled and disabled with the given configuration.
	--list-groups # List pylint's message groups.
	--list-conf-levels # Generate pylint's confidence levels.
	--full-documentation # Generate pylint's full documentation.
	--generate-rcfile # Generate a sample configuration file according to the current configuration. You can put other options before this one to get them in the generated configuration.
	--confidence: string@'complete confidence' # Only show warnings with the listed confidence levels. eave empty to show all.
	--enable(-e): string # Enable the message, report, category or checker with the given id(s). You can either give multiple identifier separated by comma (,) or put this option multiple time (only on the command line, not in the configuration file where it should appear only once). See also the "--disable" option for examples.
	--disable(-d): string # Disable the message, report, category or checker with the given id(s). You can either give multiple identifiers separated by comma (,) or put this option multiple times (only on the command line, not in the configuration file where it should appear only once). You can also use "--disable=all" to disable everything first and then reenable specific checks. For example, if you want to run only the similarities checker, you can use "--disable=all --enable=similarities". If you want to run only the classes checker, but have no Warning level messages displayed, use "--disable=all --enable=classes --disable=W".
	--output-format(-f): string@'complete output format' # Set the output format. You can also give a reporter class, e.g. mypackage.mymodule.MyReporterClass.
	--reports(-r): string@'complete yn' # Tells whether to display a full report or only the messages.
	--evaluation: string # Python expression which should return a score less than or equal to 10. You have access to the variables 'error', 'warning', 'refactor', and 'convention' which contain the number of messages in each category, as well as 'statement' which is the total number of statements analyzed. This score is used by the global evaluation report (RP0004).
	--score(-s): string@'complete yn' # Activate the evaluation score.
	--msg-template: string # Template used to display messages. This is a python new-style format string used to format the message information. See doc for all details.
	...modules_or_packages: path
]
