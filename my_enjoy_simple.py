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

model_path = "logs/ppo2/Reacher2Dof-v0_1/Reacher2Dof-v0.zip"

env = gym.make(env_name)
# The algorithms require a vectorized environment to run
env = DummyVecEnv([lambda: env])


model = PPO2.load(model_path, env=env)


env.render(mode="human")  # this needs to be placed BEFORE env.reset()


for episode in range(20):
    obs = env.reset()             
    rewards = []
    
    for t in range(100):
        # action = env.action_space.sample()  
        action, _states = model.predict(obs, deterministic=True)
        obs, reward, done, info = env.step(action) 
        rewards.append(reward)
        time.sleep(1./30.) 

