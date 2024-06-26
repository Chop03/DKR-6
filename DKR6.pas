﻿program ProgrammaDeque;

const
  MAX_SIZE = 5;

type
  TDeque = record
    data: array [1..MAX_SIZE] of Integer;
    front, rear: Integer;
  end;

// процедура инициализации дека. Устанавливает front и rear в 0.
procedure Initialize(var deque: TDeque);
begin
  deque.front := 0;
  deque.rear := 0;
end;

//функция, проверяющая, пуст ли дек. Корооче если front и rear = 0, то дек пуст и ура победа.
function IsEmpty(deque: TDeque): Boolean;
begin
  IsEmpty := (deque.front = 0) and (deque.rear = 0);
end;

//функция, проверяющая, полон ли дек. Короче если следующий индекс после rear равен front, то дек полон и ура победа
function IsFull(deque: TDeque): Boolean;
begin
  IsFull := (deque.rear mod MAX_SIZE) + 1 = deque.front;
end;

//процедурка добавляет элемент в начало дека.
procedure EnqueueFront(var deque: TDeque; value: Integer);
begin
  if IsFull(deque) then
    writeln('Дек полон')
  else begin
    if deque.front = 0 then
      deque.front := 1;
    deque.front := ((deque.front - 2 + MAX_SIZE) mod MAX_SIZE) + 1;
    deque.data[deque.front] := value;
  end;
end;

// процедурака добавляет элемент в конец дека.
procedure EnqueueRear(var deque: TDeque; value: Integer);
begin
  if IsFull(deque) then
    writeln('Дек полон')
  else begin
    deque.rear := ((deque.rear mod MAX_SIZE) + 2) - 1;
    deque.data[deque.rear] := value;
  end;
end;

//функция удаления элемента из начала дека.
function DequeueFront(var deque: TDeque): Integer;
var
  value: Integer;
begin
  if IsEmpty(deque) then begin
    writeln('Дек пуст');
    DequeueFront := -1;
  end
  else begin
    value := deque.data[deque.front];
    if deque.front = deque.rear then
      Initialize(deque)
    else
      deque.front := ((deque.front mod MAX_SIZE) + 2) - 1;
    DequeueFront := value;
  end;
end;

//функция удаления элемента из конца дека.
function DequeueRear(var deque: TDeque): Integer;
var
  value: Integer;
begin
  if IsEmpty(deque) then begin
    writeln('Дек пуст');
    DequeueRear := -1;
  end
  else begin
    value := deque.data[deque.rear];
    if deque.front = deque.rear then
      Initialize(deque)
    else
      deque.rear := ((deque.rear - 2 + MAX_SIZE) mod MAX_SIZE) + 1;
    DequeueRear := value;
  end;
end;

//процедура отображения содержимого дека.
procedure DisplayDeque(deque: TDeque);
var
  i, index: Integer;
begin
  if IsEmpty(deque) then
    writeln('Дек пуст')
  else begin
    index := deque.front;
    while index <> ((deque.rear mod MAX_SIZE) + 1) do begin
      write(deque.data[index], ' ');
      index := ((index mod MAX_SIZE) + 2) - 1;
    end;
    writeln;
  end;
end;

var
  deque: TDeque;
  vibor, value: Integer;

begin
  Initialize(deque);

  repeat
    writeln('1 - Добавить значение в начало');
    writeln('2 - Удалить значение из начала');
    writeln('3 - Добавить значение в конец');
    writeln('4 - Удалить значение из конца');
    writeln('5 - Показать содержимое дека');
    writeln('0 - Выход');
    write('Введите ваш выбор: ');
    readln(vibor);

    case vibor of
      1: begin
        write('Введите значение для добавления в начало: ');
        readln(value);
        EnqueueFront(deque, value);
      end;
      3: begin
        write('Введите значение для добавления в конец: ');
        readln(value);
        EnqueueRear(deque, value);
      end;
      2: writeln('Удаленное значение из начала: ', DequeueFront(deque));
      4: writeln('Удаленное значение из конца: ', DequeueRear(deque));
      5: DisplayDeque(deque);
      0: writeln('Завершение программы');
      else writeln('Неверный выбор');
    end;

    writeln;
  until vibor = 0;

end.