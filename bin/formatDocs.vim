:%s/\s\+$//
:norm gg=G
:%s/^  end\n*  \(\w\)/  end\r\r  \1/
:%s/^end\n*\(\w\)/end\r\r\1/
:%s/\n*  Scenario/\r\r  Scenario/g
:%s/\(@\w\+\)\n\n  Scenario/\1\r  Scenario/g
:wq!
