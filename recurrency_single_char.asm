
;--------COUNT RECURRENCY - SINGLE CHAR---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  line db 'c','i','a','o','m','i','c','h','i','a','m','o','l','u','i','s','!'
  char_count dw 17
  search_val db 'i'
  recurrency db 0 ;not found 0
             ;    found 1
                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx; (cx) contains the array counter   
  mov cx,char_count
  push bx
  xor bx,bx; (bl) contain the value we are looking for
  mov bl,search_val 
  push si
  xor si,si; (si) contains the actual iteration #
  push ax 
  xor ax,ax; (al) contains the i array char, rather (ah) contains the repetition 
  cycle:     
    mov al,line[si]
    cmp al,bl
    jne increment
    ;inc counter
    inc ah
    increment: 
    inc si  
    loop cycle
  mov recurrency,ah
  jmp end
  
  end:      
  pop ax
  pop si
  pop bx
  pop cx  
   
.EXIT
  ;procedure space
 
end



