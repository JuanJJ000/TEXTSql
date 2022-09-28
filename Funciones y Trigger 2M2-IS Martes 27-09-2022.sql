create database SFCIB

restore database SFCIB from disk='D:\SFCIB.bak'
with replace

use SFCIB

select * from Deptos
select * from Municipios
select * from Proveedor
select * from Productos
select * from Clientes
select * from Facultad

insert into Municipios values('Managua',1)

insert into Facultad values('01','FTC','Pepito',
'1995-02-01')

insert into Facultad values('02','FTI','Juanito',
'1995-02-01')

insert into Facultad values('03','FCyS','Claudia Benavidez',
'1997-02-01')

create procedure NCliente
@IDC char(5),
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@DC nvarchar(75),
@IDM int,
@TC char(8),
@IDF char(3)
as
declare @idcl as char(5)
set @idcl=(select Id_Cliente from Clientes
where Id_Cliente=@IDC)
declare @idmun as int
set @idmun=(select Id_Mun from Municipios
where Id_Mun=@IDM)
declare @pdt as char(1)
set @pdt=(select substring(@TC,1,1))
declare @idfac as char(3)
set @idfac=(select Id_Facultad from Facultad
where Id_Facultad=@IDF)
if(@idcl=@IDC)
begin
  print 'Cliente ya registrado'
end
else
begin
  if(@IDC='' or @PNC='' or @PAC='' or @DC='' or @IDF='')
  begin
    print 'No pueden ser nulos'
  end
  else
  begin
    if(@idmun=@IDM)
	begin
	  if(@pdt='2' or @pdt='5' or @pdt='7' or @pdt='8')
	  begin
	    if(@idfac=@IDF)
        begin
		  insert into Clientes values(@IDC,
		  @PNC,@SNC,@PAC,@SAC,@DC,@IDM,@TC,
		  1,@IDF)
		end
		else
		begin
		  print 'Facultad no registrada'
		end
	  end
	  else
	  begin
	    print 'Debe iniciar con 2,5,7 u 8'
	  end
	end
	else
	begin
	  print 'Municipio no registrado'
	end
  end

end

NCliente '01','Evelyn','','Espinoza',
'Aragon','Managua',1,'22496429','03'


NCliente '02','Angel','','Zuniga',
'Espinoza','Managua',8,'52496429','02'

select * from Clientes

create procedure NVenta
@IDC char(5)
as
declare @idcl as char(5)
set @idcl=(select Id_Cliente from
Clientes where Id_Cliente=@IDC)
if(@idcl=@IDC)
begin
  if(@IDC='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    insert into Ventas values(getdate(),
    @IDC,0)
  end
end
else
begin
  print 'Cliente no registrado'
end

NVenta '01'

select * from Ventas

create function CSTP(@CodProd char(5),@cv int)
returns float
as
begin
   declare @stp as float
   select @stp=preciop * @cv from
   Productos where CodProd=@CodProd
   return @stp
end

create trigger ActInvV
on Det_Ventas
after insert
as
  update Productos set existp=existp -
  (select cantv from inserted)
  from Productos p, Det_Ventas dv
  where p.CodProd=dv.CodProd

create procedure NDV
@IDV int,
@CP char(5),
@cv int
as
declare @idventa int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
declare @codp as char(5)
set @codp=(select CodProd from Productos where CodProd=@CP)
declare @exp as int
set @exp=(select existp from Productos where CodProd=@CP)
if(@idventa=@IDV)
begin
  if(@CP='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    if(@CP=@codp)
	begin
	  if(@cv<=@exp)
	  begin
	    insert into Det_Ventas values(@IDV,@CP,@cv,dbo.CSTP(@CP,@cv))
	  end
	  else
	  begin
	    print 'Inventario insuficiente'
	  end
	end
	else
	begin
	  print 'Producto no registrado'
	end
  end
end
else
begin
  print 'Venta no registrada'
end


select * from Productos

NDV 1,'03',10

select * from Det_Ventas

NDV 1,'01',5

select * from Ventas

create procedure ActV
@IDV int
as
declare @idventa as int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
declare @stv as float
set @stv=(select sum(subtp) from Det_Ventas where Id_Venta=@IDV)
if(@IDV=@idventa)
begin
  update Ventas set TotalV=@stv where Id_Venta=@IDV

end
else
begin
 print 'Venta no encontrada'
end

ActV 1


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




Create trigger AcInvComPrec
on Det_Compras
after insert
as
  update Productos set existp=existp + (select cantc from inserted)  from Productos p, Det_Compras dc
  where p.CodProd=dc.CodProd
  update productos set preciop = (select precioc from inserted) / 0.90 from Productos p, Det_Compras dc
  where p.CodProd=dc.CodProd and p.preciop <= dc.precioc


  
Create Function CTComp (@subtcom float, @totalc float)
returns float
as
begin
   declare @TOTAL as float
  SELECT @TOTAL = SUM(subtcom) * 0.15
  FROM Det_compras where cantc > 0 and subtcom > 0 
   return @TOTAL
end

 
backup database SFCIB to disk='D:\SFCIB.bak'