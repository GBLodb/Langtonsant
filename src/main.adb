with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
   type Direction is (Up, Down, Left, Right);
   type Matrix is array (Integer range<>, Integer range<>) of Boolean;
   Map: Matrix(0..40, 0..40) := (others => (others => False));

   procedure Run (X, Y: in out Integer; D: in out Direction) is
   begin
      Map(X, Y) := not Map(X, Y);
      case D is
         when Left =>
            D := (if Map(X, Y) then Up else Down);
            X := X + (if Map(X, Y) then -1 else 1);
         when Right =>
            D := (if Map(X, Y) then Down else Up);
            X := X + (if Map(X, Y) then 1 else -1);
         when Up =>
            D := (if Map(X, Y) then Right else Left);
            Y := Y + (if Map(X, Y) then 1 else -1);
         when Down =>
            D := (if Map(X, Y) then Left else Right);
            Y := Y + (if Map(X, Y) then -1 else 1);
      end case;
   end Run;

   procedure Result (M: in Matrix) is
   begin
      for X in M'Range(1) loop
         for Y in M'Range(2) loop
            Put((if M(X, Y) = True then "*" else " "));
         end loop;
         New_Line;
      end loop;
   end Result;

      X, Y : Integer;
      D : Direction;

   begin
      X := 19;
      Y := 19;
      D := Up;

      loop
         Result(Map);
         Run(X, Y, D);
         delay 0.05;
      end loop;

end Main;
