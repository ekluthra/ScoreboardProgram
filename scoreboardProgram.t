%Program name: scoreboardProgram
%Students: McHenry, Ekagra
%Date: 14 May, 2018
%This program simply displays a scoreboard, and allows the user to change the scores and fouls of each team
%The team with the greatest score will have their score be displayed on the seven segment display
%If one team reaches 10 points, they win. If one team reaches 10 fouls, the other team wins

%importing GUI and setting screen size
import GUI
setscreen ("graphics:800;550")

%mousewhere variables
var x, y, button : int

%declaring font
var font1 : int := Font.New ("Californian FB:46:bold")

%variables keeping track of points and fouls
var score1 : int := 0
var score2 : int := 0
var fouls1 : int := 0
var fouls2 : int := 0

%pictures for scoreboard
var scoreboard : int := Pic.FileNew ("scoreboard.jpg")
var cavsLogo : int := Pic.FileNew ("cavs.jpg")
var rapsLogo : int := Pic.FileNew ("raps.jpg")

%pictures of numbers for fouls
var foul0 : int := Pic.FileNew ("yellow0.jpg")
var foul1 : int := Pic.FileNew ("yellow1.jpg")
var foul2 : int := Pic.FileNew ("yellow2.jpg")
var foul3 : int := Pic.FileNew ("yellow3.jpg")
var foul4 : int := Pic.FileNew ("yellow4.jpg")
var foul5 : int := Pic.FileNew ("yellow5.jpg")
var foul6 : int := Pic.FileNew ("yellow6.jpg")
var foul7 : int := Pic.FileNew ("yellow7.jpg")
var foul8 : int := Pic.FileNew ("yellow8.jpg")
var foul9 : int := Pic.FileNew ("yellow9.jpg")
foul0 := Pic.Scale (foul0, 50, 75)
foul1 := Pic.Scale (foul1, 50, 75)
foul2 := Pic.Scale (foul2, 50, 75)
foul3 := Pic.Scale (foul3, 50, 75)
foul4 := Pic.Scale (foul4, 50, 75)
foul5 := Pic.Scale (foul5, 50, 75)
foul6 := Pic.Scale (foul6, 50, 75)
foul7 := Pic.Scale (foul7, 50, 75)
foul8 := Pic.Scale (foul8, 50, 75)
foul9 := Pic.Scale (foul9, 50, 75)

%pictures of numbers for score
var num0 : int := Pic.FileNew ("num0.jpg")
var num1 : int := Pic.FileNew ("num1.jpg")
var num2 : int := Pic.FileNew ("num2.jpg")
var num3 : int := Pic.FileNew ("num3.jpg")
var num4 : int := Pic.FileNew ("num4.jpg")
var num5 : int := Pic.FileNew ("num5.jpg")
var num6 : int := Pic.FileNew ("num6.jpg")
var num7 : int := Pic.FileNew ("num7.jpg")
var num8 : int := Pic.FileNew ("num8.jpg")
var num9 : int := Pic.FileNew ("num9.jpg")
num0 := Pic.Scale (num0, 65, 100)
num1 := Pic.Scale (num1, 65, 100)
num2 := Pic.Scale (num2, 65, 100)
num3 := Pic.Scale (num3, 65, 100)
num4 := Pic.Scale (num4, 65, 100)
num5 := Pic.Scale (num5, 65, 100)
num6 := Pic.Scale (num6, 65, 100)
num7 := Pic.Scale (num7, 65, 100)
num8 := Pic.Scale (num8, 65, 100)
num9 := Pic.Scale (num9, 65, 100)

%declaring procs
forward proc main
forward proc cavsWin
forward proc rapsWin

%main screen
body proc main
    %changing background color
    GUI.SetBackgroundColor (black)
    %scoreboard
    Pic.Draw (scoreboard, 0, 0, picCopy)
    %covering up watermark with a black box
    drawfillbox (0, 225, 800, 300, black)
    %covering old logo and drawing cavs logo
    Pic.Draw (cavsLogo, 35, 450, picCopy)
    drawfillbox (590, 440, 770, 540, black)
    %covering old logo and drawing raptors logo
    Pic.Draw (rapsLogo, 620, 440, picCopy)
    %covering old numbers from scoreboard to draw new numbers
    drawfillbox (25, 340, 225, 440, black)
    drawfillbox (570, 340, 775, 440, black)
    drawfillbox (65, 41, 180, 100, black)
    drawfillbox (620, 41, 735, 100, black)
    Pic.Draw (num0, 65, 340, picCopy)
    Pic.Draw (num0, 135, 340, picCopy)
    Pic.Draw (num0, 605, 340, picCopy)
    Pic.Draw (num0, 675, 340, picCopy)
    Pic.Draw (foul0, 69, 50, picCopy)
    Pic.Draw (foul0, 126, 50, picCopy)
    Pic.Draw (foul0, 626, 50, picCopy)
    Pic.Draw (foul0, 684, 50, picCopy)
    %boxes around signs for score
    drawbox (70, 290, 125, 330, white)
    drawbox (140, 290, 195, 330, white)
    drawbox (610, 290, 665, 330, white)
    drawbox (680, 290, 735, 330, white)
    %boxes around signs for fouls
    drawbox (60, 0, 115, 40, white)
    drawbox (130, 0, 185, 40, white)
    drawbox (618, 0, 673, 40, white)
    drawbox (688, 0, 743, 40, white)
    %negative signs for score
    drawfillbox (75, 305, 120, 315, white)
    drawfillbox (615, 305, 660, 315, white)
    %positive signs for score
    drawfillbox (150, 305, 185, 315, white)
    drawfillbox (162, 295, 173, 325, white)
    drawfillbox (690, 305, 725, 315, white)
    drawfillbox (702, 295, 713, 325, white)
    % - signs for fouls
    drawfillbox (65, 15, 110, 25, white)
    drawfillbox (623, 15, 667, 25, white)
    % + signs for fouls
    drawfillbox (140, 15, 175, 25, white)
    drawfillbox (154, 5, 163, 35, white)
    drawfillbox (700, 15, 735, 25, white)
    drawfillbox (712, 5, 723, 35, white)
    %main loop for checking mouse and rewriting scores
    loop
	%if the raptors' score is greater than the cavs' score
	if score2 > score1 then
	    %output the raptors' score
	    parallelput (score2)
	else
	    %otherwise output the cavs' score
	    parallelput (score1)
	end if
	%check mouse location and if it's clicked
	mousewhere (x, y, button)
	%if the mouse is clicked at the plus sign for the cavs' score, add 1 to their score and redraw their score on the board
	if x >= 140 and x <= 195 and y >= 290 and y <= 330 and button = 1 then
	    if score1 = 0 then
		score1 := score1 + 1
		Pic.Draw (num1, 135, 340, picCopy)
	    elsif score1 = 1 then
		score1 := score1 + 1
		Pic.Draw (num2, 135, 340, picCopy)
	    elsif score1 = 2 then
		score1 := score1 + 1
		Pic.Draw (num3, 135, 340, picCopy)
	    elsif score1 = 3 then
		score1 := score1 + 1
		Pic.Draw (num4, 135, 340, picCopy)
	    elsif score1 = 4 then
		score1 := score1 + 1
		Pic.Draw (num5, 135, 340, picCopy)
	    elsif score1 = 5 then
		score1 := score1 + 1
		Pic.Draw (num6, 135, 340, picCopy)
	    elsif score1 = 6 then
		score1 := score1 + 1
		Pic.Draw (num7, 135, 340, picCopy)
	    elsif score1 = 7 then
		score1 := score1 + 1
		Pic.Draw (num8, 135, 340, picCopy)
	    elsif score1 = 8 then
		score1 := score1 + 1
		Pic.Draw (num9, 135, 340, picCopy)
	    elsif score1 = 9 then
		score1 := score1 + 1
		cavsWin
		exit
	    end if
	    %this acts as both the delay and the sound effect
	    Music.Sound (1600, 300)
	    Music.SoundOff
	end if
	%if the mouse is clicked at the plus sign for the raptors' score, add 1 to their score and redraw their score on the board
	if x >= 680 and x <= 735 and y >= 290 and y <= 330 and button = 1 then
	    if score2 = 0 then
		score2 := score2 + 1
		Pic.Draw (num1, 675, 340, picCopy)
	    elsif score2 = 1 then
		score2 := score2 + 1
		Pic.Draw (num2, 675, 340, picCopy)
	    elsif score2 = 2 then
		score2 := score2 + 1
		Pic.Draw (num3, 675, 340, picCopy)
	    elsif score2 = 3 then
		score2 := score2 + 1
		Pic.Draw (num4, 675, 340, picCopy)
	    elsif score2 = 4 then
		score2 := score2 + 1
		Pic.Draw (num5, 675, 340, picCopy)
	    elsif score2 = 5 then
		score2 := score2 + 1
		Pic.Draw (num6, 675, 340, picCopy)
	    elsif score2 = 6 then
		score2 := score2 + 1
		Pic.Draw (num7, 675, 340, picCopy)
	    elsif score2 = 7 then
		score2 := score2 + 1
		Pic.Draw (num8, 675, 340, picCopy)
	    elsif score2 = 8 then
		score2 := score2 + 1
		Pic.Draw (num9, 675, 340, picCopy)
	    elsif score2 = 9 then
		score2 := score2 + 1
		rapsWin
		exit
	    end if
	    %this acts as both the delay and the sound effect
	    Music.Sound (1600, 300)
	    Music.SoundOff
	end if
	%if the minus sign is clicked for the cavs' score, take away from their score and redraw on the scoreboard
	if x >= 70 and x <= 125 and y >= 290 and y <= 330 and button = 1 then
	    if score1 = 1 then
		score1 := score1 - 1
		Pic.Draw (num0, 135, 340, picCopy)
	    elsif score1 = 2 then
		score1 := score1 - 1
		Pic.Draw (num1, 135, 340, picCopy)
	    elsif score1 = 3 then
		score1 := score1 - 1
		Pic.Draw (num2, 135, 340, picCopy)
	    elsif score1 = 4 then
		score1 := score1 - 1
		Pic.Draw (num3, 135, 340, picCopy)
	    elsif score1 = 5 then
		score1 := score1 - 1
		Pic.Draw (num4, 135, 340, picCopy)
	    elsif score1 = 6 then
		score1 := score1 - 1
		Pic.Draw (num5, 135, 340, picCopy)
	    elsif score1 = 7 then
		score1 := score1 - 1
		Pic.Draw (num6, 135, 340, picCopy)
	    elsif score1 = 8 then
		score1 := score1 - 1
		Pic.Draw (num7, 135, 340, picCopy)
	    elsif score1 = 9 then
		score1 := score1 - 1
		Pic.Draw (num8, 135, 340, picCopy)
	    end if
	    %this acts as both the delay and sound effect
	    Music.Sound (275, 300)
	    Music.SoundOff
	end if
	%if the minus sign is clicked for the raptors' score, take away from their score and redraw on the scoreboard
	if x >= 610 and x <= 665 and y >= 290 and y <= 330 and button = 1 then
	    if score2 = 1 then
		score2 := score2 - 1
		Pic.Draw (num0, 675, 340, picCopy)
	    elsif score2 = 2 then
		score2 := score2 - 1
		Pic.Draw (num1, 675, 340, picCopy)
	    elsif score2 = 3 then
		score2 := score2 - 1
		Pic.Draw (num2, 675, 340, picCopy)
	    elsif score2 = 4 then
		score2 := score2 - 1
		Pic.Draw (num3, 675, 340, picCopy)
	    elsif score2 = 5 then
		score2 := score2 - 1
		Pic.Draw (num4, 675, 340, picCopy)
	    elsif score2 = 6 then
		score2 := score2 - 1
		Pic.Draw (num5, 675, 340, picCopy)
	    elsif score2 = 7 then
		score2 := score2 - 1
		Pic.Draw (num6, 675, 340, picCopy)
	    elsif score2 = 8 then
		score2 := score2 - 1
		Pic.Draw (num7, 675, 340, picCopy)
	    elsif score2 = 9 then
		score2 := score2 - 1
		Pic.Draw (num8, 675, 340, picCopy)
	    end if
	    %this acts as both the delay and sound effect
	    Music.Sound (275, 300)
	    Music.SoundOff
	end if
	%adding fouls for the cavs
	if x >= 130 and x <= 185 and y >= 0 and y <= 40 and button = 1 then
	    if fouls1 = 0 then
		fouls1 += 1
		Pic.Draw (foul1, 126, 50, picCopy)
	    elsif fouls1 = 1 then
		fouls1 += 1
		Pic.Draw (foul2, 126, 50, picCopy)
	    elsif fouls1 = 2 then
		fouls1 += 1
		Pic.Draw (foul3, 126, 50, picCopy)
	    elsif fouls1 = 3 then
		fouls1 += 1
		Pic.Draw (foul4, 126, 50, picCopy)
	    elsif fouls1 = 4 then
		fouls1 += 1
		Pic.Draw (foul5, 126, 50, picCopy)
	    elsif fouls1 = 5 then
		fouls1 += 1
		Pic.Draw (foul6, 126, 50, picCopy)
	    elsif fouls1 = 6 then
		fouls1 += 1
		Pic.Draw (foul7, 126, 50, picCopy)
	    elsif fouls1 = 7 then
		fouls1 += 1
		Pic.Draw (foul8, 126, 50, picCopy)
	    elsif fouls1 = 8 then
		fouls1 += 1
		Pic.Draw (foul9, 126, 50, picCopy)
	    elsif fouls1 = 9 then
		fouls1 += 1
		rapsWin
		exit
	    end if
	    %this acts as both the delay and sound effect
	    Music.Sound (275, 300)
	    Music.SoundOff
	end if
	%adding fouls for the raptors
	if x >= 688 and x <= 743 and y >= 0 and y <= 40 and button = 1 then
	    if fouls2 = 0 then
		fouls2 += 1
		Pic.Draw (foul1, 684, 50, picCopy)
	    elsif fouls2 = 1 then
		fouls2 += 1
		Pic.Draw (foul2, 684, 50, picCopy)
	    elsif fouls2 = 2 then
		fouls2 += 1
		Pic.Draw (foul3, 684, 50, picCopy)
	    elsif fouls2 = 3 then
		fouls2 += 1
		Pic.Draw (foul4, 684, 50, picCopy)
	    elsif fouls2 = 4 then
		fouls2 += 1
		Pic.Draw (foul5, 684, 50, picCopy)
	    elsif fouls2 = 5 then
		fouls2 += 1
		Pic.Draw (foul6, 684, 50, picCopy)
	    elsif fouls2 = 6 then
		fouls2 += 1
		Pic.Draw (foul7, 684, 50, picCopy)
	    elsif fouls2 = 7 then
		fouls2 += 1
		Pic.Draw (foul8, 684, 50, picCopy)
	    elsif fouls2 = 8 then
		fouls2 += 1
		Pic.Draw (foul9, 684, 50, picCopy)
	    elsif fouls2 = 9 then
		fouls2 += 1
		cavsWin
		exit
	    end if
	    %this acts as both the delay and sound effect
	    Music.Sound (275, 300)
	    Music.SoundOff
	end if
	%taking away fouls for the cavs
	if x >= 60 and x <= 115 and y >= 0 and y <= 40 and button = 1 then
	    if fouls1 = 9 then
		fouls1 -= 1
		Pic.Draw (foul8, 126, 50, picCopy)
	    elsif fouls1 = 8 then
		fouls1 -= 1
		Pic.Draw (foul7, 126, 50, picCopy)
	    elsif fouls1 = 7 then
		fouls1 -= 1
		Pic.Draw (foul6, 126, 50, picCopy)
	    elsif fouls1 = 6 then
		fouls1 -= 1
		Pic.Draw (foul5, 126, 50, picCopy)
	    elsif fouls1 = 5 then
		fouls1 -= 1
		Pic.Draw (foul4, 126, 50, picCopy)
	    elsif fouls1 = 4 then
		fouls1 -= 1
		Pic.Draw (foul3, 126, 50, picCopy)
	    elsif fouls1 = 3 then
		fouls1 -= 1
		Pic.Draw (foul2, 126, 50, picCopy)
	    elsif fouls1 = 2 then
		fouls1 -= 1
		Pic.Draw (foul1, 126, 50, picCopy)
	    elsif fouls1 = 1 then
		fouls1 -= 1
		Pic.Draw (foul0, 126, 50, picCopy)
	    end if
	    %this acts as both the delay and the sound effect
	    Music.Sound (1600, 300)
	    Music.SoundOff
	end if
	%taking away fouls for the raptors
	if x >= 618 and x <= 673 and y >= 0 and y <= 40 and button = 1 then
	    if fouls2 = 9 then
		fouls2 -= 1
		Pic.Draw (foul8, 684, 50, picCopy)
	    elsif fouls2 = 8 then
		fouls2 -= 1
		Pic.Draw (foul7, 684, 50, picCopy)
	    elsif fouls2 = 7 then
		fouls2 -= 1
		Pic.Draw (foul6, 684, 50, picCopy)
	    elsif fouls2 = 6 then
		fouls2 -= 1
		Pic.Draw (foul5, 684, 50, picCopy)
	    elsif fouls2 = 5 then
		fouls2 -= 1
		Pic.Draw (foul4, 684, 50, picCopy)
	    elsif fouls2 = 4 then
		fouls2 -= 1
		Pic.Draw (foul3, 684, 50, picCopy)
	    elsif fouls2 = 3 then
		fouls2 -= 1
		Pic.Draw (foul2, 684, 50, picCopy)
	    elsif fouls2 = 2 then
		fouls2 -= 1
		Pic.Draw (foul1, 684, 50, picCopy)
	    elsif fouls2 = 1 then
		fouls2 -= 1
		Pic.Draw (foul0, 684, 50, picCopy)
	    end if
	    %this acts as both the delay and the sound effect
	    Music.Sound (1600, 300)
	    Music.SoundOff
	end if
    end loop
end main

%procedure for if the cavs win
body proc cavsWin
    %clears screen, draws black background, posts score and fouls
    cls
    GUI.SetBackgroundColor (black)
    Music.PlayFileLoop ("crowdcheer.mp3")
    Pic.Draw (cavsLogo, 300, 340, picCopy)
    Font.Draw ("The                Win!", 180, 350, font1, white)
    Font.Draw ("Points: ", 180, 250, font1, white)
    Font.Draw ("Fouls: ", 180, 150, font1, white)
    Font.Draw (intstr (score1), 360, 250, font1, white)
    Font.Draw (intstr (fouls1), 360, 150, font1, white)
    %resets scores and fouls
    fouls1 := 0
    score1 := 0
    fouls2 := 0
    score2 := 0
    Font.Draw ("New Scoreboard", 210, 50, font1, white)
    drawbox (205, 45, 635, 95, white)
    loop
	mousewhere (x, y, button)
	if x >= 205 and x <= 635 and y >= 45 and y <= 95 and button = 1 then
	    Music.PlayFileStop
	    main
	    exit
	end if
    end loop
end cavsWin

%procedure for if the raps win
body proc rapsWin
    %clears screen, draws black background, posts score and fouls
    cls
    GUI.SetBackgroundColor (black)
    Music.PlayFileLoop ("crowdcheer.mp3")
    Pic.Draw (rapsLogo, 330, 340, picCopy)
    Font.Draw ("The                Win!", 180, 350, font1, white)
    Font.Draw ("Points: ", 180, 250, font1, white)
    Font.Draw ("Fouls: ", 180, 150, font1, white)
    Font.Draw (intstr (score2), 360, 250, font1, white)
    Font.Draw (intstr (fouls2), 360, 150, font1, white)
    %resets scores and fouls
    fouls1 := 0
    score1 := 0
    fouls2 := 0
    score2 := 0
    Font.Draw ("New Scoreboard", 210, 50, font1, white)
    drawbox (205, 45, 635, 95, white)
    loop
	mousewhere (x, y, button)
	if x >= 205 and x <= 635 and y >= 45 and y <= 95 and button = 1 then
	    Music.PlayFileStop
	    main
	    exit
	end if
    end loop
end rapsWin

main
