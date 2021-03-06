#!/bin/bash

ENV=Tiger
SOLVER=LinearAlphaNet
EPSILON_DECAY=0.99
EPSILON_DECAY_STEP=75
EPSILON_MINIMUM=0.02
EPSILON_START=0.2
LEARNING_RATE=0.05
LEARNING_RATE_DECAY=0.996
LEARNING_RATE_DECAY_STEP=50
LEARNING_RATE_MINIMUM=0.00025
MAX_STEPS=50
SEED=111
N_EPOCHS=5000
TEST=5

echo "Linear Alpha Nets with multiple seeds"
echo "==================================="

seeds=(122 29410 4111 1637 12256)

for i in ${seeds[@]}; do
	SEED=${i}
	args="--env $ENV --solver $SOLVER --seed $SEED --max_steps $MAX_STEPS --n_epochs $N_EPOCHS --epsilon_start $EPSILON_START \
    	     --epsilon_decay $EPSILON_DECAY --epsilon_decay_step $EPSILON_DECAY_STEP --epsilon_minimum $EPSILON_MINIMUM  \
   	     --learning_rate $LEARNING_RATE --learning_rate_decay $LEARNING_RATE_DECAY --learning_rate_decay_step $LEARNING_RATE_DECAY_STEP \
    	     --learning_rate_minimum $LEARNING_RATE_MINIMUM --test $TEST --use_tf --save"
	echo $args

	python vi.py $args > "experiments/results/lan-seed-${i}.txt" &
done
exit 0

