create table Menu (
	Id int primary key identity(1,1)
	,[Name] nvarchar(255)
)
go
create table Permission (
	Id int primary key identity(1,1)
	,[Name] nvarchar(255)
)

create table MenuPermission (
	Id int primary key identity(1,1)
	,MenuId int references Menu(Id)
	,PermissionId int references Permission(Id)
)

create table [Role] (
	Id int primary key identity(1,1)
	,[Name] nvarchar(255)
)

create table RolePermission (
	Id int primary key identity(1,1)
	,MenuPermissionId int references MenuPermission(Id)
	,RoleId int references [Role](Id)
)

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
 (N'Create')
,(N'Edit')
,(N'Delete')
,(N'Import')
,(N'Export')
,(N'View')
GO
insert into MenuPermission values 
 (1,1)
,(1,2)