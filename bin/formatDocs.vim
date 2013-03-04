:%s/\s\+$//  "Remove trailing whitespace
:norm gg=G   "Perform indentation
:%s/end\n\n*/end\r\r/g "Insert two newlines after any 'end'
:%s/}\n\n*/}\r\r/g "Insert two newlines after any '}'
:%s/,\n\n*/,\r/g "Remove blank lines after a comma
:%s/^\n*\( *\)end/\1end/g "Remove all newlines before 'end'
:%s/\n*  Scenario/\r\r  Scenario/g "Standard indentation for scenarios
:%s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/g "Standard indentation for scenarios
:wq! "Save file
