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
  Write('������� �����, �� ������� ����� �������� �������: ');
  Readln(K);
  for J := 1 to 64 do
  begin
    first := nil; // ��������� ����������
    cur := nil;
    s := '';
    for i := 1 to J do // �������� ������ � ����������
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
    cur^.next := first; // ������������ ������
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
      dispose(temp);// �������� ��������
    end;

    writeln('����������: ', J:2,'. �������: ', cur^.number:2, '. ���������: ', s);
  end;
  readln;
end.
