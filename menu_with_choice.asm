
;--------print menu ---------;
.MODEL small
.STACK
.DATA
  ;variable space                                       
  start_msg db 'hello this is exam X program!',10,13,'$'   
  first_choice db '1) item 1 ',10,13,'$'
  second_choice db '2) item 2 ',10,13,'$' 
  third_choice db '3) item 3 ',10,13,'$'
  forth_choice db '4) item 4 ',10,13,'$'  
  choice_msg db 'enter your choice here: ','$'
  choice_err_msg db 10,13,'this choice doesnt exist! ',10,13,'$'  
  decision db 0       
  first_init db 10,13,'-> you entered the first part...',10,13,'$' 
  second_init db 10,13,'-> you entered the second part...',10,13,'$'
  third_init db 10,13,'-> you entered the third part...',10,13,'$'
  forth_init db 10,13,'-> you entered the forth part...',10,13,'$' 
  
  ;program variables

  
.CODE
.STARTUP
  ;code space    
    push ax
    push bx
    push cx
    push dx 
    push si
    push di
    
    ;print the menu by using the procedure
    mov dx, offset start_msg
    CALL print_str 
    mov dx, offset first_choice
    CALL print_str
    mov dx, offset second_choice
    CALL print_str
    mov dx, offset third_choice
    CALL print_str
    mov dx, offset forth_choice
    CALL print_str
      
    _choice:
    ;then ask the client to enter the choice
    mov dx, offset choice_msg
    CALL print_str    
    ;wait for an answer from client
    CALL enter_choice
    
    ;choice now is on 'decision'
    switch:
    mov al,decision
    cmp al,49
    je _gotofirst
    cmp al,50
    je _gotosecond
    cmp al,51
    je _gotothird
    cmp al,52
    je _gotoforth
    mov dx, offset choice_err_msg
    CALL print_str 
    jmp _choice
    
    _gotofirst:
        mov dx, offset first_init
        CALL print_str     
        
        jmp _end
         
    _gotosecond:
        mov dx, offset second_init
        CALL print_str 
        
        jmp _end
        
    _gotothird:
        mov dx, offset third_init
        CALL print_str
        
        jmp _end
        
    _gotoforth:
        mov dx, offset forth_init
        CALL print_str
        
        jmp _end
    
    
    
    _end:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax 
    
    _close:
    CALL close
      
   
.EXIT
  ;procedure space
  
  ;this procedure print an entire string in dx
  ;string should be called as:
  ;     mov dx, offset start_msg  
  ;     start_msg db 'model of a string',10,13,'$'
  ;where 10 is 'newline' char and 13 'alignleft'char , $ is 'end_of_string'     
  print_str PROC
    ;procedure body here  
    push ax
    mov ah, 9
    int 21h
    pop ax
        
    RET
  print_str endp 
  
  ;this procedure print a sigle char in dl 
  print_char PROC
    ;procedure body here 
    push ax
    mov AH,02    ; Function to display a char  
    int 21h
    pop ax
        
    RET
  print_char endp
  
  ;this procedure wait a char in input and then print it in console 
  ;the value is stored in a variable in memory (decision)
  ;-> required      decision db 0         
  enter_choice PROC 
    ;procedure body here
    push ax 
    mov AH,08    ; Function to read a char from keyboard
    int 21h      ; the char saved in AL
    mov decision, al
    push dx
    xor dx,dx
    mov dl,al
    CALL print_char
    pop dx 
    pop ax
            
    RET
  enter_choice endp 
  
  close PROC 
    ;procedure body here
    push ax 
    MOV AH,4Ch   ; Function to exit
    MOV AL,00    ; Return 00
    INT 21h
    pop ax
        
    RET
  close endp
 
end