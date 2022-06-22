############################################################################################################
###########                 Desafio - AED         #########################
#############          IGTI - Professor Mairon Chaves      ###########################
############################################################################################################

rm(list = ls())

###########Uma empresa que trabalha com vendas em um E-commerce deseja estudar
############quais características (variáveis) dos seus clientes que impactam no consumo, ou seja, as
############variáveis que têm relação ao quanto o cliente consome (compra). Para este objetivo,
############foram selecionados aleatoriamente 29 clientes do banco de dados


#Forma o conjunto de dados historico contendo vinte e nove clientes selecionados aleatoriamente do banco de dados e a armazena
#em um data frame chamado dados


dados <- data.frame(
  Consumo = c(2595, 8470, 4007, 6734, 33628, 3903, 
              13444, 12560, 31176, 5435, 26736, 3728, 8684, 8356, 36936, 3744, 
              30420, 5958, 1019, 11688, 4442, 2640, 23888, 25844, 7430, 10276, 
              3381, 3512, 4957),
  Estado_Civil = c("Divorciado", "Casado", "Divorciado", 
                   "Casado", "Solteiro", "Divorciado", "Solteiro", "Solteiro", "Solteiro", 
                   "Casado", "Solteiro", "Divorciado", "Solteiro", "Solteiro", "Solteiro", 
                   "Divorciado", "Solteiro", "Divorciado", "Divorciado", "Solteiro", 
                   "Casado", "Solteiro", "Solteiro", "Solteiro", "Casado", "Solteiro", 
                   "Casado", "Casado", "Casado"), 
  Genero = c("Feminino", "Feminino", 
             "Masculino", "Feminino", "Feminino", "Feminino", "Feminino", 
             "Feminino", "Feminino", "Masculino", "Masculino", "Masculino", 
             "Feminino", "Feminino", "Masculino", "Masculino", "Feminino", 
             "Masculino", "Feminino", "Feminino", "Masculino", "Masculino", 
             "Masculino", "Masculino", "Masculino", "Feminino", "Feminino", 
             "Masculino", "Feminino"), 
  Idade = c(20.2585750236176, 32.1118436595569, 
            31.7467633607352, 37.8198500301827, 71.2083039792698, 29.7176362875943, 
            44.8093915220787, 35.8376118862763, 58.8385574663313, 39.9177951271474, 
            58.0550560477448, 21.778210059274, 31.7467633607352, 37.8198500301827, 
            71.2083039792698, 18.2385329827666, 61.5387187691615, 35.8376118862763, 
            20.2585750236176, 39.9177951271474, 37.9148802474609, 23.3568492662162, 
            54.9958059606044, 61.2973920327649, 34.58738731516, 29.7176362875943, 
            19.2584996796213, 20.2585750236176, 37.8080561311484), 
  Renda_Mensal = c(1985.88181437971,3769.2479179441, 2291.88059431382, 2390.40280655742, 8534.7173298783, 
                   2495.88975635737, 5714.55454591117, 5832.6343267674, 6882.89867212748, 
                   2099.31900110052, 6342.50934129081, 1941.14793399086, 3575.98064224822, 
                   3589.23716442208, 8534.7173298783, 2740.46957610393, 5714.55454591117, 
                   2390.40280655742, 1635.64603350165, 4364.56455252666, 1905.53820715893, 
                   2338.3086884437, 5832.6343267674, 6882.89867212748, 3842.53578942318, 
                   4919.14670791015, 2063.01440787432, 2380.55793401061, 1985.88181437971),
  Possui_Imovel_Proprio = c("Sim", "Sim", "Nao", "Sim", "Nao", 
                            "Nao", "Nao", "Sim", "Sim", "Nao", "Nao", "Nao", "Nao", "Nao", 
                            "Nao", "Sim", "Nao", "Sim", "Nao", "Nao", "Nao", "Sim", "Sim", 
                            "Nao", "Nao", "Nao", "Nao", "Nao", "Nao")
)

View(dados)




#Explore a variável resposta, que é o Consumo, responda:

#Pelo histograma, você diria que a variável segue uma distribuição normal?
#Histograma do consumo
hist(dados$Consumo)
shapiro.test(dados$Consumo)
#Não, pois os dados não são distribuídos simetricamente em torno de um valor central.
#Como o valor p do teste shapiro é muito menor do que o alfa (significancia), 
#podemos rejeitar a hipótese nula, ou seja, a variável consumo não segue uma distribuição normal


#Pelo boxplot, você consegue visualizar algum outlier?
#Boxplot do consumo
boxplot(dados$Consumo)
#Sim, há pontos outliers acima do limite superior


#Estatisticas descritivas do consumo
summary(dados$Consumo)




#Suspeita-se que a variável Estado Civil está associada com o fato do cliente 
#Possuir Imóvel Próprio. Investigue a relação entre essas duas variáveis e 
#responda: 
#través do teste qui-quadrado, existe relação significativa entre o Estado Civil 
#e o fato de o cliente Possuir Imóvel Próprio? Justifique sua resposta.  
#Adote 90% de confiança ao realizar suas interpretações.

#Gera tabela de contigencia entre Estado Civil e Possui Imovel Proprio
tabela_contigencia <- table(dados$Estado_Civil, dados$Possui_Imovel_Proprio)

tabela_contigencia

plot(tabela_contigencia)

#Realiza  teste qui-quadrado
chisq.test(tabela_contigencia) #ignore a mensagem de warning 

#O valor p foi de 72,87% é maior do que o alfa 10% (nível de significância). 
#Ou seja, há uma probabilidade de 72,87% de erro ao rejeitar H0.
#H0 faz referÊncia ao fato do estado civil do cliente não influenciar na posse imóvel próprio
#Assim, podemos afirmar que não exite relação entre estado civil e imovel proprio


#####################################################################################
#Explore a relação entre as variáveis Consumo e Possui Imóvel Próprio, responda:
#Através de um teste t de Student para amostras independentes, existe diferença 
#significativa entre o consumo médio do público que possui imóvel próprio quando 
#comparado com o consumo médio do público que não possui imóvel próprio? 
#Adote 95% de confiança ao realizar suas interpretações.

boxplot(dados$Consumo ~ dados$Possui_Imovel_Proprio)

#Test t de Student
t.test(dados$Consumo ~ dados$Possui_Imovel_Proprio , 
       paired = FALSE, #amostras nao pareadas
       alternative = 'two.sided', #bilateral
       conf.level = 0.95 #95% de confianca
)
#O valor p é de 72.26%. Ou seja, não rejeitamos H0.
#Assim, a média do consumo de quem possui imóvel é igual a 
#média do consumo de quem não possui imóvel 
#Ao p valor de 72,26%, não há evidências para rejeitar a hipótese nula de 
#igualdade de médias, ou seja, a média do consumo de quem tem imóvel próprio 
#não é estatisticamente diferente da média de consumo de quem não tem imóvel próprio.




#Explore a relação entre as variáveis Consumo e Idade, e responda:
#Pelo gráfico de dispersão, você identifica que existe relação linear entre o 
#Consumo e a Idade? Se sim, a relação é positiva ou negativa?

plot(y = dados$Consumo ,
     x = dados$Idade,
     pch = 16)

#Coeficiente de correlacao
#Obtenha o valor do coeficiente de correlação linear de Pearson entre o 
#Consumo e a Idade e interprete. Marque a alternativa CORRETA.
cor(dados$Consumo, dados$Idade)

#Se tentarmos utilizar somente a Idade para prever o Consumo, o quanto da variação 
#do Consumo a variável Idade consegue explicar? Em outras palavras, 
#interpretar o R2 da regressão linear do Consumo em função da Idade.

#Ajuste regressao linear do Consumo em funcao da Idade
regressao_linear <- lm(Consumo ~ Idade, data = dados)
summary(regressao_linear)

#Execute um teste de normalidade para regressão linear entre Consumo e Idade e, 
#de acordo com os resultados, informe se os resíduos seguem ou não seguem uma 
#distribuição normal. Adote 95% de confiança.
#Teste de normalidade para os residuos da regressao
shapiro.test(regressao_linear$residuals)

#Explore a variavel Renda Mensal
#Qual o valor do primeiro quartil e qual a sua interpretação CORRETA?
summary(dados$Renda_Mensal)
#O primeiro quartil é 2292, isso nos diz que 25% dos clientes têm renda mensal de até 2292
#O valor da mediana é 3576, isso nos diz que 50% dos clientes têm renda até 3576 
#e os outros 50% têm renda maior que 3576.
#
#Explore a relação entre as variáveis Consumo e Idade, e responda:

#Regressao linear do Consumo em funcao da Idade e Renda Mensal
#O modelo de regressão linear ajustado é válido?
regressao_linear <- lm(Consumo ~ Idade + Renda_Mensal, data = dados)
summary(regressao_linear)
#O modelo de regressão linear ajustado é válido?
#Sim, pois p valor do teste F é aproximadamente zero, então há evidências para rejeitar 
#a hipótese de que o modelo ajustado não é válido.

#Marque a alternativa com a interpretação CORRETA do coeficiente Beta da variável Renda Mensal.
#O coeficiente Beta da variável Renda Mensal é de 2,62, ou seja, mantendo as demais
#variáveis constantes, a cada aumento unitário na Renda Mensal, o consumo aumenta, em média, 2,62 unidades.

#Como os valores t são obtidos? (coluna t value)

#Dividindo a coluna Estimate pela coluna Std. Error.