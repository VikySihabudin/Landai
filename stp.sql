USE [LandComp3]
GO
/****** Object:  StoredProcedure [landcomp].[P_TABLE]    Script Date: 06/26/2015 10:04:28 ******/
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
/****** Object:  StoredProcedure [landcomp].[P_PRAREGLOG]    Script Date: 06/26/2015 10:04:28 ******/
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
/****** Object:  StoredProcedure [landcomp].[P_MSTBRG1]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[P_MSTBRG1]

@param1 varchar(20),	--PARAMETER
@param2 varchar(50),	--NoBarang
@param3 varchar(50),	--NamaBarang
@param4 varchar(50),	--KodeBarang
@param5 tinyint    ,	--BarangMinimum	
@param6 varchar(800),	--UserID	
@param7 smalldatetime,	--UserDate
@param8 varchar(800)	--Keterangan
	
	--declare	@param1 varchar(20)		--PARAMETER
--			@param2 varchar(50),	--NoBarang
--			@param3 varchar(50),	--NamaBarang
--			@param4 varchar(50),	--KodeBarang
--			@param5 tinyint    ,	--BarangMinimum	
--			@param6 varchar(800),	--UserID	
--			@param7 smalldatetime,	--UserDate
--			@param8 varchar(800)	--Keterangan

AS

BEGIN

DECLARE @date SMALLDATETIME

SELECT @param7 = GETDATE()

IF @param1 = 'I'
	BEGIN
	
	INSERT INTO LANDCOMP.landcomp.MSTBRG
		(
				NoBarang,
				NamaBarang,
				KodeBarang,
				BarangMinimum,	
				UserID,	
				UserDate,
				Keterangan
				)
				
	VALUES
		(
		@param2,
		@param3,
		@param4,
		@param5,
		@param6,
		@param7,
		@param8
		)
		
		END
	
	IF @param1 = 'D'
	BEGIN
	
	DELETE LANDCOMP.landcomp.MSTBRG 
	WHERE NoBarang = @param2
	
	END
	IF @param1 = 'E'
	BEGIN
	
	UPDATE LANDCOMP.landcomp.MSTBRG 
	SET
	NoBarang		=@param2,
	NamaBarang		=@param3,
	KodeBarang		=@param4,
	BarangMinimum	=@param5,
	UserID			=@param6,
	UserDate		=@param7,
	Keterangan		=@param8
			
	WHERE NoBarang=@param2
	
	END

	IF @param1='L'
	BEGIN
	SELECT
	NoBarang,
	NamaBarang,						
	KodeBarang,
	BarangMinimum,
	UserID,
	UserDate,
	Keterangan
	FROM landcomp.MSTBRG 
	
	End
	End
GO
/****** Object:  StoredProcedure [landcomp].[CheckUser]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[CheckUser]
(
@username as varchar(50),
@password as varchar(50)
)
AS 

--DECLARE
--@username as varchar(50),
--@password as varchar(50)

--SET @username = 'admin'
--SET @password = 'admin'
 
 
SELECT 
	a.UserssIDents userid,
	a.UserssNamess namass,
	a.UserssGroups groups,
	--c.GroupsNamess groups,
	c.GroupsLanjut lanjut,
	c.GroupsExcept excepts
FROM landcomp.USERSS a
--INNER JOIN landcomp.USRGRP b
	--ON a.UserssIDents = b.UsrgrpUserss
INNER JOIN landcomp.GROUPS c
	ON a.UserssGroups = c.GroupIDents
WHERE a.UserssIDents = @username 
--AND a.UserssPasswd = @password 
AND a.UserrsActive = 1
GO
/****** Object:  StoredProcedure [landcomp].[C_LOOKUP]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[C_LOOKUP] 
	-- Add the parameters for the stored procedure here
	@LookupType varchar(10)
	,@LookupParams varchar(100)
	,@LookupSearch varchar(1000)
	,@LookupWilayah varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

--DECLARE
--	@LookupType varchar(10)
--	,@LookupParams varchar(100)
--	,@LookupSearch varchar(1000)

--SET @LookupType = '1'
--SET @LookupParams = '6'
--SET @LookupSearch = '6'

	DECLARE @sql varchar(4999);
	DECLARE @params TABLE(item varchar(1000));
	DECLARE @param varchar(100);
	DECLARE @param1 as varchar(100);
	DECLARE @param2 as varchar(100);
	DECLARE @param3 as varchar(100);
	DECLARE @i as int;

	insert into @params 
	select * from landcomp.F_SPLITS(@LookupParams,',')


	IF @LookupType='1'
	BEGIN
		declare @top as varchar(10); 
		set @top = 'top 100';
		--declare @top as varchar(10); set @top = 'top 1000';
		declare @jns as char(1); 
		set @jns = (select item from @params);

			SET @sql = '
					select distinct ' + @top + ' MidentIdents [ID |ro|80|left], MidentNamass [Nama|ro|80|left] , MidentJnsKel [Jenis Kelamin Stasiun|ro|0|left]
					, MidentTmplhr [Tempat Lahir|ro|0|left], REPLACE(CONVERT(VARCHAR(10),MidentTgllhr,111),''/'',''-'') [Tanggal Lahir|ro|0|left], MidentPekerj [Pekerjaan|ro|0|left], MidentAlamat [Alamat|ro|*|left]
					, MidentNmrHps [Nomor HP|ro|0|left], MidentJnsIdn [Jenis ID|ro|0|left]
					FROM
					(
						SELECT MidentIdents, MidentJnsIdn, MidentNamass, MidentJnsKel, MidentTmplhr, MidentTgllhr, MidentPekerj, MidentAlamat, MidentNmrHps
						FROM MIDENT
						WHERE MidentIdents like ''%' + @LookupSearch + '%'' OR MidentNamass like ''%' + @LookupSearch + '%'' 
					) AS A 

				'

		
		--print @sql;
		exec(@sql);
	END
	
	--stp nama perusahaan
	IF @LookupType='2'
	BEGIN
		--declare @top as varchar(10); 
		set @top = 'top 100';
		--declare @top as varchar(10); set @top = 'top 1000';
		--declare @jns as char(1); 
		set @jns = (select item from @params);

			SET @sql = '
					select distinct ' + @top + ' perusaIdents [ID |ro|80|left], perusaNamass [Nama|ro|80|left]
					FROM
					(
						SELECT perusaIdents, perusaNamass
						FROM PERUSA
						WHERE perusaIdents like ''%' + @LookupSearch + '%'' OR perusaNamass like ''%' + @LookupSearch + '%'' 
					) AS A 

				'

		
		--print @sql;
		exec(@sql);
	END
	
	--stp serah terima berkas
	IF @LookupType='3'
	BEGIN
		--declare @top as varchar(10); 
		set @top = 'top 100';
		--declare @top as varchar(10); set @top = 'top 1000';
		--declare @jns as char(1); 
		set @jns = (select item from @params);

			SET @sql = '
					select distinct ' + @top + ' registNmrReg [ID |ro|80|left], 
												 MidentNamass [Nama|ro|80|left],
												 registIdents [Identitas|ro|80|left],
												 MidentNmrHps [No Hp|ro|80|left],
												 mdesaaNmdesa [Desa|ro|80|left],
												 mcamatNmcamt [Kecamatan|ro|80|left],
												 mkabupNmkabu [Kabupaten|ro|80|left]
					FROM
					(
						SELECT registNmrReg, MidentNamass, 
						registIdents, MidentNmrHps, mdesaaNmdesa,
						mcamatNmcamt, mkabupNmkabu
						FROM REGIST a
						left outer join PENLAP b
						on b.penlapNmrPen = a.registNmrPen
						left outer join PRAREG c
						on c.praregNmrPra = b.penlapNmrPra					
						inner join MIDENT d
						on a.registIdents = d.MidentIdents
						LEFT OUTER JOIN MCAMAT 
						ON praregLokkec = mcamatidcamt
						LEFT OUTER JOIN MDESAA 
						ON praregLokdes = mdesaaIddesaa
						LEFT OUTER JOIN MKABUP 
						ON praregLokkab = mkabupIdkabu						
						WHERE registNmrReg like ''%' + @LookupSearch + '%'' OR registDatess like ''%' + @LookupSearch + '%'' 
					) AS A 

				'

		
		--print @sql;
		exec(@sql);
	END
	
	--stp serah terima berkas
	IF @LookupType='4'
	BEGIN
		--declare @top as varchar(10); 
		set @top = 'top 100';
		--declare @top as varchar(10); set @top = 'top 1000';
		--declare @jns as char(1); 
		set @jns = (select item from @params);

			SET @sql = '
					select distinct ' + @top + ' UserssIDents [ID |ro|80|left], 
												 UserssNamess [Nama|ro|80|left]
					FROM
					(
						select 
						UserssIDents,
						UserssNamess
						FROM landcomp.USERSS						
						WHERE UserssIDents like ''%' + @LookupSearch + '%'' 
					) AS A 

				'

		
		--print @sql;
		exec(@sql);
	END
	
	
	
END
GO
/****** Object:  StoredProcedure [landcomp].[C_ADMINS]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [landcomp].[C_ADMINS]
@param1 VARCHAR(2), -- 1 kabupaten, 2 kecamatan, 3 desa
@param2 VARCHAR(50) -- nomorid parent
AS

--DECLARE @param1 VARCHAR(2),
--@param2 VARCHAR(50)

--SET @param1 = '3'
--SET @param2 = 'Barabai'

IF @param1 = '1'
SELECT mkabupIdkabu idents, mkabupNmkabu namass
FROM MKABUP


IF @param1 = '2'
--SELECT RIGHT('0000'+ CONVERT(VARCHAR(10),mcamatIdcamt),4) idents, mcamatNmcamt namass
SELECT mcamatIdcamt idents, mcamatNmcamt namass
FROM MCAMAT
WHERE mcamatIdkabu = @param2


IF @param1 = '3'
--SELECT RIGHT('0000'+ CONVERT(VARCHAR(10),mdesaaIddesaa),4) idents,  mdesaaNmdesa namass
SELECT mdesaaIddesaa idents,  mdesaaNmdesa namass
FROM MDESAA a
--INNER JOIN MCAMAT b
--	ON a.mdesaaIdcamt = b.mcamatIdcamt
WHERE a.mdesaaIdcamt = @param2
GO
/****** Object:  StoredProcedure [landcomp].[P_MINDENT_S]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[P_MINDENT_S]
@param1 VARCHAR(2), -- PARAM
@param2 VARCHAR(50), -- midentIdents
@param3 VARCHAR(50), -- midentSequen
@param4 VARCHAR(50), -- midentNamass
@param5 VARCHAR(50), -- midentTgllhr
@param6 VARCHAR(50), -- midentPkrjan
@param7 VARCHAR(800) -- midentAlamat

AS
BEGIN

--DECLARE @param1 VARCHAR(2),
--								@param2 VARCHAR(50),
--								@param3 VARCHAR(50),
--								@param4 VARCHAR(50),
--								@param5 VARCHAR(50),
--								@param6 VARCHAR(50),
--								@param7 VARCHAR(800)

--SET @param1 = 'I';
--SET @param2 = 'MIDENT001'
----SET @param3 = 'MIDENT001'
--SET @param4 = 'JONI ISKANDAR2'
--SET @param5 = '19890428'
--SET @param6 = '2'
--SET @param7 = 'PERUMAHAN KARANG POLA'

DECLARE @SQ tinyint

SET @SQ = 0;

IF @param1 = 'I'
BEGIN
--SELECT ISNULL(MAX(X), 0) AS MaxX

SELECT @SQ	= ISNULL(MAX(midentSequen),0)+ 1	
FROM landcomp.MIDENT_S
WHERE midentIdents = @param2

--SELECT @SQ
INSERT INTO landcomp.MIDENT_S_LOG
			(
				MidentLParams, 
				MidentLIdents, 
				MidentLSequen, 
				MidentLNamass, 
				MidentLTgllhr, 
				MidentLPkrjan, 
				MidentLAlamat
			) VALUES 
			(
				@param1,
				@param2,
				@SQ,
				@param4,
				@param5,
				@param6,
				@param7
			)


INSERT INTO MIDENT_S 
			( midentIdents, 
					midentSequen, 
					midentNamass, 
					midentTgllhr, 
					midentPkrjan, 
					midentAlamat
			)
			VALUES
			(
				@param2,
				@SQ,
				@param4,
				@param5,
				@param6,
				@param7
			)
			
END


IF @param1 = 'SS'
BEGIN
	SELECT midentIdents, 
								midentSequen, 
								midentNamass, 
								CONVERT(VARCHAR(10),midentTgllhr,112)midentTgllhr, 
								midentPkrjan, 
								midentAlamat 
FROM landcomp.MIDENT_S
WHERE midentIdents = @param2
END

IF @param1 = 'US'
BEGIN
UPDATE landcomp.MIDENT_S 
							SET midentNamass=@param4, 
											midentTgllhr=@param5, 
											midentPkrjan=@param6, 
											midentAlamat=@param7
WHERE midentIdents=@param2 AND midentSequen=@param3

END

IF @param1 = 'DS'
BEGIN

DELETE landcomp.MIDENT_S
WHERE midentIdents=@param2 AND midentSequen=@param3

END

END
GO
/****** Object:  StoredProcedure [landcomp].[P_MINDENT_A]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[P_MINDENT_A]
@param1 VARCHAR(2), -- PARAM
@param2 VARCHAR(50), -- midentIdents
@param3 VARCHAR(50), -- midentSequen
@param4 VARCHAR(50), -- midentNamass
@param5 VARCHAR(50), -- midentTgllhr
@param6 VARCHAR(50), -- midentPkrjan
@param7 VARCHAR(800) -- midentAlamat

AS
BEGIN

--DECLARE @param1 VARCHAR(2),
--								@param2 VARCHAR(50),
--								@param3 VARCHAR(50),
--								@param4 VARCHAR(50),
--								@param5 VARCHAR(50),
--								@param6 VARCHAR(50),
--								@param7 VARCHAR(800)
					

--SET @param1 = 'DA';
--SET @param2 = '12345678'
--SET @param3 = '6'
--SET @param4 = 'ads'
--SET @param5 = '20150325'
--SET @param6 = '1'
--SET @param7 = 'sdsad'


DECLARE @SQ tinyint

SET @SQ = 0;


IF @param1 = 'I'
BEGIN

SELECT @SQ	= ISNULL(MAX(midentSequen),0)+ 1	
FROM landcomp.MIDENT_A
WHERE midentIdents = @param2

INSERT INTO landcomp.MIDENT_A_LOG
			(
				MidentLParams, 
				MidentLIdents, 
				MidentLSequen, 
				MidentLNamass, 
				MidentLTgllhr, 
				MidentLPkrjan, 
				MidentLAlamat
			) VALUES 
			(
				@param1,
				@param2,
				@SQ,
				@param4,
				@param5,
				@param6,
				@param7
			)



INSERT INTO  landcomp.MIDENT_A
			( midentIdents, 
					midentSequen, 
					midentNamass, 
					midentTgllhr, 
					midentPkrjan, 
					midentAlamat
			) VALUES
			(
				@param2,
				@SQ,
				@param4,
				@param5,
				@param6,
				@param7
			)
			
END


IF @param1 = 'SA'
BEGIN
	SELECT midentIdents, 
								midentSequen, 
								midentNamass, 
								CONVERT(VARCHAR(10),midentTgllhr,112)midentTgllhr, 
								midentPkrjan, 
								midentAlamat 
FROM landcomp.MIDENT_A
WHERE midentIdents = @param2
END

IF @param1 = 'UA'
BEGIN
UPDATE landcomp.MIDENT_A 
							SET midentNamass=@param4, 
											midentTgllhr=@param5, 
											midentPkrjan=@param6, 
											midentAlamat=@param7
WHERE midentIdents=@param2 AND midentSequen=@param3

END

IF @param1 = 'DA'
BEGIN

DELETE MIDENT_A
WHERE midentIdents = @param2 AND midentSequen = @param3

END

END
GO
/****** Object:  StoredProcedure [landcomp].[P_MINDENT]    Script Date: 06/26/2015 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [landcomp].[P_MINDENT]

	@param1 VARCHAR(10),   -- PARAM										
	@param2 VARCHAR(255), --MidentIdents,  
	@param3 VARCHAR(255) , --MidentJnsIdn, 
	@param4 VARCHAR(255) , --MidentNamass, 
	@param5 VARCHAR(255) , --MidentJnsKel, 
	@param6 VARCHAR(255) , --MidentTmplhr, 
	@param7 VARCHAR(255) , --MidentTgllhr, 
	@param8 VARCHAR(255) , --MidentPekerj, 
	@param9 VARCHAR(255) , --MidentNmrPeg, 
	@param10 VARCHAR(255) , --MidentAlamat, 
	@param11 VARCHAR(255) , --MidentNmrHps, 
	@param12 VARCHAR(255) , --MidentStatus, 
	@param13 VARCHAR(255) , --MidentNmPsng, 
	@param14 VARCHAR(255) , --MidentTmpPas, 
	@param15 VARCHAR(255) , --MidentTglPas, 
	@param16 VARCHAR(255) , --MidentThnNkh, 
	@param17 VARCHAR(255) , --MidentNmAyah, 
	@param18 VARCHAR(255) , --MidentTglAyh, 
	@param19 VARCHAR(255) , --MidentKrjAyh, 
	@param20 VARCHAR(255) , --MidentAlmAyh, 
	@param21 VARCHAR(255) , --MidentNmIbus, 
	@param22 VARCHAR(255) , --MidentTglIbu, 
	@param23 VARCHAR(255) , --MidentKrjIbu, 
	@param24 VARCHAR(255) , --MidentAlmIbu, 
	@param25 VARCHAR(255) , --MidentUserID, 
	@param26 VARCHAR(255)  --MidentUserDt	

AS
BEGIN

--DECLARE @param1 VARCHAR(10),   -- PARAM										
--		@param2 VARCHAR(255), --MidentIdents,  
--		@param3 VARCHAR(255) , --MidentJnsIdn, 
--		@param4 VARCHAR(255) , --MidentNamass, 
--		@param5 VARCHAR(255) , --MidentJnsKel, 
--		@param6 VARCHAR(255) , --MidentTmplhr, 
--		@param7 VARCHAR(255) , --MidentTgllhr, 
--		@param8 VARCHAR(255) , --MidentPekerj, 
--		@param9 VARCHAR(255) , --MidentNmrPeg, 
--		@param10 VARCHAR(255) , --MidentAlamat, 
--		@param11 VARCHAR(255) , --MidentNmrHps, 
--		@param12 VARCHAR(255) , --MidentStatus, 
--		@param13 VARCHAR(255) , --MidentNmPsng, 
--		@param14 VARCHAR(255) , --MidentTmpPas, 
--		@param15 VARCHAR(255) , --MidentTglPas, 
--		@param16 VARCHAR(255) , --MidentThnNkh, 
--		@param17 VARCHAR(255) , --MidentNmAyah, 
--		@param18 VARCHAR(255) , --MidentTglAyh, 
--		@param19 VARCHAR(255) , --MidentKrjAyh, 
--		@param20 VARCHAR(255) , --MidentAlmAyh, 
--		@param21 VARCHAR(255) , --MidentNmIbus, 
--		@param22 VARCHAR(255) , --MidentTglIbu, 
--		@param23 VARCHAR(255) , --MidentKrjIbu, 
--		@param24 VARCHAR(255) , --MidentAlmIbu, 
--		@param25 VARCHAR(255) , --MidentUserID, 
--		@param26 VARCHAR(255)  --MidentUserDt									
										

--		SET @param1 = 'E' -- PARAM							
--		SET @param2 = 'MI0001' --MidentIdents,  
--		SET @param3 = '1' --MidentJnsIdn, 
--		SET @param4 = 'FikriS' --MidentNamass, 
--		SET @param5 = '1' --MidentJnsKel, 
--		SET @param6 = 'JakartaS' --MidentTmplhr, 
--		SET @param7 = '20150310' --MidentTgllhr, 
--		SET @param8 = '2' --MidentPekerj, 
--		SET @param9 = 'NIP00012' --MidentNmrPeg, 
--		SET @param10 = 'Karang PolaS' --MidentAlamat, 
--		SET @param11 = '0857820454013' --MidentNmrHps, 
--		SET @param12 = '2' --MidentStatus, 
--		SET @param13 = 'Test1' --MidentNmPsng, 
--		SET @param14 = 'Jakartas' --MidentTmpPas, 
--		SET @param15 = '20150310' --MidentTglPas, 
--		SET @param16 = '2012' --MidentThnNkh, 
--		SET @param17 = 'Ayah1s' --MidentNmAyah, 
--		SET @param18 = '20150310' --MidentTglAyh, 
--		SET @param19 = 'Test1s' --MidentKrjAyh, 
--		SET @param20 = 'Alamat1s' --MidentAlmAyh, 
--		SET @param21 = 'Ibu1s' --MidentNmIbus, 
--		SET @param22 = '20150310' --MidentTglIbu, 
--		SET @param23 = 'Test1s' --MidentKrjIbu, 
--		SET @param24 = 'Test1s' --MidentAlmIbu, 
--		SET @param25 = '' --MidentUserID, 
--		SET @param26 = '' --MidentUserDt		

DECLARE @date SMALLDATETIME,
				@sql VARCHAR(8000),
				@where VARCHAR(8000)

IF @param1 = 'I'
BEGIN

INSERT INTO landcomp.MIDENT_LOG	(
									MidentLParams,
									MidentLDatess, 
									MidentLIdents, 
									MidentLJnsIdn, 
									MidentLNamass, 
									MidentLJnsKel, 
									MidentLTmplhr, 
									MidentLTgllhr, 
									MidentLPekerj, 
									MidentLNmrPeg, 
									MidentLAlamat, 
									MidentLNmrHps, 
									MidentLStatus, 
									MidentLNmPsng, 
									MidentLTmpPas, 
									MidentLTglPas, 
									MidentLThnNkh, 
									MidentLNmAyah, 
									MidentLTglAyh, 
									MidentLKrjAyh, 
									MidentLAlmAyh, 
									MidentLNmIbus, 
									MidentLTglIbu, 
									MidentLKrjIbu, 
									MidentLAlmIbu, 
									MidentLUserID, 
									MidentLUserDt	
								 )	VALUES
								 (
									@param1,
									GETDATE(),
									@param2,
									@param3,
									@param4,
									@param5,
									@param6,
									@param7,
									@param8,
									@param9,
									@param10,
									@param11,
									@param12,
									@param13,
									@param14,
									@param15,
									@param16,
									@param17,
									@param18,
									@param19,
									@param20,
									@param21,
									@param22,
									@param23,
									@param24,
									@param25,
									GETDATE()				
								 )				

INSERT INTO landcomp.Mident   (	
									MidentIdents,
									MidentDatess, 
									MidentJnsIdn, 
									MidentNamass, 
									MidentJnsKel, 
									MidentTmplhr, 
									MidentTgllhr, 
									MidentPekerj, 
									MidentNmrPeg, 
									MidentAlamat, 
									MidentNmrHps, 
									MidentStatus, 
									MidentNmPsng, 
									MidentTmpPas, 
									MidentTglPas, 
									MidentThnNkh, 
									MidentNmAyah, 
									MidentTglAyh, 
									MidentKrjAyh, 
									MidentAlmAyh, 
									MidentNmIbus, 
									MidentTglIbu, 
									MidentKrjIbu, 
									MidentAlmIbu, 
									MidentUserID, 
									MidentUserDt
							   ) VALUES
							   ( 
									@param2,
									GETDATE(),
									@param3,
									@param4,
									@param5,
									@param6,
									@param7,
									@param8,
									@param9,
									@param10,
									@param11,
									@param12,
									@param13,
									@param14,
									@param15,
									@param16,
									@param17,
									@param18,
									@param19,
									@param20,
									@param21,
									@param22,
									@param23,
									@param24,
									@param25,
									GETDATE()
							   )
										
END


IF @param1 = 'E'
BEGIN

INSERT INTO landcomp.MIDENT_LOG	
											(
													MidentLParams, 
													MidentLIdents, 
													MidentLJnsIdn, 
													MidentLNamass, 
													MidentLJnsKel, 
													MidentLTmplhr, 
													MidentLTgllhr, 
													MidentLPekerj, 
													MidentLNmrPeg, 
													MidentLAlamat, 
													MidentLNmrHps, 
													MidentLStatus, 
													MidentLNmPsng, 
													MidentLTmpPas, 
													MidentLTglPas, 
													MidentLThnNkh, 
													MidentLNmAyah, 
													MidentLTglAyh, 
													MidentLKrjAyh, 
													MidentLAlmAyh, 
													MidentLNmIbus, 
													MidentLTglIbu, 
													MidentLKrjIbu, 
													MidentLAlmIbu, 
													MidentLUserID, 
													MidentLUserDt
											)		VALUES
											(
														@param1,
														@param2, 
														@param3, 
														@param4, 
														@param5, 
														CONVERT(VARCHAR(10),@param6,112), 
														@param7, 
														@param8, 
														@param9, 
														@param10, 
														@param11, 
														@param12, 
														@param13, 
														@param14, 
														CONVERT(VARCHAR(10),@param15,112), 
														@param16, 
														@param17, 
														CONVERT(VARCHAR(10),@param18,112), 
														@param19, 
														@param20, 
														@param21, 
														CONVERT(VARCHAR(10),@param22,112), 
														@param23, 
														@param24, 													
														@param25, 
														GETDATE()
											)				

UPDATE landcomp.MIDENT
														SET 
														MidentJnsIdn = @param3,
														MidentNamass = @param4,
														MidentJnsKel = @param5,
														MidentTmplhr= @param6,
														MidentTgllhr= @param7,
														MidentPekerj= @param8,
														MidentNmrPeg= @param9,
														MidentAlamat= @param10,
														MidentNmrHps= @param11,
														MidentStatus= @param12,
														MidentNmPsng= @param13,
														MidentTmpPas= @param14,
														MidentTglPas= @param15,
														MidentThnNkh= @param16,
														MidentNmAyah= @param17,
														MidentTglAyh= @param18,
														MidentKrjAyh= @param19,
														MidentAlmAyh= @param20,
														MidentNmIbus= @param21,
														MidentTglIbu= @param22,
														MidentKrjIbu= @param23, 
														MidentAlmIbu= @param24
WHERE midentIdents=@param2 

END


IF @param1 = 'F'
BEGIN

SELECT MidentIdents, 
							MidentJnsIdn, 
							MidentNamass, 
							MidentJnsKel, 
							MidentTmplhr, 
							REPLACE(CONVERT(VARCHAR(10),MidentTgllhr,111),'/','-')MidentTgllhr, 
							MidentPekerj, 
							MidentNmrPeg, 
							MidentAlamat, 
							MidentNmrHps, 
							MidentStatus, 
							MidentNmPsng, 
							MidentTmpPas, 
							REPLACE(CONVERT(VARCHAR(10),MidentTglPas,111),'/','-')MidentTglPas, 
							REPLACE(CONVERT(VARCHAR(4),MidentThnNkh,111),'/','-')MidentThnNkh, 
							MidentNmAyah, 
							REPLACE(CONVERT(VARCHAR(10),MidentTglAyh,111),'/','-')MidentTglAyh, 
							MidentKrjAyh, 
							MidentAlmAyh, 
							MidentNmIbus, 
							REPLACE(CONVERT(VARCHAR(10),MidentTglIbu,111),'/','-')MidentTglIbu, 
							MidentKrjIbu, 
							MidentAlmIbu
FROM landcomp.MIDENT
WHERE MidentIdents = @param2

END

IF @param1 = 'D'
BEGIN

	DELETE landcomp.Mident
	WHERE MidentIdents = @param2

END


IF @param1 = 'UAY'
BEGIN

UPDATE landcomp.Mident
			SET MidentNmAyah = @param17,
							MidentTglAyh = @param18,
							MidentKrjAyh = @param19,
							MidentAlmAyh = @param20
			WHERE MidentIdents = @param2
END


IF @param1 = 'SAY'
BEGIN

SELECT MidentNmAyah, 
							MidentTglAyh, 
							MidentKrjAyh, 
							MidentAlmAyh 
FROM landcomp.Mident
WHERE MidentIdents = @param2
END

IF @param1 = 'UIB'
BEGIN

UPDATE landcomp.Mident
			SET MidentNmIbus = @param21,
							MidentTglIbu = @param22,
							MidentKrjIbu = @param23,
							MidentAlmIbu = @param24
			WHERE MidentIdents = @param2
END

IF @param1 = 'SIB'
BEGIN

SELECT MidentNmIbus,
							MidentTglIbu,
							MidentKrjIbu,
							MidentAlmIbu
FROM landcomp.Mident
WHERE MidentIdents = @param2
			
END

IF @param1 = 'L'
BEGIN

--SELECT			  MidentIdents,
--							MidentNamass,
--							b.codessDescs1 MidentJnsKel,
--							MidentTmplhr,
--							REPLACE(CONVERT(VARCHAR(10),MidentTglLhr,111),'/','-') MidentTglLhr,
--							''  MidentStatus