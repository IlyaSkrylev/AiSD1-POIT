program Project2;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

Type
  ptr = ^Stack;
  Stack = record
    SPrior: shortInt;
    Str: char;
    prev: ptr;
  end;

Var
  tmp, first: ptr;
  S: string;
  StPrior, OtnPrior: ShortInt;
  Rang: integer;
  Flag: boolean;

begin
  write('Введите выражение в инфиксном представлении: ');
  readln(s);
  s := '(' + s + ')';
  write('Введенное выражение в обратной польской записи: ');
  New(Tmp);
  Tmp := nil;
  Rang := 0;
  Repeat
    case s[1] of
      '+','-': OtnPrior := 1;
      '*','/': OtnPrior := 3;
      '^': OtnPrior := 6;
      'A'..'Z','a'..'z': OtnPrior := 7;
      '(': OtnPrior := 9;
      ')': OtnPrior := 0;
    end;

    if tmp <> nil then
      case tmp^.str of
        '+','-': tmp^.SPrior := 2;
        '*','/': tmp^.SPrior := 4;
        '^': tmp^.SPrior := 5;
        'A'..'Z','a'..'z': tmp^.SPrior := 8;
        '(': tmp^.SPrior := 0;
        ')': tmp^.SPrior := -1;
      end;

    Flag := True;
    while flag do
    begin
      If (Tmp <> nil) and (OtnPrior <= tmp^.SPrior) then
      begin
        if (Tmp^.str <> '(') then
        begin
          write(Tmp^.str);
          if Tmp^.Str <> ')' then
          begin
            if (tmp^.Sprior < 8) then
              Rang := Rang - 1
            else
              Rang := Rang + 1;
          end;
        end
        else
          flag := false;
        Tmp := Tmp^.Prev;

      end
      else
      begin
        First := tmp;
        New(tmp);
        Tmp^.prev := first;
        tmp^.str := s[1];
        Flag := False;
      end;
    end;
    delete(s,1,1);
  Until Length(S) = 0;
  writeln;
  write('Ранг полученного выражения: ', Rang);

  while Tmp <> nil do
  begin
    cur := Tmp;
    Tmp := Tmp^.Prev;
    Dispose(cur);
  end;
  readln;
end.
