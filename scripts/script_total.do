/*Comandos Iniciais*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"

/*Puxando Master*/
use "Base_anual_DRO.dta"
rename Ano anos
sort Sigla anos 
merge 1:1 Sigla anos using "Base_anual_DE.dta"
drop Nome _merge


/*Salvando*/
save "Base_anual_Total.dta",replace


























