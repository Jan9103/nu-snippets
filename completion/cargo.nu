def 'complete aan' [] { ['auto', 'always', 'never'] }

# Compile the current package
export extern build [
  --quiet(-q)  # Do not print cargo log messages
  --package(-p): string  # Package to build (see `cargo help pkgid`)
  --workspace  # Build all packages in the workspace
  --exclude: string  # Exclude packages from the build
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --all  # Alias for --workspace (deprecated)
  --color: string@'complete aan'  # Coloring: auto, always, never
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --frozen  # Require Cargo.lock and cache are up to date
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --lib  # Build only this package's library
  --locked  # Require Cargo.lock is up to date
  --bin: string  # Build only the specified binary
  --bins  # Build all binaries
  --config: string  # Override a configuration value
  --example: string  # Build only the specified example
  --examples  # Build all examples
  --test: string  # Build only the specified test target
  --tests  # Build all tests
  --bench: string  # Build only the specified bench target
  --benches  # Build all benches
  --all-targets  # Build all targets
  --release(-r)  # Build artifacts in release mode, with optimizations
  --profile: string  # Build artifacts with the specified profile
  --features(-F): string  # Space or comma separated list of features to activate
  --all-features  # Activate all available features
  --no-default-features  # 
  --target: string  # Build for the target triple
  --target-dir: path  # Directory for all generated artifacts
  --out-dir: path  # Copy final artifacts to this directory (unstable)
  --manifest-path: path  # Path to Cargo.toml
  --ignore-rust-version  # Ignore `rust-version` specification in packages
  --message-format: string  # Error format
  --build-plan  # Output the build plan in JSON (unstable)
  --unit-graph  # Output build graph in JSON (unstable)
  --future-incompat-report  # Outputs a future incompatibility report at the end of the build
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Analyze the current package and report errors, but don't build ob
export extern check [
  --quiet(-q)  # Do not print cargo log messages
  --package(-p): string  # Package(s) to check
  --workspace  # Check all packages in the workspace
  --exclude: string  # Exclude packages from the check
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --all  # Alias for --workspace (deprecated)
  --color: string@'complete aan'  # Coloring: auto, always, never
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --frozen  # Require Cargo.lock and cache are up to date
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --lib  # Check only this package's library
  --locked  # Require Cargo.lock is up to date
  --bin: string  # Check only the specified binary
  --bins  # Check all binaries
  --config: string  # Override a configuration value
  --example: string  # Check only the specified example
  --examples  # Check all examples
  --test: string  # Check only the specified test target
  --tests  # Check all tests
  --bench: string  # Check only the specified bench target
  --benches  # Check all benches
  --all-targets  # Check all targets
  --release(-r)  # Check artifacts in release mode, with optimizations
  --profile: string  # Check artifacts with the specified profile
  --features(-F): string  # Space or comma separated list of features to activate
  --all-features  # Activate all available features
  --no-default-features  # Do not acti
  --target: string  # Check for the target triple
  --target-dir: path  # Directory for all generated artifacts
  --manifest-path: path  # Path to Cargo.toml
  --ignore-rust-version  # Ignore `rust-version` specification in packages
  --message-format: string  # Error format
  --unit-graph  # Output build graph in JSON (unstable)
  --future-incompat-report  # Outputs a future incompatibility report at the end of the build
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Remove the target directory
export extern clean [
  --quiet(-q)  # Do not print cargo log messages
  --package(-p): string  # Package to clean artifacts for
  --manifest-path: path  # Path to Cargo.toml
  --target: string  # Target triple to clean output for
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --target-dir: path  # Directory for all generated artifacts
  --color: string@'complete aan'  # Coloring: auto, always, never
  --release(-r)  # Whether or not to clean release artifacts
  --frozen  # Require Cargo.lock and cache are up to date
  --profile: string  # Clean artifacts of the specified profile
  --doc  # Whether or not to clean just the documentation directory
  --locked  # Require Cargo.lock is up to date
  --offline  # Run without accessing the network
  --config  # <KEY=VALUE
]

# Build this package's and its dependencies' documentation
export extern doc [
  --quiet(-q)  # Do not print cargo log messages
  --open  # Opens the docs in a browser after the operation
  --package(-p): string  # Package to document
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --workspace  # Document all packages in the workspace
  --exclude: string  # Exclude packages from the build
  --all  # Alias for --workspace (deprecated)
  --color: string@'complete aan'  # Coloring: auto, always, never
  --frozen  # Require Cargo.lock and cache are up to date
  --no-deps  # Don't build documentation for dependencies
  --document-private-items  # Document private items
  --locked  # Require Cargo.lock is up to date
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --offline  # Run without accessing the 
  --config: string  # Override a configuration value
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --lib  # Document only this package's library
  --bin: string  # Document only the specified binary
  --bins  # Document all binaries
  --example: string  # Document only the specified example
  --examples  # Document all examples
  --release(-r)  # Build artifacts in release mode, with optimizations
  --profile: string  # Build artifacts with the specified profile
  --features(-F): string  # Space or comma separated list of features to activate
  --all-features  # Activate all available features
  --no-default-features  # Do not activate the `default` feature
  --target: string  # Build for the target triple
  --manifest-path: path  # Path to Cargo.toml
  --message-format: string  # Error format
  --ignore-rust-version  # Ignore `rust-version` specification in packages
  --unit-graph  # Output build graph in JSON (unstable)
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Create a new cargo package
export extern new [
  --quiet(-q)  # Do not print cargo log messages
  --registry: string  # Registry to use
  --vcs: string  # Initialize a new repository for the given version control system (git, hg, pijul, or fossil) or do not initialize any version control at all (none), overriding a global configuration. [possible values: git, hg, pijul, fossil, none]
  --bin  # Use a binary (application) template [default]
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --lib  # Use a library template
  --color: string@'complete aan'  # Coloring: auto, always, never
  --edition: string  # Edition to set for the crate generated [possible values: 2015, 2018, 2021]
  --frozen  # Require Cargo.lock and cache are up to date
  --name: string  # Set the resulting package name, defaults to the directory name
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
  dir: path
]

# Create a new cargo package in an existing directory
export extern init [
  --quiet(-q)  # Do not print cargo log messages
  --registry: string  # Registry to use
  --vcs: string  # Initialize a new repository for the given version control system (git, hg, pijul, or fossil) or do not initialize any version control at all (none), overriding a global configuration. [possible values: git, hg, pijul, fossil, none]
  --bin  # Use a binary (application) template [default]
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --lib  # Use a library template
  --color: string@'complete aan'  # Coloring: auto, always, never
  --edition: string  # Edition to set for the crate generated [possible values: 2015, 2018, 2021]
  --frozen  # Require Cargo.lock and cache are up to date
  --name: string  # Set the resulting package name, defaults to the d
  --locked  # Require Cargo.lock is up to date
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
  dir: path
]

# Add dependencies to a manifest file
export extern add [
  --no-default-features: string  # Disable the default features
  --default-features: string  # Re-enable the default features
  --features(-F): string  # Space or comma separated list of features to activate
  --optional: string  # Mark the dependency as optional
  --verbose(-v): string  # Use verbose output (-vv very verbose/build.rs output)
  --no-optional: string  # Mark the dependency as required
  --color: string@'complete aan'  # Coloring: auto, always, never
  --rename: string  # Rename the dependency
  --frozen: string  # Require Cargo.lock and cache are up to date
  --manifest-path: path  # Path to Cargo.toml
  --locked: string  # Require Cargo.lock is up to date
  --package(-p): string  # Package to modify
  --offline: string  # Run without accessing the network
  --quiet(-q): string  # Do not print cargo log messages
  --config: string  # Override a configuration value
  --dry-run: string  # Don't actually write the manifest
  --path: string  # 
  --git: string  # Git repository location
  --branch: string  # Git branch to download the crate from
  --tag: string  # Git tag to download the crate from
  --rev: string  # Git reference to download the crate from
  --registry: string  # Package registry for this dependency
  --dev: string  # Add as development dependency
  --build: string  # Add as build dependency
  --target: string  # Add as dependency to the given target platform
  ...dep_id: string
]

# Remove dependencies from a manifest file
export extern remove [
  --package(-p): string  # Package to remove from
  --manifest-path: path  # Path to Cargo.toml
  --quiet(-q)  # Do not print cargo log messages
  --dry-run  # Don't actually write the manifest
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --color: string@'complete aan'  # Coloring: auto, always, never
  --frozen  # Require Cargo.lock and cache are up to date
  --locked  # Require Cargo.lock is up to date
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
  --dev  # Remove as development dependency
  --target: string  # Remove as dependency from the given target platform
  ...dep_id: string
]

# Run a binary or example of the local package
export extern run [
  --quiet(-q)  # Do not print cargo log messages
  --bin: string  # Name of the bin target to run
  --example: string  # Name of the example target to run
  --package(-p): string  # Package with the target to run
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --color: string@'complete aan'  # Coloring: auto, always, never
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --frozen  # Require Cargo.lock and cache are up to date
  --release(-r)  # Build artifacts in release mode, with optimizations
  --locked  # Require Cargo.lock is up to date
  --profile: string  # Build artifacts with the specified profile
  --features(-F): string  # 
  --offline  # Run without accessing the network
  --all-features  # Activate all available features
  --config: string  # Override a configuration value
  --no-default-features  # Do not activate the `default` feature
  --target: string  # Build for the target triple
  --target-dir: path  # Directory for all generated artifacts
  --manifest-path: path  # Path to Cargo.toml
  --message-format: string  # Error format
  --unit-graph  # Output build graph in JSON (unstable)
  --ignore-rust-version  # Ignore `rust-version` specification in packages
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Run the tests
export extern test [
  --quiet(-q)  # Display one character per test instead of one line
  --lib  # Test only this package's library unit tests
  --bin: string  # Test only the specified binary
  --bins  # Test all binaries
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --example: string  # Test only the specified example
  --color: string@'complete aan'  # Coloring: auto, always, never
  --examples  # Test all examples
  --frozen  # Require Cargo.lock and cache are up to date
  --test: string  # Test only the specified test target
  --locked  # Require Cargo.lock is up to date
  --bench: string  # Test only the specified bench target
  --offline  # Run without accessing the network
  --benches  # Test all benches
  --config: string  # Override a configuration value
  --all-targets  # Test all targets
  --doc  # Test only this library's documentation
  --no-run  # Compile, but don't run tests
  --no-fail-fast  # Run all tests regardless of failure
  --package(-p): string  # Package to run tests for
  --workspace  # Test all packages in the workspace
  --exclude: string  # Exclude packages from the test
  --all  # Alias for --workspace (deprecated)
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --keep-going  # Do not abort t
  --release(-r)  # Build artifacts in release mode, with optimizations
  --profile: string  # Build artifacts with the specified profile
  --features(-F): string  # Space or comma separated list of features to activate
  --all-features  # Activate all available features
  --no-default-features  # Do not activate the `default` feature
  --target: string  # Build for the target triple
  --target-dir: path  # Directory for all generated artifacts
  --manifest-path: path  # Path to Cargo.toml
  --ignore-rust-version  # Ignore `rust-version` specification in packages
  --message-format: string  # Error format
  --unit-graph  # Output build graph in JSON (unstable)
  --future-incompat-report  # Outputs a future incompatibility report at the end of the build
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Run the benchmarks
export extern bench [
  --quiet(-q)  # Do not print cargo log messages
  --lib  # Benchmark only this package's library
  --bin: string  # Benchmark only the specified binary
  --bins  # Benchmark all binaries
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --example: string  # Benchmark only the specified example
  --color: string@'complete aan'  # Coloring: auto, always, never
  --examples  # Benchmark all examples
  --frozen  # Require Cargo.lock and cache are up to date
  --test: string  # Benchmark only the specified test target
  --locked  # Require Cargo.lock is up to date
  --tests  # 
  --bench: string  # Benchmark only the specified bench target
  --offline  # Run without accessing the network
  --benches  # Benchmark all benches
  --config: string  # Override a configuration value
  --all-targets  # Benchmark all targets
  --no-run  # Compile, but don't run benchmarks
  --package(-p): string  # Package to run benchmarks for
  --workspace  # Benchmark all packages in the workspace
  --exclude: string  # Exclude packages from the benchmark
  --all  # Alias for --workspace (deprecated)
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --profile: string  # Build artifacts with the specified profile
  --all-features  # Activate all available features
  --no-default-features  # Do not activate the `default` feature
  --target: string  # Build for the target triple
  --target-dir: path  # Directory for all generated artifacts
  --manifest-path: path  # Path to Cargo.toml
  --ignore-rust-version  # Ignore `rust-version` specification in packages
  --message-format: string  # Error format
  --no-fail-fast  # Run all benchmarks regardless of failure
  --unit-graph  # Output build graph in JSON (unstable)
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Update dependencies listed in Cargo.lock
export extern update [
  --quiet(-q)  # Do not print cargo log messages
  --workspace(-w)  # Only update the workspace packages
  --package(-p): string  # Package to update
  --aggressive  # Force updating all dependencies of SPEC as well when used with -p
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --dry-run  # Don't actually write the lockfile
  --color: string@'complete aan'  # Coloring: auto, always, never
  --precise: string  # Update a single dependency to exactly PRECISE when used with -p
  --frozen  # Require Cargo.lock and cache are up to date
  --manifest-path: path  # Path to Cargo.toml
  --locked  # Require Cargo.lock is up to date
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
]

# Search registry for crates
export extern search [
  --quiet(-q)  # Do not print cargo log messages
  --index: string  # Registry index URL to upload the package to
  --limit: string  # Limit the number of results (default: 10, max: 100)
  --registry: string  # Registry to use
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --color: string@'complete aan'  # Coloring: auto, always, never
  --frozen  # Require Cargo.lock and cache are up to date
  --locked  # Require Cargo.lock is up to date
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
]

# Package and upload this package to the registry
export extern publish [
  --quiet(-q)  # Do not print cargo log messages
  --index: string  # Registry index URL to upload the package to
  --token: string  # Token to use when uploading
  --no-verify  # Don't verify the contents by building them
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --allow-dirty  # Allow dirty working directories to be packaged
  --color: string@'complete aan'  # Coloring: auto, always, never
  --target: string  # Build for the target triple
  --frozen  # Require Cargo.lock and cache are up to date
  --target-dir: path  # Directory for all generated artifacts
  --locked  # Require Cargo.lock is up to date
  --package(-p): string  # Package to publish
  --manifest-path: path  # Path to Cargo.toml
  --offline  # Run without accessing the network
  --features(-F): string  # Space or comma separated list of features to activate
  --all-features  # Activate all available features
  --no-default-features  # Do not activate the `default` feature
  --jobs(-j): int  # Number of parallel jobs, defaults to # of CPUs
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --dry-run  # Perform all checks without uploading
  --registry: string  # Registry to publish to
]

# Install a Rust binary. Default location is $HOME/.cargo/bin
export extern install [
  --quiet(-q)  # Do not print cargo log messages
  --version: string  # Specify a version to install
  --git: string  # Git URL to install the specified crate from
  --branch: string  # Branch to use when installing from git
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --tag: string  # Tag to use when installing from git
  --color: string@'complete aan'  # Coloring: auto, always, never
  --rev: string  # Specific commit to use when installing from git
  --frozen  # Require Cargo.lock and cache are up to date
  --path: string  # Filesystem path to local crate to install
  --list  # list all installed packages and their versions
  --locked  # Require Cargo.lock is up to date
  --jobs(-j): int  # 
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
  --keep-going  # Do not abort the build as soon as there is an error (unstable)
  --force(-f)  # Force overwriting existing crates or binaries
  --no-track  # Do not save tracking information
  --features(-F): string  # Space or comma separated list of features to activate
  --all-features  # Activate all available features
  --no-default-features  # Do not activate the `default` feature
  --profile: string  # Install artifacts with the specified profile
  --debug  # Build in debug mode (with the 'dev' profile) instead of release mode
  --bin: string  # Install only the specified binary
  --bins  # 
  --example: string  # Install only the specified example
  --examples  # Install all examples
  --target: string  # Build for the target triple
  --target-dir: path  # Directory for all generated artifacts
  --root: string  # Directory to install packages into
  --index: string  # Registry index to install from
  --registry: string  # Registry to use
  --message-format: string  # Error format
  --timings: string  # Timing output formats (unstable) (comma separated): html, json
]

# Uninstall a Rust binary
export extern uninstall [
  --quiet(-q)  # Do not print cargo log messages
  --package(-p): string  # Package to uninstall
  --bin: string  # Only uninstall the binary NAME
  --root: string  # Directory to uninstall packages from
  --verbose(-v)  # Use verbose output (-vv very verbose/build.rs output)
  --color: string@'complete aan'  # Coloring: auto, always, never
  --frozen  # Require Cargo.lock and cache are up to date
  --locked  # Require Cargo.lock is up to date
  --offline  # Run without accessing the network
  --config: string  # Override a configuration value
]
