export def 'parsed ffprobe' [file: path]: nothing -> record<streams: table, format: record, chapters: list> {
  ^ffprobe -print_format json -v quiet -show_format -show_streams -show_chapters $file
  | from json
  | update format.duration {|i| $i.format.duration | into int | into duration --unit sec }
  | update format.size {|i| $i.format.size | into filesize }
  | update format.start_time {|i| $i.format.start_time | into int | into duration --unit sec }
  | update format.bit_rate {|i| $i.format.bit_rate | into int }
  | update streams {|stream|
    $stream
    | update start_time {|i| $i.start_time | into int | into duration --unit sec }
  }
}
