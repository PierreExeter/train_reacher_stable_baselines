import gym
import numpy as np
import pandas as pd
from pathlib import Path
import gym_reacher
import time

from stable_baselines.common.policies import MlpPolicy, MlpLstmPolicy, MlpLnLstmPolicy
from stable_baselines.common.vec_env import DummyVecEnv
from stable_baselines import A2C, ACKTR, DDPG, PPO1, PPO2, SAC, TRPO, TD3
from stable_baselines.deepq.policies import MlpPolicy as mlp_dqn
from stable_baselines.sac.policies import MlpPolicy as mlp_sac
from stable_baselines.ddpg.policies import MlpPolicy as mlp_ddpg
from stable_baselines.td3.policies import MlpPolicy as mlp_td3
from stable_baselines.ddpg.noise import NormalActionNoise, OrnsteinUhlenbeckActionNoise



# create environment
# env_name = 'Reacher1Dof-v0'
env_name = 'Reacher2Dof-v0'
# env_name = 'Reacher3Dof-v0'
# env_name = 'Reacher4Dof-v0'
# env_name = 'Reacher5Dof-v0'
# env_name = 'Reacher6Dof-v0'

env = gym.make(env_name)
# The algorithms require a vectorized environment to run
# env = DummyVecEnv([lambda: env])





model_list = [
    A2C(MlpPolicy, env, verbose=1, tensorboard_log=tensorboard_dir+"A2C/"),
    ACKTR(MlpPolicy, env, verbose=1, tensorboard_log=tensorboard_dir+"ACKTR/"),
    DDPG(mlp_ddpg, env, verbose=1, tensorboard_log=tensorboard_dir+"DDPG/"),
    PPO1(MlpPolicy, env, verbose=1, tensorboard_log=tensorboard_dir+"PPO1/"),
    PPO2(MlpPolicy, env, verbose=1, tensorboard_log=tensorboard_dir+"PPO2/"),
    SAC(mlp_sac, env, verbose=1, tensorboard_log=tensorboard_dir+"SAC/"),
    TRPO(MlpPolicy, env, verbose=1, tensorboard_log=tensorboard_dir+"TRPO/"),
    TD3(mlp_td3, env, action_noise=action_noise, verbose=1, tensorboard_log=tensorboard_dir+"TD3/"),
]

algo_list = ['A2C', 'ACKTR', 'DDPG', 'PPO1', 'PPO2', 'SAC', 'TRPO', 'TD3']


env.render(mode="human")  # this needs to be placed BEFORE env.reset()


print(algo)
model = model.load(trained_dir+algo)


for episode in range(20):
    obs = env.reset()             
    rewards = []
    
    for t in range(100):
        # action = env.action_space.sample()  
        action, _states = model.predict(obs, deterministic=True)
        obs, reward, done, info = env.step(action) 
        rewards.append(reward)
        time.sleep(1./30.) 

