### Library Numpy

# check statistics

import numpy as np

sample = (1, 2, 5, 9, 200) 

np.mean(sample) # mean
np.var(sample) # variance

np.std(sample) # standard deviation
np.max(sample) # maximum
np.min(sample) # minimum
np.median(sample) # median

np.percentile(sample, 25) # Q1
np.percentile(sample, 50) # Q2 = median
np.percentile(sample, 75) # Q3
np.percentile(sample, 46) # 46th percentile
