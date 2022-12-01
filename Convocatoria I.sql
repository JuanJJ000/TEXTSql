Create database Cinemark

restore database Cinemark from disk='D:\Cinemark.bak'
with replace

use Cinemark

sp_addlogin 'EmpleadoCine','CinemarkNumberOne23','Cinemark'
sp_addsrvrolemember 'EmpleadoCine','sysadmin'

sp_adduser 'EmpleadoCine','Phd'

sp_addrolemember 'db_ddladmin','Phd'



Create table tickets (
Id_ticket int identity(1,1) primary key not null,
CodTanda char (5) foreign key references Tandas (CodTanda) not null,
PrecioT float not null,
existp int default 200 not null
)

Create table Productos (
CodProd char (5) primary key not null,
NombreProd nvarchar (50) not null,
DescProd nvarchar (50) not null,
preciop float not null,
existp int not null,
EstadoProd bit default 1 not null
)

Create table Sala (
CodSala char (5) primary key not null,
NombreSala nvarchar (50) not null,
CodTanda char (5) foreign key references Tandas (CodTanda) not null,
EstadoSala bit default 1 not null
)

alter table Sala add Asientos int default 200

create table Tandas(
CodTanda char (5) primary key not null,
Nombre_Tan nvarchar (30) not null,
DescripTan nvarchar (50) not null,
Duración datetime not null,
EstadoTanda bit default 1 not null
)



Create table Combos(
CodComb char(5 ) primary key not null,
Nombre_Comb nvarchar(20) not null,
CodProd char(5) foreign key references Productos(CodProd) not null,
PrecioComb float not null
)

Create table Ventas(
Id_Venta int identity (1,1) primary key not null,
Fecha_Venta datetime default getdate() not null,
TotalV float not null
)

Create table det_Ventas(
Id_Venta int foreign key references Ventas(Id_Venta) not null,
CodProd char(5) foreign key references Productos(CodProd) not null,
cantv int not null,
subtp float,
primary key(Id_Venta, CodProd)
)


----------------------------------------------------------------------------------------------------------

create procedure NSala
@CDS char (5),
@NMS nvarchar (50) ,
@CDT char (5)
as
declare @CodSal as char(5)
set @CodSal=(select CodSala from Sala where CodSala=@CDS)
declare @CodTan as char(5)
set @CodTan=(select CodTanda from Tandas where CodTanda=@CDT)
if(@NMS = '')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@CDS=@CodSal and @CDT = @CodTan)
  begin
    insert into Sala values(@CDS,@NMS,@CDT,1,200)
  end
  else
  begin
    print 'Sala no agregada'
  end
end

create procedure BuscarS
@CDS char(5)
as
declare @CodSal as int
set @CodSal=(select CodSala from Sala where CodSala=@CDS)
if(@CDS=@CodSal)
begin
  select * from Sala where CodSala=@CDS
end
else
begin
  print 'Sala no encontrada'
end

create procedure MSala
@CDS char (5),
@NMS nvarchar (50) ,
@CDT char (5),
@EstadoSal bit
as
declare @CodSal as char(5)
set @CodSal=(select CodSala from Sala where CodSala=@CDS)
declare @CodTan as char(5)
set @CodTan=(select CodTanda from Tandas where CodTanda=@CDT)
if(@NMS = '')
begin
  print 'No puede ser nulo'
end
else
begin
  if(@CDS=@CodSal and @CDT = @CodTan)
  begin
    update Sala set NombreSala=@NMS where CodSala=@CDS and EstadoSala=@EstadoSal
  end
  else
  begin
    print 'Sala no agregada'
  end
end




backup database Cinemark to disk='D:\Cinemark.bak'