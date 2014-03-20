iteent=0
itetailleclef=0
tailleclef=0
tmpmul=0
tmpdiv=0
entropy=0

tabCarac=("a" "b" "z" "e" "r" "t")
tabOccu=("1" "1" "1" "1" "1" "1")

tailleTabCarac=${#tabCarac[*]}
tailleTabOccu=${#tabOccu[*]}

while test $itetailleclef != $tailleTabOccu
do
    tailleclef=$(($tailleclef + ${tabOccu[$itetailleclef]}))
    itetailleclef=$(($itetailleclef+1))
done

while test $iteent != $tailleTabCarac
do
    tmpmul=$((${tabOccu[$iteent]}*${tabOccu[$iteent]}))
    tmpdiv=$(bc -l <<< "$tmpmul / $tailleclef")
    
    echo "E = $entropy + ${tabOccu[$iteent]} * ${tabOccu[$iteent]} / $tailleclef"
    entropy=$(bc -l <<< "$entropy + $tmpdiv")
    iteent=$(($iteent+1))
done 

echo "E = 1 - ($entropy / $tailleclef)"
entropy=$(bc -l <<< "1 - ($entropy / $tailleclef)")

echo "E¨= 1 - ($entropy * $entropy)"
entropyp=$(bc -l <<< "($entropy * $entropy)")

entropy=$(bc -l <<< "($entropy * 100)")
entropyp=$(bc -l <<< "($entropyp * 100)")
echo "E = $entropy"
echo "E¨= $entropyp"
