# TRANSFER FUNCTION ESTIMATION TOOLBOX

MATLAB app to estimate Transfer Functions. Requires MATLAB R2016b or above

Developed by: Nikhil Mukund Menon 
                        (nikhil@iucaa.in, nikhil.mukund@LIGO.ORG)

Based on MATLAB's TFEST function
                 (Ref: https://in.mathworks.com/help/ident/ref/tfest.html)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Add TF measurement data to measured_TFs subfolder.
The following formats are accepted : 
   1. [Freq real_TF imag_TF]
   2. [Freq complex_TF]
   3. FRD Model


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 Weighting Filter

Use either of 'Inverse' or 'Inverse Square Root'  to capture low magnitude dynamics




