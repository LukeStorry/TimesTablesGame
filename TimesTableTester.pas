//Written By Luke Storry

program TT2withexit;

Uses SysUtils, Crt;

var
  score , i , n , correctAnswer , max , myAnswer : Integer;
                             startTime , endTime : Comp;   //larger that Int
                                          replay : char;

function CheckInput : Integer;
     var input : String;
             j : Integer;
         isINT : Boolean;
     begin
        Repeat
            Readln(input);
            if input = 'stop' then n:=i;
            isInt := True;   //if char is a number
            j:=0;
            Repeat       //check every character in string
                j+=1;    //iterate length counter
                Write(' ' , Ord(input[j]));
                if (Ord(input[j])<48) or (Ord(input[j])>57) OR not(n=i)
                   then begin    //if char isn't a number
                          Write('That is not an integer, Please try again:  ');
                          isINT := False;
                        end;
            Until (j > Length(input+1)) OR (isINT = False) OR (n=i);
        Until (isINT = True) OR (n=i);  //ends loop when input is an Integer
        If n=i then Result := 0
               else Result := StrToInt(input) //output.
     end;   //of CheckInput function


function GenerateQuestion(max:integer) : String;      //var correctAnswer:integer
         var a , b : Integer;
   begin
     Randomize;                    //initialize the random generator
      a := Random(max-1)+1;        //generates a random number between 1 and max
      b := Random(max-1)+1;
      correctAnswer := a*b;
     Result := 'What is ' + IntToStr(a) + ' times ' + IntToStr(b) + '?    ';
   end;                            //of generate Q function




function CheckAnswer (myAnswer , correctAnswer :integer) : String;
   begin
     if myAnswer = correctAnswer  //checks input against previously stored correct answer
      then begin
                Score+=1;
                Result := 'That is correct! ';
           end
      else Result := 'That is not correct, it is ' + IntToStr(correctAnswer);
   end;   //of checkanswer function


 begin  //main program
  Writeln('Times Table Tester.');
  Writeln('Written By Luke Storry.');  Writeln;
  Writeln('This program will ask you multiplication questions.');

  Repeat
      Writeln; Writeln;
      score:=0;  //initializes the score variable
      Write('How many questions would you like?  ');
      n:=CheckInput; Writeln; Writeln;
      Write('What number should be the highest you are asked to multiply?  ');
      max:=CheckInput; Writeln; Writeln;

      Write('The Timer Starts in ');
      Write('.'); Delay(200); Write('.'); Delay(200); Write('.'); Delay(200);
      Write(' 3 ');
      Write('.'); Delay(200); Write('.'); Delay(200); Write('.'); Delay(200);
      Write(' 2 ');
      Write('.'); Delay(200); Write('.'); Delay(200); Write('.'); Delay(200);
      Write(' 1 ');
      Write('.'); Delay(200); Write('.'); Delay(200); Write('.'); Delay(200);
      Writeln(' GO!'); Writeln;

      startTime:=TimeStampToMSecs(DateTimeToTimeStamp(now)); //milliseconds since 2000

      for i:=1 to n do
        begin
           Writeln('Question ' , i , ':  ');
           Write(GenerateQuestion(max));
             myAnswer := CheckInput;
           Writeln(CheckAnswer( myAnswer , correctAnswer ));
           Writeln;
        end;  //of for loop

      endTime:=TimeStampToMSecs(DateTimeToTimeStamp(now)); //milliseconds since 2000

      Write('You got ' , score , ' points of out of ' , n , ',');
      Writeln('in '  ,  (endTime-startTime)/1000:4:2 , ' seconds.'); //gives time difference
      Delay(2000); Writeln; Writeln;
      Write('Would you like to play again?  (y/n)    ');
      Readln(replay)

  until (replay = 'n');


  Writeln('Thankyou for playing. :)');
  Readln;

end.
