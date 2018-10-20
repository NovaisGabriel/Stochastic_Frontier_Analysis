/*Comandos Iniciais*/
clear all
set more off
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final"
use "Base_anual_Total.dta"
sort anos
#delim ;

/*Criando vari�veis auxiliares para verificar estat�sticas*/
gen fracao_receita_passageiro = 100*ReceitadePassagem / TotaldaReceitadeVoo;

gen fracao_custos_tecnicos = 100*CustocomTripulantesTcnicos/TotaldeCustosDiretos;
gen fracao_custos_comissarios = 100*CustocomComissriosdeBordo/TotaldeCustosDiretos;
gen fracao_custos_combustiveis  = 100*CustocomCombustvel/TotaldeCustosDiretos;
gen fracao_custos_direto = fracao_custos_tecnicos+fracao_custos_comissarios+fracao_custos_combustiveis;

gen fracao_custos_servicosbordo =100*CustoServiodeBordo/TotaldeCustosIndiretos;
gen fracao_custos_indiretos = fracao_custos_servicosbordo;

gen fracao_custos_trafego = 100*OrganizaoTrfegoPassageiro/TotaldeDespesasOperacionais;
gen fracao_custos_carga =  100*OrganizaoTrfegoCarga/TotaldeDespesasOperacionais;
gen fracao_custos_administrativas = 100*DespesasAdministrativaseGerais/TotaldeDespesasOperacionais;
gen fracao_custos_operacionais = fracao_custos_trafego+fracao_custos_carga+fracao_custos_administrativas;

gen fracao_custos_resultado = (CustocomTripulantesTcnicos+CustocomComissriosdeBordo+CustocomCombustvel+
CustoServiodeBordo+OrganizaoTrfegoPassageiro+OrganizaoTrfegoCarga+DespesasAdministrativaseGerais)/TotaldaReceitadeVoo;


/*==================================Analisando Cada Empresa em DRO=======================================================*/

/*Receitas de Passagem*/
twoway (line ReceitadePassagem anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line ReceitadePassagem anos if Sigla=="GLO")(line ReceitadePassagem anos if Sigla=="ONE")
(line ReceitadePassagem anos if Sigla=="PTB")(line ReceitadePassagem anos if Sigla=="SLX")
(line ReceitadePassagem anos if Sigla=="TAM"),ytitle("Montante (Milh�es)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Receita proveniente de Passagem") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM"))
ylabel(0 "0" 2000000 "2" 4000000 "4" 6000000 "6" 8000000 "8") 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\ReceitasPassagem.gph");

graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\ReceitasPassagem.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\ReceitasPassagem.png", width(4000);

/*Receitas Total de Voo*/
twoway (line TotaldaReceitadeVoo anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line TotaldaReceitadeVoo anos if Sigla=="GLO")(line TotaldaReceitadeVoo anos if Sigla=="ONE")
(line TotaldaReceitadeVoo anos if Sigla=="PTB")(line TotaldaReceitadeVoo anos if Sigla=="SLX")
(line TotaldaReceitadeVoo anos if Sigla=="TAM"),ytitle("Montante (Milh�es)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Receita Total de Voo") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM"))
ylabel(0 "0" 2000000 "2" 4000000 "4" 6000000 "6" 8000000 "8") 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\TotaldaReceitadeVoo.gph");

graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\TotaldaReceitadeVoo.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\TotaldaReceitadeVoo.png", width(4000);

/*Fra��o de Receitas de Passagem*/
twoway (line fracao_receita_passageiro anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_receita_passageiro anos if Sigla=="GLO")(line fracao_receita_passageiro anos if Sigla=="ONE")
(line fracao_receita_passageiro anos if Sigla=="PTB")(line fracao_receita_passageiro anos if Sigla=="SLX")
(line fracao_receita_passageiro anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Receita proveniente de Passagem") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM"))  
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\FracaoReceitasPassagem.gph");

graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\FracaoReceitasPassagem.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\FracaoReceitasPassagem.png", width(4000);

/*Resultado de Voo*/
twoway (line ResultadodeVoo anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line ResultadodeVoo anos if Sigla=="GLO")(line ResultadodeVoo anos if Sigla=="ONE")
(line ResultadodeVoo anos if Sigla=="PTB")(line ResultadodeVoo anos if Sigla=="SLX")
(line ResultadodeVoo anos if Sigla=="TAM"),ytitle("Montante (Milh�es)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Resultado Total de Voo") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM"))
ylabel(0 "0" 500000 "0.5" 1000000 "1") 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\ResultadodeVoo.gph");

graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\ResultadodeVoo.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\ResultadodeVoo.png", width(4000);

/*Fra��o de Custos Tecnicos*/
twoway (line fracao_custos_tecnicos anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_tecnicos anos if Sigla=="GLO")(line fracao_custos_tecnicos anos if Sigla=="ONE")
(line fracao_custos_tecnicos anos if Sigla=="PTB")(line fracao_custos_tecnicos anos if Sigla=="SLX")
(line fracao_custos_tecnicos anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Diretos com T�cnicos") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_tecnicos.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_tecnicos.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_tecnicos.png", width(4000);

/*Fra��o de Custos Comiss�rios*/
twoway (line fracao_custos_comissarios anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_comissarios anos if Sigla=="GLO")(line fracao_custos_comissarios anos if Sigla=="ONE")
(line fracao_custos_comissarios anos if Sigla=="PTB")(line fracao_custos_comissarios anos if Sigla=="SLX")
(line fracao_custos_comissarios anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Diretos com Comiss�rios") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_comissarios.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_comissarios.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_comissarios.png", width(4000);

/*Fra��o de Custos Combust�veis*/
twoway (line fracao_custos_combustiveis anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_combustiveis anos if Sigla=="GLO")(line fracao_custos_combustiveis anos if Sigla=="ONE")
(line fracao_custos_combustiveis anos if Sigla=="PTB")(line fracao_custos_combustiveis anos if Sigla=="SLX")
(line fracao_custos_combustiveis anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Diretos com Combust�veis") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_combustiveis.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_combustiveis.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_combustiveis.png", width(4000);

/*Fra��o de Custos Diretos*/
twoway (line fracao_custos_direto anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_direto anos if Sigla=="GLO")(line fracao_custos_direto anos if Sigla=="ONE")
(line fracao_custos_direto anos if Sigla=="PTB")(line fracao_custos_direto anos if Sigla=="SLX")
(line fracao_custos_direto anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Diretos Selecionados e Somados") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_direto.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_direto.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_direto.png", width(4000);

/*Fra��o de Custos Indiretos com Servi�os de Bordo*/
twoway (line fracao_custos_servicosbordo anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_servicosbordo anos if Sigla=="GLO")(line fracao_custos_servicosbordo anos if Sigla=="ONE")
(line fracao_custos_servicosbordo anos if Sigla=="PTB")(line fracao_custos_servicosbordo anos if Sigla=="SLX")
(line fracao_custos_servicosbordo anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Indiretos com Servi�os de Bordo") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_servicosbordo.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_servicosbordo.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_servicosbordo.png", width(4000);

/*Fra��o de Custos Operacionais com Tr�fego*/
twoway (line fracao_custos_trafego anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_trafego anos if Sigla=="GLO")(line fracao_custos_trafego anos if Sigla=="ONE")
(line fracao_custos_trafego anos if Sigla=="PTB")(line fracao_custos_trafego anos if Sigla=="SLX")
(line fracao_custos_trafego anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Operacionais com Tr�fego") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_trafego.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_trafego.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_trafego.png", width(4000);

/*Fra��o de Custos Operacionais com Carga*/
twoway (line fracao_custos_carga anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_carga anos if Sigla=="GLO")(line fracao_custos_carga anos if Sigla=="ONE")
(line fracao_custos_carga anos if Sigla=="PTB")(line fracao_custos_carga anos if Sigla=="SLX")
(line fracao_custos_carga anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Operacionais com Carga") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_carga.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_carga.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_carga.png", width(4000);

/*Fra��o de Custos Administrativas*/
twoway (line fracao_custos_tecnicos anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_tecnicos anos if Sigla=="GLO")(line fracao_custos_tecnicos anos if Sigla=="ONE")
(line fracao_custos_tecnicos anos if Sigla=="PTB")(line fracao_custos_tecnicos anos if Sigla=="SLX")
(line fracao_custos_tecnicos anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Operacionais com Administra��o") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_administrativas.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_administrativas.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_administrativas.png", width(4000);

/*Fra��o de Custos Operacionais*/
twoway (line fracao_custos_operacionais anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_operacionais anos if Sigla=="GLO")(line fracao_custos_operacionais anos if Sigla=="ONE")
(line fracao_custos_operacionais anos if Sigla=="PTB")(line fracao_custos_operacionais anos if Sigla=="SLX")
(line fracao_custos_operacionais anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Fra��o de Custos Operacionais Selecionados e Somados") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_operacionais.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_operacionais.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_operacionais.png", width(4000);

/*Fra��o de Custos-Resultado*/
twoway (line fracao_custos_resultado anos if Sigla=="AZU", yaxis(1) xaxis(1))
(line fracao_custos_resultado anos if Sigla=="GLO")(line fracao_custos_resultado anos if Sigla=="ONE")
(line fracao_custos_resultado anos if Sigla=="PTB")(line fracao_custos_resultado anos if Sigla=="SLX")
(line fracao_custos_resultado anos if Sigla=="TAM"),ytitle("Fra��o (%)",height(30)) 
title("An�lise de DRO das empresas") subtitle("Raz�o de Custos e Resultado de Voo") 
note("Fonte: ANAC - Ag�ncia Nacional de Avia��o Civil - Mercado de Trabalho") 
legend( textwidth(10)width(350) col(6) label(1 "AZU") label(2 "GLO") label(3 "ONE") label(4 "PTB") label(5 "SLX") label(6 "TAM")) 
saving("C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_resultado.gph");
 
graph use "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_resultado.gph";
graph export "C:\Users\Samsung\Desktop\Doutorado - EPGE\2� Ano\EA\final\ADBD\fracao_custos_resultado.png", width(4000);

