Coleta de dados Utilizando R e SQlite

Instalar o pacote RSQLite
install.packages('RSQLite')

#Importar o pacote RSQLiteB
library(RSQLite)
library(readr)

#Connectar no SGBD. Trabalhar em memoria. Quando finalizar o programa não existe mais. Ou utilizar o banco de dados fisicamente.
# Nem todos os bancos utilizam o dbConnect
con = dbConnect(RSQLite::SQLite(),':memory:')

#Listar as tabelas no BD
dbListTables(con)

#Como não existem tabelas. Iremos cria-las

dbWriteTable(con,'contabilidade','./contabilidade.csv')
dbListTables(con)

#remover os dados da tabela
#dbRemoveTable(con,'./contabilidade.csv')

dbListFields(con,'contabilidade')


dbReadTable(con,'contabilidade')

dados = dbSendQuery(con,'SELECT * FROM contabilidade WHERE CAP=1')
dbFetch(dados)

dados = dbSendQuery(con, 'SELECT*FROM contabilidade')
dbFetch(dados)

#Limpar o cursor de dados
dbClearResult(dados)

dbFetch(dados)

dados = dbSendQuery(con,'SELECT*FROM contabilidade WHERE PC BETWEEN 40000 AND 50000')
dbFetch(dados)

#Desconectar do banco de dados
dbDisconnect(con)

dbReadTable(con,'contabilidade')


-----------------------------------
  
  Gerando um SQLite fisico
#criando uma conecçao com um banco de dados fisico
dbfile = './bootcamp.sqlite'
con = dbConnect(RSQLite::SQLite(),dbfile)
#SE não tivesse passado o dbfile, a função iria criar um banco de daods
cliente = read.csv('./clientes_8000.csv',sep=';',encoding = 'UTF-8')
head(cliente)

names(cliente)[1] = 'idade'
names(cliente)[6] = 'raca'
names(cliente)[9] = 'regiao'

head(cliente)

dbListTables(con)

#Criando as tabelas
dbWriteTable(con,'cliente',cliente)

#Colunas da tabela cliente
dbListFields(con,'cliente')

#Leitura da tabela
dbReadTable(con,'cliente')

#Testando o comando de remoção. Através de uma segunda tabela
dbWriteTable(con,'cliente1',cliente)
dbListTables(con)

dbRemoveTable(con,'cliente1')
dbListTables(con)

dados = dbSendQuery(con,"SELECT*FROM cliente WHERE UF='MG'")
dbFetch(dados)

dados = dbSendQuery(con,"SELECT DISTINCT (escolaridade) FROM cliente WHERE UF='MG'")
dbFetch(dados)


dados = dbSendQuery(con,"SELECT DISTINCT (escolaridade) FROM cliente WHERE UF='MG' ORDER BY 1")
dbFetch(dados)

#Desconectar do banco de dados
dbDisconnect(con)
