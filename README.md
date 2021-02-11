# TRANSFER FUNCTION ESTIMATION TOOLBOX

```diff 
- ALERT !!!! This project is now archived. 
- For better results & functionalities use RIFF: Robust IIR Fitting & Filtering
- https://github.com/Nikhil-Mukund/RIFF 
```

MATLAB app to estimate noisy Transfer Functions. Requires MATLAB R2016b or above

Developed by: Nikhil Mukund Menon 
                        (nikhil@iucaa.in, nikhil.mukund@LIGO.ORG)

Based on MATLAB's Rationalfit and Tfest functions

                 (Ref: https://in.mathworks.com/help/rf/ug/rationalfit.html)

                 (Ref: https://in.mathworks.com/help/ident/ref/tfest.html)


![Alt text](TFestimate_App.png?raw=true "TFestimate App Screenshot")


## To Run App
Open Matlab (Recommended Version: R2018b)

Go to TFestimate folder
 
Run TFestimate_App_v1.mlapp

Add new TF measurements by clicking the 'Add new file' button

Click either Rationalfit or Tfest 

See & modify generated IIR filters in 'Filter' Section 

Try modifying default parameters to obtain better fits  

## Add TF measurement data to measured_TFs subfolder.
The following formats are accepted : 
   1. [Freq real_TF imag_TF]
   2. [Freq complex_TF]
   3. [Freq Mag Phs(in radian) ]
   4. FRD Model


## Weighting Filter

Use either of 'Inverse' or 'Inverse Square Root'  to capture low magnitude dynamics




