#!/bin/bash

ITERATE=100 # Number of replicate populations
POP=1000 # Population size
TE=4 # Number of initial TEs
RECOMB=1e-2 # Recombination rate
OUTCROSS=1.0 # Outcrossing rate
MODEL=0 # Model of TE regulation, 0=Compete and 1=Parasite

for (( i=0; i<$ITERATE; i++ ))
do
	slim -d RUN=$i -d TE_INITIAL=$TE -d K=$POP -d RECOMB=$RECOMB -d OUTCROSSING=$OUTCROSS -d MODEL=$MODEL NonWFFull.slim
done
