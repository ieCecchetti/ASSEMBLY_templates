
;--------COUNT RECURRENCY - ALL CHAR---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  line db 'c','i','a','o','m','i','c','h','i','a','m','o','l','u','i','s','!'  
  char_count dw 17
  alphabet_c db 26 dup(?);case 
  counters_c db 26 dup(?)
  alphabet_lc db 26 dup(?);lower_case
  counters_lc db 26 dup(?)                                                
 
.CODE
.STARTUP
  ;code space
  push cx  
  xor cx,cx;  
  mov cx,26; i need to use it for initialize the alphabet array at start
  push si
  xor si,si; (si) contains the actual iteration # of the inner (char comparing)
  push ax 
  xor ax,ax; (al) contains the i_th char of line 
  push bx
  xor bx,bx; (bl) contains the char m/M and (bh) the # of repetition   
  
  mov al,61h; along the way will contains the lower case characters 
  mov ah,41h; along the way will contains the case characters
  init:
    mov alphabet_lc[si],al
    mov counters_lc[si],0
    mov alphabet_c[si],ah
    mov counters_c[si],0
    inc si
    inc al
    inc ah
    loop init
    
    ;reset the value of register 
    mov cx,char_count; contans the # of char 
    push di
    xor di,di; counter of the outer cycle, poit to the actual line character
    xor ax,ax
    xor si,si
    
  outer:     
    mov al,line[di]
    inner:
        mov bl,alphabet_c[si]
        mov bh,counters_c[si]
        cmp al,bl
        jne m_check
        ;inc counter
        add counters_c[si],1
        jmp increment_out
        
        m_check:
        mov bl,alphabet_lc[si]
        mov bh,counters_lc[si]
        cmp al,bl
        jne increment_in        
        ;inc counter
        add counters_lc[si],1
        jmp increment_out
        
        increment_in: 
        inc si
        cmp si,26
        jne inner
    increment_out:      
    xor si,si
    inc di
    cmp di,cx
    jne outer 
  
  end:
  pop di      
  pop bx
  pop ax
  pop si
  pop cx  
   
.EXIT
  ;procedure space
 
end
