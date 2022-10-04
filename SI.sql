use SFCIB


--create procedure NBar
--@NE nvarchar (4),
--@PNE nvarchar(15),
--@SNE nvarchar(15),
--@PAE nvarchar(15),
--@SAE nvarchar(15),
--@DE nvarchar(70),
--@IDM int,
--@TE char(8),
--@IDB int
--as declare @nume as char(4)
--set @nume =(select NEmp from Empleados where NEmp=@NE)
--declare @idmun as int
--set @idmun =(select Id_Mun from Municipios where Id_Mun=@IDM)
--declare @pd as char(1)
--set @nume =(select substring(@TE,1,1))
--declare @idbar as int
--set @idbar =(select Id_Bar from Bar where Id_Bar=@IDB)
--declare @Pa as char(1)
--set @idbar 
--begin 













-- Procedimiento de insercion para contacto
-- Crear las tablas Dev_CB con su correspondiente detalle_DCB
-- DevBP con su correspondiente det_DBP
-- Recordar que la Dev_CB esta sujeta a la venta
-- Recordar que la Dev_BP esta sujeta a la compra
-- en las devoluciones se considera al empleado.

CREATE PROCEDURE NSContactos
@PNCont nvarchar(15),
@SNCont nvarchar(15),
@PACont nvarchar(15),
@SACont nvarchar(15),
@DirCont nvarchar(15),
@IDM int,
@IDP int,
@TelCont char(8),
@IDC int
as
declare @idContc as int
set @idContc=(select Id_Contacto from Contactos where Id_Contacto=@IDC)
declare @idmun as float
set @idmun =(select Id_Mun from Municipios where Id_Mun = @IDM)
declare @idProv as float
set @idProv =(select Id_Prov from Proveedor where Id_Prov = @IDP)
if(@IDC=@idContc)
begin 
 if(@PNCont='' or @PACont='' or @DirCont ='' or @Telcont='' )
begin
print 'No puede ser nulo'
end 
else
begin
  if(@IDM = @idmun and @IDP = @idProv)
  begin 
   insert into Contactos values(@PNCont,@SNCont,@PACont,@SACont,@DirCont,@IDM,@TelCont,@IDP)
   print 'se realizo exitosamente'
  end
  else
  print 'No se logro registrar'
end
end


NSContactos 'Juan','Jose','Gomez','Arauz','Lago de managua',1,'82818027',1,1

select*from Contactos

Create table Dev_CB(

Id_DevCB int Primary key  not null,
NProd nvarchar(15) not null,
DirCliente nvarchar(70) not null,
TelEmp char(8) check(TelEmp like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
NEmp char(4) foreign key references Empleados(NEmp) not null,
Id_Venta int foreign key references Ventas(Id_Venta) not null

)
Create table Dev_BP(

Id_DevCB int Primary key  not null,
NProd nvarchar(15) not null,
DirCliente nvarchar(70) not null,
TelEmp char(8) check(TelEmp like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
NEmp char(4) foreign key references Empleados(NEmp) not null,
Id_Compras char(5) foreign key references Compras(Id_Compras) not null

)





--create table Empleados(
--	NEmp char(4) primary key not null,
--	PNEmp nvarchar(15) not null,
--	SNEmp nvarchar(15),
--	PAEmp nvarchar(15) not null,
--	SAEmp nvarchar(15),
--	DirEmp nvarchar(70) not null,
--	Id_Mun int foreign key references Municipios(Id_Mun) not null,
--	TelEmp char(8) check(TelEmp like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
--)

--alter table Empleados add Id_Bar int not null

--alter table Empleados add constraint fk_BE foreign key(Id_Bar) references Bar(Id_Bar)



select * from Municipios
































