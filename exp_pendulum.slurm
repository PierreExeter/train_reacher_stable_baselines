#!/bin/sh
# Slurm flags                                                                                                                                                                              
#SBATCH -p DevQ                                                                                                                                                                                
#SBATCH -N 1                                                                                                                                                                                     
#SBATCH -t 00:10:00                                                                                                                                                                                 
#SBATCH -A ucd01                                                                                                                                                                                        
#SBATCH -o submission_log/output.txt                                                                                                                                                                                                          
# Mail me on job start & end                                                                                                                                                                            
#SBATCH --mail-user=pierre.aumjaud@ucd.ie                                                                                                                                    
#SBATCH --mail-type=BEGIN,END  

cd $SLURM_SUBMIT_DIR

# Load software                                                                                                                                                                                                                
module load conda/2
source activate base_G5
module load cuda/10.0

# Run code                                                                                                                                                                                    
date
time ./run_experiments_pendulum.sh
date
