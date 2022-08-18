Create database Alpesanic

use Alpesanic

Create table Camionero(

IdC int primary key identity (1,1) not null,
NombreC nvarchar (30) not null,
DirC nvarchar (50) not null,
SalC float not null,
Prob nvarchar (20)not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

)
Create table Camion
(
MatriculaCam char(10) primary key not null,
PotenciaCam float not null,
TipoCam nvarchar (20) not null,
Model nvarchar (50) not null
)

Create table Paquete(
CodPaq char (5) primary key not null,
DescPaq nvarchar (50) not null,
DirPaq nvarchar (50) not null,
DestPaq nvarchar (50) not null,
Provincia nvarchar (20) not null
)

--Usuario/Admin

--sp_addlogin 'Juan','GomezArauz2022','Alpesanic'
--sp_addsrvrolemember 'Juan','sysadmin'

--sp_adduser 'Juan','Phd'

--sp_addrolemember 'db_ddladmin','Phd'