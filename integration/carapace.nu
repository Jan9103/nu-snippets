export-env {
  $env.config = (
    $env.config
    | upsert completions.external {
      enable: true
      completer: {|spans|
        ^carapace $spans.0 nushell ...$spans
        | from json
        | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
      }
    }
  )
}
