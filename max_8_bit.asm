
;--------MAX 8 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array db 12,23,2,34,76,43,23,34,45,13
  array_count dw 10
  max db 0
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter 
  mov cx,array_count
  push bx
  xor bx,bx; (bl) contains the actual maximum
  mov bl,max
  push si
  xor si,si; (dl) contains the actual iteration# (0 at start) 
  push ax
  xor ax,ax; (al) contains the i array value
  cycle:
    mov al,array[si]
    cmp bl,al
    jb switch; if 1st below(minor) then 2nd      
  next:
    inc si  
    loop cycle
    jmp end_max    
  switch:
    xchg bl,al
    jmp next
  end_max:
  mov max, bl   
  pop ax
  pop si
  pop bx
  pop cx

 
.EXIT
  ;procedure space
 
end