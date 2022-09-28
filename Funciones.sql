--1.- Calcular el subtcom de la tabla Det_Compras

--2.- Actualizar inventario por compras

--3.- Calcular totatlc de Compras

--4.- Actualizar precio del 
--    producto si el precio de
--    compra es mayor o igual
--    al precio del producto

--1)



CREATE PROCEDURE NSCompras
@cantc int,
@precioc float,
@IDC int
as
declare @idcompra as int
set @idcompra=(select Id_Compras from Compras where Id_Compras=@IDC)
declare @stc as float
set @stc =(select precioc * @cantc from Det_Compras where Id_Compras=@idcompra)
if(@IDC=@idcompra)
begin 
 if(@cantc > 0 or @precioc > 0)
 begin
  update Det_Compras  set subtcom=@stc where Id_Compras=@IDC
 end
end
else	
begin
print 'Compra no encontrada'
end

--2 : 4) 


Create trigger AcInvComPrec
on Det_Compras
after insert
as
  update Productos set existp=existp + (select cantc from inserted)  from Productos p, Det_Compras dc
  where p.CodProd=dc.CodProd
  update productos set preciop = (select precioc from inserted) / 0.90 from Productos p, Det_Compras dc
  where p.CodProd=dc.CodProd and p.preciop <= dc.precioc

--3)




Create Function CTComp (@subtcom float, @totalc float)
returns float
as
begin
   declare @TOTAL as float
  SELECT @TOTAL = SUM(subtcom) * 0.15
  FROM Det_compras where cantc > 0 and subtcom > 0 
   return @TOTAL
end













































