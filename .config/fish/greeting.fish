# .dotfile
# fish - greeting

# http://sourceforge.net/p/fish/mailman/fish-users/thread/516BDE58.6080307@gmail.com/
# https://gist.githubusercontent.com/siteshwar/5472791/raw/79ea0c34ca548ee047bc4b9f304621439b3546d7/Greeting+with+Fish+Logo
function fish_greeting -d "What's up, fish?"
  set_color $fish_color_autosuggestion[1]; uname -nsr
  echo (set_color red)'                 ___
   ___======____='(set_color yellow)'---='(set_color red)')
 /T            \_'(set_color yellow)'--==='(set_color red)')
 L \ '(set_color yellow)'(@)   '(set_color red)'\~    \_'(set_color yellow)'-=='(set_color red)')
  \      / )J'(set_color yellow)'~~    '(set_color red)'\\'(set_color yellow)'-='(set_color red)')
   \\\\___/  )JJ'(set_color yellow)'~~    '(set_color red)'\)
    \_____/JJJ'(set_color yellow)'~~      '(set_color red)'\
    / \  , \\'(set_color red)'J'(set_color yellow)'~~~~      \
   (-\)'(set_color red)'\='(set_color yellow)'|  \~~~        L__
   ('(set_color red)'\\'(set_color yellow)'\\)  ( -\)_            ==__
    '(set_color red)'\V    '(set_color yellow)'\-'(set_color red)'\) =='(set_color yellow)'=_____  J\   \\\\
           '(set_color red)'\V)     \_)'(set_color yellow)' \   JJ J\)
                       /J J'(set_color red)'T'(set_color yellow)'\JJJ'(set_color red)'J)
                       (J'(set_color yellow)'JJ| '(set_color red)'\UUU)
                        (UU)'
end
