module.exports =
  imgTest: (file) ->
    /// (
      \. (jpe?g)
      |  (png)
      |  (gif)
    )$ ///.test file

  osFileTest: (file) ->
    not ///
      \.DS_Store
      | exports?
    ///.test file
