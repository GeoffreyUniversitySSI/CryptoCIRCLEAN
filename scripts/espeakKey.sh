#!/bin/bash

key=$(gpg --gen-random --armor 1 15)

LENGTH=${#key}
COUNTER=0
until [ "$COUNTER" -ge "$LENGTH" ] ; do
STR=${key:$COUNTER:1}
case $STR in
	a) OUTPUT="$OUTPUT alpha"
	;;
	A) OUTPUT="$OUTPUT ALPHA"
	;;
	b) OUTPUT="$OUTPUT bravo"
	;;
	B) OUTPUT="$OUTPUT BRAVO"
	;;
	c) OUTPUT="$OUTPUT charlie"
	;;
	C) OUTPUT="$OUTPUT CHARLIE"
	;;
	d) OUTPUT="$OUTPUT delta"
	;;
	D) OUTPUT="$OUTPUT DELTA"
	;;
	e) OUTPUT="$OUTPUT echo"
	;;
	E) OUTPUT="$OUTPUT ECHO"
	;;
	f) OUTPUT="$OUTPUT foxtrot"
	;;
	F) OUTPUT="$OUTPUT FOXTROT"
	;;
	g) OUTPUT="$OUTPUT golf"
	;;
	G) OUTPUT="$OUTPUT GOLF"
	;;
	h) OUTPUT="$OUTPUT hotel"
	;;
	H) OUTPUT="$OUTPUT HOTEL"
	;;
	i) OUTPUT="$OUTPUT india"
	;;
	I) OUTPUT="$OUTPUT INDIA"
	;;
	j) OUTPUT="$OUTPUT juliet"
	;;
	J) OUTPUT="$OUTPUT JULIET"
	;;
	k) OUTPUT="$OUTPUT kilo"
	;;
	K) OUTPUT="$OUTPUT KILO"
	;;
	l) OUTPUT="$OUTPUT lima"
	;;
	L) OUTPUT="$OUTPUT LIMA"
	;;
	m) OUTPUT="$OUTPUT mike"
	;;
	M) OUTPUT="$OUTPUT MIKE"
	;;
	n) OUTPUT="$OUTPUT november"
	;;
	N) OUTPUT="$OUTPUT NOVEMBER"
	;;
	o) OUTPUT="$OUTPUT oscar"
	;;
	O) OUTPUT="$OUTPUT OSCAR"
	;;
	p) OUTPUT="$OUTPUT papa"
	;;
	P) OUTPUT="$OUTPUT PAPA"
	;;
	q) OUTPUT="$OUTPUT quebec"
	;;
	Q) OUTPUT="$OUTPUT QUEBEC"
	;;
	r) OUTPUT="$OUTPUT romeo"
	;;
	R) OUTPUT="$OUTPUT ROMEO"
	;;
	s) OUTPUT="$OUTPUT sierra"
	;;
	S) OUTPUT="$OUTPUT SIERRA"
	;;
	t) OUTPUT="$OUTPUT tango"
	;;
	T) OUTPUT="$OUTPUT TANGO"
	;;
	u) OUTPUT="$OUTPUT uniform"
	;;
	U) OUTPUT="$OUTPUT UNIFORM"
	;;
	v) OUTPUT="$OUTPUT victor"
	;;
	V) OUTPUT="$OUTPUT VICTOR"
	;;
	w) OUTPUT="$OUTPUT whiskey"
	;;
	W) OUTPUT="$OUTPUT WHISKEY"
	;;
	x) OUTPUT="$OUTPUT xray"
	;;
	X) OUTPUT="$OUTPUT XRAY"
	;;
	y) OUTPUT="$OUTPUT yankee"
	;;
	Y) OUTPUT="$OUTPUT YANKEE"
	;;
	z) OUTPUT="$OUTPUT zulu"
	;;
	Z) OUTPUT="$OUTPUT ZULU"
	;;
	1) OUTPUT="$OUTPUT 1"
	;;
	2) OUTPUT="$OUTPUT 2"
	;;
	3) OUTPUT="$OUTPUT 3"
	;;
	4) OUTPUT="$OUTPUT 4"
	;;
	5) OUTPUT="$OUTPUT 5"
	;;
	6) OUTPUT="$OUTPUT 6"
	;;
	7) OUTPUT="$OUTPUT 7"
	;;
	8) OUTPUT="$OUTPUT 8"
	;;
	9) OUTPUT="$OUTPUT 9"
	;;
	0) OUTPUT="$OUTPUT 0"
	;;
	"#") OUTPUT="$OUTPUT #"
	;;
	"$") OUTPUT="$OUTPUT $"
	;;
	"%") OUTPUT="$OUTPUT %"
	;;
	"&") OUTPUT="$OUTPUT &"
	;;
	"'") OUTPUT="$OUTPUT '"
	;;
	"(") OUTPUT="$OUTPUT ("
	;;
	")") OUTPUT="$OUTPUT )"
	;;
	"*") OUTPUT="$OUTPUT *"
	;;
	"+") OUTPUT="$OUTPUT +"
	;;
	",") OUTPUT="$OUTPUT ,"
	;;
	"-") OUTPUT="$OUTPUT -"
	;;
	".") OUTPUT="$OUTPUT ."
	;;
	"/") OUTPUT="$OUTPUT /"
	;;
	":") OUTPUT="$OUTPUT :"
	;;
	";") OUTPUT="$OUTPUT ;"
	;;
	"<") OUTPUT="$OUTPUT <"
	;;
	"=") OUTPUT="$OUTPUT ="
	;;
	">") OUTPUT="$OUTPUT >"
	;;
	"?") OUTPUT="$OUTPUT ?"
	;;
	"@") OUTPUT="$OUTPUT @"
	;;
	"[") OUTPUT="$OUTPUT ["
	;;
	"]") OUTPUT="$OUTPUT ]"
	;;
	"^") OUTPUT="$OUTPUT ^"
	;;
	"_") OUTPUT="$OUTPUT _"
	;;
	"{") OUTPUT="$OUTPUT {"
	;;
	"}") OUTPUT="$OUTPUT }"
	;;
	"|") OUTPUT="$OUTPUT |"
	;;
	"~") OUTPUT="$OUTPUT ~"
	;;
	esac
	let COUNTER+=1
done

echo $key
echo $OUTPUT

espeak -vfr -s 1 "voici la clef qui seras répéter 3 fois"
espeak -vfr -s 1 "Attention 3 2 1 go"
espeak -ven -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$OUTPUT"
espeak -ven -s 1 "repeat"
espeak -ven -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$OUTPUT"
espeak -vde -s 1 "wiederholen"
espeak -ven -s 1 -k 2 -g 20 --punct="#$%&'()*+,-./:;<=>?@[]^_{|}~" "$OUTPUT"
echo $keyspace
