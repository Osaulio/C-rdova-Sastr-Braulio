PROCESSOR 16F887
#include <xc.inc>
;CONFIG word1
CONFIG FOSC = INTRC_NOCLKOUT
CONFIG WDTE = OFF
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG CP = OFF
CONFIG CPD = OFF
CONFIG BOREN = OFF
CONFIG IESO = OFF
CONFIG FCMEN = ON
CONFIG DEBUG = ON
;CONFIG word2
CONFIG BOR4V=BOR40V
CONFIG WRT = OFF
PSECT udata
stop1:
    DS 1
stop2:
    DS 1
stop3:
    DS 1
PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL main
goto main
    
PSECT code
Num0:
BANKSEL PORTB
movlw 0b00111111
movwf PORTB
PAGESEL main
return

PSECT code
Num1:
BANKSEL PORTB
movlw 0b00000110
movwf PORTB
PAGESEL main
return

PSECT code
Num2:
BANKSEL PORTB
movlw 0b01011011
movwf PORTB
PAGESEL main
return
    
PSECT code
Num3:
BANKSEL PORTB
movlw 0b01001111
movwf PORTB
PAGESEL main
return    

PSECT code
Num4:
BANKSEL PORTB
movlw 0b01100110
movwf PORTB
PAGESEL main
return

PSECT code
Num5:
BANKSEL PORTB
movlw 0b01101101
movwf PORTB
PAGESEL main
return
   
PSECT code
Num6:
BANKSEL PORTB
movlw 0b01111101
movwf PORTB
PAGESEL main
return

PSECT code
Num7:
BANKSEL PORTB
movlw 0b00000111
movwf PORTB
PAGESEL main
return

PSECT code
Num8:
BANKSEL PORTB
movlw 0b01111111
movwf PORTB
PAGESEL main
return

PSECT code
Num9:
BANKSEL PORTB
movlw 0b01101111
movwf PORTB
PAGESEL main
return

PSECT code
delay_255us:
movlw   255
movwf   stop3
decfsz stop3
goto $-1
return

PSECT code
delay_65ms:
movlw   255
movwf   stop2
call delay_255us
decfsz stop2
goto $-2
return
 
PSECT code
delay_500ms:
movlw   0x08
movwf stop1
call delay_65ms
decfsz  stop1
goto $-2
return
   
PSECT code
main:
bcf STATUS,0
bcf STATUS,5
bcf STATUS,6
BANKSEL ANSELH
CLRF ANSELH
BANKSEL TRISB
MOVLW 0b00000000
MOVWF TRISB
BANKSEL PORTB
CLRF PORTB
BANKSEL OSCCON
MOVLW  0b01110000
MOVWF  OSCCON
INICIO:
call Num0
call delay_500ms
call Num1
call delay_500ms
call Num2
call delay_500ms   
call Num3
call delay_500ms
call Num4
call delay_500ms
call Num5
call delay_500ms
call Num6
call delay_500ms
call Num7
call delay_500ms
call Num8
call delay_500ms
call Num9
call delay_500ms
GOTO INICIO
END