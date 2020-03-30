#!/bin/bash


for ((i=0;i<10;i+=1))
do
    python train.py \
       --algo a2c \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log01.run

    python train.py \
       --algo acktr \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log02.run

    python train.py \
       --algo ppo2 \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log03.run

    python train.py \
       --algo ddpg \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log04.run

    python train.py \
       --algo sac \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log05.run

    python train.py \
       --algo td3 \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log06.run

    python train.py \
       --algo trpo \
       --env ReacherBulletEnv-v0 \
       --eval-episodes 10 \ 
       --seed $i \
       &> submission_log/log07.run

done

