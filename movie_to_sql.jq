.MediaContainer.Metadata[]
  | {
      title: "\(.title)" | gsub("'"; "''"),
      year,
      username: $username,
      guid: "\(.guid)",
    }
  | "insert into movies values ( '\(.title)', \(.year), '\(.username)', '\(.guid)' );"
