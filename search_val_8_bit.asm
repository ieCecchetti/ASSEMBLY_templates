
;--------RESEARCH 8 bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  array db 12,34,2,44,76,43,23,30,50,13
  array_count dw 10
  search_val db 50
  found db 0 ;not found 0
             ;    found 1
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter  
  mov cx, array_count
  push bx
  xor bx,bx; (bl) contain the value we are looking for
  mov bl,search_val 
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (al) contains the i array value
  cycle:     
    mov al,array[si]
    cmp al,bl
    je foundIT
    inc si  
    loop cycle
    ;write not found
    mov found,0
    jmp end_search
  foundIT:
    ;write found
    mov found,1
  end_search:      
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end