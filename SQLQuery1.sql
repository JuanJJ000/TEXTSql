--Create database SICIF

----a
--use SICIF

--Create table Proveedor(

--Id_prov int identity (1,1) primary key not null,
--NobreProv nvarchar (40) not null,
--DirP nvarchar (50) not null
--)


--insert into Proveedor values ('GRUMA','Carretera a Masaya'),
--('FEMSA' ,'Carretera Norte')

--select * from Proveedor


--Usuario/Admin

--sp_addlogin 'Juan','GomezArauz2022','SICIF'
--sp_addsrvrolemember 'Juan','sysadmin'

--sp_adduser 'Juan','Phd'

--sp_addrolemember 'db_ddladmin','Phd'


-- Usuario Solo lectura

--sp_addlogin 'Estudiantes','ESistemas2022','SICIF'
--sp_addsrvrolemember 'Estudiantes','processadmin'
--use SICIF	
--sp_adduser 'Estudiantes','Estudiantes'

--sp_addrolemember 'db_denydatawriter','Estudiantes'
--sp_addrolemember 'db_datareader','Estudiantes'

--revoke create table, Create view, create procedure to Estudiantes

--deny insert, delete, update on Proveedor to Estudiantes

--Usuario solo escritura


--sp_addlogin 'Cajero','Cajero2022','SICIF'
--sp_addsrvrolemember 'Cajero','processadmin'
--use SICIF	
--sp_adduser 'Cajero','Cajero'

--sp_addrolemember 'db_denydatareader','Cajero'

--sp_addrolemember 'db_datawriter','Cajero'


--revoke create table, Create view, create procedure to Cajero
             
--deny insert, delete, update on Proveedor to Cajero


--Usuario L/E

--sp_addlogin 'Docente','Cajero2022','SICIF'
--sp_addsrvrolemember 'Cajero','processadmin'
--use SICIF	
--sp_adduser 'Cajero','Cajero'

--sp_addrolemember 'db_denydatareader','Cajero'

--sp_addrolemember 'db_datawriter','Cajero'