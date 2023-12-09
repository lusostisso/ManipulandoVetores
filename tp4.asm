.text
.globl main
	# $t0 = endereco vetor a
	# $t1 = endereco vetor b
	# $t2 = endereco vetor c
	# $t3 = endereco vetor d
	# $t4 = length vetores
	# $t5 = posicao do vetor
	# $t6 = andar a partir do end do vetor
	# $t8 = tam vetor bytes
	
	# $s0 = elemento vet a
	# $s1 = elemento vet b
	# $s2 = variavel a colocar no vetor criado
	# $s3 = b(vezes) que diminui
	# $s4 = acumula func mult
	# $s5 = a
	# $s6 = b(vezes) 
	# $s7 = acumula total
main:	la $t0, a	# Carrega o endereço do vetor a em $t0
    	la $t1, b	# Carrega o endereço do vetor b em $t1
    	la $t2, c	# Carrega o endereço do vetor c em $t2
    	la $t3, d	# Carrega o endereço do vetor d em $t3
    	lw $t4, n	# Carrega valor de n (length vetores)
    	# transformando a length em tamanho de bytes da memoria utilizados
mem:    bnez $t4, addM
	lw $t4,n	
    	li $t5, 0
	la $t7, PE	# Carrega o endereço de PE
	
criaC:	blt $t5,$t8,addC # Se $t5 for menor que $t8, salta para a addC
    	li $t5,0	# Carrega  0 em $t5
    	j criaD		# salta para criaD
    	

# addC: Adição do conteúdo de $t5 a $t6
addC:	addi $t6,$t5,0		# $t6 = $t5 + 0 
	add $t0, $t0, $t6 	# $t0 = %t0 + $t6
	add $t1, $t1, $t6	# $t1 = $t1 + $t6
	add $t2, $t2, $t6	# $t2 = $t2 + $t6
	lw $s0, 0($t0)		# Carrega valor de endereço apontado por $t0 para $s0
	lw $s1, 0($t1)		# Carrega valor de endereço apontado por $t1 para $s1
	add $s2, $s0,$s1 	# $s2 = $s0 + $s1
	sw $s2,0($t2)		# Armazena o resultado $s2 em t2
	
	addi $t5,$t5,4		# $t5 = $t5 + 4, 4 bytes
	la $t0, a		# Carrega o endereço do array a em $t0
	la $t1,b		# Carrega o endereço do array b em $t1
	la $t2,c		# Carrega o endereço do array c em $t2
	j criaC			# Salto criaC

criaD:	blt $t5,$t8, addD	# Se $t5 for menor que $t8, salta para a addD
	li $t5,0		# Carrega  0 em $t5
    	j prodE			# salta para criaE

addD:	addi $t6,$t5,0		# $t6 = $t5 + 0
	add $t0, $t0, $t6 	# $t0 = $t0 + $t6
	add $t1, $t1, $t6	# $t1 = $t1 + $t6
	add $t3, $t3, $t6	# $t3 = $t3 + $t6
	lw $s0, 0($t0)		# Carrega valor de endereço apontado por $t0 para $s0
	lw $s1, 0($t1)		# Carrega valor de endereço apontado por $t1 para $s1
	sub $s2, $s0,$s1	# $s2 = $s0 - $s1
	sw $s2,0($t3)		# Armazena o resultado $s2 no endereco de $t3
	addi $t5,$t5,4		# $t5 = $t5 + 4, 4 bytes
	la $t0, a		# Endereço do array a em $t0
	la $t1,b		# Endereço do array b em $t1
	la $t3,d		# Endereço do array d em $t3
	j criaD			# Salta para criaD
    	
prodE:	li $s7, 0 		# Carregando 0 no registrador $s7

chamaP:	blt $t5,$t8, multicacao	 # Se $t5 for menor que $t8, salta para multicacao
	li $t5, 0		 # Carrega 0 em $t5
	j fim			 # Salta para fim

multicacao:	
	addi $t6,$t5,0		 # $t6 = $t5 + 0 
	add $t2, $t2, $t6 	 # $t2 = $t2 + $t6
	add $t3, $t3, $t6	 # $t3 = $t3 + $t6
	lw $s5,0($t2)  		 # Carrega $t2 (a) para $s5
	lw $s6,0($t3) 		 # Carrega $t3 (b) para $s6
	addi $s3,$s6,0		 # $s3 = $s6 + 0 
	bltz $s6, tsb		 # Se $s6 < 0, salta para tsb
	
while:	bnez $s3, acum		 # Se $s3 != 0, salta para acum
	bltz $s6, tsa		 # Se $s6 < 0, salta para tsa
	
postsa:	add $s7,$s7,$s4		# $s7 = $s7 + $s4
	la $t2,c		# Carrega c em $t2
	la $t3,d		# Carrega d em $t3
	addi $t5,$t5,4		# $t5 = $t5 + 4
	li $s4, 0		# $s4 = 0
	j chamaP		# Salto para chamaP

tsb: 	sub $s3,$zero,$s3	# $s3 = 0 - $s3 (negativo de $s3)
	j while			# Salto para while
	
tsa:	sub $s4,$zero,$s4	# $s4 = 0 - $s4 (negativo de $s4)
	j postsa		# Salto  para postsa
	
acum:	add $s4,$s4,$s5		# $s4 = $s4 + $s5
	subi $s3,$s3,1		# $s3 = $s3 - 1
	j while			# Salto para while
	
addM:	addi $t8,$t8,4		# $t8 = $t8 + 4
	subi $t4,$t4,1		# $t4 = $t4 - 1
	j mem			# Salto para mem
	
fim: sw $s7, 0($t7)   		# Armazena $s7 no endereço apontado por $t7

     
.data
n:	.word	8
PE:	.word	0
a:	.word	49, 10, -4, -6, 85, 9, 7, 9
b:	.word	55, -8, 16, -3, 36, 45, 34, -10
c:	.word	0, 0, 0, 0, 0, 0, 0, 0
d:	.word	0, 0, 0, 0, 0, 0, 0, 0