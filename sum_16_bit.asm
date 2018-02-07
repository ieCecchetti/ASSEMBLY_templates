
;--------SUM 16 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array dw 12,230,2,304,760,43,203,300,450,130
  array_count dw 10
  sum_DB dw 0
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter
  mov cx,array_count
  push bx
  xor bx,bx; (bx) init accumulator over the sum 
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (ax) contains the i array value
  cycle:     
    mov ax,word ptr array[si]
    add bx,ax; prevent overflow by appli a 16 bit sum ah=0
    add si,2  
    loop cycle
  mov sum_DB,bx 
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end