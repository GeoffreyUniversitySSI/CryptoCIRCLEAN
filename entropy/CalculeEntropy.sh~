#!/bin/bash
#$1 = nom du fichier
#$2 = clef

inArray()
{ 
    #$1 = lettre à rechercher
    #$2 = longueur tableau
    if [[ "$#" -ne 1 ]]; then
        echo "je veux UN putin de paramêtre, connard!  ->$1 ."
        exit
    else
        cmpt1=0
        nb=${#tabCarac[*]}
        ok=0
        
        while test $cmpt1 != $nb
        do	
	        echo "on veut: $1 , on a: ${tabCarac[$cmpt1]}"
	        
		    if [ "${1}" == "${tabCarac[${cmpt1}]}" ]; then
		        occu=$cmpt1
		        ok=$(($ok+1))
		        echo "rentrer"
            fi
		    cmpt1=$(($cmpt1+1))
		    
	    done
	    
	    #si variable pas set, char non trouvé: on renvoit -1
	    if [ $ok -eq 0 ]; then
	        occu=-1
	    fi
    fi

}

clef=9LHzmQCrYo+waBsSMA3G
longueur=${#clef}
cmpt=0

echo "length: $longueur | cmpt: $cmpt"

while test $cmpt != $longueur
do
	charatest=${clef:$cmpt:1}
	
	if [ $cmpt -eq 0 ]; then
	    tabCarac[$cmpt]=$charatest
        tabOccu[$cmpt]=1
        
    else
        inArray $charatest 

	    echo "occu si -1 pas present: $occu"
	    echo "char a test: $charatest"
	    
	    if [ $occu -ge 0 ]; then
	       echo "caca"
	       tabOccu[$occu]=$((${tabOccu[$occu]}+1))
	       
	    else
            echo "pipi: $charatest"
            pos=${#tabCarac[*]}
            tabCarac[$pos]=$charatest
            tabOccu[$pos]=1
            echo "pos: $pos"
	    fi
	fi
	
	echo " tab: ${tabCarac[@]}"
	echo " tab: ${tabOccu[@]}"
	cmpt=$(($cmpt+1))
done

exit 0
