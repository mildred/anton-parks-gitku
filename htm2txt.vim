%s/&#138;/Š/ge
%s/&#169;/©/ge
%s/&ugrave;/ù/ge
%s/&igrave;/ì/ge
%s/&agrave;/à/ge
%s/&egrave;/è/ge
%s/&iacute;/í/ge
%s/&aacute;/á/ge
%s/&eacute;/é/ge
%s/&uacute;/ú/ge

silent %s/\n\([^<]\)/ \1/ge
silent %s/^<P>$//ge

let &modified=1
while &modified
  w
  let &modified=0
  %s/<SUB>0/₀<SUB>/ge
  %s/<SUB>1/₁<SUB>/ge
  %s/<SUB>2/₂<SUB>/ge
  %s/<SUB>3/₃<SUB>/ge
  %s/<SUB>4/₄<SUB>/ge
  %s/<SUB>5/₅<SUB>/ge
  %s/<SUB>6/₆<SUB>/ge
  %s/<SUB>7/₇<SUB>/ge
  %s/<SUB>8/₈<SUB>/ge
  %s/<SUB>9/₉<SUB>/ge
  %s/<SUB>,/,<SUB>/ge
  %s/<SUB>(/₍<SUB>/ge
  %s/<SUB>)/₎<SUB>/ge
  %s/<SUB><\/SUB>//ge
endwhile
%s/\(<\/TT>\)\([₀₁₂₃₄₅₆₇₈₉,₍₎]*\)/\2\1/ge
silent %s/\([^\n]\)\n\(<TT>\)/\1 \2/ge
%s/^<TT>\([^<: ,]*\)/*\1* <TT>/ge

w
let &modified=1
while &modified
  w
  let &modified=0
  " šùúéíìèàá
  silent %s/\(<TT>[^<]*\)\([ :(),\[\]]\+\)\([^<]*<\/TT>\)/\1<\/TT>\2<TT>\3/ge
  silent %s/\(<TT>[^<]*\)Š\([^<]*<\/TT>\)/\1š\2/ge
  silent %s/\(<TT>[^<]*\)Ù\([^<]*<\/TT>\)/\1ù\2/ge
  silent %s/\(<TT>[^<]*\)Ú\([^<]*<\/TT>\)/\1ú\2/ge
  silent %s/\(<TT>[^<]*\)\([A-Z]\)\([^<]*<\/TT>\)/\=submatch(1).tolower(submatch(2)).submatch(3)/ge
  silent %s/<TT><\/TT>//ge
endwhile
silent %s/<TT>\([^:\[][^<]*\)<\/TT>\(\(,?[₀₁₂₃₄₅₆₇₈₉]\|₍\|₎\)*\)/|\1\2|/ge
silent %s/<IMG [^>]*indent.gif[^>]*>/    /ge

silent %s/^\([^:]*[^ ]\) *:  */\=submatch(1)."\n\n    ".submatch(2)/ge
w
let &modified=1
while &modified
  w
  let &modified=0
  silent %s/^\(\*.*\)  \(.*\)/\1 \2/ge
  silent %s/^\(\*.*\)|\(.*\)/\1*\2/ge
endwhile
w
let &modified=1
while &modified
  w
  let &modified=0
  silent %s/^\(\*.*\)\[\*\(.*\)/\1[|\2/ge
  silent %s/^\(\*.*\)\*\]\(.*\)/\1|]\2/ge
endwhile
w
let &modified=1
while &modified
  w
  let &modified=0
  silent %s/^\(\*\([^\*]*\*\)*\)\([^\*]*₍\)\([^ ]*\)\* *,\*\(.*\)\(₎\*\)/\1\3\4\6 *\3\5\6/ge
endwhile
w
let &modified=1
while &modified
  w
  let &modified=0
  silent %s/^\(\*.*\),\(.*\)/\1\2/ge
  silent %s/^\(\*.*\)₍\(.*\)/\1\2/ge
  silent %s/^\(\*.*\)₎\(.*\)/\1\2/ge
endwhile
w

silent %s/<HR[^>]*>/\="\n".repeat('-', 78)/ge
silent %s/<\/TITLE[^>]*>/\='~'/ge
silent %s/<[^>]*>//ge
silent %s/\%^[ \n]*//ge

normal G
append

vim:tw=78:ts=8:sts=4:sw=4:ft=help:norl:
.
w

normal ggvGgqgg
w
e
nohl
q
