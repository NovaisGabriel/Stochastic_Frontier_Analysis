/*Comandos Iniciais*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"

/*Puxando Master*/
use "Base_anual_Total.dta"
rename Sigla dmu

/*Definindo os Outputs e os Inputs*/
gen insumo_1 = A
gen insumo_2 = DespesasAdministrativaseGerais
gen insumo_3 = Pyl
gen insumo_4 = CustocomCombustvel/combL
gen insumo_5 = (CustocomComissriosdeBordo+CustocomTripulantesTcnicos)/H

gen PP_kg = PP*75
*gen produto = (ReceitadePassagem/(D*PP_kg))+(ReceitadeCarga/(D*CP_kg))
gen produto = PP_kg/D + CP_kg/D + Cor_kg/D

/*Salvando*/
save "Base_anual_Total_Final.dta",replace

/*Criando base de 2010*/
drop if anos~=2010
save "Base_2010.dta",replace

/*Criando base de 2011*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"
use "Base_anual_Total_Final.dta"
drop if anos~=2011
save "Base_2011.dta",replace

/*Criando base de 2012*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"
use "Base_anual_Total_Final.dta"
drop if anos~=2012
save "Base_2012.dta",replace

/*Criando base de 2013*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"
use "Base_anual_Total_Final.dta"
drop if anos~=2013
save "Base_2013.dta",replace

/*Criando base de 2014*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"
use "Base_anual_Total_Final.dta"
drop if anos~=2014
save "Base_2014.dta",replace
