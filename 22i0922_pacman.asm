INCLUDE Irvine32.inc
includelib winmm.lib
INCLUDE macros.inc
PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data

;call clrscr
;(posY-offsety)*81+(posX-offsetX) array element
; . for 10 p
; C for 50 p
;level one tutorial (will be an option)
;metatron theme level 2
; animation for menu
; speed increases when coin
; speed increases with levels


audio byte "C:\Users\aimen\Downloads\Pac_man\pacman.wav", 0
audio1 byte "C:\Users\aimen\Downloads\Pac_man\Selection.wav", 0
level1 byte "C:\Users\aimen\Downloads\Pac_man\level1.wav", 0
level1coin byte "C:\Users\aimen\Downloads\Pac_man\level1coin.wav", 0
level2 byte "C:\Users\aimen\Downloads\Pac_man\level2.wav", 0
level3 byte "C:\Users\aimen\Downloads\Pac_man\level3.wav", 0
pausem byte "C:\Users\aimen\Downloads\Pac_man\pause.wav", 0


	;16x, 9y
L1  byte "	     _-_       ",0
	byte "    /~~   ~~\    ",0
	byte " /~~         ~~\ ",0
	byte "{               }",0
	byte " \  _-     -_  / ",0
	byte "   ~  \\ //  ~   ",0
	byte "_- -   | | _- _  ",0
	byte "  _ -  | |   -_  ",0
	byte "      // \\      ",0
			

ground byte "  ______________________________________________________________________________ ",0 
		byte "|     *            _____________   ____________      *        *    _________   |",0
		byte "| *          *    |. . . . . . .| |. . . . . . |  *       *       |. . . . .|  |",0
		byte "|       *       * |. _________ .| |. ________ .|     *            |. _____ .|  |",0
		byte "|   ______________|.|     *   |.| |.|  *     |.|   ____________   |.|     |.|  |",0
		byte "|  |C . . . . . . . |*    ____|.|_|.|___    *|.|  |. . . . . . |  |.|*    |.|  |",0
		byte "| *|______________ .|    |. . . . . . . |    |.|  |. ________ .| *|.|   * |.|  |",0
		byte "|     *        *  |.|  * |. __________ .|    |.| *|.|  *     |.|  |.|     |.|  |",0
		byte "|   ______________|.|    |.|          |.|*   |.|  |.|*    *  |.|  |.|     |.|  |",0
		byte "|  |. . . . . . . . |   *|.|__________|.|    |.|__|.|________|.|__|.| *   |.|  |",0
		byte "|* |. ____________ .|    |. . . . . . . |*   |. . . . . . . . . . . |     |.|  |",0
		byte "|  |.|      *     |.|    |. __________ .|    |.. ___==========___ ..|   * |.|  |",0
		byte "|  |.|  *     *   |.| *  |.|          |.|  * |..| |            | |..|*    |.|  |",0
		byte "|  |.|____________|.|    |.|__________|.|    |..|_|____________|_|..|     |C|  |",0
		byte "|  |. . . . . . . . |*   |. . . C . . . |    |. . . . . . . . . . . | *   |.|  |",0
		byte "|  |______________ .|    |. __________ .|   *|. __ . ________ . __ .|     |.|  |",0
		byte "| *       *       |.|    |.|          |.|    |.|  |.| *    * |.|  |.|    *|.|  |",0
		byte "|   ______________|.|  * |.|__________|.|*   |.|  |.|    *   |.|  |.|*    |.|  |",0
		byte "|  |C . . . . . . . |    |. . . . . . . |    |.|  |.|________|.|  |.|     |.|  |",0
		byte "|* |______________ .|*   |____ . _ . ___|   *|.|  |. . . . . . |  |.|     |.|  |",0
		byte "|    *         *  |.|      *  |.| |.|  *     |.|  |____________|  |.|  *  |.|  |",0
		byte "|   ______________|.|_________|.| |.|________|.|     *     *      |.|_____|.|  |",0
		byte "|  |. . . . . . . . . . . . . . | |. . . . . . |              *   |. . . . .|  |",0
		byte "|  |____________________________| |____________|  *     *         |_________|  |",0
		byte "|______________________________________________________________________________|",0

			
level3map byte "________________________________________________________________________________",0 
		byte "|  _______________.  .____________________________________.  ._______________  |",0
		byte "| |. . . . . . . .|  | . . . . . . . . . . . . . . . . . .|  |. . . . . . . C| |",0
		byte "| |. ___________ .|  |. ________________________________ .|  |. ___________ .| |",0
		byte "| |.|___________|.|__|.|________________________________|.|__|.|___________|.| |",0
		byte "| |C . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . | |",0
		byte "| |_________ . _ . _________________   __   _________________ . _ . _________| |",0
		byte "|_________  |.| | |                 | |  | |                 |.| |.|  _________|",0
		byte "          | |.| |.|_________________|.|  |.|_________________| | |.| |          ",0
		byte "          | |.| |. . . . . . . . . . .|  |. . . . . . . . . . .| |.| |          ",0
		byte " _________| |.| |__________ . ________|  |________ . __________| |.| |_________ ",0
		byte "|___________|.|____________|.|____________________|.|____________|.|___________|",0
		byte ". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ",0
		byte " ___________ . ____________ . ________    ________ . ____________ . ___________ ",0
		byte "|_________  |.|   _________|.|        |  |        |.|_________   |.|  _________|",0
		byte "          | |.|  |. . . . . .|        |  |        |. . . . . .|  |.| |          ",0
		byte "          | |.|  |. _______ .|________|  |________|. _______ .|  |.| |          ",0
		byte " _________| |.|  |.|       |. . . . . . . . . . . . |       |.|  |.| |_________ ",0
		byte "|  _________|.|__|.|       |. ____________________ .|       |.|__|.|_________  |",0
		byte "| |. . . . . . . . |       |.|____            ____|.|       |. . . . . . . . | |",0
		byte "| |. ____________ .|       |. . . |          |. . . |       |. ____________ .| |",0
		byte "| |.|____________|.|_______|. __ .|__________|. __ .|_______|.|____________|.| |",0
		byte "| |. . . . . . . . . . . . . |  |. . . . . . . |  |. . . . . . . . . . . . . | |",0
		byte "| |__________________________|  |______________|  |__________________________| |",0
		byte "|______________________________________________________________________________|",0

level2map byte " ______________________________________________________________________________ ",0 
		byte "|  ___________________________________    __________________________________   |",0
		byte "|  | C . . . . . . . . . . . . . . . .|  |. . . . . . . . . . . . . . . . C |  |",0
		byte "|  |. _____________ . ______________ .|  |. ______________ . _____________ .|  |",0
		byte "|  |.|      0      |.|      9       |.|  |.|       2      |.|      2      |.|  |",0
		byte "|  |.|_____________|.|______________|.|__|.|______________|.|_____________|.|  |",0
		byte "|  | . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|  |",0
		byte "|  |. _____________ . __ . __________________________ . __ . _____________ .|  |",0
		byte "|  |.|_____________|.|  |.|___________    ___________|.|  |.|_____________|.|  |",0
		byte "|  | . . . . . . . . |  |. . . . . . .|  |. . . . . . .|  |. . . . . . . . .|  |",0
		byte "|  |_______________ .|  |___________ .|  |. ___________|  |. _______________|  |",0
		byte "|__________________|.|______________|.|__|.|______________|.|__________________|",0
		byte ". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ",0
		byte " __________________ . ______________ . __ . ______________ . __________________ ",0
		byte "|  ________________|.|   ___________|.|  |.|___________   |.|_______________   |",0
		byte "|  | C . . . . . . . |  |. . . . . . .|  |. . . . . . .|  |. . . . . . . . .|  |",0
		byte "|  |. _____________ .|  |. ___________|  |___________ .|  |. _____________ .|  |",0
		byte "|  |.|_____________|.|__|.|__________________________|.|__|.|_____________|.|  |",0
		byte "|  | . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .|  |",0
		byte "|  |. _____________ . ______________ . __ . ______________ . _____________ .|  |",0
		byte "|  |.|             |.|              |.|  |.|              |.|             |.|  |",0
		byte "|  |.|_____________|.|______________|.|  |.|______________|.|_____________|.|  |",0
		byte "|  | . . . . . . . . . . . . . . . . .|  |C . . . . . . . . . . . . . . . . |  |",0
		byte "|  |__________________________________|  |__________________________________|  |",0
		byte "|______________________________________________________________________________|",0

 
temp db 0

;===================================================================

strScore BYTE "Your score is: ",0
score dd 0

xPos BYTE 58
yPos BYTE 16

xghost byte 83
yghost byte 14

yPosfruit BYTE ?
xPosfruit BYTE ?

inputChar BYTE ?

;=========================Menu Variables==============================

intro byte ".--------------------------------------------------------------------------------------------------.",0
	  byte "| .---------------------------------------------------------------------------------------------.  |",0
	  byte "| |   ______           __             ______      ____    ____          __          ____  _____  | |",0
	  byte "| |  |_   __ \        /  \          .' ___  |    |_   \  /   _|        /  \        |_   \|_   _| | |",0
	  byte "| |    | |__) |      / /\ \        / .'   \_|      |   \/   |         / /\ \         |   \ | |   | |",0
	  byte "| |    |  ___/      / ____ \       | |             | |\  /| |        / ____ \        | |\ \| |   | |",0
	  byte "| |   _| |_       _/ /    \ \_     \ `.___.'\     _| |_\/_| |_     _/ /    \ \_     _| |_\   |_  | |",0
	  byte "| |  |_____|     |____|  |____|     `._____.'    |_____||_____|   |____|  |____|   |_____|\____| | |",0
	  byte "| |                                                                                              | |",0
	  byte "| '---------------------------------------------------------------------------------------------'  |",0
	  byte " '------------------------------------------------------------------------------------------------' ",0

pacboi  byte "-::::::::::::- -::::::::::::- -::::::::::::- -::::::::::::- -::::::::::::-",0
		byte "                                                                         ",0
		byte ".-------.    ____        _______   ,---.    ,---.   ____    ,---.   .--. ",0
		byte "\  _(`)_ \ .'  __ `.    /   __  \  |    \  /    | .'  __ `. |    \  |  | ",0
		byte "| (_ o._)|/   '  \  \  | ,_/  \__) |  ,  \/  ,  |/   '  \  \|  ,  \ |  | ",0
		byte "|  (_,_) /|___|  /  |,-./  )       |  |\_   /|  ||___|  /  ||  |\_ \|  | ",0
		byte "|   '-.-'    _.-`   |\  '_ '`)     |  _( )_/ |  |   _.-`   ||  _( )_\  | ",0
		byte "|   |     .'   _    | > (_)  )  __ | (_ o _) |  |.'   _    || (_ o _)  | ",0
		byte "|   |     |  _( )_  |(  .  .-'_/  )|  (_,_)  |  ||  _( )_  ||  (_,_)\  | ",0
		byte "/   )     \ (_ o _) / `-'`-'     / |  |      |  |\ (_ o _) /|  |    |  | ",0
		byte "`---'      '.(_,_).'    `._____.'  '--'      '--' '.(_,_).' '--'    '--' ",0

instrucshun byte "<--Return to menu (Press any key)                                              ",0
			byte "                                                                               ",0
			byte "---------------------------------Instructions----------------------------------",0
			byte "                                                                               ",0
			byte " ~You are supposed to collect the coins and dots while the ghost chases you.   ",0
			byte "                                                                               ",0
			byte " ~You will have 3 lives. Collecting the coins will not only give you a bonus   ",0
			byte " score, it will let you eat the ghost for some time.                           ",0
			byte "                                                                               ",0
			byte " ~After eating all of the dots, you level up and the difficulty increases.     ",0
			byte "                                                                               ",0
			byte " ~Eat the random fruits for bonus points.                                      ",0
			byte "                                                                               ",0
			byte "-----------------------------------Controls------------------------------------",0
			byte "                                                                               ",0
			byte "                                   W - up                                      ",0
			byte "                         A - Left S - down D - right               .--.        ",0
			byte "                                                                 .'_\/_'.      ",0
			byte "-----------------------------Character Description-------------- '. /\ .' -----",0
			byte "                                                                    |'         ",0
			byte "            X-Player(PacMan)        #-Ghost          C-Coin      /\ |          ",0
			byte "                                                                   \|          ",0
			byte "------------------------------------------------------------------\\|//--------",0

yourname  byte " __ __                ___ _               ",0
		  byte "|  |  |___ _ _ ___   |   | |___ _____ ___ ",0
		  byte "|_   _| . | | |  _|  | | | | .'|     | -_|",0
		  byte "  |_| |___|___|_| \/ |_|___|__,|_|_|_|___|",0
		  byte "                                          ",0
		  byte "    _______\/______________\/\\/______    ",0
		  byte "   |                                  |   ",0
		  byte "   |___\\/________________\\//________|   ",0

pauselogo	byte "   ___                     ",0
			byte "  / _ \__ _ _   _ ___  ___ ",0
			byte " / /_)/ _` | | | / __|/ _ \",0
			byte "/ ___/ (_| | |_| \__ \  __/",0
			byte "\/    \__,_|\__,_|___/\___|",0

gameover byte "   ___                         ___                 ",0
		byte "  / _ \__ _ _ __ ___   ___    /___\__   _____ _ __ ",0
		byte " / /_\/ _` | '_ ` _ \ / _ \  //  //\ \ / / _ \ '__|",0
		byte "/ /_\\ (_| | | | | | |  __/ / \_//  \ V /  __/ |   ",0
		byte "\____/\__,_|_| |_| |_|\___| \___/    \_/ \___|_|   ",0
                                                   
playern byte "Player Name: ",0		
pscore byte "Player Score:",0
   
continuegame byte "[1] Continue",0
mainmenu byte "[2] Main Menu",0


stgame byte "[1] New Game",0
instrr byte "[2] Instructions",0
Depart byte "[3] Exit Game", 0

spaceline byte "                                                                                                                                                                                                        ",0
valforbg dd 200

totalscore dd 0
levelup dd 0

colorchange dd 0

namestore dd 50 dup (?)
inpp byte ?
ycopy dd ?

fruitycounter dd 0

;==================CODE=====================

.code
scorecheck PROC
	
	mov eax, score		

	cmp levelup , 0
	je s1
	cmp levelup , 1
	je s2
	cmp levelup , 2
	je s3
	jmp cc

	s1:	
	cmp score, 1000
	jge fruitspawnn
	jmp cc	

	fruitspawnn:
	cmp fruitycounter, 1
	je cc
		call fruitspawn
		call drawfruit

	jmp cc	

	s2:
	cmp score, 1500
	jge fruitspawn1
	jmp cc	
	fruitspawn1:
	cmp fruitycounter, 1
	je cc
		call fruitspawn
		call drawfruit

	jmp cc

	s3:	
	cmp score, 1000
	jge fruitspawnn2
	jmp cc	

	fruitspawnn2:
	cmp fruitycounter, 1
	je cc
		call fruitspawn
		call drawfruit

	jmp cc	
	
	cc:
		mov dl,0
		mov dh,0
		mov eax,white+(black * 16)
		call SetTextColor
		call Gotoxy
		mov edx,OFFSET strScore
		call WriteString
		mov eax,score
		call WriteDec
		mov dl,0
		mov dh,1
		call gotoxy

		mov eax, totalscore
		call WriteDec

		
	cmp totalscore, 9422
	je exitscc
	jmp rret
	exitscc:
		call exitscreen
	rret:
		ret

scorecheck ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	mov eax,yellow
	call SetTextColor
	call Gotoxy
	mov al," "
	call WriteChar

	ret
UpdatePlayer ENDP

DrawPlayer PROC

	mov dl, xPos
	mov dh, yPos
	call Gotoxy
	mov al,"X"
	call WriteChar
	ret

DrawPlayer ENDP

;===============OPENING SCREEN===============

whitesc PROC
	;x=100, y=50

	mov dh, 0
	mov esi, offset spaceline
	mov ecx, 30
	
	loo:
		mov temp, cl
		mov ecx, valforbg
		mov bl, 0

		loo2:
			mov dl,bl	
			cmp colorchange,0
			je white1
			jmp nega

			white1:
			mov eax, white+(white*16)
			call SetTextColor
			jmp cont

			nega:
			mov eax, white+(black * 16)
			call SetTextColor
			
			cont:
			call Gotoxy
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop loo2
		mov esi, offset spaceline
		movzx ecx, temp
		inc dh
	loop loo
	ret

whitesc ENDP

logocolor PROC
	
	mov dh, 9
	mov esi, offset intro
	mov ecx, 11
	
	light:
		mov temp, cl
		mov ecx, 101
		mov bl, 10

		light2:
			mov dl,bl	
			cmp colorchange, 0
			je greyy
			cmp colorchange, 1
			je dgreyy
			cmp colorchange, 2
			je blackk

			greyy:
				mov eax,lightgray + (white * 16)
				call SetTextColor
				jmp color

			dgreyy:
				mov eax, gray + (white * 16)
				call SetTextColor
				jmp color

			blackk:
				mov eax, black + (white * 16)
				call SetTextColor
				jmp color

			color:
			call Gotoxy
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop light2
		movzx ecx, temp
		inc dh
	loop light

	ret
logocolor ENDP

username PROC
	
	mov dh, 8
	mov esi, offset yourname
	mov ecx, 8
	
	loopp:
		mov temp, cl
		mov ecx, 43
		mov bl, 40

		loop2:
			mov dl,bl	
			mov eax, black+(white*16)
			call SetTextColor
			call Gotoxy
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop loop2
		movzx ecx, temp
		inc dh
	loop loopp

	mov esi, offset namestore
		mov dl, 54
		mov dh, 14
		call gotoxy
		mov edx, offset namestore
		mov ecx, 255
		call readstring
	
		call clrscr

	ret
username ENDP

Instructions PROC
mov edx, 0
	mov dh, 2
	mov esi, offset instrucshun
	mov ecx, 24
	mov ebx, 0	

	loopp:
	
		mov temp, cl
		mov ecx, 80
		mov bl, 3

		loop2:
			mov dl,bl	
			mov eax, lightcyan+(white * 16)
			call SetTextColor
			call Gotoxy
			mov eax, [esi]
			call Writechar
			inc bl
			inc esi
		loop loop2

		movzx ecx, temp
		inc dh
	loop loopp
	ret

Instructions ENDP

PrintMaze PROC
	
	call scorecheck
	mov eax,blue 
	call SetTextColor

	maze1:
	mov edx, 0
	mov dh, 2
	mov esi, offset ground
	mov ecx, 25
	mov ebx, 0
	
	loopp:
	
		mov temp, cl
		mov ecx, 81
		mov bl, 20

		loop2:
			outputt:
			mov dl,bl
			call Gotoxy
			mov eax,blue 
			call SetTextColor
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop loop2

		movzx ecx, temp
		inc dh
	loop loopp

	ret

PrintMaze ENDP

printmenu PROC

mov dh, 2
	mov esi, offset pacboi
	mov ecx, 11

	loopp:
		mov temp, cl
		mov ecx, 74
		mov bl, 25

		loop2:
			mov dl,bl	

			cmp colorchange, 0
			je cyann
			cmp colorchange, 1
			je darkcyan
			cmp colorchange, 2
			je bluee

			cyann:
			mov eax,lightcyan+(white * 16)
			call SetTextColor
			jmp printing
			
			darkcyan:
			mov eax,cyan+(white * 16)
			call SetTextColor
			jmp printing

			bluee:
			mov eax,blue+(white * 16)
			call SetTextColor

			printing:
			call Gotoxy
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop loop2
		movzx ecx, temp
		inc dh
	loop loopp
	
	mov eax, cyan+(white * 16)
	call SetTextColor
	mov dl,53
	mov dh,16
	call Gotoxy
	mov edx,OFFSET stgame
	call WriteString

	mov dl,53
	mov dh,18

	call Gotoxy
	mov edx,OFFSET instrr
	call WriteString

	mov dl,53
	mov dh,20
	call Gotoxy
	mov edx,OFFSET depart
	call WriteString

	ret
printmenu ENDP

startofgame PROC
	call whitesc
	mov eax, 300
	call delay
	call logocolor
	mov eax, 400
	call delay
	
	inc colorchange
	call logocolor
	
	mov eax, 600
	call delay

	inc colorchange
	call logocolor
	
	mov eax, 2000
	call delay
	
	dec colorchange
	call logocolor
 
	mov eax, 600
	call delay
	
	dec colorchange
	call logocolor
	mov eax, 400
	call delay

	call clrscr
	mov eax, 1500
	call delay
	
	call username
ret
startofgame ENDP

Menu PROC

	backtomenu:

	mov colorchange, 0
	call printmenu

	inc colorchange
	mov eax, 600
	call delay

	call printmenu

	inc colorchange
	mov eax, 600
	call delay

	call printmenu

	mov al, 0
	mov edx, offset inpp
	call readchar

	cmp al, '1'
	je gamestart

	cmp al, '2'
	je instruction

	cmp al, '3'
	je exitt
	
	jmp callmenu
	
	exitt:
	call clrscr
	exit

	gamestart:

		INVOKE PlaySound, OFFSET audio1, NULL, 200001H
		mov eax,600
		call Delay
		inc colorchange
		call whitesc
		cmp levelup, 0
		jne bingus

		INVOKE PlaySound, OFFSET level1, NULL, 200001H
		call clrscr
		call PrintMaze
		;call coinprint
		mov eax,white +(black*16)
		call SetTextColor
		call DrawPlayer
		
		jmp endoffunc

		bingus:
		call clrscr

		call levelupto
		
		jmp endoffunc

	instruction:
		INVOKE PlaySound, OFFSET audio1, NULL, 200001H
		mov eax,800
		call Delay
		call clrscr
		
		INVOKE PlaySound, OFFSET audio, NULL, 200001H

		call instructions

		mov edx, offset inpp
		call readchar
		
		cmp al, '+'
		jne callmenu

	callmenu:
		INVOKE PlaySound, OFFSET audio1, NULL, 200001H
		mov eax,200
		call Delay
		call clrscr
		jmp backtomenu



	endoffunc:
	ret

Menu ENDP

coinprint PROC

	mov dl,25
	mov dh,7
	mov eax, yellow
	call SetTextColor
	call Gotoxy
	mov al,"C"
	call WriteChar

	mov dl,25
	mov dh,20
	mov eax, yellow
	call SetTextColor
	call Gotoxy
	mov al,"C"
	call WriteChar

	mov dl,53
	mov dh,16
	mov eax, yellow
	call SetTextColor
	call Gotoxy
	mov al,"C"
	call WriteChar

	mov dl,96
	mov dh,15
	mov eax, yellow
	call SetTextColor
	call Gotoxy
	mov al,"C"
	call WriteChar

	ret
coinprint ENDP

pausemenu PROC
	
	INVOKE PlaySound, OFFSET pausem, NULL, 200001H

	call clrscr
	mov colorchange, 1
	call whitesc
	mov dh, 2
	mov esi, offset pauselogo
	mov ecx, 5

	loopp:
		mov temp, cl
		mov ecx, 28
		mov bl, 10

		loop2:
			mov dl,bl	

			mov eax,red
			call SetTextColor			

			printing:
			call Gotoxy
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop loop2
		movzx ecx, temp
		inc dh
	loop loopp
	
	mov eax, lightred
	call SetTextColor

	mov dl,10
	mov dh,14
	call Gotoxy
	mov edx,OFFSET continuegame
	call WriteString

	mov dl,10
	mov dh,16
	call Gotoxy
	mov edx,OFFSET mainmenu
	call WriteString

	mov dl,10
	mov dh,18
	call Gotoxy
	mov edx,OFFSET depart
	call WriteString

	pausedgame:

	mov al, 0
	mov edx, offset inpp
	call readchar

	cmp al, '1'
	je continuegame1

	cmp al, '2'
	je backtomenu

	cmp al, '3'
	je exiting
	
	exiting:
	call clrscr
	exit

	continuegame1:
		
		cmp levelup, 0
		jne bingus

		INVOKE PlaySound, OFFSET level1, NULL, 200001H
		call clrscr
		call PrintMaze
		call coinprint
		mov eax,white +(black*16)
		call SetTextColor
		call DrawPlayer
		
		jmp endoffunc

		bingus:
		call clrscr

		call levelupto
		
		jmp endoffunc

	backtomenu:
		mov colorchange,0

		call whitesc
		INVOKE PlaySound, OFFSET audio1, NULL, 200001H
		mov eax,200
		call Delay
		call clrscr

		call menu

	endoffunc:
	ret

pausemenu ENDP

levelupto PROC

	maze1:
	cmp levelup, 1
	je l2
	cmp levelup, 2
	je l3
	jmp restin
	
	l2:
		INVOKE PlaySound, OFFSET level2, NULL, 200001H 
		mov edi, offset level2map
		jmp restin

	l3:
		INVOKE PlaySound, OFFSET level3, NULL, 200001H
		mov edi, offset level3map

	restin:

	call whitesc
	mov eax, 300
	call delay
	mov edx, 0
	mov dh, 2
	mov eax,blue
	call SetTextColor
	mov esi, offset ground
	mov ecx, 25
	mov ebx, 0
	
	loopp:
	
		mov temp, cl
		mov ecx, 81
		mov bl, 20

		loop2:
			mov eax, [edi]
			mov [esi], eax
			mov dl,bl
			call Gotoxy
			mov eax,blue
			call SetTextColor
			mov eax, [esi]
			call WriteChar
			inc bl
			inc edi
			inc esi
		loop loop2

		movzx ecx, temp
		inc dh
	loop loopp
	
	cmp levelup, 1
	je summon2
	cmp levelup, 2
	je summon3	
	jmp resting
	
	summon2:
		mov xPos, 40
		mov Ypos, 15
		call DrawPlayer
		jmp resting

	summon3:
		mov xPos, 35
		mov Ypos, 14
		call DrawPlayer

resting:
	ret

levelupto ENDP

fruitspawn PROC
	
	call randomize
	mov eax, 22
	call RandomRange
	add al, 3
	mov bl,al

	mov eax, 75
	call RandomRange
	add al, 25
	mov xPosfruit, al
	mov yPosfruit, bl
	ret

fruitspawn ENDP

drawfruit PROC

			movzx eax, yPosfruit
			sub eax, 2
			mov ebx, 81
			mul ebx

			inc xPos
			movzx ebx, xPosfruit
			dec xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx

			cmp ground[esi], "."
			jne randomagain
			
			inc fruitycounter

			mov eax,lightgreen
			call SetTextColor
			mov eax,lightgreen
			call SetTextColor
			mov dl,xPosfruit
			mov dh,yPosfruit
			call Gotoxy
			mov al,"O"
			call WriteChar
			ret

randomagain:
	call fruitspawn
ret
drawfruit ENDP

fruitcollected PROC

		mov bl,xPos
		cmp bl,xPosfruit
		jne notCollecting
		mov bl,yPos
		cmp bl,yPosfruit
		jne notCollecting

		add score, 100
		add totalscore, 100


		notCollecting:
		ret

fruitcollected ENDP


exitscreen PROC

	call clrscr
	mov colorchange, 1
	call whitesc
	mov dh, 4
	mov esi, offset gameover
	mov ecx, 5

	lloopp:
		mov temp, cl
		mov ecx, 52
		mov bl, 35

		lloop2:
			mov dl,bl	

			mov eax,red
			call SetTextColor			

			printing:
			call Gotoxy
			mov eax, [esi]
			call WriteChar
			inc bl
			inc esi
		loop lloop2
		movzx ecx, temp
		inc dh
	loop lloopp
		mov eax,lightred
		call SetTextColor	
		
		mov dl,36
		mov dh,10
		call Gotoxy
		mov edx,OFFSET playern
		call WriteString

		mov dl, 50
		mov dh, 10
		call gotoxy
		mov edx, offset namestore
		call writestring

		mov dl,36
		mov dh,14
		call Gotoxy
		mov edx,OFFSET pscore
		call WriteString
	
		
		mov dl, 50
		mov dh, 14
		call gotoxy
		mov eax, totalscore
		call writedec
exit
;ret
exitscreen ENDP

;========================ghost exp code===========================

UpdateGhost PROC
	mov dl,xghost
	mov dh,yghost
	mov eax,lightred
	call SetTextColor
	call Gotoxy
	mov al," "
	call WriteChar

	ret
UpdateGhost ENDP

Drawghost PROC

	mov dl, xghost
	mov dh, yghost
	call Gotoxy
	mov al,"#"
	call WriteChar
	ret

Drawghost ENDP

ghostmoves PROC
	inpt1:
			
	inp1:
		
		mov al, xPos
		cmp xghost, al
		jl moveleft1
		
		mov al, xPos
		cmp xghost, al
		jg moveright1

		mov al, yPos
		cmp yghost, al
		jl movedown1

		mov al, yPos
		cmp xghost, al
		jg moveup1

		moveUp1:
		
			dec yPos
			movzx eax, yghost
			inc yPos
			sub eax, 2
			mov ebx, 81
			mul ebx

			movzx ebx, xghost
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx
			
			cmp ground[esi], " "
			je continue11

			cmp ground[esi], "."
			je continue11

			cmp ground[esi], "|"
			je inpt1

			cmp ground[esi], "_"
			je movedown1

			cmp ground[esi], "*"
			je inpt1

			cmp ground[esi], "C"
			je continue11

			continue11:
			call updateghost
			dec yghost
			call drawghost
			mov eax, 100
			call delay
			    
		jmp moveup1

		moveDown1:

			inc yPos
			movzx eax, yghost
			dec yPos
			sub eax, 2
			mov ebx, 81
			mul ebx

			movzx ebx, xghost
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx
			
			cmp ground[esi], " "
			je continue22

			cmp ground[esi], "."
			je continue22

			cmp ground[esi], "|"
			je inpt1

			cmp ground[esi], "_"
			je moveup1

			cmp ground[esi], "*"
			je inpt1

			cmp ground[esi], "C"
			je continue22
			
			continue22:
			call updateghost
			inc yghost
			call drawghost
			mov eax, 100
			call delay


		jmp moveDown1

		moveLeft1:

			movzx eax, yghost
			sub eax, 2
			mov ebx, 81
			mul ebx

			dec xPos
			movzx ebx, xghost
			inc xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx

			cmp ground[esi], " "
			je continue33

			cmp ground[esi], "."
			je continue33

			cmp ground[esi], "|"
			je moveright1

			cmp ground[esi], "_"
			je inpt1

			cmp ground[esi], "*"
			je inpt1

			cmp ground[esi], "C"
			je continue33
			
			continue33:			
			call updateghost
			dec xghost
			
			call drawghost
			mov eax, 70
			call delay

		
		jmp moveLeft1
		
		moveRight1:
			movzx eax, yghost
			sub eax, 2
			mov ebx, 81
			mul ebx

			inc xPos
			movzx ebx, xghost
			dec xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx
		
			cmp ground[esi], " "
			je continue44

			cmp ground[esi], "."
			je continue44

			cmp ground[esi], "|"
			je moveleft1

			cmp ground[esi], "_"
			je inpt1

			cmp ground[esi], "*"
			je inpt1

			cmp ground[esi], "C"
			je continue44		 
			
			continue44:
			call updateghost
			inc xghost
			call drawghost
			mov eax, 70
			call delay

		jmp moveRight1
		ret
ghostmoves endp

;========================ghost exp code===========================


main PROC
	
	call startofgame
	INVOKE PlaySound, OFFSET audio, NULL, 200001H
	call clrscr
	call menu

	gameLoop:
		mov eax,white+(black * 16)
		call SetTextColor

		call drawghost
	inpt:
		call DrawPlayer
		call ReadChar
	
	inp:
		mov inputChar,al

		cmp inputChar,"w"
		je moveUp

		cmp inputChar,"s"
		je moveDown

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight

		cmp inputChar, "p"
		je pausee
		
		jmp inpt

		pausee:
			call pausemenu
			jmp inpt

		moveUp:
		
			dec yPos
			movzx eax, yPos
			inc yPos
			sub eax, 2
			mov ebx, 81
			mul ebx

			movzx ebx, xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx
			
			cmp ground[esi], " "
			je continue1

			cmp ground[esi], "."
			je incscore1

			cmp ground[esi], "|"
			je inpt

			cmp ground[esi], "_"
			je inpt

			cmp ground[esi], "*"
			je inpt

			cmp ground[esi], "C"
			add score, 40
			add totalscore, 40
			jmp incscore1

			cmp ground[esi], "O"
			add score, 90
			add totalscore, 90
			jmp continue1 

			incscore1:
			mov ground [esi], " "
				add score, 10
				add totalscore, 10
				call scorecheck

				cmp totalscore, 6351
				je leveling

				cmp totalscore, 2870
				je leveling
			
				jmp continue1

			leveling:
				inc totalscore
				mov fruitycounter, 0

				mov score, 0
				inc levelup
				call levelupto
				jmp inpt

			continue1:
		;	call ghostmoves

			cmp fruitycounter, 1
			je froot
			jmp c1
			froot:
			call fruitcollected
			c1:

			call UpdatePlayer
			dec yPos
			call DrawPlayer
			mov eax, 100
			call delay

			call ReadKey  
			jnz inp 
			    
		jmp moveup

		moveDown:

			inc yPos
			movzx eax, yPos
			dec yPos
			sub eax, 2
			mov ebx, 81
			mul ebx

			movzx ebx, xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx
			
			cmp ground[esi], " "
			je continue2

			cmp ground[esi], "."
			je incscore2

			cmp ground[esi], "|"
			je inpt

			cmp ground[esi], "_"
			je inpt

			cmp ground[esi], "*"
			je inpt

			cmp ground[esi], "C"
			add score, 40
			add totalscore, 40

			incscore2:
				mov ground [esi], " "
				add score, 10
				add totalscore, 10
				call scorecheck	
	
				cmp totalscore, 6351
				je leveling2

				cmp totalscore, 2870
				je leveling2
			
				jmp continue2

			leveling2:
		;	call ghostmoves

				mov fruitycounter, 0

				inc totalscore
				mov score, 0
				inc levelup
				call levelupto
				jmp inpt

			
			continue2:

			cmp fruitycounter, 1
			je froot2
			jmp c2
			froot2:
			call fruitcollected
			c2:
			call UpdatePlayer
			inc yPos
			call DrawPlayer
			mov eax, 100
			call delay

			call ReadKey  
			jnz inp 
		jmp moveDown

		moveLeft:

			movzx eax, yPos
			sub eax, 2
			mov ebx, 81
			mul ebx

			dec xPos
			movzx ebx, xPos
			inc xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx

			cmp ground[esi], " "
			je continue3

			cmp ground[esi], "."
			je incscore3

			cmp ground[esi], "|"
			je inpt

			cmp ground[esi], "_"
			je inpt

			cmp ground[esi], "*"
			je inpt

			cmp ground[esi], "C"
			add score, 40
			add totalscore, 40
			
			incscore3:
			mov ground [esi], " "
				add score, 10
			add totalscore, 10
				call scorecheck
				
				cmp totalscore, 6351
				je leveling3

				cmp totalscore,2870
				je leveling3
			
				jmp continue3
			
			leveling3:
		;	call ghostmoves

				mov fruitycounter, 0
				inc totalscore
				mov score, 0
				inc levelup
				call levelupto
				jmp inpt
			
		

			continue3:
			cmp fruitycounter, 1
			je froot3
			jmp c3
			froot3:
			call fruitcollected
			c3:
			call UpdatePlayer
			dec xPos
			cmp xPos, 19
			je nuuh1
			jmp cc3
			nuuh1:
			mov xPos, 98
			cc3:
			call DrawPlayer
			mov eax, 70
			call delay

			call ReadKey  
			jnz inp 
		jmp moveLeft
		
		moveRight:
			movzx eax, yPos
			sub eax, 2
			mov ebx, 81
			mul ebx

			inc xPos
			movzx ebx, xPos
			dec xPos
			sub ebx, 20
			add eax, ebx 

			mov ycopy, eax
			mov edx, ycopy
			mov esi, edx
		
			cmp ground[esi], " "
			je continue4

			cmp ground[esi], "."
			je incscore4

			cmp ground[esi], "|"
			je inpt

			cmp ground[esi], "_"
			je inpt

			cmp ground[esi], "*"
			je inpt

			cmp ground[esi], "C"
			add score, 40
			add totalscore, 40

			incscore4:
			mov ground[esi], " "
				add score, 10
				add totalscore, 10
				call scorecheck

				cmp totalscore, 6351
				je leveling4

				cmp totalscore, 2870
				je leveling4
			
				jmp continue4

				leveling4:
				mov fruitycounter, 0
				inc totalscore
				mov score, 0
				inc levelup
				call levelupto
				jmp inpt
			
			
			continue4:
		;	call ghostmoves

			cmp fruitycounter, 1
			je froot4
			jmp c4
			froot4:
			call fruitcollected
			c4:
			call UpdatePlayer
			inc xPos
			call DrawPlayer
			cmp xPos, 99
			je nuuh
			jmp cc4
			nuuh:
				mov xPos, 20
			cc4:
			mov eax, 70
			call delay

			call ReadKey  
			jnz inp 

		jmp moveRight

	exitGame:
	exit

	main ENDP
end main