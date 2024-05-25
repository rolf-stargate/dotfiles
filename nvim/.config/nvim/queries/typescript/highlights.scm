
; Highlights the 'debug' function call and its string parameters in JavaScript
((call_expression
  function: (identifier) @function.debug
  arguments: (arguments) @parameter.debug
  (#eq? @function.debug "debug")
  (#set! "priority" 2000)
) @parameter.debug
  (#set! "priority" 2000)
  )




