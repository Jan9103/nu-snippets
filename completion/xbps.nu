# Install or update via xbps
# Examples:
#   Update everything: xbps-install -Su
#   Install vim: xbps-install vim
export extern xbps-install [
  --automatic(-A)  # Set automatic installation mode
  --config(-C): path  # Path to confdir (xbps.d)
  --cachedir(-c): path  # Path to cachedir
  --debug(-d)  # Debug mode shown to stderr
  --download-only(-D)  # Download packages and check integrity, nothing else
  --force(-f)  # Force package re-installation. If specified twice, all files will be overwritten.
  --help(-h)  # Print help usage
  --ignore-conf-repos(-i)  # Ignore repositories defined in xbps.d
  --ignore-file-conflicts(-I)  # Ignore detected file conflicts
  --unpack-only(-U)  # Unpack packages in transaction, do not configure them
  --memory-sync(-M)  # Remote repository data is fetched and stored in memory, ignoring on-disk repodata archives
  --dry-run(-n)  # Dry-run mode
  --repository(-R): string  # Add repository to the top of the list. This option can be specified multiple times
  --rootdir(-r): path  # Full path to rootdir
  --reproducible  # Enable reproducible mode in pkgdb
  --sync(-S)  # Sync remode repository index
  --update(-u)  # Update target package(s)
  --verbose(-v)  # Verbose messages
  --yes(-y)  # Assume yes to all questions
  --version(-V)  # Show XBPS version
  ...PKGNAME: string  # Package name(s)
]

# Examples:
#   Search for a package online: xbps-query -Rs vim
#   List all install packages: xbps-query -l
# Notes:
#   `--cat=FILE PKG` exists, but cant be implemented in nushell
export extern xbps-query [
  --config(-C): path  # Path to confdir (xbps.d)
  --cachedir(-c): path  # Path to cachedir
  --debug(-d)  # Debug mode shown to stderr
  --help(-h)  # Print help usage
  --ignore-conf-repos(-i)  # Ignore repositories defined in xbps.d
  --memory-sync(-M)  # Remote repository data is fetched and stored in memory, ignoring on-disk repodata archives
  --property(-p): string  # Show properties for PKGNAME (comma-seperated list)
  --repository(-R)  # Enable repository mode. This mode explicitly looks for packages in repositories
  --repository: string  # Add repository to the top of the list. This option can be specified multiple times
  --regex  # use extended regex to match
  --fulldeptree  # Full dependency tree for -x/--deps
  --rotdir(-r): path  # Full path to rootdir
  --version(-V)  # Show XBPS version
  --verbose(-v)  # Verbose messages

  --list-pkgs(-l)  # List installed packages
  --list-repos(-L)  # List registered repositories
  --list-hold-pkgs(-H)  # List packages on hold state
  --list-repolock-pkgs  # List repolocked packages
  --list-manual-pkgs(-m)  # List packages installed explicitly  
  --list-orphans(-O)  # List package orphans
  --ownedby(-o): path  # Search for package files by matching string or regex
  --show(-S): string  # Show information for PKG
  --search(-S): string  # Search for packages by matching PKG, String or regex
  --files(-f): string  # Show package files for PKG
  --deps(-x): string  # Show package files for PKG
  --revdeps(-X): string  # Show reverse dependencies for PKG

  ...ARGUMENTS  # command dependent - probably for packages
]

export extern xbps-remove [
  --config(-C): path  # Path to confdir (xbps.d)
  --cachedir(-c): path  # Path to cachedir
  --debug(-d)  # Debug mode shown to stderr
  --force-revdeps(-F)  # Force package removal even with revdeps or unresolved shared libraries
  --force(-f)  # Force package files removal
  --help(-h)  # Print help usage
  --dry-run(-n)  # Dry-run mode
  --clean-cache(-O)  # Remove obsolete packages in cachedir
  --remove-orphans(-o)  # remove obsolete packages in cachedir
  --recursive(-R)  # recursively remove dependencies
  --rootdir(-r): path  # Full path to rootdir
  --verbose(-v)  # Verbose messages
  --yes(-y)  # Assume yes to all questions
  --version(-V)  # show xbps version  
]
