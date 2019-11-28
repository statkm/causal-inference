* simulation about 6.3 ;
* Hernan MA, Robins JM (2020). Causal Inference: What If. Boca Raton: Chapman & Hall/CRC. ;



* Figure 6.5  ;
data df_check ;
  call streaminit(111) ;
  do i = 1 to 1000 ;
    A = rand('binomial', 0.5, 1) ;
	B = rand('binomial', 1/(1+exp(-2*A)), 1) ;
	Y = rand('binomial', 1/(1+exp(-2*B)), 1) ;
	output ;
   end ;
  drop i ;
run ;

proc freq data=df_check ;
  tables A * B /chisq plots=mosaicplot ;
run ;

* marginally associated ;
proc freq data=df_check ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* subpopulation with B = 1 => conditionally independent ;
proc freq data=df_check ;
  where B=1 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* with B=0 ;
proc freq data=df_check ;
  where B=0 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;




* Figure 6.3  ;
data df_check ;
  call streaminit(111) ;
  do i = 1 to 1000 ;
    L = rand('binomial', 0.5, 1) ;
	A = rand('binomial', 1/(1+exp(-2*L)), 1) ;
	Y = rand('binomial', 1/(1+exp(-2*L)), 1) ;
	output ;
   end ;
  drop i ;
run ;

* marginally associated ;
proc freq data=df_check ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* subpopulation with L = 1: conditionally independent ;
proc freq data=df_check ;
  where L=1 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* with L=0 ;
proc freq data=df_check ;
  where L=0 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;





* Figure 6.4  ;
data df_check ;
  call streaminit(111) ;
  do i = 1 to 1000 ;
	A = rand('binomial', 0.5, 1) ;
	Y = rand('binomial', 0.5, 1) ;
    L= rand('binomial', 1/(1+exp(-2*A-2*Y)), 1) ;
	output ;
   end ;
  drop i ;
run ;

* marginally independent ;
proc freq data=df_check ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* subpopulation with L = 1: conditionally associated ;
proc freq data=df_check ;
  where L=1 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* with L=0 ;
proc freq data=df_check ;
  where L=0 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;






*Figure 6.8  ;
data df_check ;
  call streaminit(111) ;
  do i = 1 to 1000 ;
    A = rand('binomial', 0.5, 1) ;
	Y = rand('binomial', 0.5, 1) ;
	L = rand('binomial', 1/(1+exp(-5*A-5*Y)), 1) ;
	C = rand('binomial', 1/(1+exp(-5*L) ), 1) ;
	output ;
   end ;
  drop i ;
run ;


* marginally independent ;
proc freq data=df_check ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* subpopulation with L = 1: conditionally associated ;
proc freq data=df_check ;
  where L=1 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;

* subpopulation with C = 1: conditionally associated but weak than the above  ;
proc freq data=df_check ;
  where C=1 ;
  tables A * Y /chisq plots=mosaicplot ;
run ;
