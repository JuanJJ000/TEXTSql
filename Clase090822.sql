create database SFCIB
go
use SFCIB

create table Facultad(
	Id_Facultad char(3) primary key not null,
	NombreFac nvarchar(35) not null,
	NDecano nvarchar(50) not null,
	FConst date not null
)
go
create table Bar(
	Id_Bar int primary key identity(1,1) not null,
	NombreB nvarchar(35) not null,
	Propietario nvarchar(50) not null,
	Ubicacion nvarchar(50) not null
)
go
alter table Bar add FCreacion date not null

create table Deptos(
	Id_Dptos int identity(1,1) primary key not null,
	NombreDpto nvarchar(48) not null
)

create table Municipios(
	Id_Mun int identity(1,1) primary key not null,
	NombreMun nvarchar(45) not null,
	Id_Dpto int foreign key references Deptos(Id_Dptos) not null
)

create table Empleados(
	NEmp char(4) primary key not null,
	PNEmp nvarchar(15) not null,
	SNEmp nvarchar(15),
	PAEmp nvarchar(15) not null,
	SAEmp nvarchar(15),
	DirEmp nvarchar(70) not null,
	Id_Mun int foreign key references Municipios(Id_Mun) not null,
	TelEmp char(8) check(TelEmp like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

alter table Empleados add Id_Bar int not null

alter table Empleados add constraint fk_BE foreign key(Id_Bar) references Bar(Id_Bar)
