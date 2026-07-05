function __prompt_git
 git rev-parse --is-inside-work-tree >/dev/null 2>&1; or return

 set -l branch (git symbolic-ref --quiet --short HEAD 2>/dev/null)
 if test -z "$branch"
  set branch (git rev-parse --short HEAD 2>/dev/null)
 end
 test -n "$branch"; or return

 set -l dirty ''
 set -l staged ''
 set -l untracked ''

 for line in (git status --porcelain --ignore-submodules 2>/dev/null)
  set -l x (string sub -l 1 -- $line)
  set -l y (string sub -s 2 -l 1 -- $line)

  if test "$x$y" = '??'
   set untracked '?'
   continue
  end

  test "$x" != ' '; and set staged '+'
  test "$y" != ' '; and set dirty '*'
 end

 set_color $selene_bright_blue
 echo -n " $branch$staged$dirty$untracked"
 set_color normal
end
