
;--------AVG 8 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array dw 1200,230,200,340,760,4300,230,300,45,13 
  ;array dw 1000,1000,1000,1000,1000,1000,1000,1000,1000,1000
  array_count dw 10
  avg_DB dw 0
                                                
 
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
    mov ax,array[si]
    add bx,ax; prevent overflow by appli a 16 bit sum ah=0
    add si,2  
    loop cycle  
  push dx
  xor dx,dx
  mov ax,bx;    DIV has the dividend on ax
  mov cx,array_count;   reload the divisor in cx
  div cx 
  mov avg_DB,ax 
  
  pop dx 
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end