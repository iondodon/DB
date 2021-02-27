﻿USE [master]
GO
IF DB_ID('universitatea') is not null
	BEGIN 
		ALTER DATABASE universitatea SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE universitatea;
	END
GO
CREATE DATABASE [universitatea]
GO
ALTER DATABASE [universitatea] ADD FILEGROUP [userdatafgroup01]
GO
DECLARE @f NVARCHAR(512) = CONVERT(NVARCHAR,SERVERPROPERTY('InstanceDefaultDataPath'))
DECLARE @d NVARCHAR(2000) = 'ALTER DATABASE universitatea ADD FILE (NAME = N''universitatea_File2'',FILENAME = N'''+@f+'universitatea_File2.ndf'')TO FILEGROUP [userdatafgroup01]'
EXECUTE SP_Executesql @d
GO
ALTER DATABASE [universitatea] MODIFY FILEGROUP [userdatafgroup01] DEFAULT
GO
DECLARE @f NVARCHAR(512) = CONVERT(NVARCHAR,SERVERPROPERTY('InstanceDefaultDataPath'))
DECLARE @d NVARCHAR(2000) = 'ALTER DATABASE universitatea ADD FILE (NAME = N''universitatea_File3'',FILENAME = N'''+@f+'universitatea_File3.ndf'')TO FILEGROUP [userdatafgroup01]'
EXECUTE SP_Executesql @d
GO

USE [universitatea]
GO
CREATE TABLE [dbo].[discipline](
	[Id_Disciplina] [int] NOT NULL,
	[Disciplina] [varchar](255) NULL,
	[Nr_ore_plan_disciplina] [smallint] NULL,
 CONSTRAINT [PK_discipline] PRIMARY KEY CLUSTERED 
(	[Id_Disciplina] ASC)) ON [PRIMARY]
GO

CREATE TABLE [dbo].[grupe](
	[Id_Grupa] [smallint] IDENTITY(1,1) NOT NULL,
	[Cod_Grupa] [char](6) NOT NULL,
	[Specialitate] [varchar](255) NULL,
	[Nume_Facultate] [varchar](255) NULL,
 CONSTRAINT [PK_grupe] PRIMARY KEY CLUSTERED 
(
	[Id_Grupa] ASC)) ON [PRIMARY]
GO

CREATE TABLE [dbo].[profesori](
	[Id_Profesor] [int] NOT NULL,
	[Nume_Profesor] [varchar](60) NOT NULL,
	[Prenume_Profesor] [varchar](60) NOT NULL,
	[Adresa_Postala_Profesor] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Profesor] ASC)) ON [PRIMARY]
GO

CREATE TABLE [dbo].[studenti](
	[Id_Student] [int] NOT NULL,
	[Nume_Student] [varchar](50) NOT NULL,
	[Prenume_Student] [varchar](50) NOT NULL,
	[Data_Nastere_Student] [date] NULL,
	[Adresa_Postala_Student] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Student] ASC)) ON [PRIMARY]
GO

CREATE TABLE [dbo].[studenti_reusita](
	[Id_Student] [int] NOT NULL,
	[Id_Disciplina] [int] NOT NULL,
	[Id_Profesor] [int] NOT NULL,
	[Id_Grupa] [smallint] NOT NULL,
	[Tip_Evaluare] [varchar](60) NOT NULL,
	[Nota] [tinyint] NULL,
	[Data_Evaluare] [date] NULL,
 CONSTRAINT [PK_studenti_reusita] PRIMARY KEY CLUSTERED 
(
	[Id_Student] ASC,
	[Id_Disciplina] ASC,
	[Id_Profesor] ASC,
	[Id_Grupa] ASC,
	[Tip_Evaluare] ASC)) ON [PRIMARY]
GO
SET XACT_ABORT ON;  
GO  
BEGIN TRANSACTION;

-----INSERT DATA  ----------
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (100, N'Sisteme de operare', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (101, N'Programarea calculatoarelor ', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (102, N'Informatica aplicata', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (103, N'Sisteme de calcul', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (104, N'Asamblare si depanare PC', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (105, N'Cercetari operationale ', 76)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (106, N'Programarea WEB', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (107, N'Baze de date ', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (108, N'Structuri de date si algoritmi', 76)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (109, N'Retele informatice', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (110, N'Matematica discreta', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (111, N'Modelarea sistemelor', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (112, N'Limbaje evaluate de programare (Java,.NET)', 76)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (113, N'Programarea aplicatiilor Windows', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (114, N'Tehnologii de procesare a informatiei', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (115, N'Programarea declarativa', 46)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (116, N'Proiectarea sistemelor informatice', 60)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (117, N'Practica de licenta', 80)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (118, N'Practica de productie', 80)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (119, N'Integrare informationala europeana', 20)
GO
INSERT [dbo].[discipline] ([Id_Disciplina], [Disciplina], [Nr_ore_plan_disciplina]) VALUES (120, N'Programe aplicative', 46)
GO
SET IDENTITY_INSERT [dbo].[grupe] ON 
GO
INSERT [dbo].[grupe] ([Id_Grupa], [Cod_Grupa], [Specialitate], [Nume_Facultate]) VALUES (1, N'CIB171', N'Cibernetica', N'Informatica si Cibernetica')
GO
INSERT [dbo].[grupe] ([Id_Grupa], [Cod_Grupa], [Specialitate], [Nume_Facultate]) VALUES (2, N'INF171', N'Informatica', N'Informatica si Cibernetica')
GO
INSERT [dbo].[grupe] ([Id_Grupa], [Cod_Grupa], [Specialitate], [Nume_Facultate]) VALUES (3, N'TI171 ', N'Tehnologii Informationale', N'Informatica si Cibernetica')
GO
SET IDENTITY_INSERT [dbo].[grupe] OFF
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (100, N'Popescu', N'Gabriel', N'mun. Chisinau')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (101, N'Micu', N'Elena', N'mun. Chisinau, bd. Dacia, 44')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (102, N'Avram', N'Sanda', N'mun. Chisinau, or. Vadul lui Voda, str. Stefan cel Mare, 2/2')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (103, N'Munteanu', N'Alexandru', N'mun. Chisinau, bd. Decebal, 91')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (104, N'Mocanu', N'Diana', N'mun. Chisinau, str. Titulescu, 47')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (105, N'Ilascu', N'Ionela', N'mun. Chisinau, s. Stauceni, str. Mateevici, 9')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (106, N'Prodan', N'Cristian', N'mun. Chisinau, bd. Alba Iulia, 198')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (107, N'Ungureanu', N'Iulia', N'mun. Chisinau, str. N. Costin, 44/1')
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (108, N'Bivol', N'Ion', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (109, N'Dogar', N'Alexandru', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (110, N'Frent', N'Tudor', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (111, N'Ilie', N'Vasile', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (112, N'Jugaru', N'George', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (113, N'Micu', N'George', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (114, N'Mihalache', N'Mihai', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (115, N'Mihaliuc', N'Ioana', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (116, N'Mircea', N'Sorin', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (117, N'Mircea', N'Maria', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (118, N'Misan', N'Andrei', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (119, N'Moisuc', N'Nicoleta', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (120, N'Moldovan', N'Alexandru', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (121, N'Moldovanu', N'Tudor', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (122, N'Morariu', N'Simion', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (123, N'Muresan', N'Mihaela', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (124, N'Murg', N'Daniel', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (125, N'Nagy', N'Alexandru', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (126, N'Nazarie', N'Alexandru', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (127, N'Neamt', N'Ioan', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (128, N'Nechita', N'Vasile', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (129, N'Negru', N'Sergiu', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (130, N'Obreja', N'Elena', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (131, N'Olteanu', N'Andrei', NULL)
GO
INSERT [dbo].[profesori] ([Id_Profesor], [Nume_Profesor], [Prenume_Profesor], [Adresa_Postala_Profesor]) VALUES (132, N'Vieriu', N'Denis', NULL)
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (100, N'Brasovianu', N'Teodora', CAST(N'2000-11-24' AS Date), N'mun. Chisinau, str. Tighina, 23/3')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (101, N'Cosovanu', N'Geanina', CAST(N'2000-08-04' AS Date), N'mun. Chisinau, bd. Decebal, 76')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (102, N'Coste', N'Claudia', CAST(N'1999-12-05' AS Date), N'mun. Chisinau, bd. Cuza-Voda, 31')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (103, N'Damian', N'Roxana', CAST(N'2000-06-22' AS Date), N'mun. Chisinau, bd. Traian, 22')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (104, N'Damian', N'Adina', CAST(N'2000-11-18' AS Date), N'mun. Chisinau, str. N.Zelinski, 5/5')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (105, N'Dan', N'David', CAST(N'1998-01-04' AS Date), N'mun. Chisinau, str. S. Lazo, 40')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (106, N'Danci', N'Larisa', CAST(N'1999-02-06' AS Date), N'mun. Chisinau, str. Unirii Principatelor piata,1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (107, N'Diaconu', N'Samuel', CAST(N'2000-12-25' AS Date), N'or. Ungheni, str. Gh. Cristiuc, 10')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (108, N'Demian', N'Bogdan', CAST(N'2000-02-04' AS Date), N'or. Ungheni, str. Nationala, 27')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (109, N'Dobrea', N'Daniela', CAST(N'1999-10-19' AS Date), N'mun. Chisinau, str. V. Alecsandri, 78')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (110, N'Dobrita', N'Maria', CAST(N'2000-05-26' AS Date), N'mun. Chisinau, str. A. Puskin, 41')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (111, N'Dobrovat', N'Mihai', CAST(N'2000-09-06' AS Date), N'mun. Chisinau, bd. Stefan cel Mare si Sfint, 126')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (112, N'Dordai', N'Ovidiu', CAST(N'1997-01-28' AS Date), N'mun. Chisinau, str. Puskin, 28, ap.17')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (113, N'Ene', N'Mihai', CAST(N'2000-03-02' AS Date), N'mun. Chisinau, bd. Mircea cel Batrin, 4/4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (114, N'Farcas', N'Alina', CAST(N'2000-08-22' AS Date), N'mun. Chisinau, str. Varnita, 8')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (115, N'Forgaci', N'Mihai', CAST(N'1997-04-23' AS Date), N'mun. Chisinau, str. Calea Orheiului, 36')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (116, N'Fratila', N'Ovidiu', CAST(N'2000-11-03' AS Date), N'mun. Chisinau, bd. Moscova, 5')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (117, N'Gadalean', N'Gabriela', CAST(N'2001-05-05' AS Date), N'mun. Chisinau, str. Calea Orheiului, 112')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (118, N'Gheorghescu', N'Gabriel', CAST(N'2001-01-01' AS Date), N'mun. Chisinau, bd. Moscova, 20')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (119, N'Ghimpu', N'Eduard', CAST(N'2000-01-21' AS Date), N'mun. Chisinau, or. Cricova, str. Chisinaului, 84')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (120, N'Ghiran', N'Andrei', CAST(N'1999-09-04' AS Date), N'mun. Chisinau, s. Ciorescu, str. Alexandru cel Bun, 8')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (121, N'Ghiurea', N'Stefan', CAST(N'2000-10-17' AS Date), N'or. Criuleni, bd. Biruinta, 12')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (122, N'Giurca', N'Sebastian', CAST(N'2000-10-11' AS Date), N'or. Cahul, str. Republicii, 15/6-1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (123, N'Goia', N'Ariana', CAST(N'2000-04-15' AS Date), N'or. Cahul, str. 31 August, 4d/2')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (124, N'Hanea', N'Marius', CAST(N'1998-12-10' AS Date), N'or. Cahul, str. 31 August, 4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (125, N'Holhos', N'Bogdan', CAST(N'2000-05-23' AS Date), N'or. Comrat, str. Biruintei, 47')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (126, N'Corovet', N'Eduard', CAST(N'2000-01-22' AS Date), N'or. Comrat, str. Lenin, 188')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (127, N'Luca', N'Alex', CAST(N'2000-08-10' AS Date), N'or. Comrat, str. Pobedi, 109')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (128, N'Mates', N'Catalin', CAST(N'2000-01-09' AS Date), N'rl. Taraclia, s. Tvardita, str. Frunze, 1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (129, N'Dascal', N'Florina', CAST(N'1999-11-26' AS Date), N'or. Drochia, str.31 August, 33')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (130, N'Florea', N'Ioan', CAST(N'2000-01-03' AS Date), N'or. Drochia, str. Independentei, 13')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (131, N'Galambosi', N'Norbert', CAST(N'2000-01-11' AS Date), N'or. Edinet, str. Independentei, 106')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (132, N'Jinga', N'Cristian', CAST(N'2000-05-28' AS Date), N'rl. Edinet, s. Bratuseni, str. Lenin, 55')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (133, N'Lincar', N'Alexandra', CAST(N'2000-11-04' AS Date), N'rl. Edinet, or. Cupcini, str. Chisinaului, 21')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (134, N'Muresan', N'Sergiu', CAST(N'2000-02-09' AS Date), N'or. Hincesti, str. Chisinaului, 10')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (135, N'Nicola', N'Claudiu', CAST(N'2000-09-05' AS Date), N'or. Hincesti, str. Chisinaului, 4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (136, N'Nicolae', N'Radu', CAST(N'2000-08-17' AS Date), N'or. Cimislia, str. Suveranitatii, 4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (137, N'Nicolescu', N'Aurel', CAST(N'1999-06-18' AS Date), N'or. Leova, str.Stefan cel Mare, 50')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (138, N'Oncioiu', N'Costin-Ilie', CAST(N'1999-06-12' AS Date), N'or. Leova, str. Stefan cel Mare, 67/1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (139, N'Oniga', N'Bogdan', CAST(N'2000-12-14' AS Date), N'or. Leova, str. Independentei, 7')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (140, N'Orian', N'Sergiu', CAST(N'2000-01-19' AS Date), N'or. Orhei, str. Mahu Vasile, 137')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (141, N'Paros', N'Constantin', CAST(N'2000-07-25' AS Date), N'or. Orhei, str. Vasile Lupu, 34')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (142, N'Petok', N'Lorand', CAST(N'1999-02-05' AS Date), N'or. Ocnita, str.50 de ani ai Biruintei, 19')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (143, N'Pintea', N'Andrei', CAST(N'2000-01-20' AS Date), N'or. Soroca, str. Independentei, 75')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (144, N'Pitigoi', N'Valentina', CAST(N'2000-08-09' AS Date), N'or. Soroca, str. Independentei, 24')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (145, N'Poienar', N'Robert', CAST(N'2000-02-08' AS Date), N'or. Briceni, str. Stefan cel Mare, 2')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (146, N'Popov', N'Andrei', CAST(N'2000-02-08' AS Date), N'or. Briceni, str. Prieteniei, 3')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (147, N'Pop', N'Alexandru', CAST(N'2000-05-21' AS Date), N'or. Briceni, str. Independentei, 1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (148, N'Pop', N'Irina', CAST(N'1998-03-01' AS Date), N'or. Floresti, str.31 August, 59')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (149, N'Popa', N'Mihaela', CAST(N'2000-05-10' AS Date), N'or. Taraclia, str. Lenin, 143/5')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (150, N'Suciu', N'Ionut', CAST(N'2000-05-15' AS Date), N'or. Anenii Noi, str. Concilierii Nationale, 2')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (151, N'Timu', N'Andrei', CAST(N'2001-08-10' AS Date), N'or. Donduseni, str. S. Lazo, 16')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (152, N'Vacareanu', N'Stefan', CAST(N'2000-02-19' AS Date), N'or. Donduseni, str. Comarov, 12')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (153, N'Vaman', N'Mihai', CAST(N'2000-03-04' AS Date), N'mun. Balti, str. Mihai Viteazul, 18')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (154, N'Varga', N'Izabella', CAST(N'2000-06-11' AS Date), N'mun. Balti, str. Stefan cel Mare, 2')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (155, N'Viman', N'Viorel', CAST(N'2000-03-02' AS Date), N'mun. Balti, str. Independentei, 39')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (156, N'Irimia', N'Cristiana', CAST(N'1994-11-01' AS Date), N'mun. Balti, str. Alecsandri Vasile, 3')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (157, N'Irimus', N'Andrei', CAST(N'1999-03-22' AS Date), N'mun. Balti, str. Piata Vasile Alecsandri, 4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (158, N'Judea', N'Stefana', CAST(N'2000-12-24' AS Date), N'mun. Balti, str. Feroviarilor, 18')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (159, N'Jurj', N'Flaviu', CAST(N'2000-12-11' AS Date), N'mun. Balti, str. Locomotivelor, 4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (160, N'Covas', N'Roman', CAST(N'2000-10-10' AS Date), N'mun. Balti, str. Stefan cel Mare, 6/1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (161, N'Letea', N'Roland', CAST(N'2000-07-16' AS Date), N'or. Falesti, str. M. Eminescu, 13')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (162, N'Luca', N'Laura', CAST(N'2000-10-28' AS Date), N'UTA Gagauzia, s. Congaz, str. Lenin, 54')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (163, N'Lucaciu', N'Raul', CAST(N'2000-04-23' AS Date), N'mun. Chi?inau, str. Uzinelor, 88')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (164, N'Lucaciu', N'Alexandru', CAST(N'1999-11-13' AS Date), N'or. Ceadir-Lunga, str. Lenin, 54')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (165, N'Lucasu', N'Victor', CAST(N'2000-04-21' AS Date), N'mun. Chisinau, str. Ismail, 33')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (166, N'Marcu', N'Daniel', CAST(N'2000-03-11' AS Date), N'mun. Chisinau, str. M. Basarab, 5/1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (167, N'Marin', N'Stefan', CAST(N'2000-11-10' AS Date), N'mun. Chisinau, str. Alba Iulia, 206')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (168, N'Martis', N'Dan', CAST(N'1998-08-08' AS Date), N'mun. Chisinau, bd. Mircea cel Batrin, 32/10')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (169, N'Matko', N'Mihai', CAST(N'1999-09-26' AS Date), N'mun. Chisinau, str. Maria Dragan, 4/1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (170, N'Maxim', N'Tudor', CAST(N'2000-01-17' AS Date), N'mun. Chisinau, bd. Dacia, 5/4')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (171, N'Matasari', N'Alexandru', CAST(N'2000-05-15' AS Date), N'mun. Chisinau, str. Albi?oara, 78/6')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (172, N'Mazareanu', N'Sergiu', CAST(N'1995-02-23' AS Date), N'mun. Chi?inau, str. Calea Orheiului, 107/1')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (173, N'Medrea', N'Diana', CAST(N'2000-06-09' AS Date), N'mun. Chisinau, or. Vadul lui Voda, str. Stefan cel Mare, 38')
GO
INSERT [dbo].[studenti] ([Id_Student], [Nume_Student], [Prenume_Student], [Data_Nastere_Student], [Adresa_Postala_Student]) VALUES (174, N'Mesesan', N'Maria', CAST(N'2000-05-07' AS Date), N'mun. Chisinau, str. Bogdan Voevod, 1/1')
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 105, 110, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 105, 110, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 105, 110, 1, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 105, 110, 1, N'Testul 2', 9, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 107, 101, 1, N'Examen', 6, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 107, 101, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 107, 101, 1, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 108, 101, 1, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 108, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 108, 101, 1, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 108, 101, 1, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 110, 131, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 110, 131, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 110, 131, 1, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 110, 131, 1, N'Testul 2', 2, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 111, 126, 1, N'Examen', 6, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 111, 126, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 111, 126, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 111, 126, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 113, 104, 1, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 113, 104, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 113, 104, 1, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 116, 102, 1, N'Testul 1', 6, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 116, 102, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 117, 108, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 117, 108, 1, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 117, 108, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 118, 118, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 118, 118, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 118, 118, 1, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 118, 118, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 119, 117, 1, N'Examen', 9, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 119, 117, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 119, 117, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (100, 119, 117, 1, N'Testul 2', 6, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 105, 110, 1, N'Examen', 4, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 105, 110, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 105, 110, 1, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 105, 110, 1, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 107, 101, 1, N'Examen', 2, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 107, 101, 1, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 107, 101, 1, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 108, 101, 1, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 108, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 108, 101, 1, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 108, 101, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 110, 131, 1, N'Examen', 4, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 110, 131, 1, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 110, 131, 1, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 110, 131, 1, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 111, 126, 1, N'Examen', 3, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 111, 126, 1, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 111, 126, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 111, 126, 1, N'Testul 2', 2, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 113, 104, 1, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 113, 104, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 113, 104, 1, N'Testul 1', 4, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 113, 104, 1, N'Testul 2', 4, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 116, 102, 1, N'Testul 1', 7, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 116, 102, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 117, 108, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 117, 108, 1, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 117, 108, 1, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 117, 108, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 118, 118, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 118, 118, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 119, 117, 1, N'Examen', 5, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 119, 117, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (101, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 105, 110, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 105, 110, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 105, 110, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 105, 110, 1, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 107, 101, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 107, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 107, 101, 1, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 108, 101, 1, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 108, 101, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 108, 101, 1, N'Testul 1', 8, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 108, 101, 1, N'Testul 2', 4, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 110, 131, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 110, 131, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 110, 131, 1, N'Testul 1', 10, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 110, 131, 1, N'Testul 2', 2, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 111, 126, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 111, 126, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 113, 104, 1, N'Examen', 2, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 113, 104, 1, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 113, 104, 1, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 113, 104, 1, N'Testul 2', 3, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 116, 102, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 116, 102, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 116, 102, 1, N'Testul 1', 5, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 117, 108, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 117, 108, 1, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 117, 108, 1, N'Testul 1', 3, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 117, 108, 1, N'Testul 2', 2, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 118, 118, 1, N'Examen', 3, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 118, 118, 1, N'Reusita curenta', 3, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 118, 118, 1, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 118, 118, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 119, 117, 1, N'Examen', 4, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 119, 117, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 119, 117, 1, N'Testul 1', 4, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (102, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 105, 110, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 105, 110, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 105, 110, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 105, 110, 1, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 107, 101, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 107, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 107, 101, 1, N'Testul 2', 10, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 108, 101, 1, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 108, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 108, 101, 1, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 108, 101, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 110, 131, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 110, 131, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 110, 131, 1, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 110, 131, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 111, 126, 1, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 111, 126, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 111, 126, 1, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 113, 104, 1, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 113, 104, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 113, 104, 1, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 113, 104, 1, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 116, 102, 1, N'Testul 1', 7, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 116, 102, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 117, 108, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 117, 108, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 118, 118, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 118, 118, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 118, 118, 1, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 118, 118, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 119, 117, 1, N'Examen', 9, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 119, 117, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 119, 117, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (103, 119, 117, 1, N'Testul 2', 8, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 105, 110, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 105, 110, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 105, 110, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 105, 110, 1, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 107, 101, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 107, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 107, 101, 1, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 108, 101, 1, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 108, 101, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 108, 101, 1, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 108, 101, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 110, 131, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 110, 131, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 110, 131, 1, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 110, 131, 1, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 111, 126, 1, N'Examen', 10, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 111, 126, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 111, 126, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 113, 104, 1, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 113, 104, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 113, 104, 1, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 113, 104, 1, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 116, 102, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 116, 102, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 116, 102, 1, N'Testul 1', 5, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 116, 102, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 117, 108, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 117, 108, 1, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 118, 118, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 118, 118, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 118, 118, 1, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 118, 118, 1, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 119, 117, 1, N'Examen', 10, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 119, 117, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 119, 117, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (104, 119, 117, 1, N'Testul 2', 9, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 105, 110, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 105, 110, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 105, 110, 1, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 105, 110, 1, N'Testul 2', 9, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 107, 101, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 107, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 107, 101, 1, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 107, 101, 1, N'Testul 2', 9, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 108, 101, 1, N'Examen', 3, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 108, 101, 1, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 108, 101, 1, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 108, 101, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 110, 131, 1, N'Examen', 3, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 110, 131, 1, N'Reusita curenta', 3, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 110, 131, 1, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 110, 131, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 111, 126, 1, N'Examen', 10, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 111, 126, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 111, 126, 1, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 111, 126, 1, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 113, 104, 1, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 113, 104, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 113, 104, 1, N'Testul 1', 10, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 116, 102, 1, N'Testul 1', 9, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 117, 108, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 117, 108, 1, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 117, 108, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 118, 118, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 118, 118, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 118, 118, 1, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 118, 118, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 119, 117, 1, N'Examen', 10, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 119, 117, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 119, 117, 1, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (105, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 105, 110, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 105, 110, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 105, 110, 1, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 105, 110, 1, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 107, 101, 1, N'Examen', 6, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 107, 101, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 107, 101, 1, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 107, 101, 1, N'Testul 2', 10, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 108, 101, 1, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 108, 101, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 108, 101, 1, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 108, 101, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 110, 131, 1, N'Examen', 2, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 110, 131, 1, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 110, 131, 1, N'Testul 1', 4, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 110, 131, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 111, 126, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 111, 126, 1, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 113, 104, 1, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 113, 104, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 113, 104, 1, N'Testul 1', 10, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 116, 102, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 116, 102, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 116, 102, 1, N'Testul 1', 10, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 116, 102, 1, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 117, 108, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 117, 108, 1, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 117, 108, 1, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 117, 108, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 118, 118, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 118, 118, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 118, 118, 1, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 119, 117, 1, N'Examen', 6, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 119, 117, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 119, 117, 1, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (106, 119, 117, 1, N'Testul 2', 8, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 105, 110, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 105, 110, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 105, 110, 1, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 105, 110, 1, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 107, 101, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 107, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 107, 101, 1, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 107, 101, 1, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 108, 101, 1, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 108, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 108, 101, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 110, 131, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 110, 131, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 110, 131, 1, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 110, 131, 1, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 111, 126, 1, N'Examen', NULL, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 111, 126, 1, N'Reusita curenta', NULL, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 111, 126, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 113, 104, 1, N'Examen', 2, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 113, 104, 1, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 113, 104, 1, N'Testul 1', 8, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 113, 104, 1, N'Testul 2', 2, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 116, 102, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 116, 102, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 116, 102, 1, N'Testul 1', 7, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 117, 108, 1, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 118, 118, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 118, 118, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 118, 118, 1, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 119, 117, 1, N'Examen', 8, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 119, 117, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (107, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 105, 110, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 105, 110, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 105, 110, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 105, 110, 1, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 107, 101, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 107, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 107, 101, 1, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 108, 101, 1, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 108, 101, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 108, 101, 1, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 110, 131, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 110, 131, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 110, 131, 1, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 110, 131, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 111, 126, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 111, 126, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 113, 104, 1, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 113, 104, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 113, 104, 1, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 116, 102, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 116, 102, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 116, 102, 1, N'Testul 1', 9, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 117, 108, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 117, 108, 1, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 117, 108, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 118, 118, 1, N'Examen', 4, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 118, 118, 1, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 118, 118, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 119, 117, 1, N'Examen', 7, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 119, 117, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (108, 119, 117, 1, N'Testul 2', 5, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 105, 110, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 105, 110, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 105, 110, 1, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 107, 101, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 107, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 107, 101, 1, N'Testul 1', 3, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 107, 101, 1, N'Testul 2', 2, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 108, 101, 1, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 108, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 108, 101, 1, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 110, 131, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 110, 131, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 110, 131, 1, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 110, 131, 1, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 111, 126, 1, N'Examen', 5, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 111, 126, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 111, 126, 1, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 113, 104, 1, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 113, 104, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 113, 104, 1, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 113, 104, 1, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 116, 102, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 116, 102, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 116, 102, 1, N'Testul 1', 8, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 116, 102, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 118, 118, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 118, 118, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 118, 118, 1, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 118, 118, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 119, 117, 1, N'Examen', 6, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 119, 117, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 119, 117, 1, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (109, 119, 117, 1, N'Testul 2', 10, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 105, 110, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 105, 110, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 105, 110, 1, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 107, 101, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 107, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 107, 101, 1, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 107, 101, 1, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 108, 101, 1, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 108, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 108, 101, 1, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 108, 101, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 110, 131, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 110, 131, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 110, 131, 1, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 110, 131, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 111, 126, 1, N'Examen', 9, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 111, 126, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 111, 126, 1, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 111, 126, 1, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 113, 104, 1, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 113, 104, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 113, 104, 1, N'Testul 1', 1, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 113, 104, 1, N'Testul 2', 3, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 116, 102, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 116, 102, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 116, 102, 1, N'Testul 1', 5, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 116, 102, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 117, 108, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 117, 108, 1, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 117, 108, 1, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 117, 108, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 118, 118, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 118, 118, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 118, 118, 1, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 118, 118, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 119, 117, 1, N'Examen', 9, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 119, 117, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 119, 117, 1, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (110, 119, 117, 1, N'Testul 2', 8, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 105, 110, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 105, 110, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 105, 110, 1, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 107, 101, 1, N'Examen', 3, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 107, 101, 1, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 107, 101, 1, N'Testul 1', 3, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 107, 101, 1, N'Testul 2', 4, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 108, 101, 1, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 108, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 108, 101, 1, N'Testul 1', 3, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 108, 101, 1, N'Testul 2', 4, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 110, 131, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 110, 131, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 110, 131, 1, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 110, 131, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 111, 126, 1, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 111, 126, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 111, 126, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 113, 104, 1, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 113, 104, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 113, 104, 1, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 113, 104, 1, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 116, 102, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 116, 102, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 116, 102, 1, N'Testul 1', 10, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 116, 102, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 117, 108, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 117, 108, 1, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 117, 108, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 117, 108, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 118, 118, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 118, 118, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 118, 118, 1, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 118, 118, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 119, 117, 1, N'Examen', 5, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 119, 117, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (111, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 105, 110, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 105, 110, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 105, 110, 1, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 105, 110, 1, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 107, 101, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 107, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 107, 101, 1, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 108, 101, 1, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 108, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 108, 101, 1, N'Testul 1', 8, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 108, 101, 1, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 110, 131, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 110, 131, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 110, 131, 1, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 110, 131, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 111, 126, 1, N'Examen', 10, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 111, 126, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 111, 126, 1, N'Testul 1', 4, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 113, 104, 1, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 113, 104, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 113, 104, 1, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 113, 104, 1, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 116, 102, 1, N'Examen', 4, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 116, 102, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 116, 102, 1, N'Testul 1', 1, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 116, 102, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 117, 108, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 117, 108, 1, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 117, 108, 1, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 118, 118, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 118, 118, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 118, 118, 1, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 118, 118, 1, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 119, 117, 1, N'Examen', 7, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 119, 117, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 119, 117, 1, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (112, 119, 117, 1, N'Testul 2', 6, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 105, 110, 1, N'Examen', 3, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 105, 110, 1, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 105, 110, 1, N'Testul 1', 3, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 105, 110, 1, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 107, 101, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 107, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 107, 101, 1, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 108, 101, 1, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 108, 101, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 108, 101, 1, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 108, 101, 1, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 110, 131, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 110, 131, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 110, 131, 1, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 110, 131, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 111, 126, 1, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 111, 126, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 111, 126, 1, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 111, 126, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 113, 104, 1, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 113, 104, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 113, 104, 1, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 113, 104, 1, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 116, 102, 1, N'Examen', 4, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 116, 102, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 116, 102, 1, N'Testul 1', 5, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 116, 102, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 117, 108, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 117, 108, 1, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 117, 108, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 117, 108, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 118, 118, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 118, 118, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 118, 118, 1, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 118, 118, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 119, 117, 1, N'Examen', 6, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 119, 117, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 119, 117, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (113, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 105, 110, 1, N'Examen', 2, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 105, 110, 1, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 105, 110, 1, N'Testul 1', 1, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 105, 110, 1, N'Testul 2', 2, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 107, 101, 1, N'Examen', 6, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 107, 101, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 107, 101, 1, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 107, 101, 1, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 108, 101, 1, N'Examen', 3, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 108, 101, 1, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 108, 101, 1, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 108, 101, 1, N'Testul 2', 3, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 110, 131, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 110, 131, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 110, 131, 1, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 111, 126, 1, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 111, 126, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 111, 126, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 111, 126, 1, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 113, 104, 1, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 113, 104, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 113, 104, 1, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 113, 104, 1, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 116, 102, 1, N'Examen', 10, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 116, 102, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 116, 102, 1, N'Testul 1', 6, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 116, 102, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 117, 108, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 118, 118, 1, N'Examen', 3, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 118, 118, 1, N'Reusita curenta', 3, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 118, 118, 1, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 118, 118, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 119, 117, 1, N'Examen', 6, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 119, 117, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 119, 117, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (114, 119, 117, 1, N'Testul 2', 10, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 105, 110, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 105, 110, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 105, 110, 1, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 105, 110, 1, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 107, 101, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 107, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 107, 101, 1, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 108, 101, 1, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 108, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 108, 101, 1, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 108, 101, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 110, 131, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 110, 131, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 110, 131, 1, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 110, 131, 1, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 111, 126, 1, N'Examen', 6, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 111, 126, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 111, 126, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 111, 126, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 113, 104, 1, N'Examen', 2, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 113, 104, 1, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 113, 104, 1, N'Testul 1', 2, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 116, 102, 1, N'Testul 1', 8, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 117, 108, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 117, 108, 1, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 117, 108, 1, N'Testul 1', 4, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 117, 108, 1, N'Testul 2', 4, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 118, 118, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 118, 118, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 118, 118, 1, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 119, 117, 1, N'Examen', 10, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 119, 117, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (115, 119, 117, 1, N'Testul 2', 6, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 105, 110, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 105, 110, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 105, 110, 1, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 107, 101, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 107, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 108, 101, 1, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 108, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 108, 101, 1, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 108, 101, 1, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 110, 131, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 110, 131, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 110, 131, 1, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 110, 131, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 111, 126, 1, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 111, 126, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 111, 126, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 111, 126, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 113, 104, 1, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 113, 104, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 113, 104, 1, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 113, 104, 1, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 116, 102, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 116, 102, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 116, 102, 1, N'Testul 1', 6, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 117, 108, 1, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 118, 118, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 118, 118, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 118, 118, 1, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 119, 117, 1, N'Examen', 8, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 119, 117, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (116, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 105, 110, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 105, 110, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 105, 110, 1, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 105, 110, 1, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 107, 101, 1, N'Examen', 10, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 107, 101, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 107, 101, 1, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 108, 101, 1, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 108, 101, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 108, 101, 1, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 110, 131, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 110, 131, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 110, 131, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 111, 126, 1, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 111, 126, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 113, 104, 1, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 113, 104, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 113, 104, 1, N'Testul 1', 1, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 113, 104, 1, N'Testul 2', 4, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 116, 102, 1, N'Examen', 6, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 116, 102, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 116, 102, 1, N'Testul 1', 7, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 116, 102, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 117, 108, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 117, 108, 1, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 117, 108, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 118, 118, 1, N'Examen', 2, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 118, 118, 1, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 118, 118, 1, N'Testul 1', 4, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 119, 117, 1, N'Examen', 7, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 119, 117, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (117, 119, 117, 1, N'Testul 2', 8, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 105, 110, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 105, 110, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 105, 110, 1, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 107, 101, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 107, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 107, 101, 1, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 107, 101, 1, N'Testul 2', 10, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 108, 101, 1, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 108, 101, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 108, 101, 1, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 108, 101, 1, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 110, 131, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 110, 131, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 110, 131, 1, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 110, 131, 1, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 111, 126, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 111, 126, 1, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 113, 104, 1, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 113, 104, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 113, 104, 1, N'Testul 1', 10, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 113, 104, 1, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 116, 102, 1, N'Examen', 5, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 116, 102, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 116, 102, 1, N'Testul 1', 5, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 117, 108, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 117, 108, 1, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 117, 108, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 118, 118, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 118, 118, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 118, 118, 1, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 119, 117, 1, N'Examen', 5, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 119, 117, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 119, 117, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (118, 119, 117, 1, N'Testul 2', 7, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 105, 110, 1, N'Examen', 3, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 105, 110, 1, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 105, 110, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 105, 110, 1, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 107, 101, 1, N'Examen', 2, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 107, 101, 1, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 107, 101, 1, N'Testul 1', 2, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 108, 101, 1, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 108, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 108, 101, 1, N'Testul 1', 10, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 108, 101, 1, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 110, 131, 1, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 110, 131, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 110, 131, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 111, 126, 1, N'Examen', 5, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 111, 126, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 111, 126, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 111, 126, 1, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 113, 104, 1, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 113, 104, 1, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 113, 104, 1, N'Testul 1', 10, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 116, 102, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 116, 102, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 116, 102, 1, N'Testul 1', 1, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 116, 102, 1, N'Testul 2', 2, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 117, 108, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 117, 108, 1, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 117, 108, 1, N'Testul 1', 1, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 117, 108, 1, N'Testul 2', 3, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 118, 118, 1, N'Examen', 2, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 118, 118, 1, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 118, 118, 1, N'Testul 1', 4, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 118, 118, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 119, 117, 1, N'Examen', 7, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 119, 117, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 119, 117, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (119, 119, 117, 1, N'Testul 2', 10, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 105, 110, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 105, 110, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 105, 110, 1, N'Testul 2', 9, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 107, 101, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 107, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 107, 101, 1, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 107, 101, 1, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 108, 101, 1, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 108, 101, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 108, 101, 1, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 110, 131, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 110, 131, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 110, 131, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 111, 126, 1, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 111, 126, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 111, 126, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 111, 126, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 113, 104, 1, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 113, 104, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 113, 104, 1, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 113, 104, 1, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 116, 102, 1, N'Testul 1', 7, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 117, 108, 1, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 118, 118, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 118, 118, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 119, 117, 1, N'Examen', 5, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 119, 117, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 119, 117, 1, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (120, 119, 117, 1, N'Testul 2', 5, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 105, 110, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 105, 110, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 105, 110, 1, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 107, 101, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 107, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 107, 101, 1, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 107, 101, 1, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 108, 101, 1, N'Examen', 2, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 108, 101, 1, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 108, 101, 1, N'Testul 1', 2, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 108, 101, 1, N'Testul 2', 3, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 110, 131, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 110, 131, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 110, 131, 1, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 111, 126, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 111, 126, 1, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 113, 104, 1, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 113, 104, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 113, 104, 1, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 113, 104, 1, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 116, 102, 1, N'Examen', 8, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 116, 102, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 116, 102, 1, N'Testul 1', 6, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 117, 108, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 117, 108, 1, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 117, 108, 1, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 118, 118, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 118, 118, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 118, 118, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 119, 117, 1, N'Examen', 6, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 119, 117, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 119, 117, 1, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (121, 119, 117, 1, N'Testul 2', 9, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 105, 110, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 105, 110, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 105, 110, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 105, 110, 1, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 107, 101, 1, N'Examen', 9, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 107, 101, 1, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 107, 101, 1, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 107, 101, 1, N'Testul 2', 9, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 108, 101, 1, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 108, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 108, 101, 1, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 110, 131, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 110, 131, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 110, 131, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 111, 126, 1, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 111, 126, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 111, 126, 1, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 111, 126, 1, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 113, 104, 1, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 113, 104, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 113, 104, 1, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 113, 104, 1, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 116, 102, 1, N'Examen', 6, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 116, 102, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 116, 102, 1, N'Testul 1', 9, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 117, 108, 1, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 117, 108, 1, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 118, 118, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 118, 118, 1, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 118, 118, 1, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 118, 118, 1, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 119, 117, 1, N'Examen', 7, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 119, 117, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 119, 117, 1, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (122, 119, 117, 1, N'Testul 2', 10, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 105, 110, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 105, 110, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 105, 110, 1, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 105, 110, 1, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 107, 101, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 107, 101, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 107, 101, 1, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 108, 101, 1, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 108, 101, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 108, 101, 1, N'Testul 1', 8, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 108, 101, 1, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 110, 131, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 110, 131, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 110, 131, 1, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 110, 131, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 111, 126, 1, N'Examen', 5, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 111, 126, 1, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 111, 126, 1, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 111, 126, 1, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 113, 104, 1, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 113, 104, 1, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 113, 104, 1, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 113, 104, 1, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 116, 102, 1, N'Examen', 7, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 116, 102, 1, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 116, 102, 1, N'Testul 1', 9, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 117, 108, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 117, 108, 1, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 117, 108, 1, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 117, 108, 1, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 118, 118, 1, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 118, 118, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 118, 118, 1, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 119, 117, 1, N'Examen', 6, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 119, 117, 1, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (123, 119, 117, 1, N'Testul 2', 10, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 105, 110, 1, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 105, 110, 1, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 105, 110, 1, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 105, 110, 1, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 107, 101, 1, N'Examen', 10, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 107, 101, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 107, 101, 1, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 107, 101, 1, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 108, 101, 1, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 108, 101, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 108, 101, 1, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 108, 101, 1, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 110, 131, 1, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 110, 131, 1, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 110, 131, 1, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 110, 131, 1, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 111, 126, 1, N'Examen', 10, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 111, 126, 1, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 111, 126, 1, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 111, 126, 1, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 113, 104, 1, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 113, 104, 1, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 113, 104, 1, N'Testul 1', 1, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 113, 104, 1, N'Testul 2', 2, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 116, 102, 1, N'Examen', 2, CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 116, 102, 1, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 116, 102, 1, N'Testul 1', 10, CAST(N'2017-10-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 116, 102, 1, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 117, 108, 1, N'Examen', 4, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 117, 108, 1, N'Reusita curenta', 4, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 117, 108, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 117, 108, 1, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 118, 118, 1, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 118, 118, 1, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 118, 118, 1, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 118, 118, 1, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 119, 117, 1, N'Examen', 4, CAST(N'2018-01-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 119, 117, 1, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 119, 117, 1, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (124, 119, 117, 1, N'Testul 2', 10, CAST(N'2017-12-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 100, 100, 3, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 100, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 100, 100, 3, N'Testul 2', 4, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 101, 104, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 101, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 101, 104, 3, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 101, 104, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 103, 100, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 104, 100, 3, N'Examen', 5, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 104, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 107, 101, 3, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 107, 101, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 107, 101, 3, N'Testul 1', 8, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 107, 101, 3, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 108, 108, 3, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 108, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 108, 108, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 108, 108, 3, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 109, 109, 3, N'Testul 1', 9, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 109, 109, 3, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 114, 105, 3, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 114, 105, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 117, 108, 3, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 118, 128, 3, N'Examen', 4, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 118, 128, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 118, 128, 3, N'Testul 2', 4, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 119, 117, 3, N'Examen', 2, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 119, 117, 3, N'Reusita curenta', 2, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 119, 117, 3, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 119, 117, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 120, 116, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 120, 116, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 120, 116, 3, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (125, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 100, 100, 3, N'Examen', 4, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 100, 100, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 101, 104, 3, N'Examen', 4, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 101, 104, 3, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 101, 104, 3, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 101, 104, 3, N'Testul 2', 4, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 103, 100, 3, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 103, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 103, 100, 3, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 103, 100, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 104, 100, 3, N'Examen', 6, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 104, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 104, 100, 3, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 106, 104, 3, N'Examen', 2, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 106, 104, 3, N'Reusita curenta', 2, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 107, 101, 3, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 108, 108, 3, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 108, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 108, 108, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 108, 108, 3, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 109, 109, 3, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 109, 109, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 109, 109, 3, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 114, 105, 3, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 114, 105, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 114, 105, 3, N'Testul 2', 9, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 117, 108, 3, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 118, 128, 3, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 118, 128, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 118, 128, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 118, 128, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 119, 117, 3, N'Examen', 9, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 119, 117, 3, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 119, 117, 3, N'Testul 2', 9, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 120, 116, 3, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 120, 116, 3, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 120, 116, 3, N'Testul 1', 2, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (126, 120, 116, 3, N'Testul 2', 3, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 100, 100, 3, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 100, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 100, 100, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 101, 104, 3, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 101, 104, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 101, 104, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 103, 100, 3, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 103, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 103, 100, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 103, 100, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 104, 100, 3, N'Examen', 10, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 104, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 106, 104, 3, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 106, 104, 3, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 106, 104, 3, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 107, 101, 3, N'Examen', 9, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 107, 101, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 108, 108, 3, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 108, 108, 3, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 108, 108, 3, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 108, 108, 3, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 109, 109, 3, N'Testul 1', 5, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 109, 109, 3, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 114, 105, 3, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 114, 105, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 114, 105, 3, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 114, 105, 3, N'Testul 2', 9, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 117, 108, 3, N'Examen', 5, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 117, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 117, 108, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 117, 108, 3, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 118, 128, 3, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 118, 128, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 118, 128, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 119, 117, 3, N'Testul 2', 9, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 120, 116, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 120, 116, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 120, 116, 3, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (127, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 100, 100, 3, N'Examen', 3, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 100, 100, 3, N'Reusita curenta', 3, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 101, 104, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 101, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 101, 104, 3, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 101, 104, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 103, 100, 3, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 103, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 103, 100, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 103, 100, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 104, 100, 3, N'Examen', 9, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 104, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 104, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 106, 104, 3, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 106, 104, 3, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 106, 104, 3, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 106, 104, 3, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 107, 101, 3, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 107, 101, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 107, 101, 3, N'Testul 1', 7, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 107, 101, 3, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 108, 108, 3, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 108, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 108, 108, 3, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 108, 108, 3, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 109, 109, 3, N'Examen', 9, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 109, 109, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 109, 109, 3, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 114, 105, 3, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 114, 105, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 114, 105, 3, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 117, 108, 3, N'Examen', 6, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 117, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 117, 108, 3, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 118, 128, 3, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 118, 128, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 118, 128, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 119, 117, 3, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 119, 117, 3, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 119, 117, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 120, 116, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 120, 116, 3, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 120, 116, 3, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (128, 120, 116, 3, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 100, 100, 3, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 100, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 100, 100, 3, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 101, 104, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 101, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 101, 104, 3, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 101, 104, 3, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 103, 100, 3, N'Examen', 2, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 103, 100, 3, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 103, 100, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 103, 100, 3, N'Testul 2', 4, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 104, 100, 3, N'Examen', 2, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 104, 100, 3, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 104, 100, 3, N'Testul 1', 2, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 104, 100, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 106, 104, 3, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 106, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 107, 101, 3, N'Testul 1', 10, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 108, 108, 3, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 108, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 108, 108, 3, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 108, 108, 3, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 109, 109, 3, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 109, 109, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 109, 109, 3, N'Testul 1', 9, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 109, 109, 3, N'Testul 2', 4, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 114, 105, 3, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 114, 105, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 117, 108, 3, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 118, 128, 3, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 118, 128, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 119, 117, 3, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 119, 117, 3, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 120, 116, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 120, 116, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (129, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 100, 100, 3, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 100, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 101, 104, 3, N'Testul 2', 2, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 103, 100, 3, N'Examen', 4, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 103, 100, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 103, 100, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 104, 100, 3, N'Examen', 6, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 104, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 106, 104, 3, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 106, 104, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 106, 104, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 106, 104, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 107, 101, 3, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 107, 101, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 108, 108, 3, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 108, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 108, 108, 3, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 108, 108, 3, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 109, 109, 3, N'Testul 1', 5, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 114, 105, 3, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 114, 105, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 114, 105, 3, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 114, 105, 3, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 117, 108, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 117, 108, 3, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 118, 128, 3, N'Examen', 2, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 118, 128, 3, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 118, 128, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 118, 128, 3, N'Testul 2', 4, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 119, 117, 3, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 119, 117, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 119, 117, 3, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 119, 117, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 120, 116, 3, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (130, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 100, 100, 3, N'Examen', 2, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 100, 100, 3, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 100, 100, 3, N'Testul 1', 1, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 100, 100, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 101, 104, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 101, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 101, 104, 3, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 101, 104, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 103, 100, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 104, 100, 3, N'Examen', 9, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 104, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 104, 100, 3, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 106, 104, 3, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 106, 104, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 106, 104, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 107, 101, 3, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 107, 101, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 107, 101, 3, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 108, 108, 3, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 108, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 108, 108, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 108, 108, 3, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 109, 109, 3, N'Testul 1', 10, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 114, 105, 3, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 114, 105, 3, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 114, 105, 3, N'Testul 1', 1, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 114, 105, 3, N'Testul 2', 3, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 117, 108, 3, N'Examen', NULL, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 117, 108, 3, N'Reusita curenta', NULL, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 117, 108, 3, N'Testul 1', 3, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 117, 108, 3, N'Testul 2', 4, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 118, 128, 3, N'Examen', 4, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 118, 128, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 118, 128, 3, N'Testul 1', 4, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 119, 117, 3, N'Examen', 9, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 119, 117, 3, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 119, 117, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 120, 116, 3, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 120, 116, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 120, 116, 3, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (131, 120, 116, 3, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 100, 100, 3, N'Examen', 5, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 100, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 100, 100, 3, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 100, 100, 3, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 101, 104, 3, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 101, 104, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 103, 100, 3, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 103, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 103, 100, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 103, 100, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 104, 100, 3, N'Examen', 10, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 104, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 104, 100, 3, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 104, 100, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 106, 104, 3, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 106, 104, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 106, 104, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 106, 104, 3, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 107, 101, 3, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 107, 101, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 107, 101, 3, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 108, 108, 3, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 108, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 108, 108, 3, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 108, 108, 3, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 109, 109, 3, N'Examen', 9, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 109, 109, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 109, 109, 3, N'Testul 1', 5, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 109, 109, 3, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 114, 105, 3, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 114, 105, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 114, 105, 3, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 114, 105, 3, N'Testul 2', 8, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 117, 108, 3, N'Examen', 10, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 117, 108, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 117, 108, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 117, 108, 3, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 118, 128, 3, N'Examen', 5, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 118, 128, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 118, 128, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 118, 128, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 119, 117, 3, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 119, 117, 3, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 119, 117, 3, N'Testul 2', 6, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 120, 116, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 120, 116, 3, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 120, 116, 3, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (132, 120, 116, 3, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 100, 100, 3, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 100, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 101, 104, 3, N'Examen', 6, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 101, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 101, 104, 3, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 101, 104, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 103, 100, 3, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 104, 100, 3, N'Examen', 5, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 104, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 104, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 104, 100, 3, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 106, 104, 3, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 106, 104, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 106, 104, 3, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 106, 104, 3, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 107, 101, 3, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 107, 101, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 108, 108, 3, N'Examen', 4, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 108, 108, 3, N'Reusita curenta', 4, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 108, 108, 3, N'Testul 1', 1, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 108, 108, 3, N'Testul 2', 2, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 109, 109, 3, N'Examen', 9, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 109, 109, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 109, 109, 3, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 114, 105, 3, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 114, 105, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 117, 108, 3, N'Examen', 10, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 117, 108, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 117, 108, 3, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 118, 128, 3, N'Examen', 5, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 118, 128, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 119, 117, 3, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 119, 117, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 120, 116, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 120, 116, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 120, 116, 3, N'Testul 1', 10, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (133, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 100, 100, 3, N'Examen', 5, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 100, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 100, 100, 3, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 100, 100, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 101, 104, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 103, 100, 3, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 103, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 103, 100, 3, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 104, 100, 3, N'Examen', 8, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 104, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 106, 104, 3, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 106, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 106, 104, 3, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 107, 101, 3, N'Testul 1', 7, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 107, 101, 3, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 108, 108, 3, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 108, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 108, 108, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 108, 108, 3, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 109, 109, 3, N'Examen', 6, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 109, 109, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 109, 109, 3, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 114, 105, 3, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 114, 105, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 114, 105, 3, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 114, 105, 3, N'Testul 2', 6, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 117, 108, 3, N'Examen', 6, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 117, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 117, 108, 3, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 118, 128, 3, N'Examen', 9, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 118, 128, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 118, 128, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 118, 128, 3, N'Testul 2', 8, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 119, 117, 3, N'Testul 1', 8, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 119, 117, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 120, 116, 3, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (134, 120, 116, 3, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 100, 100, 3, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 100, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 101, 104, 3, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 101, 104, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 101, 104, 3, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 101, 104, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 103, 100, 3, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 103, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 103, 100, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 103, 100, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 104, 100, 3, N'Examen', 7, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 104, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 106, 104, 3, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 106, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 107, 101, 3, N'Examen', 4, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 107, 101, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 107, 101, 3, N'Testul 1', 7, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 107, 101, 3, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 108, 108, 3, N'Examen', 3, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 108, 108, 3, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 108, 108, 3, N'Testul 1', 3, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 108, 108, 3, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 109, 109, 3, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 114, 105, 3, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 114, 105, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 117, 108, 3, N'Examen', 5, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 117, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 117, 108, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 117, 108, 3, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 118, 128, 3, N'Examen', 3, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 118, 128, 3, N'Reusita curenta', 3, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 118, 128, 3, N'Testul 1', 1, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 119, 117, 3, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 119, 117, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 119, 117, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 120, 116, 3, N'Examen', 4, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 120, 116, 3, N'Reusita curenta', 4, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (135, 120, 116, 3, N'Testul 2', 3, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 100, 100, 3, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 100, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 101, 104, 3, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 101, 104, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 103, 100, 3, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 103, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 103, 100, 3, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 104, 100, 3, N'Examen', 7, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 104, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 106, 104, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 108, 108, 3, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 108, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 108, 108, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 108, 108, 3, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 114, 105, 3, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 114, 105, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 114, 105, 3, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 117, 108, 3, N'Examen', 8, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 117, 108, 3, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 117, 108, 3, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 117, 108, 3, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 118, 128, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 118, 128, 3, N'Testul 2', 6, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 119, 117, 3, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 119, 117, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 119, 117, 3, N'Testul 2', 6, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 120, 116, 3, N'Examen', 6, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 120, 116, 3, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (136, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 100, 100, 3, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 100, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 101, 104, 3, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 103, 100, 3, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 103, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 103, 100, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 104, 100, 3, N'Examen', 8, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 104, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 104, 100, 3, N'Testul 1', 3, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 104, 100, 3, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 106, 104, 3, N'Examen', 9, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 106, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 107, 101, 3, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 107, 101, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 107, 101, 3, N'Testul 1', 7, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 107, 101, 3, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 108, 108, 3, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 108, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 108, 108, 3, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 108, 108, 3, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 109, 109, 3, N'Examen', 10, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 109, 109, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 109, 109, 3, N'Testul 1', 9, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 109, 109, 3, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 114, 105, 3, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 114, 105, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 114, 105, 3, N'Testul 2', 10, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 117, 108, 3, N'Examen', 5, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 117, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 117, 108, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 117, 108, 3, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 118, 128, 3, N'Testul 2', 9, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 119, 117, 3, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 119, 117, 3, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 119, 117, 3, N'Testul 1', 8, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 119, 117, 3, N'Testul 2', 9, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 120, 116, 3, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 120, 116, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 120, 116, 3, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (137, 120, 116, 3, N'Testul 2', 9, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 100, 100, 3, N'Examen', 10, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 100, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 100, 100, 3, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 100, 100, 3, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 101, 104, 3, N'Examen', 6, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 101, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 101, 104, 3, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 101, 104, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 103, 100, 3, N'Examen', 10, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 103, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 103, 100, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 103, 100, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 104, 100, 3, N'Examen', 5, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 104, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 104, 100, 3, N'Testul 1', 1, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 104, 100, 3, N'Testul 2', 2, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 106, 104, 3, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 106, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 106, 104, 3, N'Testul 1', 4, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 106, 104, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 107, 101, 3, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 107, 101, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 108, 108, 3, N'Examen', 4, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 108, 108, 3, N'Reusita curenta', 4, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 108, 108, 3, N'Testul 1', 3, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 108, 108, 3, N'Testul 2', 4, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 109, 109, 3, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 109, 109, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 109, 109, 3, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 114, 105, 3, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 114, 105, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 114, 105, 3, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 117, 108, 3, N'Examen', 6, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 117, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 117, 108, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 117, 108, 3, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 118, 128, 3, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 118, 128, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 118, 128, 3, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 118, 128, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 119, 117, 3, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 119, 117, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 120, 116, 3, N'Examen', 4, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 120, 116, 3, N'Reusita curenta', 4, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (138, 120, 116, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 100, 100, 3, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 100, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 100, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 100, 100, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 101, 104, 3, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 101, 104, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 101, 104, 3, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 101, 104, 3, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 103, 100, 3, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 103, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 103, 100, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 104, 100, 3, N'Examen', 9, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 104, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 104, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 104, 100, 3, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 107, 101, 3, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 107, 101, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 107, 101, 3, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 108, 108, 3, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 108, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 108, 108, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 108, 108, 3, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 109, 109, 3, N'Examen', 4, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 109, 109, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 109, 109, 3, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 114, 105, 3, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 114, 105, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 114, 105, 3, N'Testul 2', 10, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 117, 108, 3, N'Examen', 6, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 117, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 117, 108, 3, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 118, 128, 3, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 118, 128, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 118, 128, 3, N'Testul 2', 10, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 119, 117, 3, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 119, 117, 3, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 119, 117, 3, N'Testul 2', 8, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (139, 120, 116, 3, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 100, 100, 3, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 100, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 100, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 100, 100, 3, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 101, 104, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 101, 104, 3, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 101, 104, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 103, 100, 3, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 104, 100, 3, N'Examen', 9, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 104, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 104, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 104, 100, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 106, 104, 3, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 106, 104, 3, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 106, 104, 3, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 107, 101, 3, N'Testul 1', 10, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 108, 108, 3, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 108, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 108, 108, 3, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 108, 108, 3, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 109, 109, 3, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 109, 109, 3, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 114, 105, 3, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 114, 105, 3, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 114, 105, 3, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 117, 108, 3, N'Examen', 9, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 117, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 117, 108, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 117, 108, 3, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 118, 128, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 118, 128, 3, N'Testul 2', 8, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 119, 117, 3, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 119, 117, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 120, 116, 3, N'Examen', 6, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 120, 116, 3, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 120, 116, 3, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (140, 120, 116, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 100, 100, 3, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 100, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 100, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 100, 100, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 101, 104, 3, N'Examen', 4, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 101, 104, 3, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 101, 104, 3, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 101, 104, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 103, 100, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 103, 100, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 104, 100, 3, N'Examen', 8, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 104, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 104, 100, 3, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 104, 100, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 106, 104, 3, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 107, 101, 3, N'Testul 1', 10, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 107, 101, 3, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 108, 108, 3, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 108, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 108, 108, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 108, 108, 3, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 109, 109, 3, N'Examen', 9, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 109, 109, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 109, 109, 3, N'Testul 1', 5, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 109, 109, 3, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 114, 105, 3, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 114, 105, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 114, 105, 3, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 114, 105, 3, N'Testul 2', 9, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 117, 108, 3, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 117, 108, 3, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 118, 128, 3, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 118, 128, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 118, 128, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 120, 116, 3, N'Testul 1', 10, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (141, 120, 116, 3, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 100, 100, 3, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 100, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 100, 100, 3, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 100, 100, 3, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 101, 104, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 101, 104, 3, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 101, 104, 3, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 103, 100, 3, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 104, 100, 3, N'Examen', 8, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 104, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 104, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 104, 100, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 106, 104, 3, N'Testul 2', 4, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 107, 101, 3, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 107, 101, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 107, 101, 3, N'Testul 1', 4, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 107, 101, 3, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 108, 108, 3, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 108, 108, 3, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 108, 108, 3, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 108, 108, 3, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 109, 109, 3, N'Examen', 8, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 109, 109, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 109, 109, 3, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 109, 109, 3, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 114, 105, 3, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 114, 105, 3, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 114, 105, 3, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 114, 105, 3, N'Testul 2', 8, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 117, 108, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 117, 108, 3, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 118, 128, 3, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 118, 128, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 118, 128, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 118, 128, 3, N'Testul 2', 8, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 119, 117, 3, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 119, 117, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 119, 117, 3, N'Testul 2', 6, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 120, 116, 3, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (142, 120, 116, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 100, 100, 3, N'Examen', 10, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 100, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 100, 100, 3, N'Testul 1', 4, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 100, 100, 3, N'Testul 2', 6, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 101, 104, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 101, 104, 3, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 101, 104, 3, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 101, 104, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 103, 100, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 104, 100, 3, N'Examen', 9, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 104, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 104, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 104, 100, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 107, 101, 3, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 107, 101, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 107, 101, 3, N'Testul 1', 7, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 107, 101, 3, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 108, 108, 3, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 108, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 108, 108, 3, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 108, 108, 3, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 109, 109, 3, N'Examen', 6, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 109, 109, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 114, 105, 3, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 114, 105, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 114, 105, 3, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 117, 108, 3, N'Examen', 10, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 117, 108, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 117, 108, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 117, 108, 3, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 118, 128, 3, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 118, 128, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 118, 128, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 120, 116, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 120, 116, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 120, 116, 3, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (143, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 100, 100, 3, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 100, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 100, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 101, 104, 3, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 101, 104, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 103, 100, 3, N'Examen', 10, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 103, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 103, 100, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 104, 100, 3, N'Examen', 4, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 104, 100, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 104, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 104, 100, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 106, 104, 3, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 107, 101, 3, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 107, 101, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 108, 108, 3, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 108, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 108, 108, 3, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 108, 108, 3, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 109, 109, 3, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 114, 105, 3, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 114, 105, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 114, 105, 3, N'Testul 2', 10, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 117, 108, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 117, 108, 3, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 118, 128, 3, N'Examen', 5, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 118, 128, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 118, 128, 3, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 120, 116, 3, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 120, 116, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (144, 120, 116, 3, N'Testul 2', 9, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 100, 100, 3, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 100, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 101, 104, 3, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 101, 104, 3, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 103, 100, 3, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 103, 100, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 103, 100, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 103, 100, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 104, 100, 3, N'Examen', 6, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 104, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 104, 100, 3, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 104, 100, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 106, 104, 3, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 106, 104, 3, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 106, 104, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 107, 101, 3, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 107, 101, 3, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 107, 101, 3, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 108, 108, 3, N'Examen', 3, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 108, 108, 3, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 108, 108, 3, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 108, 108, 3, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 109, 109, 3, N'Examen', 9, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 109, 109, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 109, 109, 3, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 114, 105, 3, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 114, 105, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 114, 105, 3, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 117, 108, 3, N'Examen', 7, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 117, 108, 3, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 117, 108, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 117, 108, 3, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 118, 128, 3, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 118, 128, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 118, 128, 3, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 118, 128, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 119, 117, 3, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 119, 117, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 119, 117, 3, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 119, 117, 3, N'Testul 2', 8, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 120, 116, 3, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (145, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 100, 100, 3, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 100, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 100, 100, 3, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 100, 100, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 101, 104, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 101, 104, 3, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 101, 104, 3, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 101, 104, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 103, 100, 3, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 103, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 103, 100, 3, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 104, 100, 3, N'Examen', 4, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 104, 100, 3, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 104, 100, 3, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 104, 100, 3, N'Testul 2', 4, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 106, 104, 3, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 106, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 106, 104, 3, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 106, 104, 3, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 107, 101, 3, N'Examen', 10, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 107, 101, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 107, 101, 3, N'Testul 1', 6, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 107, 101, 3, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 108, 108, 3, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 108, 108, 3, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 108, 108, 3, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 108, 108, 3, N'Testul 2', 10, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 109, 109, 3, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 109, 109, 3, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 114, 105, 3, N'Examen', 2, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 114, 105, 3, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 114, 105, 3, N'Testul 1', 1, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 114, 105, 3, N'Testul 2', 3, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 117, 108, 3, N'Examen', 10, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 117, 108, 3, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 117, 108, 3, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 117, 108, 3, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 118, 128, 3, N'Testul 1', 2, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 118, 128, 3, N'Testul 2', 2, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 119, 117, 3, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 119, 117, 3, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 119, 117, 3, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 119, 117, 3, N'Testul 2', 6, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 120, 116, 3, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 120, 116, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 120, 116, 3, N'Testul 1', 10, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (146, 120, 116, 3, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 100, 100, 3, N'Examen', 2, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 100, 100, 3, N'Reusita curenta', 2, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 100, 100, 3, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 100, 100, 3, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 101, 104, 3, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 101, 104, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 101, 104, 3, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 101, 104, 3, N'Testul 2', 2, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 103, 100, 3, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 103, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 103, 100, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 103, 100, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 104, 100, 3, N'Examen', 10, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 104, 100, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 104, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 104, 100, 3, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 106, 104, 3, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 106, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 106, 104, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 106, 104, 3, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 107, 101, 3, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 107, 101, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 107, 101, 3, N'Testul 1', 9, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 107, 101, 3, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 108, 108, 3, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 108, 108, 3, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 108, 108, 3, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 108, 108, 3, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 109, 109, 3, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 109, 109, 3, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 114, 105, 3, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 114, 105, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 114, 105, 3, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 114, 105, 3, N'Testul 2', 6, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 117, 108, 3, N'Examen', 5, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 117, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 117, 108, 3, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 117, 108, 3, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 118, 128, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 118, 128, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 119, 117, 3, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 119, 117, 3, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 119, 117, 3, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 119, 117, 3, N'Testul 2', 7, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 120, 116, 3, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 120, 116, 3, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 120, 116, 3, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (147, 120, 116, 3, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 100, 100, 3, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 100, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 100, 100, 3, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 100, 100, 3, N'Testul 2', 10, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 101, 104, 3, N'Examen', 6, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 101, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 101, 104, 3, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 101, 104, 3, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 103, 100, 3, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 103, 100, 3, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 103, 100, 3, N'Testul 1', 3, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 103, 100, 3, N'Testul 2', 3, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 104, 100, 3, N'Examen', 3, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 104, 100, 3, N'Reusita curenta', 3, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 104, 100, 3, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 104, 100, 3, N'Testul 2', 3, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 106, 104, 3, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 106, 104, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 106, 104, 3, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 106, 104, 3, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 107, 101, 3, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 107, 101, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 107, 101, 3, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 108, 108, 3, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 108, 108, 3, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 108, 108, 3, N'Testul 1', 3, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 108, 108, 3, N'Testul 2', 3, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 109, 109, 3, N'Examen', 6, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 109, 109, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 109, 109, 3, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 109, 109, 3, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 114, 105, 3, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 114, 105, 3, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 114, 105, 3, N'Testul 1', 3, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 114, 105, 3, N'Testul 2', 4, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 117, 108, 3, N'Examen', 5, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 117, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 117, 108, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 117, 108, 3, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 118, 128, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 118, 128, 3, N'Testul 2', 6, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 119, 117, 3, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 119, 117, 3, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 119, 117, 3, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 119, 117, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 120, 116, 3, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 120, 116, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 120, 116, 3, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (148, 120, 116, 3, N'Testul 2', 7, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 100, 100, 3, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 100, 100, 3, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 100, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 100, 100, 3, N'Testul 2', 8, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 101, 104, 3, N'Examen', 6, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 101, 104, 3, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 101, 104, 3, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 101, 104, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 103, 100, 3, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 103, 100, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 103, 100, 3, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 103, 100, 3, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 104, 100, 3, N'Examen', 7, CAST(N'2018-01-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 104, 100, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 104, 100, 3, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 104, 100, 3, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 106, 104, 3, N'Examen', 3, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 106, 104, 3, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 106, 104, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 106, 104, 3, N'Testul 2', 4, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 107, 101, 3, N'Examen', 10, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 107, 101, 3, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 107, 101, 3, N'Testul 1', 5, CAST(N'2017-10-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 107, 101, 3, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 108, 108, 3, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 108, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 108, 108, 3, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 108, 108, 3, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 109, 109, 3, N'Examen', 7, CAST(N'2018-01-13' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 109, 109, 3, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 109, 109, 3, N'Testul 1', 10, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 109, 109, 3, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 114, 105, 3, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 114, 105, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 114, 105, 3, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 114, 105, 3, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 117, 108, 3, N'Examen', 5, CAST(N'2018-01-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 117, 108, 3, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 117, 108, 3, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 117, 108, 3, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 118, 128, 3, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 118, 128, 3, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 118, 128, 3, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 118, 128, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 119, 117, 3, N'Examen', 9, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 119, 117, 3, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 119, 117, 3, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 119, 117, 3, N'Testul 2', 5, CAST(N'2017-12-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 120, 116, 3, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 120, 116, 3, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 120, 116, 3, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (149, 120, 116, 3, N'Testul 2', 5, CAST(N'2017-12-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 101, 104, 2, N'Examen', 9, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 101, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 101, 104, 2, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 101, 104, 2, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 102, 103, 2, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 102, 103, 2, N'Reusita curenta', 5, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 102, 103, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 102, 103, 2, N'Testul 2', 9, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 106, 104, 2, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 106, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 106, 104, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 106, 104, 2, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 107, 101, 2, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 107, 101, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 107, 101, 2, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 107, 101, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 108, 108, 2, N'Examen', 10, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 108, 108, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 108, 108, 2, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 112, 129, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 112, 129, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 112, 129, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 112, 129, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 113, 104, 2, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 113, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 113, 104, 2, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 115, 103, 2, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 115, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 115, 103, 2, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 115, 103, 2, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 117, 108, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 117, 108, 2, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 117, 108, 2, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 117, 108, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 118, 107, 2, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 118, 107, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 118, 107, 2, N'Testul 2', 9, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 119, 117, 2, N'Examen', 6, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 119, 117, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 119, 117, 2, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 119, 117, 2, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 120, 116, 2, N'Examen', 9, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 120, 116, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 120, 116, 2, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (150, 120, 116, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 101, 104, 2, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 101, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 101, 104, 2, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 101, 104, 2, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 102, 103, 2, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 102, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 102, 103, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 102, 103, 2, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 106, 104, 2, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 106, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 106, 104, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 107, 101, 2, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 107, 101, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 107, 101, 2, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 108, 108, 2, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 108, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 108, 108, 2, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 108, 108, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 112, 129, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 112, 129, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 112, 129, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 113, 104, 2, N'Examen', 3, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 113, 104, 2, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 113, 104, 2, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 113, 104, 2, N'Testul 2', 10, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 115, 103, 2, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 115, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 115, 103, 2, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 115, 103, 2, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 116, 102, 2, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 116, 102, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 116, 102, 2, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 117, 108, 2, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 117, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 117, 108, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 117, 108, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 118, 107, 2, N'Examen', 4, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 118, 107, 2, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 118, 107, 2, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 119, 117, 2, N'Examen', 6, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 119, 117, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 119, 117, 2, N'Testul 1', 1, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 119, 117, 2, N'Testul 2', 2, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 120, 116, 2, N'Examen', 7, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 120, 116, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 120, 116, 2, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (151, 120, 116, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 101, 104, 2, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 101, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 101, 104, 2, N'Testul 1', 9, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 101, 104, 2, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 102, 103, 2, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 102, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 102, 103, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 102, 103, 2, N'Testul 2', 8, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 106, 104, 2, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 106, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 106, 104, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 107, 101, 2, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 107, 101, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 107, 101, 2, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 108, 108, 2, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 108, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 108, 108, 2, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 108, 108, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 112, 129, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 112, 129, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 112, 129, 2, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 113, 104, 2, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 115, 103, 2, N'Examen', 9, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 115, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 115, 103, 2, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 115, 103, 2, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 116, 102, 2, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 116, 102, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 116, 102, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 116, 102, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 117, 108, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 118, 107, 2, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 118, 107, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 118, 107, 2, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 118, 107, 2, N'Testul 2', 10, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 119, 117, 2, N'Examen', 5, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 119, 117, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 119, 117, 2, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 119, 117, 2, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 120, 116, 2, N'Examen', 10, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 120, 116, 2, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 120, 116, 2, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (152, 120, 116, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 101, 104, 2, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 101, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 101, 104, 2, N'Testul 1', 5, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 101, 104, 2, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 102, 103, 2, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 102, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 102, 103, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 106, 104, 2, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 106, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 106, 104, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 106, 104, 2, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 107, 101, 2, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 107, 101, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 107, 101, 2, N'Testul 1', 8, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 107, 101, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 108, 108, 2, N'Examen', 5, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 108, 108, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 108, 108, 2, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 108, 108, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 112, 129, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 112, 129, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 112, 129, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 113, 104, 2, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 113, 104, 2, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 115, 103, 2, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 115, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 115, 103, 2, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 115, 103, 2, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 116, 102, 2, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 116, 102, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 116, 102, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 116, 102, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 117, 108, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 118, 107, 2, N'Examen', 9, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 118, 107, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 118, 107, 2, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 119, 117, 2, N'Examen', 7, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 119, 117, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 119, 117, 2, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 119, 117, 2, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 120, 116, 2, N'Examen', 6, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 120, 116, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 120, 116, 2, N'Testul 1', 8, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (153, 120, 116, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 101, 104, 2, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 101, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 101, 104, 2, N'Testul 1', 5, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 101, 104, 2, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 102, 103, 2, N'Examen', 5, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 102, 103, 2, N'Reusita curenta', 5, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 102, 103, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 102, 103, 2, N'Testul 2', 6, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 106, 104, 2, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 106, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 106, 104, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 106, 104, 2, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 107, 101, 2, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 107, 101, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 107, 101, 2, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 108, 108, 2, N'Examen', 10, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 108, 108, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 108, 108, 2, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 108, 108, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 112, 129, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 112, 129, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 112, 129, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 112, 129, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 113, 104, 2, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 113, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 113, 104, 2, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 113, 104, 2, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 115, 103, 2, N'Examen', 9, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 115, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 115, 103, 2, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 115, 103, 2, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 116, 102, 2, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 116, 102, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 116, 102, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 116, 102, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 117, 108, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 118, 107, 2, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 118, 107, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 119, 117, 2, N'Examen', 5, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 119, 117, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 119, 117, 2, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 119, 117, 2, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 120, 116, 2, N'Examen', 6, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 120, 116, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 120, 116, 2, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (154, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 101, 104, 2, N'Examen', 4, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 101, 104, 2, N'Reusita curenta', 4, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 101, 104, 2, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 101, 104, 2, N'Testul 2', 4, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 102, 103, 2, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 102, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 102, 103, 2, N'Testul 1', 3, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 102, 103, 2, N'Testul 2', 4, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 106, 104, 2, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 106, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 106, 104, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 106, 104, 2, N'Testul 2', 10, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 107, 101, 2, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 107, 101, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 107, 101, 2, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 108, 108, 2, N'Examen', 4, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 108, 108, 2, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 108, 108, 2, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 108, 108, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 112, 129, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 112, 129, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 113, 104, 2, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 113, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 113, 104, 2, N'Testul 1', 10, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 113, 104, 2, N'Testul 2', 9, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 115, 103, 2, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 115, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 115, 103, 2, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 115, 103, 2, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 116, 102, 2, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 116, 102, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 116, 102, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 116, 102, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 117, 108, 2, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 117, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 117, 108, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 118, 107, 2, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 118, 107, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 118, 107, 2, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 118, 107, 2, N'Testul 2', 7, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 119, 117, 2, N'Examen', 7, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 119, 117, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 119, 117, 2, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 120, 116, 2, N'Examen', 8, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 120, 116, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 120, 116, 2, N'Testul 1', 10, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (155, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 101, 104, 2, N'Examen', 5, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 101, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 102, 103, 2, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 102, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 102, 103, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 106, 104, 2, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 106, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 106, 104, 2, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 106, 104, 2, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 107, 101, 2, N'Examen', 3, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 107, 101, 2, N'Reusita curenta', 3, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 107, 101, 2, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 107, 101, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 108, 108, 2, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 108, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 108, 108, 2, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 108, 108, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 112, 129, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 112, 129, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 112, 129, 2, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 113, 104, 2, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 113, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 113, 104, 2, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 113, 104, 2, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 115, 103, 2, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 115, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 115, 103, 2, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 115, 103, 2, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 116, 102, 2, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 116, 102, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 116, 102, 2, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 116, 102, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 117, 108, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 117, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 117, 108, 2, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 117, 108, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 118, 107, 2, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 118, 107, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 119, 117, 2, N'Examen', 5, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 119, 117, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 119, 117, 2, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 119, 117, 2, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 120, 116, 2, N'Examen', 8, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 120, 116, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 120, 116, 2, N'Testul 1', 10, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (156, 120, 116, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 101, 104, 2, N'Examen', 5, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 101, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 101, 104, 2, N'Testul 2', 6, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 102, 103, 2, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 102, 103, 2, N'Reusita curenta', 4, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 102, 103, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 102, 103, 2, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 106, 104, 2, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 106, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 106, 104, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 106, 104, 2, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 107, 101, 2, N'Examen', 9, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 107, 101, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 107, 101, 2, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 107, 101, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 108, 108, 2, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 108, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 108, 108, 2, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 108, 108, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 112, 129, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 112, 129, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 113, 104, 2, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 115, 103, 2, N'Examen', 10, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 115, 103, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 115, 103, 2, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 115, 103, 2, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 116, 102, 2, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 117, 108, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 117, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 117, 108, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 117, 108, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 118, 107, 2, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 118, 107, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 118, 107, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 119, 117, 2, N'Examen', 8, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 119, 117, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 119, 117, 2, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 119, 117, 2, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 120, 116, 2, N'Examen', 8, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 120, 116, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 120, 116, 2, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (157, 120, 116, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 101, 104, 2, N'Examen', 9, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 101, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 102, 103, 2, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 102, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 102, 103, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 106, 104, 2, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 106, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 106, 104, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 106, 104, 2, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 107, 101, 2, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 107, 101, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 107, 101, 2, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 107, 101, 2, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 108, 108, 2, N'Examen', 5, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 108, 108, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 108, 108, 2, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 108, 108, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 112, 129, 2, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 112, 129, 2, N'Reusita curenta', 5, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 112, 129, 2, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 113, 104, 2, N'Examen', 3, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 113, 104, 2, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 115, 103, 2, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 115, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 115, 103, 2, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 115, 103, 2, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 116, 102, 2, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 116, 102, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 116, 102, 2, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 116, 102, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 117, 108, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 117, 108, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 117, 108, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 118, 107, 2, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 118, 107, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 118, 107, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 119, 117, 2, N'Examen', 5, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 119, 117, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 119, 117, 2, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 119, 117, 2, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 120, 116, 2, N'Examen', 3, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 120, 116, 2, N'Reusita curenta', 3, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 120, 116, 2, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (158, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 101, 104, 2, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 101, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 101, 104, 2, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 101, 104, 2, N'Testul 2', 5, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 102, 103, 2, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 102, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 102, 103, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 102, 103, 2, N'Testul 2', 9, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 106, 104, 2, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 106, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 106, 104, 2, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 107, 101, 2, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 107, 101, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 107, 101, 2, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 107, 101, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 108, 108, 2, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 108, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 108, 108, 2, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 108, 108, 2, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 112, 129, 2, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 112, 129, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 112, 129, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 113, 104, 2, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 113, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 115, 103, 2, N'Examen', 9, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 115, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 115, 103, 2, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 115, 103, 2, N'Testul 2', 4, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 116, 102, 2, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 116, 102, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 116, 102, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 117, 108, 2, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 117, 108, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 117, 108, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 118, 107, 2, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 118, 107, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 118, 107, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 119, 117, 2, N'Examen', 8, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 119, 117, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 119, 117, 2, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 119, 117, 2, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 120, 116, 2, N'Examen', 8, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 120, 116, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 120, 116, 2, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (159, 120, 116, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 101, 104, 2, N'Examen', 3, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 101, 104, 2, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 101, 104, 2, N'Testul 1', 1, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 101, 104, 2, N'Testul 2', 2, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 102, 103, 2, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 102, 103, 2, N'Reusita curenta', 4, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 102, 103, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 106, 104, 2, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 106, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 106, 104, 2, N'Testul 1', 4, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 106, 104, 2, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 107, 101, 2, N'Examen', 5, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 107, 101, 2, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 107, 101, 2, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 108, 108, 2, N'Examen', 10, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 108, 108, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 108, 108, 2, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 112, 129, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 112, 129, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 112, 129, 2, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 112, 129, 2, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 113, 104, 2, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 113, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 115, 103, 2, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 115, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 115, 103, 2, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 115, 103, 2, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 117, 108, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 118, 107, 2, N'Examen', 10, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 118, 107, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 118, 107, 2, N'Testul 2', 7, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 119, 117, 2, N'Examen', 9, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 119, 117, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 119, 117, 2, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 119, 117, 2, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 120, 116, 2, N'Examen', 7, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 120, 116, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 120, 116, 2, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (160, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 101, 104, 2, N'Examen', 9, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 101, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 101, 104, 2, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 102, 103, 2, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 102, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 102, 103, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 102, 103, 2, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 106, 104, 2, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 106, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 106, 104, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 107, 101, 2, N'Examen', 7, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 107, 101, 2, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 107, 101, 2, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 107, 101, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 108, 108, 2, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 108, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 108, 108, 2, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 112, 129, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 112, 129, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 112, 129, 2, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 113, 104, 2, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 113, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 113, 104, 2, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 115, 103, 2, N'Examen', 7, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 115, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 115, 103, 2, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 115, 103, 2, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 116, 102, 2, N'Examen', 10, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 116, 102, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 116, 102, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 117, 108, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 118, 107, 2, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 118, 107, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 118, 107, 2, N'Testul 1', 2, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 118, 107, 2, N'Testul 2', 3, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 119, 117, 2, N'Examen', 2, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 119, 117, 2, N'Reusita curenta', 2, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 119, 117, 2, N'Testul 1', 4, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 119, 117, 2, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 120, 116, 2, N'Examen', 6, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 120, 116, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 120, 116, 2, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (161, 120, 116, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 101, 104, 2, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 101, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 101, 104, 2, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 101, 104, 2, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 102, 103, 2, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 102, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 102, 103, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 102, 103, 2, N'Testul 2', 6, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 106, 104, 2, N'Examen', 5, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 106, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 106, 104, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 106, 104, 2, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 107, 101, 2, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 107, 101, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 107, 101, 2, N'Testul 1', 3, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 107, 101, 2, N'Testul 2', 2, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 108, 108, 2, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 108, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 108, 108, 2, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 108, 108, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 112, 129, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 112, 129, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 113, 104, 2, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 113, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 113, 104, 2, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 113, 104, 2, N'Testul 2', 10, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 115, 103, 2, N'Examen', 4, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 115, 103, 2, N'Reusita curenta', 4, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 115, 103, 2, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 115, 103, 2, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 116, 102, 2, N'Examen', 4, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 116, 102, 2, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 116, 102, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 116, 102, 2, N'Testul 2', 4, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 117, 108, 2, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 117, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 117, 108, 2, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 117, 108, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 118, 107, 2, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 118, 107, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 118, 107, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 119, 117, 2, N'Examen', 6, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 119, 117, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 119, 117, 2, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 120, 116, 2, N'Examen', 8, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 120, 116, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 120, 116, 2, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (162, 120, 116, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 101, 104, 2, N'Examen', 2, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 101, 104, 2, N'Reusita curenta', 2, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 101, 104, 2, N'Testul 1', 4, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 101, 104, 2, N'Testul 2', 4, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 102, 103, 2, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 102, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 102, 103, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 102, 103, 2, N'Testul 2', 9, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 106, 104, 2, N'Examen', 9, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 106, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 106, 104, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 107, 101, 2, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 107, 101, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 107, 101, 2, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 107, 101, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 108, 108, 2, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 108, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 108, 108, 2, N'Testul 1', 7, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 108, 108, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 112, 129, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 112, 129, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 112, 129, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 113, 104, 2, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 113, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 113, 104, 2, N'Testul 1', 9, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 113, 104, 2, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 115, 103, 2, N'Examen', 5, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 115, 103, 2, N'Reusita curenta', 5, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 115, 103, 2, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 115, 103, 2, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 116, 102, 2, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 116, 102, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 116, 102, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 116, 102, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 117, 108, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 118, 107, 2, N'Examen', 9, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 118, 107, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 118, 107, 2, N'Testul 2', 5, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 119, 117, 2, N'Examen', 7, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 119, 117, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 119, 117, 2, N'Testul 1', 10, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 119, 117, 2, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 120, 116, 2, N'Examen', 5, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 120, 116, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 120, 116, 2, N'Testul 1', 7, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (163, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 101, 104, 2, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 101, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 101, 104, 2, N'Testul 1', 10, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 101, 104, 2, N'Testul 2', 4, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 102, 103, 2, N'Examen', 4, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 102, 103, 2, N'Reusita curenta', 4, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 102, 103, 2, N'Testul 1', 2, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 106, 104, 2, N'Examen', 2, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 106, 104, 2, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 106, 104, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 106, 104, 2, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 107, 101, 2, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 107, 101, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 107, 101, 2, N'Testul 1', 5, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 107, 101, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 108, 108, 2, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 108, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 108, 108, 2, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 112, 129, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 112, 129, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 112, 129, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 113, 104, 2, N'Examen', 5, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 113, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 115, 103, 2, N'Examen', 9, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 115, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 115, 103, 2, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 115, 103, 2, N'Testul 2', 10, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 116, 102, 2, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 116, 102, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 117, 108, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 118, 107, 2, N'Examen', 10, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 118, 107, 2, N'Reusita curenta', 10, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 118, 107, 2, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 119, 117, 2, N'Examen', 10, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 119, 117, 2, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 119, 117, 2, N'Testul 2', 10, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 120, 116, 2, N'Examen', 7, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 120, 116, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 120, 116, 2, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (164, 120, 116, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 101, 104, 2, N'Examen', 5, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 101, 104, 2, N'Reusita curenta', 5, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 101, 104, 2, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 101, 104, 2, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 102, 103, 2, N'Examen', 9, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 102, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 102, 103, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 102, 103, 2, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 106, 104, 2, N'Examen', 7, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 106, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 106, 104, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 107, 101, 2, N'Examen', 2, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 107, 101, 2, N'Reusita curenta', 2, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 107, 101, 2, N'Testul 1', 1, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 107, 101, 2, N'Testul 2', 4, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 108, 108, 2, N'Examen', 7, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 108, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 108, 108, 2, N'Testul 1', 5, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 108, 108, 2, N'Testul 2', 4, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 112, 129, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 112, 129, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 112, 129, 2, N'Testul 1', 2, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 112, 129, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 113, 104, 2, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 113, 104, 2, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 115, 103, 2, N'Examen', 9, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 115, 103, 2, N'Reusita curenta', 9, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 115, 103, 2, N'Testul 1', 10, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 115, 103, 2, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 116, 102, 2, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 116, 102, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 116, 102, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 116, 102, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 117, 108, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 117, 108, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 117, 108, 2, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 117, 108, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 118, 107, 2, N'Examen', 8, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 118, 107, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 118, 107, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 119, 117, 2, N'Examen', 8, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 119, 117, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 119, 117, 2, N'Testul 1', 5, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 119, 117, 2, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 120, 116, 2, N'Examen', 2, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 120, 116, 2, N'Reusita curenta', 2, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 120, 116, 2, N'Testul 1', 5, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (165, 120, 116, 2, N'Testul 2', 10, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 101, 104, 2, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 101, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 101, 104, 2, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 102, 103, 2, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 102, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 102, 103, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 106, 104, 2, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 106, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 106, 104, 2, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 106, 104, 2, N'Testul 2', 7, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 107, 101, 2, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 107, 101, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 107, 101, 2, N'Testul 1', 8, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 108, 108, 2, N'Examen', 5, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 108, 108, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 108, 108, 2, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 108, 108, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 112, 129, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 112, 129, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 112, 129, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 112, 129, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 113, 104, 2, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 113, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 113, 104, 2, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 115, 103, 2, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 115, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 115, 103, 2, N'Testul 1', 8, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 115, 103, 2, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 116, 102, 2, N'Examen', 8, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 116, 102, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 116, 102, 2, N'Testul 1', 10, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 116, 102, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 117, 108, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 117, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 117, 108, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 118, 107, 2, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 118, 107, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 118, 107, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 119, 117, 2, N'Examen', 8, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 119, 117, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 119, 117, 2, N'Testul 1', 8, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 119, 117, 2, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 120, 116, 2, N'Examen', 9, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 120, 116, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 120, 116, 2, N'Testul 1', 8, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (166, 120, 116, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 101, 104, 2, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 101, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 101, 104, 2, N'Testul 1', 8, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 102, 103, 2, N'Examen', 8, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 102, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 102, 103, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 102, 103, 2, N'Testul 2', 8, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 106, 104, 2, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 106, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 106, 104, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 106, 104, 2, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 107, 101, 2, N'Examen', 8, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 107, 101, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 107, 101, 2, N'Testul 1', 8, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 107, 101, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 108, 108, 2, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 108, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 108, 108, 2, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 108, 108, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 112, 129, 2, N'Examen', 8, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 112, 129, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 112, 129, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 113, 104, 2, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 113, 104, 2, N'Testul 2', 8, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 115, 103, 2, N'Examen', 3, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 115, 103, 2, N'Reusita curenta', 3, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 115, 103, 2, N'Testul 1', 2, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 115, 103, 2, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 116, 102, 2, N'Testul 1', 3, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 117, 108, 2, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 117, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 117, 108, 2, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 117, 108, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 118, 107, 2, N'Examen', 9, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 118, 107, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 118, 107, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 119, 117, 2, N'Examen', 5, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 119, 117, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 119, 117, 2, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 120, 116, 2, N'Examen', 10, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 120, 116, 2, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 120, 116, 2, N'Testul 1', 8, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (167, 120, 116, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 101, 104, 2, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 101, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 101, 104, 2, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 102, 103, 2, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 102, 103, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 102, 103, 2, N'Testul 1', 7, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 102, 103, 2, N'Testul 2', 10, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 106, 104, 2, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 106, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 106, 104, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 106, 104, 2, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 107, 101, 2, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 107, 101, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 107, 101, 2, N'Testul 1', 9, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 107, 101, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 108, 108, 2, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 108, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 108, 108, 2, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 112, 129, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 112, 129, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 113, 104, 2, N'Testul 1', 8, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 113, 104, 2, N'Testul 2', 5, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 115, 103, 2, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 115, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 115, 103, 2, N'Testul 1', 7, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 115, 103, 2, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 116, 102, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 116, 102, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 117, 108, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 117, 108, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 117, 108, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 118, 107, 2, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 118, 107, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 119, 117, 2, N'Examen', 9, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 119, 117, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 119, 117, 2, N'Testul 1', 7, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 119, 117, 2, N'Testul 2', 9, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 120, 116, 2, N'Examen', 7, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 120, 116, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 120, 116, 2, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (168, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 101, 104, 2, N'Examen', 8, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 101, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 101, 104, 2, N'Testul 1', 9, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 102, 103, 2, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 102, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 102, 103, 2, N'Testul 1', 9, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 102, 103, 2, N'Testul 2', 8, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 106, 104, 2, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 106, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 106, 104, 2, N'Testul 1', 5, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 106, 104, 2, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 107, 101, 2, N'Examen', 4, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 107, 101, 2, N'Reusita curenta', 4, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 107, 101, 2, N'Testul 1', 7, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 107, 101, 2, N'Testul 2', 10, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 108, 108, 2, N'Examen', 8, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 108, 108, 2, N'Reusita curenta', 8, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 108, 108, 2, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 112, 129, 2, N'Examen', 3, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 112, 129, 2, N'Reusita curenta', 3, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 112, 129, 2, N'Testul 1', 1, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 112, 129, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 113, 104, 2, N'Examen', 3, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 113, 104, 2, N'Reusita curenta', 3, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 113, 104, 2, N'Testul 1', 7, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 113, 104, 2, N'Testul 2', 7, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 115, 103, 2, N'Examen', 10, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 115, 103, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 115, 103, 2, N'Testul 1', 6, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 115, 103, 2, N'Testul 2', 5, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 116, 102, 2, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 116, 102, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 116, 102, 2, N'Testul 1', 4, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 116, 102, 2, N'Testul 2', 4, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 117, 108, 2, N'Testul 1', 5, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 117, 108, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 118, 107, 2, N'Examen', 9, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 118, 107, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 118, 107, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 119, 117, 2, N'Examen', 6, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 119, 117, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 119, 117, 2, N'Testul 2', 5, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 120, 116, 2, N'Examen', 3, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 120, 116, 2, N'Reusita curenta', 3, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 120, 116, 2, N'Testul 1', 1, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (169, 120, 116, 2, N'Testul 2', 4, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 101, 104, 2, N'Examen', 10, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 101, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 102, 103, 2, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 102, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 102, 103, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 102, 103, 2, N'Testul 2', 5, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 106, 104, 2, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 106, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 106, 104, 2, N'Testul 1', 8, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 106, 104, 2, N'Testul 2', 6, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 107, 101, 2, N'Examen', 9, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 107, 101, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 107, 101, 2, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 107, 101, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 108, 108, 2, N'Examen', 4, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 108, 108, 2, N'Reusita curenta', 4, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 108, 108, 2, N'Testul 1', 9, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 108, 108, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 112, 129, 2, N'Examen', 5, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 112, 129, 2, N'Reusita curenta', 5, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 112, 129, 2, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 113, 104, 2, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 113, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 113, 104, 2, N'Testul 1', 10, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 113, 104, 2, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 115, 103, 2, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 115, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 115, 103, 2, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 115, 103, 2, N'Testul 2', 8, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 116, 102, 2, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 116, 102, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 116, 102, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 117, 108, 2, N'Testul 1', 8, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 117, 108, 2, N'Testul 2', 8, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 118, 107, 2, N'Examen', 6, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 118, 107, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 118, 107, 2, N'Testul 2', 9, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 119, 117, 2, N'Examen', 6, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 119, 117, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 119, 117, 2, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 120, 116, 2, N'Examen', 6, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 120, 116, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 120, 116, 2, N'Testul 1', 9, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (170, 120, 116, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 101, 104, 2, N'Examen', 6, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 101, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 101, 104, 2, N'Testul 2', 9, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 102, 103, 2, N'Examen', 2, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 102, 103, 2, N'Reusita curenta', 2, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 102, 103, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 102, 103, 2, N'Testul 2', 8, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 106, 104, 2, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 106, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 106, 104, 2, N'Testul 1', 2, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 106, 104, 2, N'Testul 2', 8, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 107, 101, 2, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 107, 101, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 107, 101, 2, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 107, 101, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 108, 108, 2, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 108, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 108, 108, 2, N'Testul 1', 6, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 108, 108, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 112, 129, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 112, 129, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 112, 129, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 113, 104, 2, N'Examen', 8, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 113, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 113, 104, 2, N'Testul 1', 2, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 113, 104, 2, N'Testul 2', 3, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 115, 103, 2, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 115, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 115, 103, 2, N'Testul 1', 9, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 115, 103, 2, N'Testul 2', 7, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 116, 102, 2, N'Examen', 9, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 116, 102, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 116, 102, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 117, 108, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 118, 107, 2, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 118, 107, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 118, 107, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 118, 107, 2, N'Testul 2', 6, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 119, 117, 2, N'Examen', 6, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 119, 117, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 119, 117, 2, N'Testul 2', 7, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 120, 116, 2, N'Examen', 5, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 120, 116, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 120, 116, 2, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (171, 120, 116, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 101, 104, 2, N'Examen', 9, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 101, 104, 2, N'Reusita curenta', 9, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 101, 104, 2, N'Testul 1', 6, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 101, 104, 2, N'Testul 2', 8, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 102, 103, 2, N'Examen', 6, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 102, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 102, 103, 2, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 102, 103, 2, N'Testul 2', 7, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 106, 104, 2, N'Examen', 8, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 106, 104, 2, N'Reusita curenta', 8, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 106, 104, 2, N'Testul 1', 9, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 106, 104, 2, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 107, 101, 2, N'Examen', 9, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 107, 101, 2, N'Reusita curenta', 9, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 107, 101, 2, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 107, 101, 2, N'Testul 2', 5, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 108, 108, 2, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 108, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 108, 108, 2, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 112, 129, 2, N'Examen', 2, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 112, 129, 2, N'Reusita curenta', 2, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 112, 129, 2, N'Testul 1', 1, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 112, 129, 2, N'Testul 2', 2, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 113, 104, 2, N'Examen', 7, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 113, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 113, 104, 2, N'Testul 1', 3, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 113, 104, 2, N'Testul 2', 3, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 115, 103, 2, N'Examen', 8, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 115, 103, 2, N'Reusita curenta', 8, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 115, 103, 2, N'Testul 1', 3, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 115, 103, 2, N'Testul 2', 3, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 116, 102, 2, N'Testul 1', 1, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 116, 102, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 117, 108, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 117, 108, 2, N'Reusita curenta', 7, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 117, 108, 2, N'Testul 1', 7, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 117, 108, 2, N'Testul 2', 2, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 118, 107, 2, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 118, 107, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 118, 107, 2, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 118, 107, 2, N'Testul 2', 10, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 119, 117, 2, N'Examen', 9, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 119, 117, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 119, 117, 2, N'Testul 1', 2, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 119, 117, 2, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 120, 116, 2, N'Examen', 4, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 120, 116, 2, N'Reusita curenta', 4, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 120, 116, 2, N'Testul 1', 1, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (172, 120, 116, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 101, 104, 2, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 101, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 101, 104, 2, N'Testul 1', 7, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 101, 104, 2, N'Testul 2', 7, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 102, 103, 2, N'Examen', 10, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 102, 103, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 102, 103, 2, N'Testul 1', 10, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 102, 103, 2, N'Testul 2', 6, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 106, 104, 2, N'Examen', 10, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 106, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 106, 104, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 106, 104, 2, N'Testul 2', 5, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 107, 101, 2, N'Examen', 10, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 107, 101, 2, N'Reusita curenta', 10, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 107, 101, 2, N'Testul 1', 6, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 107, 101, 2, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 108, 108, 2, N'Examen', 6, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 108, 108, 2, N'Reusita curenta', 6, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 108, 108, 2, N'Testul 1', 8, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 108, 108, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 112, 129, 2, N'Examen', 6, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 112, 129, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 112, 129, 2, N'Testul 1', 5, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 112, 129, 2, N'Testul 2', 9, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 113, 104, 2, N'Examen', 10, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 113, 104, 2, N'Reusita curenta', 10, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 113, 104, 2, N'Testul 1', 6, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 113, 104, 2, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 115, 103, 2, N'Examen', 10, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 115, 103, 2, N'Reusita curenta', 10, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 115, 103, 2, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 115, 103, 2, N'Testul 2', 6, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 116, 102, 2, N'Examen', 7, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 116, 102, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 116, 102, 2, N'Testul 1', 7, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 116, 102, 2, N'Testul 2', 6, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 117, 108, 2, N'Examen', 10, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 117, 108, 2, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 117, 108, 2, N'Testul 2', 7, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 118, 107, 2, N'Examen', 5, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 118, 107, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 118, 107, 2, N'Testul 1', 9, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 118, 107, 2, N'Testul 2', 5, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 119, 117, 2, N'Examen', 8, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 119, 117, 2, N'Reusita curenta', 8, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 119, 117, 2, N'Testul 1', 6, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 119, 117, 2, N'Testul 2', 8, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 120, 116, 2, N'Examen', 10, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 120, 116, 2, N'Reusita curenta', 10, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 120, 116, 2, N'Testul 1', 6, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (173, 120, 116, 2, N'Testul 2', 9, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 101, 104, 2, N'Examen', 7, CAST(N'2018-01-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 101, 104, 2, N'Reusita curenta', 7, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 101, 104, 2, N'Testul 1', 4, CAST(N'2017-10-07' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 101, 104, 2, N'Testul 2', 2, CAST(N'2017-12-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 102, 103, 2, N'Examen', 7, CAST(N'2018-01-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 102, 103, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 102, 103, 2, N'Testul 1', 8, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 102, 103, 2, N'Testul 2', 10, CAST(N'2017-12-19' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 106, 104, 2, N'Examen', 6, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 106, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 106, 104, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 106, 104, 2, N'Testul 2', 9, CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 107, 101, 2, N'Examen', 6, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 107, 101, 2, N'Reusita curenta', 6, CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 107, 101, 2, N'Testul 1', 10, CAST(N'2017-10-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 107, 101, 2, N'Testul 2', 8, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 108, 108, 2, N'Examen', 9, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 108, 108, 2, N'Reusita curenta', 9, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 108, 108, 2, N'Testul 1', 10, CAST(N'2017-10-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 108, 108, 2, N'Testul 2', 6, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 112, 129, 2, N'Examen', 7, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 112, 129, 2, N'Reusita curenta', 7, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 112, 129, 2, N'Testul 1', 6, CAST(N'2017-10-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 112, 129, 2, N'Testul 2', 7, CAST(N'2017-12-18' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 113, 104, 2, N'Examen', 6, CAST(N'2018-01-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 113, 104, 2, N'Reusita curenta', 6, CAST(N'2018-12-05' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 113, 104, 2, N'Testul 1', 5, CAST(N'2017-10-03' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 113, 104, 2, N'Testul 2', 6, CAST(N'2017-12-15' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 115, 103, 2, N'Examen', 6, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 115, 103, 2, N'Reusita curenta', 6, CAST(N'2018-12-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 115, 103, 2, N'Testul 1', 5, CAST(N'2017-10-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 115, 103, 2, N'Testul 2', 9, CAST(N'2017-12-14' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 116, 102, 2, N'Examen', 5, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 116, 102, 2, N'Reusita curenta', 5, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 116, 102, 2, N'Testul 1', 6, CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 116, 102, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 117, 108, 2, N'Examen', 9, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 117, 108, 2, N'Reusita curenta', 9, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 117, 108, 2, N'Testul 1', 6, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 117, 108, 2, N'Testul 2', 5, CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 118, 107, 2, N'Examen', 7, CAST(N'2018-01-11' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 118, 107, 2, N'Reusita curenta', 7, CAST(N'2018-12-04' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 118, 107, 2, N'Testul 1', 10, CAST(N'2017-10-06' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 118, 107, 2, N'Testul 2', 8, CAST(N'2017-12-16' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 119, 117, 2, N'Examen', 5, CAST(N'2018-01-17' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 119, 117, 2, N'Reusita curenta', 5, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 119, 117, 2, N'Testul 1', 9, CAST(N'2017-10-09' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 119, 117, 2, N'Testul 2', 6, CAST(N'2017-12-08' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 120, 116, 2, N'Examen', 6, CAST(N'2018-01-24' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 120, 116, 2, N'Reusita curenta', 6, CAST(N'2018-12-02' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 120, 116, 2, N'Testul 1', 3, CAST(N'2017-10-12' AS Date))
GO
INSERT [dbo].[studenti_reusita] ([Id_Student], [Id_Disciplina], [Id_Profesor], [Id_Grupa], [Tip_Evaluare], [Nota], [Data_Evaluare]) VALUES (174, 120, 116, 2, N'Testul 2', 3, CAST(N'2017-12-10' AS Date))
GO
ALTER TABLE [dbo].[studenti_reusita]  WITH CHECK ADD  CONSTRAINT [FK_studenti_reusita_discipline] FOREIGN KEY([Id_Disciplina])
REFERENCES [dbo].[discipline] ([Id_Disciplina])
GO
ALTER TABLE [dbo].[studenti_reusita] CHECK CONSTRAINT [FK_studenti_reusita_discipline]
GO
ALTER TABLE [dbo].[studenti_reusita]  WITH CHECK ADD  CONSTRAINT [FK_studenti_reusita_grupe1] FOREIGN KEY([Id_Grupa])
REFERENCES [dbo].[grupe] ([Id_Grupa])
GO
ALTER TABLE [dbo].[studenti_reusita] CHECK CONSTRAINT [FK_studenti_reusita_grupe1]
GO
ALTER TABLE [dbo].[studenti_reusita]  WITH CHECK ADD  CONSTRAINT [FK_studenti_reusita_profesori] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[profesori] ([Id_Profesor])
GO
ALTER TABLE [dbo].[studenti_reusita] CHECK CONSTRAINT [FK_studenti_reusita_profesori]
GO
ALTER TABLE [dbo].[studenti_reusita]  WITH CHECK ADD  CONSTRAINT [FK_studenti_reusita_studenti1] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[studenti] ([Id_Student])
GO
ALTER TABLE [dbo].[studenti_reusita] CHECK CONSTRAINT [FK_studenti_reusita_studenti1]
GO
COMMIT TRANSACTION;
GO