/*Comandos Iniciais*/
clear all
set more off
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"

/*Puxando a base*/
import excel "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\DRO_empresas.xlsx", sheet("Planilha1") firstrow
summarize

/*Agregando para formar a base anual*/
save "Base_anual_DRO.dta",replace


























