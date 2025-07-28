# Array: data = {1, 2, 3, 4, 5}
        li t0, 0        # total = 0
        li t1, 0        # index = 0
        li t2, 5        # n = 5
        la t3, data     # t3 = base address of data

loop:
        bge t1, t2, end     # if index >= n, break
        slli t4, t1, 2      # offset = index * 4
        add t5, t3, t4      # t5 = &data[index]
        lw t6, 0(t5)        # t6 = data[index]
        add t0, t0, t6      # total += data[index]
        addi t1, t1, 1      # index++
        j loop

end:
        # total is in t0
        li a0, 10
        ecall               # exit

# Define the data in memory
.data
data: .word 1, 2, 3, 4, 5
