## Input Ratio Bar plot

<img src="https://github.com/zhiwen10/Whole_Brain_Input_Mapping/blob/master/average_area_input_ratio/git_bar_example2.png" />

## What does this do?
This is a collection of code to normalise cell count data and comapre between different experiments.
(inputs to PM vs V1 pan-layer5 RBP4 neurons, or to slender-tufted (TLX) or thick-tufted (RETRO-LP) layer5 neruons).

## Steps:
As structured in main.m file, first import cell count .xlsx files for all experiments.

Then each area cell counts were normalised to total input counts in each sample.

Experiments in the same group were thereafter avaraged.

Area ratio of any of the 4 experimental conditions exceeds 0.5%, then it's included in the final list. Otherwise deems as noise or ambigious.

Area tables were then sorted based on area locations (proximal cortex, distal cortex, thalamus, other).

Different experiments were then plotted in bar plot with error bars (standard deviation) and compared with t-ttest.



