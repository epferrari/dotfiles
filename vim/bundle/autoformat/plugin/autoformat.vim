function AutoFormat()
  "Save cursor position
  let l:winview = winsaveview()

  "Remove trailing whitespace
  %s/\s\+$//e

  "Perform indentation
  norm gg=G

  "Remove blank lines after a comma
  %s/,\n\n*/,\r/e

  "Ruby-file fixes
  if expand('%:e') == 'rb'
    "Remove extra lines after 'do'
    %s/do\((\s*\|.*\|)?\)\n*/do\1\r/e

    "Insert two newlines after any 'end'
    %s/end\n\n*/end\r\r/e

    "Remove all newlines before 'end'
    %s/^\n*\( *\)end/\1end/e

    "Remove all newlines before 'else'
    %s/^\n*\( *\)else/\1else/e
  endif

  "Cucumber-file fixes
  if expand('%:e') == 'feature'
    "Standard indentation for scenarios
    %s/\n*  Scenario/\r\r  Scenario/e

    "Standard indentation for scenarios
    %s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/e
  endif

  "CSS-only fixes
  if expand('%:e') == 'css' || expand('%:e') == 'scss'
    "Insert a space after all colons
    %s/:\s*\(\w\)/: \1/e

    "Always insert { character on same line as declaration
    %s/\n{/ {/e

    "Remove space if it's a declaration like :hover
    %s/: \(.*[{,]\)/:\1/e

    "Insert a return character after all }
    %s/\}\n*/}\r/e

    "Insert a second return character between } and other styles
    %s/\}\n*\(\s*[a-z#\.&\*\@]\)/}\r\r\1/e
  endif

  "Remove trailing newlines
  %s/\n*\%$//e

  "Remove highlighting
  nohls

  "Restore cursor position
  call winrestview(l:winview)
endfunction
