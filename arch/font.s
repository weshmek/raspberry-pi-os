.file "font.s"
.data
.align 2
.global font
.type font,%object
font:
.incbin "../font0.bin"
.size font, .-font
