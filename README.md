# MPM_preprocessing
Inspired by strange dicom to nifti conversions - sorted
OHBM, 2019, Rome: Informed at poster session by another lab that they encountered difficulty in MPM preprocessing. 
Turned out that dicom to nifti conversion was failing. 
The standard conversion yielded mosaic, and/or individual slices instead of 1 volume per echo. 
This is likely not an uncommon problem, because the VBQ toolbox contains the following function:
GetImgFromMosaic.m
This function sorts dicoms according to their image weighting and echo and places them in respective folders. 
Once this process is done, standard dicom to nifti conversion can be performed (here with SPM, but whatever suits).
Important caveat: GetImgFromMosaic.m calls on function 'isdicom'. If you do not have it, please download it from 
https://ch.mathworks.com/matlabcentral/fileexchange/11431-isdicom.
