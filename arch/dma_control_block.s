.section .data

.global dma_control_block

.align 5
dma_control_block:
.word 0 @Transfer Information TI
.word 0 @Source Address SOURCE_AD
.word 0 @Destination Address DEST_AD
.word 0 @Transfer Length TXFR_LEN
.word 0 @2D Mode Stride STRIDE
.word 0 @Next Control Block Address NEXTCONBK
.word 0 @Reserved - set to zero
.word 0 @Reserved - set to zero
.size dma_control_block, .-dma_control_block
