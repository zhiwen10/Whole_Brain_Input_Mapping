# whole-brain-input-mapping
# Data processing pipeline and code/data sharing

# Data description:
Mice brains were infected with monosynaptic tracing N2c rabies virus, targeting either V1 or PM layer5 neurons in the visual cortex. Starter cells were labeled with green GFP, while input cells were labeled with red mCherry. After perfusion, brains samples were harvested, embedded using 4-5% agarose gel in 0.1M PB, and imaged using serial two-photon tomography.

In general, 40 um physical sections were cut coronally, followed by imaging of 8 optical planes at the depth of every 5 um with 1.2 um x1.2 um resolution, without line averaging (around 12 hours to process one sample, generating 1TB data). Three channels were generated during the process, with red in channel 2, green in channel 3, blue autofluorescence in channel 4. Image tiles for each channel were stitched with Matlab script StitchIt (https://github.com/SainsburyWellcomeCentre/StitchIt).
