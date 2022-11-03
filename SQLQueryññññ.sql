


sp_addlogin 'Maria','Maria1234','Tienda'
sp_addsrvrolemember 'Maria','sysadmin'

sp_adduser 'Maria','Phd'

sp_addrolemember 'db_ddladmin','Phd'