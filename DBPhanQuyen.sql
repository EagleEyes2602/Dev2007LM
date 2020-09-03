create table Menu (
	Id int primary key identity(1,1)
	,[Name] nvarchar(255)
)
go

create table Permission (
	Id int primary key identity(1,1)
	,[Name] nvarchar(255)
)
GO

create table MenuPermission (
	Id int primary key identity(1,1)
	,MenuId int references Menu(Id)
	,PermissionId int references Permission(Id)
)
GO

create table [Role] (
	Id int primary key identity(1,1)
	,[Name] nvarchar(255)
)
Go

create table RolePermission (
	Id int primary key identity(1,1)
	,MenuPermissionId int references MenuPermission(Id)
	,RoleId int references [Role](Id)
)
GO

create table EmployeeRole (
	Id int primary key identity(1,1)
	,RoleId int references [Role](Id)
	,EmployeeId int references [Employee](Id)
)
GO

insert into Menu values 
 (N'Releaser')
,(N'Book')
,(N'Author')
,(N'BookType')
,(N'Publisher')
,(N'Reader')
,(N'BookTitle')
GO

insert into Permission values 
 (N'View')
,(N'Create')
,(N'Edit')
,(N'Delete')
,(N'Import')
,(N'Export')
GO

insert into MenuPermission values 
 (1,1)
,(1,2)
,(1,3)
,(1,4)
GO

insert into [Role] values 
 (N'Admin')
,(N'Manager')
,(N'Staff')
GO

insert into RolePermission values 
 (1,1)
,(2,1)
,(3,1)
,(4,1)
,(1,2)
,(2,2)
,(1,3)
GO

insert into EmployeeRole values 
 (1,1)
,(2,2)
,(3,3)
,(3,11)
GO

select * from EmployeeRole