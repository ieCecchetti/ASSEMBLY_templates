
;--------CLASSIC SORT_16bit---------;
.MODEL small
.STACK
.DATA

  ;variable space 
  ;line db 'c','i','a','o','m','i','c','h','i','a','m','o','l','u','i','s','!'
  array dw 1020,23,430,50,4,230,450,65,4,3,1230,98,670,40, 340
  array_count dw 15
  mode db 2;    mode = 0: SORT DESC
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
  add di,2;       it start from si+2 (16 bit)
  
  push cx
  xor cx,cx
  mov cx,array_count; set cycle number
  add cx,cx;    mul the cycle numb*2 cause di and ci increment of 2 unity each cycle (16bit info) 
  
  ;check the sort mode
  mov al,mode
  cmp al,1
  je a_sort_outer 
  
  d_sort_outer:
  mov ax, word ptr array[si]
    d_sort_inner:
    mov bx, word ptr array[di]
    cmp ax,bx    
    jb d_switch;  if the 1st is lower then the 2nd then jump
    d_increment:
    add di,2
    cmp di,cx
    jne d_sort_inner
    
  xor di,di
  add si,2
  cmp si,cx
  jne d_sort_outer
  jmp end
  
  d_switch:
  mov array[si],bx
  mov array[di],ax
  xchg ax,bx
  jmp d_increment
  
  a_sort_outer:
  mov ax,word ptr array[si]
    a_sort_inner:
    mov bx,word ptr array[di]
    cmp ax,bx    
    ja a_switch;  if the 1st is higher then the 2nd then jump   
    a_increment:
    add di,2
    cmp di,cx
    jne a_sort_inner
   
  xor di,di
  add si,2
  cmp si,cx
  jne a_sort_outer
  jmp end
   
  a_switch:
  mov array[si],bx
  mov array[di],ax
  xchg ax,bx
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
