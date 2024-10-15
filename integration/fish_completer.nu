export-env {
  $env.config = (
    $env.config
    | upsert completions.external {
      enable: true
      completer: {|spans|
        ^fish --command $'complete "--do-complete=($spans | str join " ")"'
        | $"value(char tab)description(char newline)" + $in
        | from tsv --flexible --no-infer
      }
    }
  )
}
