tmpmul=1
tailleclef=9

entropy=$(bc -l <<< "$tmpmul / $tailleclef")

echo $entropy
