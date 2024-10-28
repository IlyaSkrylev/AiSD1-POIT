program schitalochka;

Uses
  System.SysUtils;

type
  pt = ^elem;
  elem = record
    Number: integer;
    next: pt;
  end;

var
  first, cur, temp: pt;
  i, j, K: integer;
  s : String;

begin
  Write('Введите число, на которое будет выбывать человек: ');
  Readln(K);
  for J := 1 to 64 do
  begin
    first := nil; // Обнуление указателей
    cur := nil;
    s := '';
    for i := 1 to J do // Создание списка и заполнение
    begin
      if first = nil then
      begin
        new(first);
        first^.number := i;
        first^.next := nil;
        cur := first;
      end
      else
      begin
        new(temp);
        temp^.number := i;
        temp^.next := nil;
        cur^.next := temp;
        cur := cur^.next;
      end;
    end;
    cur^.next := first; // Зацикливание списка
    cur := first;
    while cur^.next <> cur do
    begin
      for i := 2 to K - 1 do
        cur := cur^.next;
      temp := cur^.next;
      if Length(s) = 0 then
        s := s + IntToStr(cur^.next^.number)
      else
        s := s + ', ' + IntToStr(cur^.next^.number);
      cur^.next := temp^.next;
      cur := cur^.next;
      dispose(temp);// удаление элемента
    end;

    writeln('Участников: ', J:2,'. Победил: ', cur^.number:2, '. Проиграли: ', s);
  end;
  readln;
end.
