
;--------SUM 8 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array db 12,23,2,34,76,43,23,30,45,13
  array_count db 10
  sum_DB dw 0
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter
  mov cl,array_count
  push bx
  xor bx,bx; (bx) init accumulator over the sum 
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (ax) contains the i array value
  cycle:
    xor ah,ah     
    mov al,array[si]
    add bx,ax; prevent overflow by appli a 16 bit sum ah=0
    inc si  
    loop cycle
  mov sum_DB,bx 
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end