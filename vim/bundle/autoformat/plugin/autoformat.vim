function AutoFormat()
  "Remove trailing whitespace
  %s/\s\+$//e

  "Perform indentation
  norm gg=G

  "Insert two newlines after any 'end'
  %s/end\n\n*/end\r\r/e

  "Remove blank lines after a comma
  %s/,\n\n*/,\r/e

  "Remove all newlines before 'end'
  %s/^\n*\( *\)end/\1end/e

  "Remove all newlines before 'else'
  %s/^\n*\( *\)else/\1else/e

  "Standard indentation for scenarios
  %s/\n*  Scenario/\r\r  Scenario/e

  "Standard indentation for scenarios
  %s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/e

  "Remove trailing newlines
  %s/\n*\%$//e

  "Remove highlighting
  nohls
endfunction
