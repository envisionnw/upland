CREATE TABLE [tsys_Db_Templates] (
  [ID] AUTOINCREMENT CONSTRAINT [PrimaryKey] PRIMARY KEY  UNIQUE  NOT NULL ,
  [Version] DOUBLE ,
  [IsSupported] SHORT ,
  [FieldCheck] BYTE ,
  [Context] VARCHAR (50),
  [Syntax] VARCHAR (10),
  [TemplateName] VARCHAR (50),
  [DataScope] VARCHAR (10),
  [Params] VARCHAR (255),
  [Template] LONGTEXT ,
  [Remarks] VARCHAR (255),
  [EffectiveDate] DATETIME ,
  [RetireDate] DATETIME ,
  [CreateDate] DATETIME ,
  [CreatedBy_ID] SHORT ,
  [LastModified] DATETIME ,
  [LastModifiedBy_ID] SHORT 
)
