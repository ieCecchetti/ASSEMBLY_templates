
;--------MIN 16 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array dw 12,230,2,34,760,430,23,340,450,13
  data_count dw 10
  min dw 65534
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter
  mov cx,data_count
  push bx
  xor bx,bx; (bx) contains the actual maximum
  mov bx,min
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (ax) contains the i array value
  cycle:
    mov ax,word ptr array[si]
    cmp bx,ax
    ja switch; if 1st above(higher) then 2nd      
  next:
    add si,2  
    loop cycle
    jmp end_min    
  switch:
    xchg bx,ax
    jmp next
  end_min:
    mov min,bx 
  pop ax
  pop si
  pop bx
  pop cx   

 
.EXIT
  ;procedure space
 
end



