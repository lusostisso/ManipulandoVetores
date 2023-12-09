# ManipulandoVetores

***Especificação:***

Etapa 1:
1. Crie dois vetores unidimensionais, A e B, cada um consistindo de n (onde n >= 8) inteiros aleatórios com sinal (devem ser utilizados 
pelo menos 2 valores positivos e 2 valores negativos).
2. Crie dois vetores C e D com o mesmo número de elementos (n) dos vetores A e B. Todas as posições dos vetores C e D devem ser 
inicializados com zero.
3. Adição de Vetores - 𝐶(𝑖) = 𝐴(𝑖) + 𝐵(𝑖)
a. Crie uma sub-rotina em linguagem assembly que realize a adição de vetores.
b. A sub-rotina deve receber os vetores de entrada A e B e armazenar o resultado em um novo vetor C.
4. Subtração de Vetores - 𝐷(𝑖) = 𝐴(𝑖) − 𝐵(𝑖)
a. Crie uma sub-rotina em linguagem assembly que realize a subtração de vetores.
b. A sub-rotina deve receber os vetores de entrada A e B e armazenar o resultado em um novo vetor D.

Etapa 2:
1. Crie uma sub-rotina que calcule o produto escalar entre dois vetores (𝐶 ∙ 𝐷)
2. Calcule o produto escalar dos vetores C e D.
3. Salve o resultado em uma variável (PE) na memória.


***Solução:***


A seguir é apresentado o código/pseudocódigo desenvolvido em Java para o auxílio do
desenvolvimento do código Assembly. 


![image](https://github.com/lusostisso/ManipulandoVetores/assets/108033299/491159ed-41b6-4712-a4cc-0145e3e482f1)


Para o âmbito de Assembly Mips, nesta tarefa, não é permitido utilizar a função mul, que
realiza a multiplicação de dois números. Dessa forma, adaptamos a operação de
multiplicação para fazer múltiplas adições.


Resultado após Execução
![image](https://github.com/lusostisso/ManipulandoVetores/assets/108033299/990eafe0-7667-481e-9b56-3fa4e418da1b)
