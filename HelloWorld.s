	slt $5,$2,$3 #test i < j
	beq $5, $0, Else # if false goto Else
	addu $4, $4, $2 #k = k+i
	j Endif #goto Endif
Else:
	addu $4,$4,$3 # k = k+j
Endif: