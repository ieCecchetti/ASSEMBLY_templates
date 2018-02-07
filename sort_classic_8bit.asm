
;--------CLASSIC SORT_8bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  ;line db 'c','i','a','o','m','i','c','h','i','a','m','o','l','u','i','s','!'
  array db 102,23,43,5,4,23,45,65,4,3,123,98,67,4, 34
  array_count dw 15
  mode db 1;    mode = 0: SORT DESC
           ;    mode = 1: SORT ASC                                           
 
.CODE
.STARTUP
  ;code space
  push ax
  xor ax,ax;    it contains the value i
  push bx
  xor bx,bx;    it contains the j value 
  push si
  xor si,si;    outer counter 
  push di
  xor di,di;    inner counter
  mov di, si
  inc di;       it start from si+1
  push cx
  xor cx,cx
  mov cx,array_count
  
  ;check the sort mode
  mov al,mode
  cmp al,1
  je a_sort_outer 
  
  d_sort_outer:
  mov al,array[si]
    d_sort_inner:
    mov bl, array[di]
    cmp al,bl    
    jb d_switch;  if the 1st is lower then the 2nd then jump
    d_increment:
    inc di
    cmp di,cx
    jne d_sort_inner
    
  xor di,di
  inc si
  cmp si,cx
  jne d_sort_outer
  jmp end
  
  d_switch:
  mov array[si],bl
  mov array[di],al
  xchg al,bl
  jmp d_increment
  
  a_sort_outer:
  mov al,array[si]
    a_sort_inner:
    mov bl, array[di]
    cmp al,bl    
    ja a_switch;  if the 1st is higher then the 2nd then jump   
    a_increment:
    inc di
    cmp di,cx
    jne a_sort_inner
   
  xor di,di
  inc si
  cmp si,cx
  jne a_sort_outer
  jmp end
   
  a_switch:
  mov array[si],bl
  mov array[di],al
  xchg al,bl
  jmp a_increment  
     
  end:
  pop cx
  pop di
  pop si
  pop bx
  pop ax 
.EXIT
  ;procedure space
 
end


