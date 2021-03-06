USE [LandComp3]
GO
/****** Object:  User [landcomp]    Script Date: 06/26/2015 09:59:28 ******/
CREATE USER [landcomp] FOR LOGIN [landcomp] WITH DEFAULT_SCHEMA=[landcomp]
GO
/****** Object:  User [PTADARO\gseptoharjo]    Script Date: 06/26/2015 09:59:28 ******/
CREATE USER [PTADARO\gseptoharjo] FOR LOGIN [PTADARO\gseptoharjo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [landcomp]    Script Date: 06/26/2015 09:59:28 ******/
CREATE SCHEMA [landcomp] AUTHORIZATION [landcomp]
GO
/****** Object:  Table [landcomp].[PERUSA_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PERUSA_LOG](
	[perusaLParams] [varchar](255) NOT NULL,
	[perusaLIdents] [varchar](255) NOT NULL,
	[perusaLDatess] [smalldatetime] NULL,
	[perusaLNamass] [varchar](255) NULL,
	[perusaLKeterg] [varchar](8000) NULL,
	[perusaLUserID] [varchar](255) NULL,
	[perusaLUserDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PERUSA]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PERUSA](
	[perusaIdents] [varchar](255) NOT NULL,
	[perusaDatess] [smalldatetime] NULL,
	[perusaNamass] [varchar](255) NULL,
	[perusaKeterg] [varchar](8000) NULL,
	[perusaUserID] [varchar](255) NULL,
	[perusaUserDt] [smalldatetime] NULL,
 CONSTRAINT [PK_PERUSA] PRIMARY KEY CLUSTERED 
(
	[perusaIdents] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PENLAP_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PENLAP_LOG](
	[penlapLParams] [char](2) NOT NULL,
	[penlapLNmrPen] [varchar](255) NOT NULL,
	[penlapLDatess] [smalldatetime] NOT NULL,
	[penlapLTglukr] [smalldatetime] NULL,
	[penlapLTglJdw] [smalldatetime] NULL,
	[penlapLNmrPra] [varchar](50) NULL,
	[penlapLKtngan] [varchar](8000) NULL,
	[penlapLLanjut] [tinyint] NULL,
	[penlapLEkspsi] [tinyint] NULL,
	[penlapLKeteks] [varchar](8000) NULL,
	[penlapLUserid] [varchar](255) NULL,
	[penlapLUserdt] [smalldatetime] NULL,
	[penlapLAssign] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PENLAP_D_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PENLAP_D_LOG](
	[penlapLParams] [varchar](2) NULL,
	[penlapLNmrPen] [varchar](50) NULL,
	[penlapLSequen] [tinyint] NULL,
	[penlapLCodess] [tinyint] NULL,
	[penlapLKetera] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PENLAP_D]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PENLAP_D](
	[penlapNmrPen] [varchar](50) NOT NULL,
	[penlapSequen] [tinyint] NOT NULL,
	[penlapCodess] [tinyint] NULL,
	[penlapKetera] [varchar](500) NULL,
 CONSTRAINT [PK_PENLAP_D] PRIMARY KEY CLUSTERED 
(
	[penlapNmrPen] ASC,
	[penlapSequen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PRAREG_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PRAREG_LOG](
	[praregLParams] [char](2) NOT NULL,
	[praregLNmrPra] [varchar](50) NOT NULL,
	[praregLDatess] [smalldatetime] NULL,
	[praregLIdents] [varchar](255) NULL,
	[praregLLokkab] [varchar](50) NULL,
	[praregLLokkec] [varchar](50) NULL,
	[praregLLokdes] [varchar](50) NULL,
	[praregLLanjut] [tinyint] NULL,
	[praregLUserid] [varchar](255) NULL,
	[praregLUserdt] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PENGTO_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PENGTO_LOG](
	[pengtoLIdents] [int] IDENTITY(1,1) NOT NULL,
	[pengtoLParams] [varchar](50) NOT NULL,
	[pengtoLNmrPid] [varchar](50) NOT NULL,
	[pengtoLDatess] [smalldatetime] NULL,
	[pengtoLNmrReg] [varchar](50) NULL,
	[pengtoLTgljdw] [smalldatetime] NULL,
	[pengtoLOverlp] [tinyint] NULL,
	[pengtoLTglpen] [smalldatetime] NULL,
	[pengtoLToLMss] [smalldatetime] NULL,
	[pengtoLToSurv] [smalldatetime] NULL,
	[pengtoLAppsur] [smalldatetime] NULL,
	[pengtoLAppTSs] [smalldatetime] NULL,
	[pengtoLDiteri] [smalldatetime] NULL,
	[pengtoLLanjut] [tinyint] NULL,
	[pengtoLKtergn] [varchar](8000) NULL,
	[pengtoLEkseps] [tinyint] NULL,
	[pengtoLKeteks] [varchar](8000) NULL,
	[pengtoLUserID] [varchar](255) NULL,
	[pengtoLUserDT] [smalldatetime] NULL,
	[pengtoLAssign] [varchar](255) NULL,
	[pengtoNamPLK] [varchar](50) NULL,
	[pengtoLuasPL] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PENGTO_D_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PENGTO_D_LOG](
	[pengtoIdents] [int] NOT NULL,
	[pengtoLParams] [char](2) NULL,
	[pengtoLNmrPid] [varchar](50) NULL,
	[pengtoLSequen] [varchar](255) NULL,
	[pengtoLNamPlk] [varchar](255) NULL,
	[pengtoLLuaPlk] [varchar](255) NULL,
	[pengtoLStatus] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PENGTO_D]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PENGTO_D](
	[pengtoIdents] [int] NULL,
	[pengtoNmrPid] [varchar](50) NULL,
	[pengtoSequen] [varchar](255) NULL,
	[pengtoNamPlk] [varchar](255) NULL,
	[pengtoLuaPlk] [varchar](255) NULL,
	[pengtoStatus] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [landcomp].[P_PRAREGLOG]    Script Date: 06/26/2015 09:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [landcomp].[P_PRAREGLOG]
		
		@param1 VARCHAR(10), --parameter
		@param2 VARCHAR(50), --praregLNmrPra
		@param3 VARCHAR(255), --praregLIdents
		@param4 VARCHAR(50), --praregLokkec
		@param5 VARCHAR(50),--praregLokdes
		@param6 TINYINT, --praregLanjut
		@param7 VARCHAR(255), --praregUserid
		@param8 SMALLDATETIME, --praregUserdt
		@param9 VARCHAR(50) --praregParams
AS
BEGIN	

--DECLARE @param1 VARCHAR(10), --parameter
--		@param2 VARCHAR(50), --praregLNmrPra
--		@param3 VARCHAR(255), --praregLIdents
--		@param4 VARCHAR(50), --praregLokkec
--		@param5 VARCHAR(50),--praregLokdes
--		@param6 TINYINT, --praregLanjut
--		@param7 VARCHAR(255), --praregUserid
--		@param8 SMALLDATETIME, --praregUserdt
--		@param9 VARCHAR(50) --praregParams
		

IF @param1='I'
BEGIN

INSERT INTO LANDCOMP.PRAREGLOG (
									praregLNmrPra,
									praregLIdents,
									praregLLokkec,
									praregLLokdes,
									praregLLanjut,
									praregLUserid,
									praregLUserdt,
									praregLParams
									) VALUES (
									@param2,
									@param3,
									@param4,
									@param5,
									@param6,
									@param7,
									@param8,
									@param9
									)

END

END
GO
/****** Object:  StoredProcedure [landcomp].[P_TABLE]    Script Date: 06/26/2015 09:59:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[P_TABLE]
AS

BEGIN
DECLARE @param1 varchar(20)		--PARAMETER






			--ALTER TABLE [landcomp].[NEGOSI_LOG](
			--	[negosiLParam] [char](2) NULL,
			--	[negosiLNmrNeg] [varchar](50) NOT NULL,
			--	[negosiLDatess] [smalldatetime] NULL,
			--	[negosiLNmrReg] [varchar](50) NULL,
			--	[negosiLNmrPid] [varchar](50) NULL,
			--	[negosiLKetrgn] [varchar](8000) NULL,
			--	[negosiLSepakt] [tinyint] NULL,
			--	[negosiLSKGR]   [tinyint] NULL,
			--	[negosiLEks]    [tinyint] NULL,
			--	[negosiLEksKet] [varchar](8000) NULL,
			--	[negosiLAssign] [varchar](255) NULL,
			--	[negosiLUserID] [varchar](255) NULL,
			--	[negosiLUserDt] [smalldatetime] NULL,

				
			--	)

			--ALTER TABLE [landcomp].[NEGOSI_D_LOG](
			--	[negosiLParams][char](2) NOT NULL,
			--	[negosiLNmrNeg] [varchar](50) NOT NULL,
			--	[negosiLDatess] [smalldatetime] NULL,
			--	[negosiLSequen] [tinyint] NOT NULL,
			--	[negosiLNegoKe] [tinyint] NOT NULL,
			--	[negosiObjeks] [varchar](10) NULL,
			--	[negosiLuasss] [float] NULL,
			--	[negosiHMinta] [money] NULL,
			--	[negosiHTawar] [money] NULL,
			--	)

			--ALTER TABLE [landcomp].[BERKS1_LOG](
			--	[berks1LParams][char](2) NOT NULL,
			--	[berks1LNmrBr1] [varchar](50) NOT NULL,
			--	[berks1LDatess] [smalldatetime] NULL,
			--	[berks1LNmrReg] [varchar](50) NULL,
			--	[berks1LNmrPid] [varchar](50) NULL,
			--	[berks1LNmrNeg] [varchar](50) NULL,
			--	[berks1LNovism] [varchar](50) NULL,
			--	[berks1LLanjut] [tinyint] NULL,
			--	[berks1LEkseps] [tinyint] NULL,
			--	[berks1Keteks] [varchar](8000) NULL,
			--	[berks1LKetrgn] [varchar](8000) NULL,
			--	[berks1LAssign] [varchar](255) NULL,
			--	[berks1LUserID] [varchar](255) NULL,
			--	[berks1LUserDt] [smalldatetime] NULL,
			--	)

			--ALTER TABLE [landcomp].[BERKS1_D_LOG]
			--	(
			--	[berks1LParams][char](2) NOT NULL,
			--	[berks1LNmrBr1] [varchar](50) NOT NULL,
			--	[berks1LDatess] [smalldatetime] NULL,
			--	[berks1LSequen]  [tinyint] NULL,
			--	[berks1LPerlah]  [varchar](50) NULL,
			--	[berks1LKetrgn] [varchar](8000) NULL,
			--	[berks1LFile]	[varchar](50) NULL,
			--	)

			--ALTER TABLE [landcomp].[BERKS2_LOG]
			--	(
			--	[berks2LParams][char](2) NOT NULL,
			--	[berks2LNmrBr2] [varchar](50) NOT NULL,
			--	[berks2LDatess] [smalldatetime] NULL,
			--	[berks2LNmrReg] [varchar](50) NULL,
			--	[berks2LNmrPid] [varchar](50) NULL,
			--	[berks2LNmrNeg] [varchar](50) NULL,
			--	[berks2LNovism] [varchar](50) NULL,
			--	[berks2LNmrBr1] [varchar](50) NULL,
			--	[berks2LNmrByr] [varchar](50) NULL,
			--	[berks2LNmrPym] [varchar](50) NULL,
			--	[berks2LKetrgn] [varchar](8000) NULL,
			--	[berks2LSlesai] [tinyint] NULL,
			--	[berks2LEkseps] [tinyint] NULL,
			--	[berks2Keteks] [varchar](8000) NULL,
			--	[berks2LAssign] [varchar](255) NULL,
			--	[berks2LUserID] [varchar](255) NULL,
			--	[berks2LUserDt] [smalldatetime] NULL,
			--	)

			--ALTER TABLE [landcomp].[BERKS2_D]
			--	(
			--	[berks2NmrBr2] [varchar](50) NOT NULL,
			--	[berks2Datess] [smalldatetime] NULL,
			--	[berks2Sequen]  [tinyint] NULL,
			--	[berks2ProPem]  [varchar](50) NULL,
			--	[berks2Ketrgn] [varchar](8000) NULL,
			--	[berks2File]	[varchar](50) NULL,
			--	)

			--ALTER TABLE [landcomp].[BERKS2_D_LOG]
			--	(
			--	[berks2LParams][char](2) NOT NULL,
			--	[berks2LNmrBr2] [varchar](50) NOT NULL,
			--	[berks2LDatess] [smalldatetime] NULL,
			--	[berks2LSequen]  [tinyint] NULL,
			--	[berks2LProPem]  [varchar](50) NULL,
			--	[berks2LKetrgn] [varchar](8000) NULL,
			--	[berks2LFile]	[varchar](50) NULL,
			--	)

			--ALTER TABLE [landcomp].[PMBYRN_LOG]
			--	(
			--	[pmbyrnLParams][char](2) NOT NULL,
			--	[pmbyrnLNmrByr] [varchar](50) NOT NULL,
			--	[pmbyrnLDatess] [smalldatetime] NULL,
			--	[pmbyrnLNmrReg] [varchar](50) NULL,
			--	[pmbyrnLNmrPid] [varchar](50) NULL,
			--	[pmbyrnLNmrNeg] [varchar](50) NULL,
			--	[pmbyrnLNovism] [varchar](50) NULL,
			--	[pmbyrnLNmrPbr] [varchar](50) NULL,
			--	[pmbyrnLTglASH] [smalldatetime] NULL,
			--	[pmbyrnLTglAMn] [smalldatetime] NULL,
			--	[pmbyrnLTglSrv] [smalldatetime] NULL,
			--	[pmbyrnLTglAGm] [smalldatetime] NULL,
			--	[pmbyrnLTgABod] [smalldatetime] NULL,
			--	[pmbyrnLTglAcc] [smalldatetime] NULL,
			--	[pmbyrnLPengBer] [tinyint] NULL,
			--	[pmbyrnLjmlhpmbyrn] [money] NULL,
			--	[pmbyrnLKetrgn] [varchar](800) NULL,
			--	[pmbyrnLLnjuts] [tinyint] NULL,
			--	[pmbyrnLEkseps] [tinyint] NULL,
			--	[pmbyrnKeteks] [varchar](800) NULL,
			--	[pmbyrnLAssign] [varchar](255) NULL,
			--	[pmbyrnLUserID] [varchar](255) NULL,
			--	[pmbyrnLUserDt] [smalldatetime] NULL,
			--	)

			--ALTER TABLE [landcomp].[VISUMS_LOG]
			--	(
			--	[visumsLParams][char](2) NOT NULL,
			--	[visumsLNovism] [varchar](50) NOT NULL,
			--	[visumsLDatess] [smalldatetime] NULL,
			--	[visumsLNmrReg] [varchar](50) NULL,
			--	[visumsLNmrPid] [varchar](50) NULL,
			--	[visumsLVerLnj] [tinyint] NULL,
			--	[visumsLEkseps] [tinyint] NULL,
			--	[VisumLKeteks] [varchar](800) NULL,
			--	[visumsLUserID] [varchar](255) NULL,
			--	[visumsLUserDt] [smalldatetime] NULL,
			--	[visumsLAssign] [varchar](255) NULL,
			--	)

			--ALTER TABLE [landcomp].[VISUMS_O]
			--	(
			--	[visumsNovism] [varchar](50) NOT NULL,
			--	[visumsDatess] [smalldatetime] NULL,
			--	[visumsSequen] [tinyint] NULL,
			--	[visumsObjLhn] [varchar](50) NULL,
			--	[VisumKetrgn] [varchar](800) NULL,
			--	)
				
			--ALTER TABLE [landcomp].[VISUMS_S]
			--	(
			--	[visumsNovism] [varchar](50) NOT NULL,
			--	[visumsDatess] [smalldatetime] NULL,
			--	[visumsSequen] [tinyint] NULL,
			--	[visumsSubLhn] [varchar](50) NULL,
			--	[VisumKetrgn] [varchar](800) NULL,
			--	)
				
			--ALTER TABLE [landcomp].[VISUMS_R]
			--	(
			--	[visumsNovism] [varchar](50) NOT NULL,
			--	[visumsDatess] [smalldatetime] NULL,
			--	[visumsSequen] [tinyint] NULL,
			--	[visumRekom] [varchar](800) NULL,
			--	[VisumAksi] [varchar](50) NULL,
			--	)

			--ALTER TABLE [landcomp].[VISUMS_O_LOG]
			--	(
			--	[visumsLParams][char](2) NOT NULL,
			--	[visumsLNovism] [varchar](50) NOT NULL,
			--	[visumsLDatess] [smalldatetime] NULL,
			--	[visumsLSequen] [tinyint] NULL,
			--	[visumsLObjLhn] [varchar](50) NULL,
			--	[VisumLKetrgn] [varchar](800) NULL,
			--	)
				
			--ALTER TABLE [landcomp].[VISUMS_S_LOG]
			--	(
			--	[visumsLParams][char](2) NOT NULL,
			--	[visumsLNovism] [varchar](50) NOT NULL,
			--	[visumsLDatess] [smalldatetime] NULL,
			--	[visumsLSequen] [tinyint] NULL,
			--	[visumsLSubLhn] [varchar](50) NULL,
			--	[VisumLKetrgn] [varchar](800) NULL,
			--	)
				
			--ALTER TABLE [landcomp].[VISUMS_R_LOG]
			--	(
			--	[visumsLParams][char](2) NOT NULL,
			--	[visumsLNovism] [varchar](50) NOT NULL,
			--	[visumsLDatess] [smalldatetime] NULL,
			--	[visumsLSequen] [tinyint] NULL,
			--	[visumLRekom] [varchar](800) NULL,
			--	[VisumLAksi] [varchar](50) NULL,
			--	)
			
				--ALTER TABLE [landcomp].[USERSS_LOG](
				--[UserssLParams][char](2) NULL,
				--[UserssLIdent] [char](50) NULL,
				--[UserssNamess] [varchar](50) NULL,
				--[UserssPasswd] [varchar](50) NULL,
				--[UserssGroups] [varchar](50) NULL,
				--[UserrsActive] [varchar](50) NULL,
				--[UserssUserID] [varchar](50) NULL,
				--[UserssUserDT] [smalldatetime] )

END
GO
/****** Object:  Table [landcomp].[SRHTRM]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[SRHTRM](
	[srhtrmNmrSTs] [varchar](50) NULL,
	[srhtrmNmrReg] [varchar](50) NULL,
	[srhtrmUsrSrh] [varchar](50) NULL,
	[srhtrmUsrTrm] [varchar](50) NULL,
	[srhtrmTglSrh] [smalldatetime] NULL,
	[srhtrmTglTrm] [smalldatetime] NULL,
	[srhtrmUserID] [varchar](50) NULL,
	[srhtrmUserDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[REPORT]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[REPORT](
	[reportIdents] [int] IDENTITY(1,1) NOT NULL,
	[reportPeriod] [varchar](10) NULL,
	[reportJeniss] [tinyint] NULL,
	[reportRncana] [nchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[REGLC]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[REGLC](
	[REGNO] [nvarchar](255) NULL,
	[REGDATE] [datetime] NULL,
	[REGALAMATTANAH] [nvarchar](255) NULL,
	[REGNMPENDAFTAR] [nvarchar](255) NULL,
	[REGKTPPENDAFTAR] [nvarchar](255) NULL,
	[REGNMPEMILIK] [nvarchar](255) NULL,
	[REGKTPPEMILIK] [nvarchar](255) NULL,
	[KABUPATEN] [nvarchar](255) NULL,
	[KECAMATAN] [nvarchar](255) NULL,
	[DESA] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[REGIST_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[REGIST_LOG](
	[registLParams] [char](2) NOT NULL,
	[registLNmrReg] [varchar](50) NOT NULL,
	[registLDatess] [smalldatetime] NULL,
	[registLNmrPen] [varchar](255) NULL,
	[registLIdents] [varchar](255) NULL,
	[registLTy1Sts] [tinyint] NULL,
	[registLTy1Jml] [smallint] NULL,
	[registLTy2Sts] [tinyint] NULL,
	[registLTy2Jml] [smallint] NULL,
	[registLAlshak] [tinyint] NULL,
	[registLSHMsss] [tinyint] NULL,
	[registLSHMNmr] [varchar](50) NULL,
	[registLSKTsss] [tinyint] NULL,
	[registLSKTNmr] [varchar](50) NULL,
	[registLK1K2ss] [tinyint] NULL,
	[registLTahuns] [varchar](50) NULL,
	[registLLuasss] [float] NULL,
	[registLBtsutr] [varchar](50) NULL,
	[registLBtsslt] [varchar](50) NULL,
	[registLBtstmr] [varchar](50) NULL,
	[registLBtsbrt] [varchar](50) NULL,
	[registLTy3Sts] [tinyint] NULL,
	[registLTy3Thn] [varchar](4) NULL,
	[registLTy4Sts] [tinyint] NULL,
	[registLTy4Thn] [varchar](4) NULL,
	[registLTy5Sts] [tinyint] NULL,
	[registLTy5Thn] [varchar](4) NULL,
	[registLKtergn] [varchar](8000) NULL,
	[registLLanjut] [tinyint] NULL,
	[registLEkspsi] [tinyint] NULL,
	[registLKeteks] [varchar](8000) NULL,
	[registLUserid] [varchar](255) NULL,
	[registLUserdt] [smalldatetime] NULL,
	[registLAssign] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[REGIST_D_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[REGIST_D_LOG](
	[registLParams] [char](2) NOT NULL,
	[registLNmrReg] [varchar](50) NOT NULL,
	[registLDatess] [nchar](10) NULL,
	[registLSequen] [tinyint] NOT NULL,
	[registLJeniss] [tinyint] NOT NULL,
	[registLKondis] [varchar](10) NULL,
	[registLKeters] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[REGIST_D]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[REGIST_D](
	[registNmrReg] [varchar](50) NOT NULL,
	[registDatess] [nchar](10) NULL,
	[registSequen] [tinyint] NOT NULL,
	[registJeniss] [tinyint] NOT NULL,
	[registKondis] [varchar](10) NULL,
	[registKeters] [varchar](500) NULL,
 CONSTRAINT [PK_REGIST_D] PRIMARY KEY CLUSTERED 
(
	[registNmrReg] ASC,
	[registSequen] ASC,
	[registJeniss] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[PMBYRN_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[PMBYRN_LOG](
	[pmbyrnLParams] [char](2) NOT NULL,
	[pmbyrnLNmrByr] [varchar](50) NOT NULL,
	[pmbyrnLDatess] [smalldatetime] NULL,
	[pmbyrnLNmrReg] [varchar](50) NULL,
	[pmbyrnLNmrPid] [varchar](50) NULL,
	[pmbyrnLNmrNeg] [varchar](50) NULL,
	[pmbyrnLNovism] [varchar](50) NULL,
	[pmbyrnLNmrPbr] [varchar](50) NULL,
	[pmbyrnLTglASH] [smalldatetime] NULL,
	[pmbyrnLTglAMn] [smalldatetime] NULL,
	[pmbyrnLTglSrv] [smalldatetime] NULL,
	[pmbyrnLTglAGm] [smalldatetime] NULL,
	[pmbyrnLTgABod] [smalldatetime] NULL,
	[pmbyrnLTglAcc] [smalldatetime] NULL,
	[pmbyrnLPengBer] [tinyint] NULL,
	[pmbyrnLNamPer] [varchar](255) NULL,
	[pmbyrnLKetrgn] [varchar](800) NULL,
	[pmbyrnLLnjuts] [tinyint] NULL,
	[pmbyrnLEkseps] [tinyint] NULL,
	[pmbyrnLKeteks] [varchar](800) NULL,
	[pmbyrnLAssign] [varchar](255) NULL,
	[pmbyrnLUserID] [varchar](255) NULL,
	[pmbyrnLUserDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[BAYAR]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[BAYAR](
	[PID] [float] NULL,
	[survey] [datetime] NULL,
	[ext] [datetime] NULL,
	[akunting] [datetime] NULL,
	[tglbayar] [datetime] NULL,
	[Status] [nvarchar](255) NULL,
	[perusahaan] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[PARCEL4]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[PARCEL4](
	[No] [float] NULL,
	[PID] [float] NULL,
	[No Registrasi] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[PARCEL3]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[PARCEL3](
	[No] [float] NULL,
	[N A M A] [nvarchar](255) NULL,
	[Desa] [nvarchar](255) NULL,
	[Kecamatan] [nvarchar](255) NULL,
	[Kab#] [nvarchar](255) NULL,
	[Nama PLK] [nvarchar](255) NULL,
	[Luas, m2] [float] NULL,
	[PID] [float] NULL,
	[Luas Bgn] [float] NULL,
	[Kondisi] [nvarchar](255) NULL,
	[Peruntukan] [nvarchar](255) NULL,
	[Prioritas] [float] NULL,
	[Diterima SURVEY] [datetime] NULL,
	[Diterima GM Ext#] [datetime] NULL,
	[Diterima Accounting] [datetime] NULL,
	[Diterima BOD] [nvarchar](255) NULL,
	[ GANTI RUGI] [float] NULL,
	[TOTAL GANTI RUGI] [float] NULL,
	[Tanggal Pembayaran] [datetime] NULL,
	[Status] [nvarchar](255) NULL,
	[Jalur Pembebasan] [nvarchar](255) NULL,
	[Tanggal Pembatasan Lahan] [nvarchar](255) NULL,
	[Status Pembatasan Lahan] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[PARCEL2]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[PARCEL2](
	[OBJECTID *] [float] NULL,
	[PID] [float] NULL,
	[PLK] [nvarchar](255) NULL,
	[Priority] [float] NULL,
	[Registrasi] [float] NULL,
	[Status_Lhn] [nvarchar](255) NULL,
	[Nama] [nvarchar](255) NULL,
	[Tgl_Pngk] [nvarchar](255) NULL,
	[Desa] [nvarchar](255) NULL,
	[Kec] [nvarchar](255) NULL,
	[Kab] [nvarchar](255) NULL,
	[Desain] [nvarchar](255) NULL,
	[Progress] [nvarchar](255) NULL,
	[Penawaran] [float] NULL,
	[Permintaan] [float] NULL,
	[Zona] [float] NULL,
	[Shape *] [nvarchar](255) NULL,
	[Luas] [float] NULL,
	[Diterima SURVEY] [datetime] NULL,
	[Diterima GM Ext#] [datetime] NULL,
	[Diterima Accounting] [datetime] NULL,
	[Tanggal Pembayaran] [datetime] NULL,
	[Tanggal Pembatasan Lahan] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[PARCEL]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[PARCEL](
	[OBJECTID *] [float] NULL,
	[PID] [float] NULL,
	[PLK] [nvarchar](255) NULL,
	[Priority] [float] NULL,
	[Registrasi] [float] NULL,
	[Status_Lhn] [nvarchar](255) NULL,
	[F7] [nvarchar](255) NULL,
	[Tgl_Pngk] [nvarchar](255) NULL,
	[Desa] [nvarchar](255) NULL,
	[Kec] [nvarchar](255) NULL,
	[Kab] [nvarchar](255) NULL,
	[Desain] [nvarchar](255) NULL,
	[Progress] [nvarchar](255) NULL,
	[Penawaran] [float] NULL,
	[Permintaan] [float] NULL,
	[Zona] [float] NULL,
	[Shape *] [nvarchar](255) NULL,
	[Shape#area] [float] NULL,
	[Shape#len] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[VISUMS_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[VISUMS_LOG](
	[visumsLParams] [char](2) NOT NULL,
	[visumsLNovism] [varchar](50) NOT NULL,
	[visumsLDatess] [smalldatetime] NULL,
	[visumsLNmrReg] [varchar](50) NULL,
	[visumsLNmrPid] [varchar](50) NULL,
	[visumsLVerLnj] [tinyint] NULL,
	[visumsLEkseps] [tinyint] NULL,
	[VisumsLKeteks] [varchar](800) NULL,
	[visumsLUserID] [varchar](255) NULL,
	[visumsLUserDt] [smalldatetime] NULL,
	[visumsLAssign] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[VISUMS_D_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[VISUMS_D_LOG](
	[visumsLParams] [char](2) NULL,
	[visumsLNovism] [varchar](50) NULL,
	[visumsLSequen] [tinyint] NULL,
	[visumsLJenis] [tinyint] NULL,
	[visumsLCodess] [tinyint] NULL,
	[visumsLKtrgn] [varchar](800) NULL,
	[visumsLAksi] [tinyint] NULL,
	[visumsLRekom] [varchar](800) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[VISUMS_D]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[VISUMS_D](
	[visumsNovism] [varchar](50) NOT NULL,
	[visumsSequen] [tinyint] NOT NULL,
	[visumsJenis] [tinyint] NULL,
	[visumsCodess] [tinyint] NULL,
	[visumsKtrgn] [varchar](max) NULL,
	[visumsAksi] [tinyint] NULL,
	[visumsRekom] [varchar](max) NOT NULL,
 CONSTRAINT [PK_VISUMS_D] PRIMARY KEY CLUSTERED 
(
	[visumsNovism] ASC,
	[visumsSequen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[VIS]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[VIS](
	[PID] [float] NULL,
	[Tanggal1] [datetime] NULL,
	[Tanggal2] [datetime] NULL,
	[AsalUsul] [nvarchar](max) NULL,
	[Rekomendasi1] [nvarchar](max) NULL,
	[Rekomendasi2] [nvarchar](255) NULL,
	[Verifikasi] [nvarchar](max) NULL,
	[Keterangan] [nvarchar](255) NULL,
	[Verifikasi1] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[USRGRP]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[USRGRP](
	[UsrgrpUserss] [varchar](50) NOT NULL,
	[UsrgrpGroups] [varchar](50) NOT NULL,
	[UsrgrpUserID] [varchar](50) NULL,
	[UsrgrpUserDT] [smalldatetime] NULL,
 CONSTRAINT [PK_USRGRP] PRIMARY KEY CLUSTERED 
(
	[UsrgrpUserss] ASC,
	[UsrgrpGroups] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[USERSS_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[USERSS_LOG](
	[UserssLParams] [char](2) NULL,
	[UserssLIdents] [varchar](50) NULL,
	[UserssLNamess] [varchar](50) NULL,
	[UserssLPasswd] [char](50) NULL,
	[UserssLGroups] [varchar](50) NULL,
	[UserrsLActive] [varchar](50) NULL,
	[UserssLUserID] [varchar](50) NULL,
	[UserssLUserDT] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[USERSS]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[USERSS](
	[UserssIDents] [varchar](50) NOT NULL,
	[UserssNamess] [varchar](50) NULL,
	[UserssPasswd] [char](50) NULL,
	[UserssGroups] [varchar](50) NULL,
	[UserrsActive] [varchar](50) NULL,
	[UserssUserID] [varchar](50) NULL,
	[UserssUserDT] [smalldatetime] NULL,
 CONSTRAINT [PK_Userss] PRIMARY KEY CLUSTERED 
(
	[UserssIDents] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[NEG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[NEG](
	[PID] [float] NULL,
	[Objek] [nvarchar](255) NULL,
	[Luas] [float] NULL,
	[HargaPenawaran] [money] NULL,
	[HargaPermintaan] [money] NULL,
	[TanggalNego] [datetime] NULL,
	[Desa] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[MKTP]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [landcomp].[MKTP](
	[REGNO] [nvarchar](255) NULL,
	[REGNMPEMILIK] [nvarchar](255) NULL,
	[REGKTPPEMILIK] [nvarchar](255) NULL,
	[REGNMPENDAFTAR] [nvarchar](255) NULL,
	[REGKTPPENDAFTAR] [nvarchar](255) NULL,
	[REGALAMATTANAH] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [landcomp].[MKABUP]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[MKABUP](
	[mkabupIdkabu] [int] IDENTITY(1,1) NOT NULL,
	[mkabupNmkabu] [varchar](50) NULL,
 CONSTRAINT [PK_MKABUP] PRIMARY KEY CLUSTERED 
(
	[mkabupIdkabu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[MIDENT_S_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[MIDENT_S_LOG](
	[MidentLParams] [char](2) NULL,
	[MidentLIdents] [varchar](255) NULL,
	[MidentLDatess] [smalldatetime] NULL,
	[MidentLSequen] [tinyint] NOT NULL,
	[MidentLNamass] [varchar](255) NULL,
	[MidentLTgllhr] [smalldatetime] NULL,
	[MidentLPkrjan] [varchar](255) NULL,
	[MidentLAlamat] [varchar](800) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[MIDENT_S]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[MIDENT_S](
	[midentIdents] [varchar](255) NOT NULL,
	[midentDatess] [smalldatetime] NULL,
	[midentSequen] [tinyint] NOT NULL,
	[midentNamass] [varchar](255) NULL,
	[midentTgllhr] [smalldatetime] NULL,
	[midentPkrjan] [varchar](255) NULL,
	[midentAlamat] [varchar](800) NULL,
 CONSTRAINT [PK_MIDENT_S] PRIMARY KEY CLUSTERED 
(
	[midentIdents] ASC,
	[midentSequen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[MIDENT_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[MIDENT_LOG](
	[MidentLParams] [char](2) NOT NULL,
	[MidentLIdents] [varchar](255) NOT NULL,
	[MidentLDatess] [smalldatetime] NULL,
	[MidentLJnsIdn] [tinyint] NULL,
	[MidentLNamass] [varchar](255) NULL,
	[MidentLJnsKel] [tinyint] NULL,
	[MidentLTmplhr] [varchar](255) NULL,
	[MidentLTgllhr] [smalldatetime] NULL,
	[MidentLPekerj] [tinyint] NULL,
	[MidentLNmrPeg] [varchar](255) NULL,
	[MidentLAlamat] [varchar](255) NULL,
	[MidentLNmrHps] [varchar](255) NULL,
	[MidentLStatus] [tinyint] NULL,
	[MidentLNmPsng] [varchar](255) NULL,
	[MidentLTmpPas] [varchar](255) NULL,
	[MidentLTglPas] [smalldatetime] NULL,
	[MidentLThnNkh] [smalldatetime] NULL,
	[MidentLNmAyah] [varchar](255) NULL,
	[MidentLTglAyh] [varchar](255) NULL,
	[MidentLKrjAyh] [varchar](255) NULL,
	[MidentLAlmAyh] [varchar](8000) NULL,
	[MidentLNmIbus] [varchar](255) NULL,
	[MidentLTglIbu] [varchar](255) NULL,
	[MidentLKrjIbu] [varchar](255) NULL,
	[MidentLAlmIbu] [varchar](255) NULL,
	[MidentLUserID] [varchar](255) NULL,
	[MidentLUserDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [landcomp].[MIDENT_A_LOG]    Script Date: 06/26/2015 09:59:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [landcomp].[MIDENT_A_LOG](
	[MidentLParams] [char](2) NULL,
	[MidentLIdents] [varchar](255) NULL,
	[MidentLDatess] [smalldatetime] NULL,