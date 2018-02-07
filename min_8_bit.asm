
;--------MIN 8 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array db 12,23,2,34,76,43,23,30,45,13
  array_count dw 10
  min db 254
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter
  mov cx,array_count
  push bx
  xor bx,bx; (bx) contains the actual maximum 
  mov bl,min
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (al) contains the i array value
  cycle:
    mov al,array[si]
    cmp bl,al
    ja switch ;in 1st above(higher) then 2nd   
  next:
    inc si  
    loop cycle
    jmp end_min    
  switch:
    xchg bl,al
    jmp next
  end_min:
    mov min,bl 
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end