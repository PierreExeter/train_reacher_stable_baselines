#!/bin/bash


python train.py --algo a2c --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo acktr --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo ppo2 --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo ddpg --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo sac --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo td3 --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo ppo2 --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median
python train.py --algo trpo --env Pendulum-v0 -n 100000 -optimize --n-trials 100 --n-jobs -1 --sampler tpe --pruner median

