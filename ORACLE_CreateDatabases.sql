drop table Attachment;
drop table Category;
drop table Email;
drop table Organization;
drop table PostType;
drop table Priority;
drop table Project;
drop table Publication;
drop table PublicationPost;
drop table Status;
drop table Users;

-- Attachment --------------
CREATE TABLE Attachment(
id number PRIMARY key,
ItemPost number(2)  NULL,
AttachmentContent varchar2(100)  NULL
)

CREATE SEQUENCE AAA START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;


-- Category --------------
CREATE TABLE Category
(
id number primary key,
CategoryName varchar2(200)  NULL ,
SortOrder number  NULL
)

CREATE SEQUENCE BBB START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- Email --------------
CREATE TABLE Email
(
id number primary key,
FromAddress varchar2(200)  NULL ,
ToAddress varchar2(200)  NULL ,
Subject varchar2(200)  NULL ,
Body varchar2(200)  NULL ,
Incomming number(3)  NULL
)

CREATE SEQUENCE CCC START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;


-- Organization --------------
CREATE TABLE Organization
(
id number primary key,
OrganizationName varchar(200)  NULL ,
Description varchar2(200)  NULL ,
Active number(3)  NULL ,
isExternal number(3)  NULL
)

CREATE SEQUENCE DDD START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;


-- PostType --------------
CREATE TABLE PostType
(
id number primary key,
PostTypeName varchar2(200)  NULL ,
SortOrder number  NULL
)

CREATE SEQUENCE EEE START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;


-- Priority --------------
CREATE TABLE Priority
(
id number primary key,
PriorityName varchar2(200)  NULL ,
SortOrder number  NULL ,
SCCClass varchar2(200)  NULL ,
BGColor varchar2(200)  NULL
)

CREATE SEQUENCE FFF START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- Project --------------
CREATE TABLE Project
(
id number primary key,
ProjectName varchar2(200)  NULL ,
Active number(3)  NULL ,
POP3Address varchar2(200)  NULL
)

CREATE SEQUENCE GGG START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- Publication --------------
CREATE TABLE Publication
(
id number primary key,
Description varchar2(200)  NULL ,
ProjectID number  NULL ,
OrganizationID number  NULL ,
CategoryID number  NULL ,
PriorityID number  NULL ,
StatusID number  NULL
)
CREATE SEQUENCE HHH START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- PublicationPost --------------
CREATE TABLE PublicationPost
(
id number primary key,
PublicationID number  NULL ,
PostText varchar2(200)  NULL ,
PostType number  NULL ,
Author number  NULL
)

CREATE SEQUENCE III START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- Status --------------
CREATE TABLE Status
(
id number primary key,
StatusName varchar2(200)  NULL ,
SortOrder number  NULL ,
CSSClass varchar2(200)  NULL ,
isDefault number(3)  NULL
)

CREATE SEQUENCE JJJ START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- User --------------
CREATE TABLE Users
(
id number primary key,
FirstName varchar2(200)  NULL ,
LastName varchar2(200)  NULL ,
UserName varchar2(200)  NULL ,
ProjectID number  NULL
)

CREATE SEQUENCE KKK START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

--================= TEST DATA ===========================-


-- Attachment --------------

Insert into  Attachment
(id, ItemPost , AttachmentContent )
Values
(AAA.nextval, 1,'test 1');

Insert into  Attachment
(id, ItemPost , AttachmentContent )
Values
(AAA.nextval, 1,'test 2');

Insert into  Attachment
(id, ItemPost , AttachmentContent )
Values
(AAA.nextval, 1,'test 3');




-- Category --------------

Insert into  Category
(id, CategoryName , SortOrder )
Values
(BBB.nextval, 'task',1);

Insert into  Category
(id, CategoryName , SortOrder )
Values
(BBB.nextval, 'project',2);

Insert into  Category
(id, CategoryName , SortOrder )
Values
(BBB.nextval, 'Program',3);

Insert into  Category
(id, CategoryName , SortOrder )
Values
(BBB.nextval, 'Portfolio',4);
Insert into  Category
(id, CategoryName , SortOrder )
Values
(BBB.nextval, 'Business',5);


-- Email --------------

Insert into  Email
(id, FromAddress , ToAddress , Subject , Body , Incomming )
Values
(CCC.nextval, 'FromAddress1','ToAddress1','Subject1','Body1', 1);
Insert into  Email
(id, FromAddress , ToAddress , Subject , Body , Incomming )
Values
(CCC.nextval, 'FromAddress2','ToAddress2','Subject2','Body2', 1);
Insert into  Email
(id, FromAddress , ToAddress , Subject , Body , Incomming )
Values
(CCC.nextval, 'FromAddress3','ToAddress3','Subject3','Outgoing body1', 0);

-- Organization --------------

Insert into  Organization
(id, OrganizationName , Description , Active , isExternal )
Values
(DDD.nextval, 'Organization 1','Organization 1 Description',1,0);
Insert into  Organization
(id, OrganizationName , Description , Active , isExternal )
Values
(DDD.nextval, 'Organization 2','Organization 2 Description',1,1);
Insert into  Organization
(id, OrganizationName , Description , Active , isExternal )
Values
(DDD.nextval, 'Organization 3','Organization 3 Description',0,0);


-- PostType --------------

Insert into  PostType
(id, PostTypeName , SortOrder )
Values
(EEE.nextval, 'Text',0);
Insert into  PostType
(id, PostTypeName , SortOrder )
Values
(EEE.nextval, 'Attachment',0);



-- Priority --------------

Insert into  Priority
(id, PriorityName , SortOrder , SCCClass , BGColor )
Values
(FFF.nextval, 'HIGH',0,'highPriority','Red');
Insert into  Priority
(id, PriorityName , SortOrder , SCCClass , BGColor )
Values
(FFF.nextval, 'Mid',1,'midPriority','Green');
Insert into  Priority
(id, PriorityName , SortOrder , SCCClass , BGColor )
Values
(FFF.nextval, 'Low',2,'lowPriority','White');



-- Project --------------

Insert into  Project
(id, ProjectName , Active , POP3Address )
Values
(GGG.nextval, 'ASP MVC',1,'POP3Address1');
Insert into  Project
(id, ProjectName , Active , POP3Address )
Values
(GGG.nextval, 'POP-up forms for ASP MVC',1,'POP3Address');


-- Publication --------------

Insert into  Publication
(id, Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values
(HHH.nextval, 'Write a code for ASP MVC',1,1,1,1,1);
Insert into  Publication
(id, Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values
(HHH.nextval, 'Write a post with explanation on basic MVC concepts',1,1,1,1,1);
Insert into  Publication
(id, Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values
(HHH.nextval, 'Server side master-details forms ',1,1,1,1,1);
Insert into  Publication
(id, Description , ProjectID , OrganizationID , CategoryID , PriorityID , StatusID )
Values
(HHH.nextval, 'Client side master-details forms ',1,1,1,1,1);

-- PublicationPost --------------

Insert into  PublicationPost
(id, PublicationID , PostText , PostType , Author )
Values
(III.nextval, 1,'test Post 1',1,1);
Insert into  PublicationPost
(id, PublicationID , PostText , PostType , Author )
Values
(III.nextval, 1,'test Post 2',1,1);
Insert into  PublicationPost
(id, PublicationID , PostText , PostType , Author )
Values
(III.nextval, 1,'test Post 3',1,1);


-- Status --------------

Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'New',1,'',1);
Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'Assigned',2,'',0);
Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'In progress',3,'',0);
Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'verification',4,'',0);
Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'closed:completed',1,'',0);
Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'closed:rejected',1,'',0);
Insert into  Status
(id, StatusName , SortOrder , CSSClass , isDefault )
Values
(JJJ.nextval, 'closed:no solution',1,'',0);


-- User --------------

Insert into  Users
(id, FirstName , LastName , UserName , ProjectID )
Values
(KKK.nextval, 'Bhaskara','Ramachandra','BRamachandra',1);


Insert into  Users
(id, FirstName , LastName , UserName , ProjectID )
Values
(KKK.nextval, 'Padmavati','Pitambara','PPitambara',1);



Insert into  Users
(id, FirstName , LastName , UserName , ProjectID )
Values
(KKK.nextval, 'Rundhati','Shripati','RShripati',1);
