USE [master]
GO
/****** Object:  Database [dbPerpustakaan]    Script Date: 13/12/2019 14.22.23 ******/
if exists (select 1 from sys.databases where name = 'dbPerpustakaan')
begin
DROP DATABASE [dbPerpustakaan]
end
GO
/****** Object:  Database [dbPerpustakaan]    Script Date: 13/12/2019 14.22.23 ******/
CREATE DATABASE [dbPerpustakaan] 
GO
USE [dbPerpustakaan]
GO
/****** Object:  Table [dbo].[mAnggota]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mAnggota](
	[idAnggota] [int] IDENTITY(1,1) NOT NULL,
	[namaAnggota] [varchar](50) NULL,
	[idJkelamin] [int] NULL,
	[alamat] [varchar](max) NULL,
	[noHP] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAnggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mBuku]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mBuku](
	[idBuku] [int] IDENTITY(1,1) NOT NULL,
	[idPenerbit] [int] NULL,
	[idJenisBuku] [int] NULL,
	[judulBuku] [varchar](max) NULL,
	[jangkaWaktu] [int] NULL,
	[dendaPerhari] [decimal](18, 2) NULL,
	[tglTerbit] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mJenisBuku]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mJenisBuku](
	[idJenisBuku] [int] IDENTITY(1,1) NOT NULL,
	[jenisBuku] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idJenisBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mJKelamin]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mJKelamin](
	[idJkelamin] [int] IDENTITY(1,1) NOT NULL,
	[jenisKelamin] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idJkelamin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mPenerbit]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mPenerbit](
	[idPenerbit] [int] IDENTITY(1,1) NOT NULL,
	[namaPenerbit] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPenerbit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mPetugas]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mPetugas](
	[NIK] [varchar](12) NOT NULL,
	[namaPetugas] [varchar](50) NULL,
	[idJkelamin] [int] NULL,
	[alamat] [varchar](max) NULL,
	[noHP] [varchar](15) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NIK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mRakBuku]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mRakBuku](
	[idRakBuku] [int] IDENTITY(1,1) NOT NULL,
	[namaRak] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRakBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mStatusUser]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mStatusUser](
	[idStatusUser] [int] IDENTITY(1,1) NOT NULL,
	[jenisUser] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idStatusUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mUser]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mUser](
	[NIK] [varchar](12) NOT NULL,
	[idUser] [varchar](20) NULL,
	[password] [varchar](20) NULL,
	[idStatusUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NIK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settingEmail]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settingEmail](
	[email] [varchar](50) NULL,
	[passEmail] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHakAkses]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHakAkses](
	[idMenu] [int] NULL,
	[idStatusUser] [int] NULL,
	[Menu] [varchar](50) NULL,
	[SubMenu] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblJumlahBuku]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJumlahBuku](
	[idBuku] [int] NOT NULL,
	[jumlahBukuTersedia] [int] NULL,
	[jumlahBukuTerpinjam] [int] NULL,
	[idRakBuku] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPeminjaman]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeminjaman](
	[nomorPinjaman] [varchar](12) NOT NULL,
	[idAnggota] [int] NULL,
	[idBuku] [int] NULL,
	[tglPinjam] [date] NULL,
	[NIK] [varchar](12) NULL,
	[statusPeminjaman] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[nomorPinjaman] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPengembalian]    Script Date: 13/12/2019 14.22.23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPengembalian](
	[nomorPinjaman] [varchar](12) NOT NULL,
	[tglPengembalian] [date] NULL,
	[lamaPinjam] [int] NULL,
	[telat] [int] NULL,
	[denda] [decimal](18, 2) NULL,
	[totalDenda] [decimal](18, 2) NULL,
	[NIK] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[nomorPinjaman] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mAnggota] ON 

INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP]) VALUES (1, N'Diaz ', 1, N'Bekasi', N'812178906')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP]) VALUES (2, N'Erlangga', 1, N'Bekasi', N'812178907')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP]) VALUES (3, N'Djendra', 2, N'Bekasi', N'812178908')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP]) VALUES (4, N'Wisnu', 1, N'Bekasi', N'812178909')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP]) VALUES (5, N'Putra', 1, N'Bekasi', N'812178910')
SET IDENTITY_INSERT [dbo].[mAnggota] OFF
SET IDENTITY_INSERT [dbo].[mBuku] ON 

INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit]) VALUES (1, 2, 1, N'Cara Cepat Jadi Kaya', 20, CAST(100000.00 AS Decimal(18, 2)), CAST(N'2018-03-04' AS Date))
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit]) VALUES (2, 2, 1, N'Hidup Sederhana Secangkir Kopi', 15, CAST(1000.00 AS Decimal(18, 2)), CAST(N'2018-03-04' AS Date))
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit]) VALUES (3, 2, 1, N'Ilmu Gendam dan Black Magic', 20, CAST(500.00 AS Decimal(18, 2)), CAST(N'2018-03-04' AS Date))
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit]) VALUES (4, 1, 4, N'Fungsi ajaib VPN', 45, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2018-03-04' AS Date))
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit]) VALUES (5, 3, 3, N'Naruto Shippuden vol 18', 10, CAST(1500.00 AS Decimal(18, 2)), CAST(N'2018-03-04' AS Date))
SET IDENTITY_INSERT [dbo].[mBuku] OFF
SET IDENTITY_INSERT [dbo].[mJenisBuku] ON 

INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku]) VALUES (1, N'Pengetahuan')
INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku]) VALUES (2, N'Novel')
INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku]) VALUES (3, N'Komik')
INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku]) VALUES (4, N'Teknologi')
SET IDENTITY_INSERT [dbo].[mJenisBuku] OFF
SET IDENTITY_INSERT [dbo].[mJKelamin] ON 

INSERT [dbo].[mJKelamin] ([idJkelamin], [jenisKelamin]) VALUES (1, N'LAKI-LAKI')
INSERT [dbo].[mJKelamin] ([idJkelamin], [jenisKelamin]) VALUES (2, N'PEREMPUAN')
SET IDENTITY_INSERT [dbo].[mJKelamin] OFF
SET IDENTITY_INSERT [dbo].[mPenerbit] ON 

INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit]) VALUES (1, N'Erlangga')
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit]) VALUES (2, N'Elex Media Komputindo')
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit]) VALUES (3, N'Grasindo')
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit]) VALUES (4, N'Bhuana Ilmu Poluler')
SET IDENTITY_INSERT [dbo].[mPenerbit] OFF
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email]) VALUES (N'30021566326', N'Novan', 1, N'Bekasi', N'8156632265', N'novan@yahoo.com')
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email]) VALUES (N'30021566327', N'Cinta', 2, N'Bekasi', N'8156632266', N'cinta@yahoo.com')
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email]) VALUES (N'30021566328', N'Lutfi', 1, N'Bekasi', N'8156632267', N'Lutfi@yahoo.com')
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email]) VALUES (N'30021566329', N'Bambang', 1, N'Bekasi', N'8156632268', N'bams@yahoo.com')
SET IDENTITY_INSERT [dbo].[mRakBuku] ON 

INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak]) VALUES (1, N'Pintu Masuk')
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak]) VALUES (2, N'Samping Kasir')
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak]) VALUES (3, N'Sudut Kanan')
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak]) VALUES (4, N'Sudut Kiri')
SET IDENTITY_INSERT [dbo].[mRakBuku] OFF
SET IDENTITY_INSERT [dbo].[mStatusUser] ON 

INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (1, N'Admin')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[mStatusUser] OFF
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566326', N'lope12', N'langsungenter', 2)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566327', N'barbar', N'satusampelima', 2)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566328', N'tuyul', N'resetpassword', 1)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (1, 50, 0, 1)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (2, 50, 0, 2)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (3, 50, 0, 3)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (4, 50, 0, 4)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (5, 50, 0, 2)
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'201911080001', 5, 4, CAST(N'2019-11-08' AS Date), N'30021566326', N'Pinjam')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'201911080002', 3, 3, CAST(N'2019-11-08' AS Date), N'30021566326', N'Pinjam')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'201911080003', 2, 1, CAST(N'2019-11-08' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'201911080003', CAST(N'2019-11-15' AS Date), 7, 0, CAST(100000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
ALTER TABLE [dbo].[mAnggota]  WITH CHECK ADD  CONSTRAINT [FKidJkelamin1] FOREIGN KEY([idJkelamin])
REFERENCES [dbo].[mJKelamin] ([idJkelamin])
GO
ALTER TABLE [dbo].[mAnggota] CHECK CONSTRAINT [FKidJkelamin1]
GO
ALTER TABLE [dbo].[mBuku]  WITH CHECK ADD  CONSTRAINT [fkidJenisBuku] FOREIGN KEY([idJenisBuku])
REFERENCES [dbo].[mJenisBuku] ([idJenisBuku])
GO
ALTER TABLE [dbo].[mBuku] CHECK CONSTRAINT [fkidJenisBuku]
GO
ALTER TABLE [dbo].[mBuku]  WITH CHECK ADD  CONSTRAINT [fkIdpenerbit] FOREIGN KEY([idPenerbit])
REFERENCES [dbo].[mPenerbit] ([idPenerbit])
GO
ALTER TABLE [dbo].[mBuku] CHECK CONSTRAINT [fkIdpenerbit]
GO
ALTER TABLE [dbo].[mPetugas]  WITH CHECK ADD  CONSTRAINT [FKidJkelamin2] FOREIGN KEY([idJkelamin])
REFERENCES [dbo].[mJKelamin] ([idJkelamin])
GO
ALTER TABLE [dbo].[mPetugas] CHECK CONSTRAINT [FKidJkelamin2]
GO
ALTER TABLE [dbo].[mUser]  WITH CHECK ADD  CONSTRAINT [fkidStatusUser] FOREIGN KEY([idStatusUser])
REFERENCES [dbo].[mStatusUser] ([idStatusUser])
GO
ALTER TABLE [dbo].[mUser] CHECK CONSTRAINT [fkidStatusUser]
GO
ALTER TABLE [dbo].[mUser]  WITH CHECK ADD  CONSTRAINT [fkNIK] FOREIGN KEY([NIK])
REFERENCES [dbo].[mPetugas] ([NIK])
GO
ALTER TABLE [dbo].[mUser] CHECK CONSTRAINT [fkNIK]
GO
ALTER TABLE [dbo].[tblHakAkses]  WITH CHECK ADD  CONSTRAINT [fkIdstatuser] FOREIGN KEY([idStatusUser])
REFERENCES [dbo].[mStatusUser] ([idStatusUser])
GO
ALTER TABLE [dbo].[tblHakAkses] CHECK CONSTRAINT [fkIdstatuser]
GO
ALTER TABLE [dbo].[tblJumlahBuku]  WITH CHECK ADD  CONSTRAINT [FKidBuku] FOREIGN KEY([idBuku])
REFERENCES [dbo].[mBuku] ([idBuku])
GO
ALTER TABLE [dbo].[tblJumlahBuku] CHECK CONSTRAINT [FKidBuku]
GO
ALTER TABLE [dbo].[tblJumlahBuku]  WITH CHECK ADD  CONSTRAINT [FKidRakBuku] FOREIGN KEY([idRakBuku])
REFERENCES [dbo].[mRakBuku] ([idRakBuku])
GO
ALTER TABLE [dbo].[tblJumlahBuku] CHECK CONSTRAINT [FKidRakBuku]
GO
ALTER TABLE [dbo].[tblPeminjaman]  WITH CHECK ADD  CONSTRAINT [fkIdanggota] FOREIGN KEY([idAnggota])
REFERENCES [dbo].[mAnggota] ([idAnggota])
GO
ALTER TABLE [dbo].[tblPeminjaman] CHECK CONSTRAINT [fkIdanggota]
GO
ALTER TABLE [dbo].[tblPeminjaman]  WITH CHECK ADD  CONSTRAINT [FKidBuku1] FOREIGN KEY([idBuku])
REFERENCES [dbo].[mBuku] ([idBuku])
GO
ALTER TABLE [dbo].[tblPeminjaman] CHECK CONSTRAINT [FKidBuku1]
GO
ALTER TABLE [dbo].[tblPeminjaman]  WITH CHECK ADD  CONSTRAINT [fkNIK1] FOREIGN KEY([NIK])
REFERENCES [dbo].[mPetugas] ([NIK])
GO
ALTER TABLE [dbo].[tblPeminjaman] CHECK CONSTRAINT [fkNIK1]
GO
ALTER TABLE [dbo].[tblPengembalian]  WITH CHECK ADD  CONSTRAINT [fkNIK2] FOREIGN KEY([NIK])
REFERENCES [dbo].[mPetugas] ([NIK])
GO
ALTER TABLE [dbo].[tblPengembalian] CHECK CONSTRAINT [fkNIK2]
GO
ALTER TABLE [dbo].[tblPengembalian]  WITH CHECK ADD  CONSTRAINT [fkNomorPinjam] FOREIGN KEY([nomorPinjaman])
REFERENCES [dbo].[tblPeminjaman] ([nomorPinjaman])
GO
ALTER TABLE [dbo].[tblPengembalian] CHECK CONSTRAINT [fkNomorPinjam]
GO
USE [master]
GO
ALTER DATABASE [dbPerpustakaan] SET  READ_WRITE 
GO
