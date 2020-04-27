LIBNAME alura "/folders/myfolders/AluraPlay";

PROC DATASETS
	lib=alura details;
RUN;

PROC CONTENTS
	data=alura.cadastro_produto;
RUN;

PROC PRINT
	data=alura.cadastro_produto;
RUN;

PROC FREQ
	data=alura.cadastro_produto nlevels;
	table genero plataforma nome;
RUN;

DATA teste;
set alura.cadastro_produto;

IF data > 201606
	THEN lancamento = "Sim";
	ELSE lancamento = "Nao";
RUN;

PROC PRINT
	data=teste noobs;
RUN;

PROC FREQ
	data=teste;
	table genero*lancamento
	/ nocol norow nopercent;
RUN;

PROC FREQ
	data=alura.cadastro_produto nlevels;
	table nome;
	table nome*genero
	/ list;
RUN;






