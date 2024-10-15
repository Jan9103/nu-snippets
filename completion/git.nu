# get last commits
def "commits" [count: int] {
	^git log --oneline --no-abbrev-commit $'HEAD~($count)..HEAD'
	| lines | each {|i| $i | split row " " | get -i 0}
}

def "complete local branch" [] {
	^git branch | lines | str substring 2..
}

def "complete branch" [] {
	^git branch -a | lines | parse -r '^[* ] (?P<branch>[^ ]*)( -> .*)?$'
}

def "complete remote" [] {
	^git remote | lines
}

def "complete checkout" [] {
	^git status --porcelain=1 | lines | str substring 3..
	| append (commits 3)
	| append (complete branch | default [])
}

def "complete push target" [] {
	let remotes = (complete remote)
	complete local branch
	| each {|branch|
		$remotes | each {|remote| $'($remote)/($branch)'}
	} | flatten
}

# Download objects and refs from another repository
export extern fetch [
	repository?: string@"complete remote" # name of the branch to fetch
	--all         # Fetch all remotes
	--append(-a)  # Append ref names and object names to .git/FETCH_HEAD
	--atomic      # Use an atomic transaction to update local refs.
	--depth: int  # Limit fetching to n commits from the tip
	--deepen: int # Limit fetching to n commits from the current shallow boundary
	--shallow-since: string   # Deepen or shorten the history by date
	--shallow-exclude: string # Deepen or shorten the history by branch/tag
	--unshallow      # Fetch all available history
	--update-shallow # Update .git/shallow to accept new refs
	--negotiation-tip: string # Specify which commit/glob to report while fetching
	--negotiate-only   # Do not fetch, only print common ancestors
	--dry-run          # Show what would be done
	--write-fetch-head # Write fetched refs in FETCH_HEAD (default)
	--no-write-fetch-head # Do not write FETCH_HEAD
	--force(-f) # Always update the local branch
	--keep(-k)  # Keep dowloaded pack
	--multiple  # Allow several arguments to be specified
	--auto-maintenance # Run 'git maintenance run --auto' at the end (default)
	--no-auto-maintenance # Don't run 'git maintenance' at the end
	--auto-gc    # Run 'git maintenance run --auto' at the end (default)
	--no-auto-gc # Don't run 'git maintenance' at the end
	--write-commit-graph    # Write a commit-graph after fetching
	--no-write-commit-graph # Don't write a commit-graph after fetching
	--prefetch  # Place all refs into the refs/prefetch/ namespace
	--prune(-p) # Remove obsolete remote-tracking references
	--prune-tags(-P) # Remove any local tags that do not exist on the remote
	--no-tags(-n)    # Disable automatic tag following
	--refmap: string # Use this refspec to map the refs to remote-tracking branches
	--tags(-t)       # Fetch all tags
	--recurse-submodules: string # Fetch new commits of populated submodules (yes/on-demand/no)
	--jobs(-j): int # Number of parallel children
	--no-recurse-submodules # Disable recursive fetching of submodules
	--set-upstream # Add upstream (tracking) reference
	--submodule-prefix: string # Prepend to paths printed in informative messages
	--upload-pack: string      # Non-default path for remote command
	--quiet(-q)   # Silence internally used git commands
	--verbose(-v) # Be verbose
	--progress    # Report progress on stderr
	--server-option(-o): string # Pass options for the server to handle
	--show-forced-updates       # Check if a branch is force-updated
	--no-show-forced-updates    # Don't check if a branch is force-updated
	-4 # Use IPv4 addresses, ignore IPv6 addresses
	-6 # Use IPv6 addresses, ignore IPv4 addresses
]

# Check out git branches and files
export extern checkout [
	...targets: string@"complete checkout" # name of the branch, files, or commit to checkout
	--conflict: string # conflict style (merge or diff3)
	--detach(-d) # detach HEAD at named commit
	--force(-f)  # force checkout (throw away local modifications)
	--guess      # second guess 'git checkout <no-such-branch>' (default)
	--ignore-other-worktrees    # do not check if another worktree is holding the given ref
	--ignore-skip-worktree-bits # do not limit pathspecs to sparse entries only
	--merge(-m)        # perform a 3-way merge with the new branch
	--orphan: string   # new unparented branch
	--ours(-2)         # checkout our version for unmerged files
	--overlay          # use overlay mode (default)
	--overwrite-ignore # update ignored files (default)
	--patch(-p)        # select hunks interactively
	--pathspec-from-file: string # read pathspec from file
	--progress  # force progress reporting
	--quiet(-q) # suppress progress reporting
	--recurse-submodules: string # control recursive updating of submodules
	--theirs(-3) # checkout their version for unmerged files
	--track(-t)  # set upstream info for new branch
	-b: string   # create and checkout a new branch
	-B: string   # create/reset and checkout a branch
	-l # create reflog for new branch
]

# Push changes
export extern push [
	remote?: string@"complete remote"  # the name of the remote
	...refs: string@"complete branch" # the branch / refspec
	--all    # push all refs
	--atomic # request atomic transaction on remote side
	--delete(-d)   # delete refs
	--dry-run(-n)  # dry run
	--exec: string # receive pack program
	--follow-tags  # push missing but relevant tags
	--force-with-lease: string # require old value of ref to be at this value
	--force(-f) # force updates
	--ipv4(-4)  # use IPv4 addresses only
	--ipv6(-6)  # use IPv6 addresses only
	--mirror    # mirror all refs
	--no-verify # bypass pre-push hook
	--porcelain # machine-readable output
	--progress  # force progress reporting
	--prune     # prune locally removed refs
	--push-option(-o): string # option to transmit
	--quiet(-q) # be more quiet
	--receive-pack: string # receive pack program
	--recurse-submodules: string # control recursive pushing of submodules
	--repo: string     # repository
	--set-upstream(-u): string@"complete push target" # set upstream for git pull/status
	--signed: string   # GPG sign the push
	--tags # push tags (can't be used with --all or --mirror)
	--thin # use thin pack
	--verbose(-v) # be more verbose
]

export extern commit [
	--all(-a)  # stage all
	--patch(-p)  # Use the interactive patch selection interface to chose which changes to commit
	--reuse-message(-C): string  # Take an existing commit object, and reuse the log message and the authorship information
	--reedit-message(-c): string  # Use existing commit object as template
	--fixup: string  # Construct a commit message for use with rebase --autosquash
	--squash: string  # Construct a commit message for use with rebase --autosquash
	--reset-author # declare that the authorship of the resulting commit now belongs to the committer
	--short # short-format for dry-run
	--branch # Show the branch and tracking info even in short-format
	--porcelain # When doing a dry-run, give the output in a porcelain-ready format
	--long # When doing a dry-run, give the output in the long-format
	--null(-z) # When showing short or porcelain status output, print the filename verbatim and terminate the entries with NUL
	--file(-F): path # Take the commit message from the given file
	--author: string # Override the commit author
	--date: string # Override the author date used in the commit
	--message(-m): string # the commit message
	--template(-t): path # use file as template
	--signoff(-s) # Add Signed-off-by line by the committer at the end of the commit log message
	--no-verify(-n) # This option bypasses the pre-commit and commit-msg hooks
	--allow-empty
	--allow-empty-message
	--cleanup: string # This option determines how the supplied commit message should be cleaned up before committing. The <mode> can be strip, whitespace, verbatim, scissors or default.
	--edit(-e) # edit commit provided message
	--no-edit
	--amend
	--no-post-rewrite # Bypass the post-rewrite hook.
	--include(-i)
	--only(-o)
	--pathspec-from-file: path # Pathspec is passed in <file> instead of commandline args
	--pathspec-file-nul # Pathspec elements are separated with NUL in --pathspec-from-file:
	--untracked-files(-u): string # show untracked files: no normal all
	--verbose(-v)
	--quiet(-q)
	--dry-run
	--status # Include the output of git-status
	--no-status
	--gpg-sign(-S): string # GPG-sign commits with <keyid>
	--no-gpg-sign
	...pathspec: path
]
