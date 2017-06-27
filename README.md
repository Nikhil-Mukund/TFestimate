# TRANSFER FUNCTION ESTIMATION TOOLBOX

MATLAB app to estimate noisy Transfer Functions. Requires MATLAB R2016b or above

Developed by: Nikhil Mukund Menon 
                        (nikhil@iucaa.in, nikhil.mukund@LIGO.ORG)

Based on MATLAB's Rationalfit and Tfest functions
                 (Ref: https://in.mathworks.com/help/rf/ug/rationalfit.html)
                 (Ref: https://in.mathworks.com/help/ident/ref/tfest.html)
## To Run App
 Open TFestimate_App_v1.mlapp
 Add new TF measurements by clicking the 'Add new file' button
 Click either Rationalfit or Tfest 
 See & modify generated IIR filters in 'Filter' Section 
 Try modifying default parameters to obtain better fits  

## Add TF measurement data to measured_TFs subfolder.
The following formats are accepted : 
   1. [Freq real_TF imag_TF]
   2. [Freq complex_TF]
   3. FRD Model


## Weighting Filter

Use either of 'Inverse' or 'Inverse Square Root'  to capture low magnitude dynamics




