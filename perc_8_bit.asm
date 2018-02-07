
;--------percentage 8 bit---------;
;calc percentage(ratio %) over the 
;sum of a vector
;---------------------------------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array db 12,23,2,34,76,43,23,30,45,13
  array_count db 10
  perc_ratio db 20
  perc_DB dw 0 
  sum_minus_perc dw 0
                                                
 
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
  ;for first lets calculate the sum over the value in the array
  cycle:     
    mov al,array[si]
    add bx,ax; prevent overflow by appli a 16 bit sum ah=0
    inc si  
    loop cycle
  ;we need to calculate the perc (= sum- (val*ratio/100))
  ;sum is on bx  
  mov ax,bx
  xor cx,cx
  mov cl, perc_ratio ; its 8 bit, but instead the sum could be 16bit
                     ;so we need to use the mul 16*16= 32 bit res 
  push dx
  xor dx,dx
  mul cx;   result in dx + ax
  xor cx,cx
  mov cx,100 
  div cx;  result of mul is on 4 byte so we need to use div 32*16= 16 bit result
  mov perc_DB, ax
  sub bx,ax
  mov sum_minus_perc, bx
  
  pop dx 
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end