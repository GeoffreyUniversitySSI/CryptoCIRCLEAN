#!/bin/bash
#$1 = nom du fichier de clef
#$2 = nom du fichier des entropie

inArray()
{ 
    #$1 = lettre à rechercher
    #$2 = longueur tableau
    if [[ "$#" -ne 1 ]]; then
        exit
    else
        cmpt1=0
        nb=${#tabCarac[*]}
        ok=0
        
        while test $cmpt1 != $nb
        do	
	        
		    if [ "${1}" == "${tabCarac[${cmpt1}]}" ]; then
		        occu=$cmpt1
		        ok=$(($ok+1))
            fi
		    cmpt1=$(($cmpt1+1))
		    
	    done
	    
	    if [ $ok -eq 0 ]; then
	        occu=-1
	    fi
    fi

}

Dissection()
{
    #$1 = clef de cryptage
    clef=$1
    longueur=${#clef}
    cmpt=0

    while test $cmpt != $longueur
    do
	    charatest=${clef:$cmpt:1}
	
	    if [ $cmpt -eq 0 ]; then
	        tabCarac[$cmpt]=$charatest
            tabOccu[$cmpt]=1
            
        else
            inArray $charatest 
	        
	        if [ $occu -ge 0 ]; then
	           tabOccu[$occu]=$((${tabOccu[$occu]}+1))
	           
	        else
                pos=${#tabCarac[*]}
                tabCarac[$pos]=$charatest
                tabOccu[$pos]=1
	        fi
	    fi
	

	    cmpt=$(($cmpt+1))
    done
}

touch $2
rm $2

nbKey=0
    
while read line
do
    Dissection $line

    tailleTabCarac=${#tabCarac[*]}
    tailleTabOccu=${#tabOccu[*]}

    iteent=0
    itetailleclef=0
    tailleclef=0
    tmpmul=0
    tmpdiv=0
    entropy=0

    while test $itetailleclef != $tailleTabOccu
    do
        tailleclef=$(($tailleclef + ${tabOccu[$itetailleclef]}))
        itetailleclef=$(($itetailleclef+1))
    done

    while test $iteent != $tailleTabCarac
    do
        tmpmul=$((${tabOccu[$iteent]}*${tabOccu[$iteent]}))
        tmpdiv=$(bc -l <<< "$tmpmul / $tailleclef")     
        entropy=$(bc -l <<< "$entropy + $tmpdiv")
        iteent=$(($iteent+1))
    done 

    entropy=$(bc -l <<< "1 - ($entropy / $tailleclef)")
    entropyp=$(bc -l <<< "($entropy * $entropy)")

    entropy=$(bc -l <<< "($entropy * 100)")
    entropyp=$(bc -l <<< "($entropyp * 100)")
    
    echo -e "$line \t $entropyp" >> $2
    
    nbKey=$(($nbKey+1))
    echo $nbKey
    
done < $1

exit 0
