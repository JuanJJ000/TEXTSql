select count (CodProd) as CantReg,
sum (existp) as CantP, avg (preciop) as PrecioProm, 
min (preciop) as PrecioMax, var (preciop) as VarianzaP,
stdev (precioP) as DevEP from Productos

Create view FAgregadas as

select  count (CodProd) as CantReg,
sum (existp) as CantP, avg (preciop) as PrecioProm, 
min (preciop) as PrecioMax, var (preciop) as VarianzaP,
stdev (precioP) as DevEP from Productos

select * from FAgregadas

-- Funciones Standard del Sistema
-- 1.- Fecha/Hora 
-- 1.1.- getdate() : Retorna la fecha y la hora del sistema
select GETDATE () as FechaHoraActual

--1.2.- Year(): Retornar el a�o de una fech
select year(getdate()) as A�oActual,
year('19710619') as MiA�oNac

--1.3.- Month(): Retorna el mes de una fecha select month()
select month(getdate()) as MesActual,
month('19710619') as MiMesNac


--1.4.- Month(): Retorna el mes de una fecha select month()
select day(getdate()) as DiaActual,
day ('19710619') as MidiaNac
  

--1.5.- datediff(): Diferenciar fechas
select DATEDIFF(YEAR,'19710619',getdate()) as
edadA, DATEDIFF(month,'19710619',getdate()) as
edadM, DATEDIFF(week,'19710619',getdate()) as
edadS, DATEDIFF(day,'19710619',getdate()) as
edadD, DATEDIFF(hour,'19710619',getdate()) as EdadH

--1.6.- dateadd(): Sumar fechas

select dateadd(YEAR,'19710619',getdate()) as
edadA, dateadd(month,'19710619',getdate()) as
edadM, dateadd(week,'19710619',getdate()) as
edadS, dateadd(day,'19710619',getdate()) as
edadD, dateadd(hour,'19710619',getdate()) as EdadH

--1.7.- datename()
SELECT DATENAME(year, getdate()) as A�oActual 
    ,DATENAME(month, getdate()) as mesactual 
    ,DATENAME(day, getdate()) as diactual 
    ,DATENAME(dayofyear, getdate()) as diadela�o 
    ,DATENAME(weekday, getdate()) as diasem

--1.8.- datepart()

select datepart(year,getdate()) as A�oActual

--2.- Cadena
--2.1-- len(): devuelve la longitud de una cadena

select len(NombreProd) as LNP from Productos

--2.2.- Char(): Devuelve el caracter a partir de su codigo ascii
select char(61) as Caract

--2.3.- Ascii(): Devuelve el codigo asccii de un caracter
select ascii ('�') as ValorA

--2.4.- Lower(): Tramsforma una cadena a minuscula
select lower ('ASH KETCHUM') as Minun

--2.5.- Upper(): Tramsforma una cadena a Mayuscu�a
select upper ('ASH KETCHUM') as Plusle

--2.6.- Substringt(): Abstraer una subcadena de una cadena
select substring ('001-190671-0011Y',5,6) as FechaNac

--2.7.- Charindex(): Coincidencia a partir de un indice
DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bicycle', @document) as indice

--2.8.- Concat(): Concatenar cadenas
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result

--2.9.- reverse(): revierte una cadena
SELECT reverse ( 'Angel' ) AS NombreInvertido;

--2.10.- Ledt() valores a partir de una posicion izquierda
select left ('Msc. en computacion',8) as ParteIzq

--2.11.- Right() valores a partir de una posicion derecha
select right ('Msc. en computacion',8) as ParteDer

--2.12.- LTrim() Elimia espacios blanco a la iz1
select LTrim ('Msc. en computacion') as EBI

--2.13.- LTrim() Elimia espacios blanco a la iz1
select RTrim ('Msc. en computacion') as EBD

--3 .- Convertir

--Cast, convert, Parse, try_cast , ry_convert, try_parse

--3.1.- Convert
declare @ani as int
set @ani=(select cast(SUBSTRING('001-190671-0011Y',9,2) as int ) 
as A�oNac) 
print @ani

--3.2 .Convert
declare @anint as int
set @anint=(select convert(int, SUBSTRING('001-190671-0011Y',9,2)) 
as A�oNac) 
print @anint

--3.3.- Parse

Select Parse('Monday, 13 december 2010' as datetime2 using 'en-US') AS Result

--3.4.- Calcular edad



DECLARE @Carvallo datetime  
set @Carvallo =(select Parse('Monday, 13 december 2010' as datetime2 using 'en-US') as datetime)
select day (@Carvallo ) as DIADENACIMIENTO


declare @anaaN as int
set @anaaN=(select convert(int, SUBSTRING('001-190671-0011Y',9,2)) 
as A�oNac) 
print @anaaN



--Otra clase


--CRUD ingresar, dar baja(eliminar), modificar, buscar y listar



select * from Deptos
alter table Deptos add EstadoD bit default 1

update Deptos set EstadoD=1


create procedure NDpto

@ND nvarchar (48)
as 
declare @nde as nvarchar(48)
set @nde =(select NombreDpto from Deptos
where NombreDpto=@ND)
if(@ND = '')
begin
print 'No puede ser nulo'
end 
else
begin
  if(@ND=@nde)
  begin
  print 'Dato duplicado'
  end 
  else
  begin 
   insert into Deptos values(@ND,1)
  end
end

select * from Deptos
NDpto'Leon s.kennedy'

--Dar baja

create procedure BDpto

@ID int
as 
declare @iddept as int
set @iddept=(Select Id_Dptos from Deptos where Id_Dptos=@ID)
if(@iddept=@ID)
begin
 update Deptos set EstadoD=0 where Id_Dptos=@ID
end
else
begin
 print 'Departamento no encontrado'
end
--BDpto 5
select * from Deptos

--Insercion Municipios
create procedure NMun
@NM nvarchar(45),
@IDD int
as
declare @iddept as int
set @iddept=(select Id_Dptos from Deptos where Id_Dptos = @IDD)
if(@NM='')
begin
 print 'No puede ser nulo'
end
else 
begin
  if(@IDD =@iddept)
  begin 
   insert into Municipios Values (@NM,@IDD)
  end
  else 
  begin 
   print 'Departamento no registrado'
  end
end

select *from Municipios

NMun 'Leon',4


--Buscar Depto

create procedure BuscarD
@ID int
as
declare @idd as int
set @idd =(select Id_Dptos from Deptos where Id_Dptos =@ID)
if(@ID=@idd)
begin 
 select * from Deptos where Id_Dptos=@ID
end 
else
begin
 print 'Departamento no encontrado'
end 

BuscarD 2

 --Listar Deptos
 alter procedure ListarD
 create procedure ListarD
 as
 select * from Deptos

 ListarD

  --Modificacin o Actualizacion

 create procedure MDpto
 @Id int,
 @ND nvarchar(48)
 as
declare @idd as int
set @idd =(select Id_Dptos from Deptos where Id_Dptos =@ID)
if(@ID=@idd)
begin 
  if(@ND='')
  begin 
   print'No puede ser nulo'
  end
  else
  begin
   
   update Deptos set NombreDpto=@ND where Id_Dptos=@ID and EstadoD=1
  end 
end
else
begin
 print 'Departamento no encontrado'
end 


MDpto 4, 'Matagalpa'

select * from Deptos





--Municipios crud

--Insercion Municipios
create procedure NMun
@NM nvarchar(45),
@IDD int
as
declare @iddept as int
set @iddept=(select Id_Dptos from Deptos where Id_Dptos = @IDD)
if(@NM='')
begin
 print 'No puede ser nulo'
end
else 
begin
  if(@IDD =@iddept)
  begin 
   insert into Municipios Values (@NM,@IDD)
  end
  else 
  begin 
   print 'Municipio no registrado'
  end
end

select *from Municipios

NMun 'Leon',4




--Dar baja


select * from Municipios
alter table Municipios add EstadoMn bit default 1

update Municipios set EstadoMn=1


create procedure BMnpios

@ID int
as 
declare @idMnpios as int
set @idMnpios=(Select Id_Mun from Municipios where Id_Mun=@ID)
if(@idMnpios=@ID)
begin
 update Municipios set EstadoMn=0 where Id_Mun=@ID
end
else
begin
 print 'Municipio no encontrado'
end
--BMnpios 3
select * from Municipios

--Lista Municipios

 alter procedure ListarM
 create procedure ListarM
 as
 select * from Municipios

 ListarM

 --Buscar Municipios


create procedure BuscarMn
@ID int
as
declare @idd as int
set @idd =(select Id_Mun from Municipios where Id_Mun=@ID)
if(@ID=@idd)
begin 
 select * from Municipios where Id_Mun=@ID
end 
else
begin
 print 'Municipio no encontrado'
end 

BuscarMn 3

-- Modificar o Actualizar  Municipios


 create procedure MMnpios
 @Id int,
 @NM nvarchar(48)
 as
declare @idd as int
set @idd =(select Id_Mun from Municipios where Id_Mun =@ID)
if(@ID=@idd)
begin 
  if(@NM='')
  begin 
   print'No puede ser nulo'
  end
  else
  begin
   
   update Municipios set NombreMun=@NM where Id_Mun=@ID and EstadoMn=1
  end 
end
else
begin
 print 'Municipio no encontrado'
end 


MMnpios 4, 'Zancudal'

select * from Municipios


--PRODUCTOS

--Insercion¨de Productos
create procedure NProd
@CP char(5),
@NP nvarchar(50),
@DP nvarchar(70),
@PrP float,
@ExP int,
@IDP int
as
declare @idprod as int
set @idprod=(select Id_Prov from Proveedor where Id_Prov = @IDP)
declare @codp as char(5)
set @codp=(select CodProd from Productos where CodProd =@CP)
if(@CP='' OR @NP='' OR  @DP='' OR @PrP<=0 OR @ExP<=0 OR @CP=@codp)
begin
 print 'No puede ser nulo'
end
else 
begin
  if(@IDP =@idprod)
  begin 
   insert into Productos Values (@CP,@NP,@DP,@PrP,@ExP,1,@IDP)
  end
  else 
  begin 
   print 'Proveedor no registrado'
  end
end


select *from Productos

NProd 'Guayaba','Verde',5.0,20,2


--Listar Producto

create procedure ListPdto
 as
 select * from Productos

 ListPdto

 --Buscar Producto

 create procedure BuscarPd
@CP int
as
declare @CdP as int
set @CdP =(select CodProd from Productos where CodProd=@CP)
if(@CP=@CdP)
begin 
 select * from Productos where CodProd=@CP
end 
else
begin
 print 'Producto no encontrado'
end 


--Modificar o Actualizar Productos

create procedure MProd
@CP char(5),
@NP nvarchar(50),
@DP nvarchar(70),
@PrP float,
@ExP int,
@IDP int
 as
declare @idprod as int
set @idprod=(select Id_Prov from Proveedor where Id_Prov = @IDP)
declare @codp as char(5) 
set @codp=(select CodProd from Productos where CodProd =@CP)
if(@CP='' OR @NP='' OR  @DP='' OR @PrP<=0 OR @ExP<=0 OR @CP=@codp)
begin
 print 'No puede ser nulo'
end
else 
begin
  if(@IDP =@idprod)
  begin 
  update Productos set NombreProd=@NP where CodProd=@CP and EstadoProd=1 and DescProd=@DP and preciop=@Prp and existp=@ExP and Id_Prov=@IDP
  end
  else 
  begin 
   print 'Producto no Actualizado'
  end
end


Prod 4, 'Zancudal'


--Dar Baja Productos

create procedure BProd

@CP int
as 
declare @CdP as int
set @CdP=(Select CodProd from Productos where CodProd=@CP)
if(@CdP=@CP)
begin
 update Productos set EstadoProd=0 where CodProd=@CP
end
else
begin
 print 'Producto no encontrado'
end


--CRUD Proveedor
--Inserción proveedor
create procedure NProv

@NPV nvarchar(35),
@DIPV nvarchar(70),
@TELPV char(8),
@IDM int as
declare @idMN as int
set @idMN=(select Id_Mun from Municipios where Id_Mun = @IDM)
if(@NPV='' or @DIPV = '' or @TELPV>=9 and @TELPV >=1)
begin
 print 'Datos invalidos'
end
else 
begin
  if(@IDM =@idMN)
  begin 
   insert into Proveedor Values (@NPV,@DIPV,@TELPV,1,@IDM)
  end
  else 
  begin 
   print 'Municipio no registrado'
  end
end

--Lista Proveedor

Create procedure ListarProv
as select * from Proveedor

ListarProv

--Buscar Proveedor
create procedure BuscarProv
@IDPV int
as
declare @idProv as int
set @idProv =(select Id_Prov from Proveedor where Id_Prov=@IDPV)
if(@IDPV= @idProv)
begin 
 select * from Proveedor where Id_Prov=@IDPV
end 
else
begin
 print 'Proveedor no encontrado'
end 

--Dar baja

create procedure BProv

@IDVP int
as 
declare @idProv as int
set @idProv=(Select Id_Prov from Proveedor where Id_Prov=@IDVP)
if(@idProv=@IDVP)
begin
 update Proveedor set EstadoProv=0 where Id_Prov=@IDVP
end
else
begin
 print 'Proveedor no encontrado'
end
























































backup database SFCIB to disk= 'D:\SFCIB.bak'