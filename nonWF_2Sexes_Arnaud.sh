#!/bin/bash

ITERATE=100
POP=1000
TE=4
RECOMB=1e-2
OUTCROSS=1.0
MODEL=0

for (( i=0; i<$ITERATE; i++ ))
do
	slim -d RUN=$i -d TE_INITIAL=$TE -d K=$POP -d RECOMB=$RECOMB -d OUTCROSSING=$OUTCROSS -d MODEL=$MODEL NonWFFull.slim
done
