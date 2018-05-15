DROP TABLE IF EXISTS [dbo].[BlogPosts]
GO
DROP TABLE IF EXISTS [dbo].[Authors]
GO

CREATE TABLE [dbo].[Authors]
(
    [AuthorId] INT NOT NULL Identity(1,1), 
    [FirstName] NVARCHAR(255) NOT NULL,
    [LastName] NVARCHAR(255) NOT NULL,
    CONSTRAINT [PK_Author] PRIMARY KEY ([AuthorId])
)
GO

CREATE TABLE [dbo].[BlogPosts]
(
    [PostId] INT NOT NULL Identity(1,1), 
    [Title] NVARCHAR(255) NOT NULL,
    [Content] NVARCHAR(255) NOT NULL,
    [PostedDate] DATETIME2 NOT NULL,
    [AuthorId] INT NOT NULL,
    CONSTRAINT [PK_Post] PRIMARY KEY ([PostId]),
    CONSTRAINT [FK_Author] FOREIGN KEY(AuthorId) REFERENCES [dbo].Authors(AuthorId)
)
GO

INSERT INTO Authors VALUES ('John','Doe');
GO

INSERT INTO BlogPosts VALUES ('Hello World', 'This is my first blog post', '1/1/2018', (SELECT AuthorId FROM Authors WHERE FirstName='John' AND LastName='Doe'));
GO
