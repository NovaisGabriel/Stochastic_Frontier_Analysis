/*Comandos Iniciais*/
clear all
set more off
set dp comma
cd "C:\Users\Samsung\Desktop\Doutorado - EPGE\2º Ano\EA\final"

/*Puxando a base*/
insheet using "Dados Estatísticos.csv",delim(";")
summarize

/*Tratando os dados*/
rename ano anos
rename combustvellitrosapenasempresasbr combL, replace
rename passageirospagos PP,replace
rename passageirosgrtis PG,replace
rename cargapagakg CP_kg,replace
rename cargagrtiskg CG_kg,replace
rename correiokg Cor_kg,replace
rename correiokm Cor_km,replace
rename distnciavoadakm D,replace
rename decolagens Dec,replace
rename cargapagakm CP_km,replace
rename cargagratiskm CG_km,replace
rename assentos A,replace
rename horasvoadas H,replace
rename payload Pyl,replace
rename bagagemkg B_kg,replace
rename empresasigla Sigla,replace
rename empresanome Nome,replace
drop if empresanacionalidade=="ESTRANGEIRA"
drop empresanacionalidade
drop if combL==.
drop aeroportodeorigemregio aeroportodedestinopas aeroportodeorigemsigla
drop aeroportodeorigemnome aeroportodeorigempas aeroportodeorigemcontinente 
drop aeroportodedestinosigla aeroportodedestinonome aeroportodedestinoregio 
drop aeroportodedestinocontinente
drop aeroportodeorigemuf aeroportodedestinouf
drop ask rpk atk rtk
summarize


/*Apenas para os anos que serão estudados*/
drop if anos<2010
drop if anos>2014



/*Agregando para formar a base anual*/
collapse (sum) PP PG  CP_kg CG_kg Cor_kg combL D Dec CP_km CG_km Cor_km A H Pyl B_kg, by(Sigla Nome anos)


/*Apenas para as empresas que serão estudadas*/
drop if Sigla~="TAM" & Sigla~="GLO" & Sigla~="AZU" & Sigla~="ONE" & Sigla~="SLX" & Sigla~="PTB"


/*Salvando*/
save "Base_anual_DE.dta",replace


























