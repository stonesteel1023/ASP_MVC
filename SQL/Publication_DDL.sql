
-- Publication --------------
CREATE TABLE [Publication]
(
  [id] [int] IDENTITY(1,1) NOT NULL, 
  [Description]    nvarchar(MAX)   NULL  , 
  [ProjectID]    int   NULL  , 
  [OrganizationID]    int   NULL  , 
  [CategoryID]    int   NULL  , 
  [PriorityID]    int   NULL  , 
  [StatusID]    int   NULL 
, CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED ([id] ASC)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]) ON [PRIMARY]
GO
    