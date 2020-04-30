Create database test_mvc
GO

Use test_mvc
GO

-- create the user and login
CREATE LOGIN xx
WITH PASSWORD = 'xxxxxx';
USE test_mvc;
CREATE USER xx FOR LOGIN xx;

-- add user to the role
EXEC sp_addrolemember  'db_owner','xx';


-- Attachment --------------
CREATE TABLE [Attachment]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[ItemPost] int  NULL ,
[AttachmentContent] Text  NULL 

, CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- Category --------------
CREATE TABLE [Category]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[CategoryName] nvarchar(200)  NULL ,
[SortOrder] int  NULL 

, CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




-- Email --------------
CREATE TABLE [Email]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[FromAddress] nvarchar(200)  NULL ,
[ToAddress] nvarchar(200)  NULL ,
[Subject] nvarchar(200)  NULL ,
[Body] nvarchar(200)  NULL ,
[Incomming] bit  NULL 

, CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




-- Organization --------------
CREATE TABLE [Organization]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[OrganizationName] nvarchar(200)  NULL ,
[Description] nvarchar(200)  NULL ,
[Active] bit  NULL ,
[isExternal] bit  NULL 

, CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




-- PostType --------------
CREATE TABLE [PostType]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[PostTypeName] nvarchar(200)  NULL ,
[SortOrder] int  NULL 

, CONSTRAINT [PK_PostType] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- Priority --------------
CREATE TABLE [Priority]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[PriorityName] nvarchar(200)  NULL ,
[SortOrder] int  NULL ,
[SCCClass] nvarchar(200)  NULL ,
[BGColor] nvarchar(200)  NULL 

, CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- Project --------------
CREATE TABLE [Project]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[ProjectName] nvarchar(200)  NULL ,
[Active] bit  NULL ,
[POP3Address] nvarchar(200)  NULL 

, CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- Publication --------------
CREATE TABLE [Publication]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[Description] nvarchar(200)  NULL ,
[ProjectID] int  NULL ,
[OrganizationID] int  NULL ,
[CategoryID] int  NULL ,
[PriorityID] int  NULL ,
[StatusID] int  NULL 

, CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- PublicationPost --------------
CREATE TABLE [PublicationPost]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[PublicationID] int  NULL ,
[PostText] nvarchar(200)  NULL ,
[PostType] int  NULL ,
[Author] int  NULL 

, CONSTRAINT [PK_PublicationPost] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- Status --------------
CREATE TABLE [Status]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[StatusName] nvarchar(200)  NULL ,
[SortOrder] int  NULL ,
[CSSClass] nvarchar(200)  NULL ,
[isDefault] bit  NULL 

, CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- User --------------
CREATE TABLE [User]
(
[id] [int] IDENTITY(1,1) NOT NULL,
[FirstName] nvarchar(200)  NULL ,
[LastName] nvarchar(200)  NULL ,
[UserName] nvarchar(200)  NULL ,
[ProjectID] int  NULL 

, CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
   (
	  [id] ASC
   )WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--================= TEST DATA ===========================-


-- Attachment --------------

Insert into [Attachment]
(ItemPost , AttachmentContent )
Values 
(1,'test 1')
GO
Insert into [Attachment]
(ItemPost , AttachmentContent )
Values 
(1,'test 2')
GO
Insert into [Attachment]
(ItemPost , AttachmentContent )
Values 
(1,'test 3')
GO



-- Category --------------

Insert into [Category]
(CategoryName , SortOrder )
Values 
('task',1)
GO
Insert into [Category]
(CategoryName , SortOrder )
Values 
('project',2)
GO
Insert into [Category]
(CategoryName , SortOrder )
Values 
('Program',3)
GO
Insert into [Category]
(CategoryName , SortOrder )
Values 
('Portfolio',4)
GO
Insert into [Category]
(CategoryName , SortOrder )
Values 
('Business',5)
GO


-- Email --------------

Insert into [Email]
(FromAddress , ToAddress , Subject , Body , Incomming )
Values 
('FromAddress1','ToAddress1','Subject1','Body1', 1)
GO
Insert into [Email]
(FromAddress , ToAddress , Subject , Body , Incomming )
Values 
('FromAddress2','ToAddress2','Subject2','Body2', 1)
GO
Insert into [Email]
(FromAddress , ToAddress , Subject , Body , Incomming )
Values 
('FromAddress3','ToAddress3','Subject3','Outgoing body1', 0)
GO

-- Organization --------------

Insert into [Organization]
(OrganizationName , Description , Active , isExternal )
Values 
('Organization 1','Organization 1 Description',1,0)
GO
Insert into [Organization]
(OrganizationName , Description , Active , isExternal )
Values 
('Organization 2','Organization 2 Description',1,1)
GO
Insert into [Organization]
(OrganizationName , Description , Active , isExternal )
Values 
('Organization 3','Organization 3 Description',0,0)
GO


-- PostType --------------

Insert into [PostType]
(PostTypeName , SortOrder )
Values 
('Text',0)
GO
Insert into [PostType]
(PostTypeName , SortOrder )
Values 
('Attachment',0)
GO



-- Priority --------------

Insert into [Priority]
(PriorityName , SortOrder , SCCClass , BGColor )
Values 
('HIGH',0,'highPriority','Red')
GO
Insert into [Priority]
(PriorityName , SortOrder , SCCClass , BGColor )
Values 
('Mid',1,'midPriority','Green')
GO
Insert into [Priority]
(PriorityName , SortOrder , SCCClass , BGColor )
Values 
('Low',2,'lowPriority','White')
GO



-- Project --------------

Insert into [Project]
(ProjectName , Active , POP3Address )
Values 
('ASP MVC',1,'POP3Address1')
GO
Insert into [Project]
(ProjectName , Active , POP3Address )
Values 
('POP-up forms for ASP MVC',1,'POP3Address')
GO


-- Publication --------------

Insert into [Publication]
(Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values 
('Write a code for ASP MVC',1,1,1,1,1)
GO
Insert into [Publication]
(Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values 
('Write a post with explanation on basic MVC concepts',1,1,1,1,1)
GO
Insert into [Publication]
(Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values 
('Server side master-details forms ',1,1,1,1,1)
GO
Insert into [Publication]
(Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values 
('Client side master-details forms ',1,1,1,1,1)
GO

-- PublicationPost --------------

Insert into [PublicationPost]
(PublicationID , PostText , PostType , Author )
Values 
(1,'test Post 1',1,1)
GO
Insert into [PublicationPost]
(PublicationID , PostText , PostType , Author )
Values 
(1,'test Post 2',1,1)
GO
Insert into [PublicationPost]
(PublicationID , PostText , PostType , Author )
Values 
(1,'test Post 3',1,1)
GO


-- Status --------------

Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('New',1,'',1)
GO
Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('Assigned',2,'',0)
GO
Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('In progress',3,'',0)
GO
Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('verification',4,'',0)
GO
Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('closed:completed',1,'',0)
GO
Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('closed:rejected',1,'',0)
GO
Insert into [Status]
(StatusName , SortOrder , CSSClass , isDefault )
Values 
('closed:no solution',1,'',0)
GO


-- User --------------

Insert into [User]
(FirstName , LastName , UserName , ProjectID )
Values 
('Bhaskara','Ramachandra','BRamachandra',1)
GO


Insert into [User]
(FirstName , LastName , UserName , ProjectID )
Values 
('Padmavati','Pitambara','PPitambara',1)
GO



Insert into [User]
(FirstName , LastName , UserName , ProjectID )
Values 
('Rundhati','Shripati','RShripati',1)
GO
