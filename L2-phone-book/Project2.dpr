program Project2;

{$APPTYPE CONSOLE}

Uses
  System.SysUtils;

Type
  pt = ^elem;
  Elem = record
    Data: integer;
    Name: string[9];
    Num: byte;
    Next: pt;
    Prev: pt;
  end;

  pt1 = ^elem1;
  Elem1 = record
    Number: integer;
    Num: byte;
    Name1: string[9];
    Next: pt1;
  end;

Var
  i, n, l, j, NumThree: integer;
  first, tmp: pt;
  first1, tmp1: pt1;
  s: string;

begin
  write('Количество номеров, которое хотите ввести: ');
  readln(n);
  //n := 3;
  New(first);
  First^.prev := nil;
  for i := 1 to N do
  begin
    tmp := first;
    write(i,'. Введите имя: ');
    readln(tmp^.name);
   // tmp^.name := 'Илья';
    write('   Введите номер: ');
    readln(tmp^.data);
    //tmp^.data := 1342542;

    while ((tmp^.data < 100) or (tmp^.data > 999)) and ((tmp^.data < 1000000) or (tmp^.data > 9999999)) do
    begin
      writeln('   Номер введен непарвильно! Номер может содержать 3 или 7 цифр!');
      write('   Введите номер: ');
      readln(tmp^.data);
    end;

    tmp^.num := i;

    if i <> n then
    begin
      New(first);
      tmp^.next := first;
      first^.prev := tmp;
    end
    else
      tmp^.next := nil;
  end;

  writeln('_______________________');
  writeln;
  writeln('Список номеров, записанный справа налево: ');
  writeln(' _____________________________');
  writeln('| № |    Имя     |   Номер    |');
  writeln('|___|____________|____________| ');

  NumThree := 0;
  New(tmp1);
  For I := n downto 1 do
  begin
    s := '         ';
    if first^.data >= 1000000 then
    begin
      tmp1^.number := first^.data;
      tmp1^.name1 := first^.name;
      tmp1^.num := i;
      if I = N then
        First1 := tmp1;
      if i > 1 then
      begin
        New(tmp1^.next);
        tmp1 := tmp1^.next;
      end
      else
      tmp1^.next := nil;
    end
    else
      inc(NumThree);

    l := length(first^.name);
    for j := 1 to l do
      delete(s, 1, 1);
    writeln('| ', i,' |', first^.name:9,'   |', first^.data:9,'   |');
    tmp := first;
    first := first^.prev;

  end;
  writeln('|___|____________|____________| ');

  writeln;
  writeln('Список номеров людей: ');
  writeln(' _____________________________');
  writeln('| № |    Имя     |   Номер    |');
  writeln('|___|____________|____________| ');

  i := 1;
  tmp1 := first1;
  while tmp1 <> nil do
  begin
    writeln('| ', tmp1^.num,' |', tmp1^.name1:9,'   |', tmp1^.number:9,'   |');

    tmp1 := tmp1^.next;
    inc(i);
  end;
  writeln('|___|____________|____________| ');

  writeln;
  writeln('Количество номеров спецслужб: ', NumThree);

  readln;
end.
