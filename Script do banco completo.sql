USE [DBDesenvolvedorIO]
GO
ALTER TABLE [dbo].[Cursos] DROP CONSTRAINT [fx_categoria_id]
GO
ALTER TABLE [dbo].[Alunos_Cursos] DROP CONSTRAINT [fk_cursos_id]
GO
ALTER TABLE [dbo].[Alunos_Cursos] DROP CONSTRAINT [fk_aluno_id]
GO
ALTER TABLE [dbo].[Cursos] DROP CONSTRAINT [DF__Cursos__ativo__2C3393D0]
GO
ALTER TABLE [dbo].[Cursos] DROP CONSTRAINT [DF__Cursos__cadastra__2B3F6F97]
GO
ALTER TABLE [dbo].[Cursos] DROP CONSTRAINT [DF__Cursos__valor__2A4B4B5E]
GO
ALTER TABLE [dbo].[Categorias] DROP CONSTRAINT [DF__Categoria__cadas__276EDEB3]
GO
ALTER TABLE [dbo].[Alunos_Cursos] DROP CONSTRAINT [DF__Alunos_Cu__cadas__300424B4]
GO
ALTER TABLE [dbo].[Alunos] DROP CONSTRAINT [DF__Alunos__ativo__24927208]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 7/11/2023 10:05:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cursos]') AND type in (N'U'))
DROP TABLE [dbo].[Cursos]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/11/2023 10:05:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categorias]') AND type in (N'U'))
DROP TABLE [dbo].[Categorias]
GO
/****** Object:  Table [dbo].[Alunos_Cursos]    Script Date: 7/11/2023 10:05:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alunos_Cursos]') AND type in (N'U'))
DROP TABLE [dbo].[Alunos_Cursos]
GO
/****** Object:  Table [dbo].[Alunos]    Script Date: 7/11/2023 10:05:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alunos]') AND type in (N'U'))
DROP TABLE [dbo].[Alunos]
GO
/****** Object:  Table [dbo].[Alunos]    Script Date: 7/11/2023 10:05:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alunos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](80) NOT NULL,
	[cidade] [char](60) NOT NULL,
	[estado] [char](2) NOT NULL,
	[cpf] [char](11) NOT NULL,
	[data_nascimento] [date] NULL,
	[ativo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alunos_Cursos]    Script Date: 7/11/2023 10:05:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alunos_Cursos](
	[aluno_id] [int] NOT NULL,
	[curso_id] [int] NOT NULL,
	[cadastrado_em] [datetime] NULL,
 CONSTRAINT [pk_alunos] PRIMARY KEY CLUSTERED 
(
	[aluno_id] ASC,
	[curso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/11/2023 10:05:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](80) NOT NULL,
	[cadastrado_em] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 7/11/2023 10:05:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria_id] [int] NOT NULL,
	[descricao] [varchar](80) NOT NULL,
	[total_horas] [int] NOT NULL,
	[valor] [decimal](12, 2) NOT NULL,
	[cadastrado_em] [datetime] NULL,
	[ativo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alunos] ON 

INSERT [dbo].[Alunos] ([id], [nome], [cidade], [estado], [cpf], [data_nascimento], [ativo]) VALUES (1, N'Rafael', N'Aracaju                                                     ', N'SE', N'00000000001', CAST(N'2000-01-01' AS Date), 1)
INSERT [dbo].[Alunos] ([id], [nome], [cidade], [estado], [cpf], [data_nascimento], [ativo]) VALUES (2, N'Eduardo', N'São Paulo                                                   ', N'SP', N'00000000002', CAST(N'2000-02-02' AS Date), 1)
INSERT [dbo].[Alunos] ([id], [nome], [cidade], [estado], [cpf], [data_nascimento], [ativo]) VALUES (3, N'Bruno', N'São Paulo                                                   ', N'SP', N'00000000003', CAST(N'2000-03-03' AS Date), 1)
INSERT [dbo].[Alunos] ([id], [nome], [cidade], [estado], [cpf], [data_nascimento], [ativo]) VALUES (4, N'Tiago', N'Rio de Janeiro                                              ', N'RJ', N'00000000004', CAST(N'2000-04-04' AS Date), 1)
INSERT [dbo].[Alunos] ([id], [nome], [cidade], [estado], [cpf], [data_nascimento], [ativo]) VALUES (5, N'Heloysa', N'Aracaju                                                     ', N'SE', N'00000000005', CAST(N'2000-05-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Alunos] OFF
GO
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (1, 1, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (1, 2, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (2, 3, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (3, 1, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (4, 4, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (5, 1, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (5, 2, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
INSERT [dbo].[Alunos_Cursos] ([aluno_id], [curso_id], [cadastrado_em]) VALUES (5, 3, CAST(N'2023-07-06T23:53:34.977' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([id], [descricao], [cadastrado_em]) VALUES (1, N'ACESSO A DADOS', CAST(N'2023-07-06T23:53:16.550' AS DateTime))
INSERT [dbo].[Categorias] ([id], [descricao], [cadastrado_em]) VALUES (2, N'SEGURANÇA', CAST(N'2023-07-06T23:53:16.550' AS DateTime))
INSERT [dbo].[Categorias] ([id], [descricao], [cadastrado_em]) VALUES (3, N'WEB', CAST(N'2023-07-06T23:53:16.550' AS DateTime))
INSERT [dbo].[Categorias] ([id], [descricao], [cadastrado_em]) VALUES (2002, N'Categoria Nova 1', CAST(N'2023-07-10T22:07:01.467' AS DateTime))
INSERT [dbo].[Categorias] ([id], [descricao], [cadastrado_em]) VALUES (2003, N'Categoria Nova 2', CAST(N'2023-07-10T22:07:01.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 

INSERT [dbo].[Cursos] ([id], [categoria_id], [descricao], [total_horas], [valor], [cadastrado_em], [ativo]) VALUES (1, 1, N'EF Core', 17, CAST(300.00 AS Decimal(12, 2)), CAST(N'2023-07-06T23:53:25.413' AS DateTime), 1)
INSERT [dbo].[Cursos] ([id], [categoria_id], [descricao], [total_horas], [valor], [cadastrado_em], [ativo]) VALUES (2, 1, N'SQL Server', 5, CAST(200.00 AS Decimal(12, 2)), CAST(N'2023-07-06T23:53:25.413' AS DateTime), 1)
INSERT [dbo].[Cursos] ([id], [categoria_id], [descricao], [total_horas], [valor], [cadastrado_em], [ativo]) VALUES (3, 3, N'ASP.NET Core Enterprise', 5, CAST(200.00 AS Decimal(12, 2)), CAST(N'2023-07-06T23:53:25.413' AS DateTime), 1)
INSERT [dbo].[Cursos] ([id], [categoria_id], [descricao], [total_horas], [valor], [cadastrado_em], [ativo]) VALUES (4, 2, N'Fundamentos de IdentyServer4', 5, CAST(200.00 AS Decimal(12, 2)), CAST(N'2023-07-06T23:53:25.413' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
ALTER TABLE [dbo].[Alunos] ADD  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [dbo].[Alunos_Cursos] ADD  DEFAULT (getdate()) FOR [cadastrado_em]
GO
ALTER TABLE [dbo].[Categorias] ADD  DEFAULT (getdate()) FOR [cadastrado_em]
GO
ALTER TABLE [dbo].[Cursos] ADD  DEFAULT ((0)) FOR [valor]
GO
ALTER TABLE [dbo].[Cursos] ADD  DEFAULT (getdate()) FOR [cadastrado_em]
GO
ALTER TABLE [dbo].[Cursos] ADD  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [dbo].[Alunos_Cursos]  WITH CHECK ADD  CONSTRAINT [fk_aluno_id] FOREIGN KEY([aluno_id])
REFERENCES [dbo].[Alunos] ([id])
GO
ALTER TABLE [dbo].[Alunos_Cursos] CHECK CONSTRAINT [fk_aluno_id]
GO
ALTER TABLE [dbo].[Alunos_Cursos]  WITH CHECK ADD  CONSTRAINT [fk_cursos_id] FOREIGN KEY([curso_id])
REFERENCES [dbo].[Cursos] ([id])
GO
ALTER TABLE [dbo].[Alunos_Cursos] CHECK CONSTRAINT [fk_cursos_id]
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD  CONSTRAINT [fx_categoria_id] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Cursos] CHECK CONSTRAINT [fx_categoria_id]
GO
