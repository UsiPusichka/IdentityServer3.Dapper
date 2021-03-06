/****** Object:  Table [dbo].[ScopeClaims]    Script Date: 1/13/2017 4:09:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[AlwaysIncludeInIdToken] [bit] NOT NULL,
	[Scope_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scopes]    Script Date: 1/13/2017 4:09:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[IncludeAllClaimsForUser] [bit] NOT NULL,
	[ClaimsRule] [nvarchar](200) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[AllowUnrestrictedIntrospection] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Scopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScopeSecrets]    Script Date: 1/13/2017 4:09:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScopeSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Expiration] [datetimeoffset](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](250) NOT NULL,
	[Scope_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ScopeSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ScopeClaims_dbo.Scopes_Scope_Id] FOREIGN KEY([Scope_Id])
REFERENCES [dbo].[Scopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScopeClaims] CHECK CONSTRAINT [FK_dbo.ScopeClaims_dbo.Scopes_Scope_Id]
GO
ALTER TABLE [dbo].[ScopeSecrets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ScopeSecrets_dbo.Scopes_Scope_Id] FOREIGN KEY([Scope_Id])
REFERENCES [dbo].[Scopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScopeSecrets] CHECK CONSTRAINT [FK_dbo.ScopeSecrets_dbo.Scopes_Scope_Id]
GO
