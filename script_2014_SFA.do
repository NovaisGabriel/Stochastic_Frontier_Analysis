/*Comandos Iniciais*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"

/*Puxando Master*/
use "Base_2014.dta"
global input_list insumo_1 insumo_2 insumo_3 insumo_4 insumo_5

describe $input_list
summarize $input_list
corr $input_list

/*Principal Component Analysis*/
pca $input_list
screeplot
screeplot, yline(1)
pca $input_list , mineigen(1)
estat loadings
predict pc1, score

/*Gerando a partir do PCA os outputs e inputs*/
gen output = produto
gen input1 = pc1

/*Normalizando output e input*/
egen min_output=min(output)
egen max_output=max(output)
gen normal_output=(output-min_output)/(max_output-min_output)+0.000000000001

egen min_input1=min(input1)
egen max_input1=max(input1)
gen normal_input1=(input1-min_input1)/(max_input1-min_input1)+0.000000000001

gen lnoutput = ln(normal_output)
gen lninput1 = ln(normal_input1)

/*Testando a regressão (poucas observações promovem problemas de estimação)*/
reg lnoutput lninput1
reg lnoutput lninput1, noconstant

/*Observando as firmas*/
scatter normal_output normal_input1,mlabel(dmu)

/*Iniciando o procedimento de construção do SFA*/

*skewness

reg lnoutput lninput1, noconstant
predict residual, re
sum res
*gen residual_cols = r(max)-residual
gen residual_cols = residual

histogram residual_cols, bin(100) normal
quietly summarize residual_cols
local sd = r(sd)
*graph twoway histogram residual_cols,bin(100) 

summarize residual_cols, detail

sktest residual_cols, noadj

quietly summarize residual_cols
scalar e_mean = r(mean)
scalar numero = _N
gen m2_valores = (residual_cols - e_mean)^2 
gen m3_valores = (residual_cols - e_mean)^3 
egen m2 =  mean(m2_valores)
egen m3 =  mean(m3_valores)
generate M3T_denominador = (6*((m2)^3)/numero)
generate double M3T = m3/M3T_denominador^(0.5)
display M3T[1]

*Instalando os comandos
*ssc install sfcross
*ssc install sfpainel

*Aplicando o modelo
frontier lnoutput lninput1
*frontier lnoutput lninput1, distribution(exponential) 
*frontier lnoutput lninput1, distribution(tnormal) 

*estimando a eficiência
predict sfa_residual
gen te_sfa=exp(sfa_residual)

/*Exportando Resultados*/
keep dmu anos te
gsort -te
gen rank_te =_n

sort dmu

outsheet using "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\SFA\2014\rank_2014.csv", replace
save "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\SFA\2014\rank_2014.dta",replace

