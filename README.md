# deeplearning
Jupiter notebooks for mybinder and IJ macro for 3D segmentation of nuclei 
The purpose of this workflow is to train and apply a 3D StarDist model (Schmitt et al)
and to facilitate the 3D annotations.
* The first step is the train/validate/apply in 2D on cropped stacks of 3D data 
* Second step is the manual merging /correction of th 2D annotation based on a IJ macro to speed up the 3D annotations
* The last step use this 3D annotation created from the 3D segmentation to train the 3D Stardist model, and then apply it.


Original 3D data:
confocal microscope Nikon A1 RSi (Nikon SAS, Champigny sur Marne, Fr) with  objective 60x 

0.21 x 0.21 x 0.50 um
DAPI staining
Colon samples from adult mouse

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/anrcrocoval/deeplearning/master)


Deploying locally on your computer
For example Windows:
Use anaconda command propt (install iof necessary using https://www.anaconda.com/products/individual download)
tehn pip install tensorflow and stardist, and other requirements by 
pip install -r requirements.txt
Note that you may need to install visual C++ compiler 14.0 from https://visualstudio.microsoft.com/downloads/
(build tools only, no need for the full visual studio)
Some note for Cuda:


To install the prerequisites for GPU support in TensorFlow 2.1:

Install your latest GPU drivers.
Install CUDA 10.1.
If the CUDA installer reports "you are installing an older driver version", you may wish to choose a custom installation and deselect some components. Indeed, note that software bundled with CUDA including GeForce Experience, PhysX, a Display Driver, and Visual Studio integration are not required by TensorFlow.
Also note that TensorFlow requires a specific version of the CUDA Toolkit unless you build from source; for TensorFlow 2.1 and 2.2, this is currently version 10.1.
Install cuDNN.
Download cuDNN v7.6.4 for CUDA 10.1. This will require you to sign up to the NVIDIA Developer Program.
Unzip to a suitable location and add the bin directory to your PATH.
Install tensorflow by pip install tensorflow.
You may need to restart your PC.

TROUBLESHOOTING:
- getiing some message about cudacnn that can not be launched: it can simply comes frome GPU memory overload, try to kill your training kernel if it happened in the prediction stage for example.

Using Stardist: https://github.com/mpicbg-csbd/stardist
Uwe Schmidt, Martin Weigert, Coleman Broaddus, and Gene Myers.
Cell Detection with Star-convex Polygons.
International Conference on Medical Image Computing and Computer-Assisted Intervention (MICCAI), Granada, Spain, September 2018.

Martin Weigert, Uwe Schmidt, Robert Haase, Ko Sugawara, and Gene Myers.
Star-convex Polyhedra for 3D Object Detection and Segmentation in Microscopy.
The IEEE Winter Conference on Applications of Computer Vision (WACV), Snowmass Village, Colorado, March 2020
