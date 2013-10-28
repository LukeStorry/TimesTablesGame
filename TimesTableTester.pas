//Written By Luke Storry

program TimesTableTester;

Uses SysUtils, Crt;

var
  score , i , correctAnswer , max , myAnswer : Integer;
                         startTime , endTime : Comp;   //larger that Int
                                      replay : char;

function CheckInput : Integer;

     var
         input : String;
             i : Integer;
         isINT : Boolean;

     begin
        Repeat
            Readln(input);
            for i:=1 to Length(input) do  //check every charachter in string
                begin
                  if (Ord(input[i])<48) or (Ord(input[i])>57)
                     then     //if char isn't a number
                        begin
                          Write('That is not an integer, Please try again:  ');
                          isINT := False;
                        end
                     else isInt := True   //if char is a number
                end;  //of for loop
        until isINT = True;  //ends loop when input is an Integer
        Result := StrToInt(input) //output.
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
  Writeln('This program will ask you 10 multiplication questions.');

  Repeat
      Writeln; Writeln;
      score:=0;  //initializes the score variable
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

      for i:=1 to 10 do
        begin
           Writeln('Question ' , i , ':  ');
           Write(GenerateQuestion(max));
             myAnswer := CheckInput;
           Writeln(CheckAnswer( myAnswer , correctAnswer ));
           Writeln;
        end;  //of for loop

      endTime:=TimeStampToMSecs(DateTimeToTimeStamp(now)); //milliseconds since 2000

      Write('You got ' , score , ' points of out 10, ');
      Writeln('in '  ,  (endTime-startTime)/1000:4:2 , ' seconds.'); //gives time difference
      Delay(2000); Writeln; Writeln;
      Write('Would you like to play again?  (y/n)    ');
      Readln(replay)

  until replay = 'n' ;


  Writeln('Thankyou for playing. :)');
  Readln;

end.
