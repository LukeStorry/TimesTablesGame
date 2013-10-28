//Written By Luke Storry

program TimesTablesTester;
Uses SysUtils, Crt;
var
  score , i , correctAnswer , max , myAnswer : Integer;
                         startTime , endTime : Comp; //larger that Int

 function GenerateQuestion(max:integer) : String;      //var correctAnswer:integer
         var a , b : Integer;
   begin
     Randomize; //initialize the random generator
      a := Random(max-1)+1;     //generates a random number between 1 and max
      b := Random(max-1)+1;
      correctAnswer := a*b;    //I DONT LIKE THIS! globals :(
     Result := 'What is ' + IntToStr(a) + ' times ' + IntToStr(b) + '?    ';
   end; //of generate Q function

function CheckAnswer (myAnswer , correctAnswer :integer) : String;
   begin
     if myAnswer = correctAnswer //checks input against previously stored correct answer
      then begin
                Score+=1; //again, i dislike using a global variable within a function?
                Result := 'That is correct! ';
           end
      else Result := 'That is not correct, it is ' + IntToStr(correctAnswer);
   end; //of checkanswer function

 begin    //main program
  Writeln('Times Table Tester.');
  Writeln('Written By Luke Storry.');  Writeln;
  Writeln('This program will ask you 10 multiplication questions.');
  Writeln; Writeln;

  score:=0; //initializes the score variable

  Write('What number should be the highest you are asked to multiply?  ');
   Readln(max);
  Writeln; Writeln;

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
         Readln(myAnswer);
       Writeln(CheckAnswer( myAnswer , correctAnswer ));
       Writeln;
    end;  //of for loop

  endTime:=TimeStampToMSecs(DateTimeToTimeStamp(now)); //milliseconds since 2000

  Write('You got ' , score , ' points of out 10,');
  Writeln('in '  ,  (endTime-startTime)/1000:4:2 , ' seconds.'); //gives time difference
 Readln;

end.
