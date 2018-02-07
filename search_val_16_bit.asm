
;--------RESEARCH 16 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array dw 120,34,2,440,76,403,203,300,50,13
  array_count dw 10
  search_val dw 50
  found db 0 ;not found 0
             ;    found 1
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter   
  mov cx,array_count
  push bx
  xor bx,bx; (bl) contain the value we are looking for
  mov bx,search_val 
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (al) contains the i array value
  cycle:     
    mov ax, word ptr array[si]
    cmp ax,bx
    je foundIT
    add si,2  
    loop cycle
    ;write not found
    mov found,0
    jmp end
  foundIT:
    ;write found
    mov found,1
  end:      
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end