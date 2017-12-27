Spherical MNI ROIs builder
-----------------------------------

Function builds spherical Regions of Interests (ROIs) in .mat and .img format from list of MNI coordinates.

**Inputs:**   

- $$coordinates$$, list of MNI coordinates (1 coordinate per row, separate column for x, y, z)                
- $$radius$$, radius of the sphere in .mm
- $$label$$, label for naming ROIs (e.g. "Power_consensus")
               
**Outputs:**  
- .mat sphere ROIs in /mat/ directory
- .img sphere ROIs in /img/ directory

**Requires:** 
- SPM12 Toolbox (http://www.fil.ion.ucl.ac.uk/spm/software/spm12/) 
- MarsBar Toolbox (http://marsbar.sourceforge.net/) 
