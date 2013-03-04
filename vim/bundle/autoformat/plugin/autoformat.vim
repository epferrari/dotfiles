function AutoFormat()
  "Remove trailing whitespace
  %s/\s\+$//

  "Perform indentation
  norm gg=G

  "Insert two newlines after any 'end'
  %s/end\n\n*/end\r\r/g

  "Remove blank lines after a comma
  %s/,\n\n*/,\r/g

  "Remove all newlines before 'end'
  %s/^\n*\( *\)end/\1end/g

  "Standard indentation for scenarios
  %s/\n*  Scenario/\r\r  Scenario/g

  "Standard indentation for scenarios
  %s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/g

  "Remove trailing newlines
  %s/\n*\%$//g
endfunction
