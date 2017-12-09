#!/bin/bash

gawk -F, '
FNR==NR {a[NR]=$1; next};
{b[$1]=$0}
END{for (i in a) if (a[i] in b) print b[a[i]]}
' >matchedPairs.txt hay.txt needle.txt

# extract dirs of matchedPairs
awk '{$1=""; print $0}' matchedPairs.txt > dirsDuplicates.txt

# remove unwanted characters
awk '{sub(/].*/,""); print}' dirsDuplicates.txt > removedChr.txt 

# print message
echo -e "Finished labelling duplicates"

#gawk -F, '
#FNR==NR {a[NR]=$1; next};
#{b[$1]=$0} END{for (i in a) if (a[i] in b) print b[a[i]]}
#' > duplicates.txt hay.txt needle.txt && awk '{$1=""; print $0}' duplicates.txt > dirslist.txt

#awk '{$1=""; print $0}' duplicates.txt
# extract directories of matches

#awk -F, '{OFS=",";$1=$2=""; print $0}' duplicates.txt
#
#gawk -F, ' FNR==NR {a[NR]=$1; next};
#{b[$1]=$0}
#END{for (i in a) if (a[i] in b) print b[a[i]]}' >test.txt hay.txt needle.txt


#gawk -F, ' 
#FNR==NR {a[NR]=$1; next};
#{b[$1]=$0}
#END{for (i in a) if (a[i] in b) print b[a[i]]}
#' >newtest.txt hay.txt needle.txt

