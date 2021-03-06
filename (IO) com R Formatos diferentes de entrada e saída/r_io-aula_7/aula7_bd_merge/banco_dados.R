#### 5. Lendo e escrevendo dados em banco de dados ####

#### 5.1 Conectando R ao banco de dados ####
#install.packages('RMySQL')
library(RMySQL)

### ALTERA��O NA CONEX�O. Dependendo da vers�o do MySQL � necess�rio fazer essa altera��o abaixo.
## execute esse script no BD. 
## ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';

# (script para voltar a configura��o padr�o)
## ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'admin';

## conectando ao banco de dados
banco_dados <- dbConnect(MySQL(), user = 'root', password = 'admin', dbname = 'alura_r_io', 
                         host = 'localhost')

## listando tabelas existentes
dbListTables(banco_dados)

##criar uma tabela atraves de um dataframe (n�o s�o inseridos os dados, apenas a estrutura da tabela)
dbCreateTable(conn = banco_dados,name = 'teste',dados_2017)


#### 5.2 Lendo registros do banco de dados ####

## montando query para consulta
dados_2017 <- dbGetQuery(conn = banco_dados, 'select * from dados_2017')

View(dados_2017)

## fun��o para executar script, por exemplo, de inser��o de dados. 
dbSendQuery(conn = banco_dados, 'script')
