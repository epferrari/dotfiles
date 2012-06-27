:%s/\s\+$//
:norm gg=G
:%s/^  end\n*  \(\w\)/  end\r\r  \1/
:wq!
