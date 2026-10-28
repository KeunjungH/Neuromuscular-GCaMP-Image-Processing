# Neuromuscular-GCaMP-Image-Processing
The custom ImageJ/Fiji macro Pre-Processing Tiff Stacks v2.ijm was developed by Annika Naveen for preprocessing fluorescence imaging data from human iPSC-derived neuromuscular coculture experiments.

This macros was developed to facilitate image preprocessing for downstream analysis of neuromuscular activity and structural organization.

File: Pre-Processing Tiff Stacks v2.ijm
Purpose: These macros facilitate the preprocessing of TIFF images exported from high-content imaging experiments, including
• Time-series images: Live-cell calcium imaging (GCaMP).
• Z-stack images: Fluorescence images acquired across multiple focal planes.
• Multichannel images: Images acquired using multiple fluorescence channels.

The processed images can be used for downstream analysis in ImageJ/Fiji or other image analysis software.

Instructions
1. Open the macro
• Open ImageJ/Fiji.
• Open Pre-Processing Tiff Stacks v2.ijm.
• Click Run

2. Enter imaging parameters
A dialog box will appear requesting the following information:
• File path: Copy and paste the full directory path to the Measurements folder containing the original TIFF images.
• Time points: For live-cell imaging, enter the total number of frames. For example, imaging at 10 Hz for 1 minute corresponds to 600 time points.
• Z-slices: For Z-stack acquisitions, enter the number of Z-slices.
• Channels: For multichannel fluorescence imaging, enter the number of channels.

Important: Set any unused parameters to 1.

3. Verify the parameters
After entering the parameters, click OK.
The macro will display the number of image stacks to be generated.

4. Locate the processed images
The macro creates a new folder named Videos within the original Measurements directory.
This folder contains the generated TIFF image stacks for subsequent analysis.
