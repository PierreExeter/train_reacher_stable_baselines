#!/bin/bash


# j=3
# for ((j=3;j<9;j+=1))
# do
# echo "NUMBER OF ENV: $j"

for ((i=1;i<11;i+=1))
do
    echo "a2c $i"
    python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_8_norm --exp-id $i --no-render -n 20000
    python plot_results.py -f logs/a2c/Pendulum-v0_Env_8_norm/a2c/Pendulum-v0_$i/

    # echo "acktr $i"
    # python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_1 --exp-id $i --no-render -n 20000
    # python plot_results.py -f logs/a2c/Pendulum-v0_Env_1/a2c/Pendulum-v0_$i/

    # echo "ppo2 $i"
    # python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_1 --exp-id $i --no-render -n 20000
    # python plot_results.py -f logs/a2c/Pendulum-v0_Env_1/a2c/Pendulum-v0_$i/

    # echo "ddpg $i"
    # python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_1 --exp-id $i --no-render -n 20000
    # python plot_results.py -f logs/a2c/Pendulum-v0_Env_1/a2c/Pendulum-v0_$i/

    # echo "sac $i"
    # python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_1 --exp-id $i --no-render -n 20000
    # python plot_results.py -f logs/a2c/Pendulum-v0_Env_1/a2c/Pendulum-v0_$i/

    # echo "td3 $i"
    # python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_1 --exp-id $i --no-render -n 20000
    # python plot_results.py -f logs/a2c/Pendulum-v0_Env_1/a2c/Pendulum-v0_$i/

    # echo "trpo $i"
    # python enjoy.py --algo a2c --env Pendulum-v0 -f logs/a2c/Pendulum-v0_Env_1 --exp-id $i --no-render -n 20000
    # python plot_results.py -f logs/a2c/Pendulum-v0_Env_1/a2c/Pendulum-v0_$i/
done
# done