program Project2;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

Type
  pt = ^elem;
  Elem = record
    Number: integer;
    Num: byte;
    Name: string[20];
    Surname: string[20];
    Otch: string[20];
    Next: pt;
  end;

procedure FindNumber(Var Temp: pt);
Var
  I, J, K: integer;
  PerNumber: integer;
  Flag: Boolean;
  Nobody: Boolean;
begin
  Nobody := True;
  write('������� �����: ');
  readln(PerNumber);
  while temp <> nil do
  begin
    if temp^.number = PerNumber then
    begin
      Nobody := False;
      writeln('������ ��������: ');
      writeln(' _______________________________________________________');
      writeln('| � |    �������    |      ���      |      ��������     |');
      writeln('|___|_______________|_______________|___________________|');
      Flag := True;
      Repeat
        if Flag = True then
        begin
          Temp^.name := ' ' + Temp^.Name;
          Flag := False;
        end
        else
        begin
          Temp^.name := Temp^.Name + ' ';
          Flag := True;
        end;
      Until Length(Temp^.Name) >= 15;

      Flag := True;
      Repeat
        if Flag = True then
        begin
          Temp^.Surname := ' ' + Temp^.SurName;
          Flag := False;
        end
        else
        begin
          Temp^.Surname := Temp^.SurName + ' ';
          Flag := True;
        end;
      Until Length(Temp^.SurName) >= 15;

      Flag := True;
      Repeat
        if Flag then
        begin
          Temp^.Otch := ' ' + Temp^.Otch;
          Flag := False;
        end
        else
        begin
          Temp^.Otch := Temp^.Otch + ' ';
          Flag := True;
        end;
      Until Length(Temp^.Otch) >= 19;

      writeln('| ', temp^.Num, ' |', temp^.Surname, '|',Temp^.Name,'|',Temp^.Otch,'|');
      writeln('|___|_______________|_______________|___________________|');
    end;

    Temp := Temp^.next;
  end;

  if Nobody then
      writeln('���������� �������� ��� � ������!');

end;

procedure FindSurname(Var Temp: pt);
Var
  I, J, K: integer;
  PersSurName: string[20];
  Flag: Boolean;
  Nobody: Boolean;
Begin
  Nobody := True;
  write('������� �������: ');
  readln(PersSurName);
  While Temp <> Nil do
  begin
    if Temp^.Surname = PersSurname then
    begin
      Nobody := False;
      writeln('������ ��������: ');
      writeln(' _____________________________________________________');
      writeln('| � |    �����    |      ���      |      ��������     |');
      writeln('|___|_____________|_______________|___________________|');


      Flag := True;
      Repeat
        if Flag then
        begin
          Temp^.name := ' ' + Temp^.Name;
          Flag := False;
        end
        else
        begin
          Temp^.name := Temp^.Name + ' ';
          Flag := True;
        end;
      Until Length(Temp^.Name) >= 15;

      Flag := True;
      Repeat
        if Flag then
        begin
          Temp^.Otch := ' ' + Temp^.Otch;
          Flag := False;
        end
        else
        begin
          Temp^.Otch := Temp^.Otch + ' ';
          Flag := True;
        end;
      Until Length(Temp^.Otch) >= 19;

      writeln('| ', temp^.Num, ' |   ', temp^.Number, '   |',Temp^.Name,'|',Temp^.Otch ,'|');
      writeln('|___|_____________|_______________|___________________|');
    end;

    temp := Temp^.next;
  end;
  if Nobody then
      writeln('���������� �������� ��� � ������!');
End;


Var
  i, n: integer;
  first, tmp: pt;
  Variant: Byte;

begin
  write('���������� �������, ������� ������ ������: ');
  readln(n);
  New(Tmp);

  for i := 1 to N do
  begin
    if I = 1 then
      first := tmp;

    write(i, '. ������� �������: ');
    readln(tmp^.surname);
    write('   ������� ���: ');
    readln(tmp^.name);
    write('   ������� ��������: ');
    readln(tmp^.otch);
    write('   ������� �����: ');
    readln(tmp^.number);


    while (tmp^.number < 1000000) or (tmp^.number > 9999999) do
    begin
      writeln('   ����� ������ �����������! ����� ������ ��������� 7 ����!');
      write('   ������� �����: ');
      readln(tmp^.number);
    end;

    tmp^.num := i;

    if i <> n then
    begin
      New(Tmp^.next);
      tmp := tmp^.next;
    end
    else
      tmp^.next := nil;
  end;

  Repeat
    tmp := first;
    Write('����������� �� ������(1) ��� �� �������(2): ');
    readln(Variant);
    Case Variant of
      1: FindNumber(tmp);
      2: FindSurName(tmp);
    End;
  Until Variant = 2;


  readln;
End.
