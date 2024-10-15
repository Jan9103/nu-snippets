def 'complete auto always never' [] {
    ['auto' 'always' 'never']
}
def 'complete file extension' [] {
    ['md' 'liquid' 'html']
}

# Build the cobalt project at the source dir
export extern 'build' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    --config(-c): path = './_cobalt.yml' # Config file to use
    --destination(-d): path = './'  # Site destination folder
    --drafts     # Include drafts
    --no-drafts  # Ignore drafts
]

# Cleans `destination` directory
export extern 'clean' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    --config(-c): path = './_cobalt.yml' # Config file to use
    --destination(-d): path = './'  # Site destination folder
    --drafts     # Include drafts
    --no-drafts  # Ignore drafts
]

# Initialise a server
export extern 'init' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    directory: path = './'  # Target directory
]

# Create a document
export extern 'new' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --edit  # Open the new document in your configured EDITOR
    --file(-f): path  # New document's parent directory or file (default: `<CWD>/title.ext`)
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    --with-ext: string@'complete file extension'  # The default file's extension
    --config(-c): path = './_cobalt.yml' # Config file to use
    --destination(-d): path = './'  # Site destination folder
    --drafts     # Include drafts
    --no-drafts  # Ignore drafts
    title: string  # Title of the post
]

# Publish a document
export extern 'publish' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    --config(-c): path = './_cobalt.yml' # Config file to use
    --destination(-d): path = './'  # Site destination folder
    --drafts     # Include drafts
    --no-drafts  # Ignore drafts
    file: path # Document to publish
]

# Rename a document
export extern 'rename' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    --config(-c): path = './_cobalt.yml' # Config file to use
    --destination(-d): path = './'  # Site destination folder
    --drafts     # Include drafts
    --no-drafts  # Ignore drafts
    file: path  # File to rename
    title: string  # Title of the post
]

# Build, serve, and watch the project at the source dir
export extern 'serve' [
    --color: string@'complete auto always never' = 'auto'  # Controls when to use color
    --host: string = 'localhost'  # Hostname or IP to serve from
    --no-watch  # Disable rebuilding on change
    --open  # Open a browser
    --port(-P): int = 1024  # Port to serve from
    --quiet(-q)    # Less output per occurrence
    --verbose(-v)  # More output per occurrence
    --version(-V)  # Print version information
    --config(-c): path = './_cobalt.yml' # Config file to use
    --destination(-d): path = './'  # Site destination folder
    --drafts     # Include drafts
    --no-drafts  # Ignore drafts
]

# Prints post-processed config
export extern 'debug config' []

# Print files associated with a collection
export extern 'debug files' []

# Print syntax-highlight information
export extern 'debug highlight syntaxes' []

# Print syntax-highlight information
export extern 'debug highlight themes' []
