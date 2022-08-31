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

--1.2.- Year(): Retornar el año de una fech
select year(getdate()) as AñoActual,
year('19710619') as MiAñoNac

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
SELECT DATENAME(year, getdate()) as AñoActual 
    ,DATENAME(month, getdate()) as mesactual 
    ,DATENAME(day, getdate()) as diactual 
    ,DATENAME(dayofyear, getdate()) as diadelaño 
    ,DATENAME(weekday, getdate()) as diasem

--1.8.- datepart()

select datepart(year,getdate()) as AñoActual

--2.- Cadena
--2.1-- len(): devuelve la longitud de una cadena

select len(NombreProd) as LNP from Productos

--2.2.- Char(): Devuelve el caracter a partir de su codigo ascii
select char(61) as Caract

--2.3.- Ascii(): Devuelve el codigo asccii de un caracter
select ascii ('ñ') as ValorA

--2.4.- Lower(): Tramsforma una cadena a minuscula
select lower ('ASH KETCHUM') as Minun

--2.5.- Upper(): Tramsforma una cadena a Mayuscuña
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
as AñoNac) 
print @ani

--3.2 .Convert
declare @anint as int
set @anint=(select convert(int, SUBSTRING('001-190671-0011Y',9,2)) 
as AñoNac) 
print @anint

--3.3.- Parse

Select Parse('Monday, 13 december 2010' as datetime2 using 'en-US') AS Result

--3.4.- Calcular edad



DECLARE @Carvallo datetime  
set @Carvallo =(select Parse('Monday, 13 december 2010' as datetime2 using 'en-US') as datetime)
select day (@Carvallo ) as DIADENACIMIENTO


declare @anint as int
set @anint=(select convert(int, SUBSTRING('001-190671-0011Y',9,2)) 
as AñoNac) 
print @anint
