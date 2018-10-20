/*Comandos Iniciais*/
clear all
set more off
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"
use "Base_anual_Total.dta"
sort anos
#delim ;

/*==================================Analisando Cada Empresa em Dados Estatísticos=======================================================*/
/*PP*/
gen PP_graph=PP/1000000;
twoway (line PP_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line PP_graph anos if Sigla=="GLO")(line PP_graph anos if Sigla=="ONE")
(line PP_graph anos if Sigla=="PTB")(line PP_graph anos if Sigla=="SLX")
(line PP_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Número de Passageiros Pagos") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\PP_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\PP_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\PP_graph.png", width(4000);

/*CP_Kg*/
gen CP_Kg_graph=CP_kg/1000000;
twoway (line PP_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line CP_Kg_graph anos if Sigla=="GLO")(line CP_Kg_graph anos if Sigla=="ONE")
(line CP_Kg_graph anos if Sigla=="PTB")(line CP_Kg_graph anos if Sigla=="SLX")
(line CP_Kg_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Kg de Carga Paga") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\CP_Kg_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\CP_Kg_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\CP_Kg_graph.png", width(4000);


/*Cor_Kg*/
gen Cor_Kg_graph=Cor_kg/1000000;
twoway (line PP_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line Cor_Kg_graph anos if Sigla=="GLO")(line Cor_Kg_graph anos if Sigla=="ONE")
(line Cor_Kg_graph anos if Sigla=="PTB")(line Cor_Kg_graph anos if Sigla=="SLX")
(line Cor_Kg_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Kg de Correio") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Cor_Kg_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Cor_Kg_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Cor_Kg_graph.png", width(4000);


/*CombL*/
gen combL_graph=combL/1000000;
twoway (line combL_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line combL_graph anos if Sigla=="GLO")(line combL_graph anos if Sigla=="ONE")
(line combL_graph anos if Sigla=="PTB")(line combL_graph anos if Sigla=="SLX")
(line combL_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Combustível em Litros") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\CombL_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\CombL_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\CombL_graph.png", width(4000);

/*Dec*/
gen Dec_graph=Dec/1000;
twoway (line Dec_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line Dec_graph anos if Sigla=="GLO")(line Dec_graph anos if Sigla=="ONE")
(line Dec_graph anos if Sigla=="PTB")(line Dec_graph anos if Sigla=="SLX")
(line Dec_graph anos if Sigla=="TAM"),ytitle("Número (Milhares)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Número de Decolagens") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Dec_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Dec_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Dec_graph.png", width(4000);

/*A*/
gen A_graph=A/1000000;
twoway (line Dec_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line A_graph anos if Sigla=="GLO")(line A_graph anos if Sigla=="ONE")
(line A_graph anos if Sigla=="PTB")(line A_graph anos if Sigla=="SLX")
(line A_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Número de Assentos") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\A_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\A_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\A_graph.png", width(4000);

/*H*/
gen H_graph=H/1000000;
twoway (line Dec_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line H_graph anos if Sigla=="GLO")(line H_graph anos if Sigla=="ONE")
(line H_graph anos if Sigla=="PTB")(line H_graph anos if Sigla=="SLX")
(line H_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Número de Horas de Voo") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\H_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\H_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\H_graph.png", width(4000);

/*Pyl*/
gen Pyl_graph=Pyl/1000000;
twoway (line Pyl_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line Pyl_graph anos if Sigla=="GLO")(line Pyl_graph anos if Sigla=="ONE")
(line Pyl_graph anos if Sigla=="PTB")(line Pyl_graph anos if Sigla=="SLX")
(line Pyl_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Payload em Kg") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Pyl_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Pyl_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\Pyl_graph.png", width(4000);

/*B_kg*/
gen B_kg_graph=B_kg/1000000;
twoway (line B_kg_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line B_kg_graph anos if Sigla=="GLO")(line B_kg_graph anos if Sigla=="ONE")
(line B_kg_graph anos if Sigla=="PTB")(line B_kg_graph anos if Sigla=="SLX")
(line B_kg_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Quantidade de Bagagem em Kg") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\B_kg_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\B_kg_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\B_kg_graph.png", width(4000);

/*D*/
gen D_graph=D/1000000;
twoway (line D_graph anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line D_graph anos if Sigla=="GLO")(line D_graph anos if Sigla=="ONE")
(line D_graph anos if Sigla=="PTB")(line D_graph anos if Sigla=="SLX")
(line D_graph anos if Sigla=="TAM"),ytitle("Número (Milhões)",height(30)) 
title("Análise dos Dados Estatísticos das Empresas") subtitle("Distância em Km") 
note("Fonte: ANAC - Agência Nacional de Aviação Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\D_graph.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\D_graph.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final\ADBD\D_graph.png", width(4000);

