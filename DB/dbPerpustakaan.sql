USE [master]
GO
ALTER DATABASE dbPerpustakaan SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
if exists(select 1 from sys.databases where name = 'dbPerpustakaan')
begin
drop database dbPerpustakaan
end
go
CREATE DATABASE [dbPerpustakaan]
GO
USE [dbPerpustakaan]
GO
/****** Object:  Table [dbo].[mAnggota]    Script Date: 22/01/2020 15.54.58 ******/
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
	[status] [int] NULL,
	[KartuPerpus] [varchar](10) NULL,
 CONSTRAINT [PK__mAnggota__2E4E51094952746C] PRIMARY KEY CLUSTERED 
(
	[idAnggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mBuku]    Script Date: 22/01/2020 15.54.58 ******/
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
	[dendaPerhari] [decimal](18, 0) NULL,
	[tglTerbit] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__mBuku__EFEAD3518FADA751] PRIMARY KEY CLUSTERED 
(
	[idBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mJenisBuku]    Script Date: 22/01/2020 15.54.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mJenisBuku](
	[idJenisBuku] [int] IDENTITY(1,1) NOT NULL,
	[jenisBuku] [varchar](50) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idJenisBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mJKelamin]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[mPenerbit]    Script Date: 22/01/2020 15.54.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mPenerbit](
	[idPenerbit] [int] IDENTITY(1,1) NOT NULL,
	[namaPenerbit] [varchar](50) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPenerbit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mPetugas]    Script Date: 22/01/2020 15.54.58 ******/
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
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NIK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mRakBuku]    Script Date: 22/01/2020 15.54.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mRakBuku](
	[idRakBuku] [int] IDENTITY(1,1) NOT NULL,
	[namaRak] [varchar](50) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRakBuku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mStatusUser]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[mUser]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[settingPerpus]    Script Date: 22/01/2020 15.54.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settingPerpus](
	[email] [varchar](50) NULL,
	[passEmail] [varchar](50) NULL,
	[defaultPinjam] [int] NULL,
	[maxPinjam] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHakAkses]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[tblJumlahBuku]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[tblPeminjaman]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[tblPengembalian]    Script Date: 22/01/2020 15.54.58 ******/
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
/****** Object:  Table [dbo].[test]    Script Date: 22/01/2020 15.54.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[yayay] [int] NULL,
	[uauauau] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mAnggota] ON 

INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (1, N'Diaz ', 1, N'Bekasi', N'812178906', 1, N'2020010201')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (2, N'Erlangga', 1, N'Bekasi', N'812178907', 1, N'2020010202')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (3, N'Djendra', 2, N'Bekasi', N'812178908', 1, N'2020010203')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (4, N'Wisnu', 1, N'Bekasi', N'812178909', 1, N'2020010204')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (5, N'Putra', 1, N'Bekasi', N'0812178910', 1, N'2020010205')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (6, N'Mas Danang', 1, N'dggdgdgdg', N'08442446646', 1, N'2020010206')
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status], [KartuPerpus]) VALUES (7, N'Orang bapuk', 1, N'Bapuk bet dah lotnok', N'08965446525', 1, N'2020010301')
SET IDENTITY_INSERT [dbo].[mAnggota] OFF
SET IDENTITY_INSERT [dbo].[mBuku] ON 

INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (1, 2, 1, N'Cara Cepat Jadi Kaya', 20, CAST(100000 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (2, 1, 1, N'Hidup Sederhana Secangkir Kopi panas', 15, CAST(1000 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (3, 2, 1, N'Ilmu Gendam dan Black Magic', 20, CAST(500 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (4, 1, 4, N'Fungsi ajaib VPN', 45, CAST(2000 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (5, 3, 3, N'Naruto Shippuden vol 18', 10, CAST(1500 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 9)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (6, 1, 1, N'Kunci Sukses Ahli Neraka', 30, CAST(666 AS Decimal(18, 0)), CAST(N'2015-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (7, 4, 4, N'Merakit Komputer Sendiri', 12, CAST(200 AS Decimal(18, 0)), CAST(N'2005-07-20' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (8, 4, 4, N'Cara Hack Facebook Sendiri', 20, CAST(600 AS Decimal(18, 0)), CAST(N'2015-02-26' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (9, 3, 1, N'Tuyul Bukanlah Sekedar Profesi', 50, CAST(900 AS Decimal(18, 0)), CAST(N'2018-06-05' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (10, 4, 1, N'Bertahan Hidup di Penghujung Bulan', 30, CAST(150000 AS Decimal(18, 0)), CAST(N'2018-06-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[mBuku] OFF
SET IDENTITY_INSERT [dbo].[mJenisBuku] ON 

INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku], [status]) VALUES (1, N'Pengetahuan', 1)
INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku], [status]) VALUES (2, N'Nempel', 9)
INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku], [status]) VALUES (3, N'Komik', 1)
INSERT [dbo].[mJenisBuku] ([idJenisBuku], [jenisBuku], [status]) VALUES (4, N'Teknologi', 1)
SET IDENTITY_INSERT [dbo].[mJenisBuku] OFF
SET IDENTITY_INSERT [dbo].[mJKelamin] ON 

INSERT [dbo].[mJKelamin] ([idJkelamin], [jenisKelamin]) VALUES (1, N'LAKI-LAKI')
INSERT [dbo].[mJKelamin] ([idJkelamin], [jenisKelamin]) VALUES (2, N'PEREMPUAN')
SET IDENTITY_INSERT [dbo].[mJKelamin] OFF
SET IDENTITY_INSERT [dbo].[mPenerbit] ON 

INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit], [status]) VALUES (1, N'Erlangga', 1)
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit], [status]) VALUES (2, N'Elex Media Komputindo', 9)
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit], [status]) VALUES (3, N'Grasias', 1)
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit], [status]) VALUES (4, N'Bhuana Ilmu Poluler', 1)
INSERT [dbo].[mPenerbit] ([idPenerbit], [namaPenerbit], [status]) VALUES (5, N'Erlanggaa', 1)
SET IDENTITY_INSERT [dbo].[mPenerbit] OFF
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566326', N'Novan', 1, N'Bekasi', N'8156632265', N'novan@yahoo.com', 1)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566327', N'Cinta', 2, N'Bekasi', N'08156632266', N'cinta@yahoo.com', 9)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566328', N'Lutfi', 1, N'Bekasi', N'8156632267', N'Lutfi@yahoo.com', 1)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566329', N'Bambang', 1, N'Bekasi', N'8156632268', N'bams@yahoo.com', 1)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'326594966595', N'Diaz Erlangga Putra', 1, N'jlnnya jauh bingits', N'081213157674', N'diazerlanggaputra@ymail.com', 1)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'955655646564', N'Anwar Fuadi', 1, N'jln. Jauh dimana aja', N'084494833445', N'anwardoank@yahoo.com', 9)
SET IDENTITY_INSERT [dbo].[mRakBuku] ON 

INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak], [status]) VALUES (1, N'Pintu Masuk', 1)
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak], [status]) VALUES (2, N'Sampingan', 1)
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak], [status]) VALUES (3, N'Sudut Kanan', 1)
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak], [status]) VALUES (4, N'Sudut Kiri', 1)
INSERT [dbo].[mRakBuku] ([idRakBuku], [namaRak], [status]) VALUES (5, N'Pintu Keluar', 1)
SET IDENTITY_INSERT [dbo].[mRakBuku] OFF
SET IDENTITY_INSERT [dbo].[mStatusUser] ON 

INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (1, N'Admin')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (2, N'User')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (3, N'IT')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (4, N'KARYAWAN')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (5, N'PETUGAS')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (6, N'0')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (7, N'KADAL')
INSERT [dbo].[mStatusUser] ([idStatusUser], [jenisUser]) VALUES (8, N'KADALI')
SET IDENTITY_INSERT [dbo].[mStatusUser] OFF
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566326', N'lope12', N'langsungenter', 2)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566327', N'barbar', N'satusampelima', 2)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566328', N'tuyul', N'resetpassword', 1)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'30021566329', N'hmm', N'1', 1)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'326594966595', N'dep', N'1', 1)
INSERT [dbo].[mUser] ([NIK], [idUser], [password], [idStatusUser]) VALUES (N'955655646564', N'lobang', N'yayaya', 1)
INSERT [dbo].[settingPerpus] ([email], [passEmail], [defaultPinjam], [maxPinjam]) VALUES (N'barbar.group12@gmail.com', N'Passwordnyasatusampelima', 3, 4)
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (1, 2, N'Akun', N'Akun')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (2, 1, N'User', N'Akun')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (4, 1, N'Master', N'Master')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (6, 1, N'Master', N'Petugas')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (8, 1, N'Master', N'Add User')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (9, 1, N'Master', N'Hak Akses')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (11, 1, N'Pengembalian', N'Pengembalian')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (3, 2, N'Akun', N'Log Out')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (5, 2, N'Pengembalian', N'Pengembalian')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (7, 2, N'Laporan', N'Harian')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (10, 2, N'Laporan', N'Laporan Master')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (12, 2, N'Laporan Master', N'Laporan Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (3, 1, N'User', N'Log Out')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (5, 1, N'Master', N'Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (1, 1, N'User', N'User')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (7, 1, N'Master', N'Anggota')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (10, 1, N'Peminjaman', N'Peminjaman')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (2, 2, N'Akun', N'Ganti Password')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (6, 2, N'Laporan', N'Laporan')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (8, 2, N'Laporan', N'Pertanggal')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (13, 2, N'Laporan Master', N'Laporan User')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (4, 2, N'Peminjaman', N'Peminjaman')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (9, 2, N'Laporan', N'Analisa Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (11, 2, N'Laporan Master', N'Laporan Anggota')
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (1, 50, 0, 1)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (2, 62, 0, 2)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (3, 51, 0, 3)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (4, 51, 0, 4)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (5, 50, 0, 2)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (6, 23, 3, 1)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (10, 20, 0, 2)
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'201911080001', 5, 4, CAST(N'2019-11-08' AS Date), N'30021566326', N'Pinjam')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'201911080002', 3, 3, CAST(N'2019-11-08' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'201911080003', 2, 1, CAST(N'2019-11-08' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050001', 3, 6, CAST(N'2020-01-05' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050002', 4, 6, CAST(N'2020-01-05' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050003', 1, 2, CAST(N'2020-01-05' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050004', 2, 4, CAST(N'2020-01-05' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050005', 5, 3, CAST(N'2020-01-05' AS Date), N'30021566326', N'Kembali')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050006', 4, 6, CAST(N'2020-01-05' AS Date), N'30021566326', N'Pinjam')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050007', 6, 6, CAST(N'2020-01-05' AS Date), N'30021566326', N'Pinjam')
INSERT [dbo].[tblPeminjaman] ([nomorPinjaman], [idAnggota], [idBuku], [tglPinjam], [NIK], [statusPeminjaman]) VALUES (N'202001050008', 7, 6, CAST(N'2020-01-05' AS Date), N'30021566326', N'Pinjam')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'201911080002', CAST(N'2020-01-05' AS Date), 58, 38, CAST(500.00 AS Decimal(18, 2)), CAST(19000.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'201911080003', CAST(N'2019-11-15' AS Date), 7, 0, CAST(100000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'202001050001', CAST(N'2020-01-05' AS Date), 0, 0, CAST(666.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'202001050002', CAST(N'2020-01-05' AS Date), 0, 0, CAST(666.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'202001050003', CAST(N'2020-01-05' AS Date), 0, 0, CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'202001050004', CAST(N'2020-01-05' AS Date), 0, 0, CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[tblPengembalian] ([nomorPinjaman], [tglPengembalian], [lamaPinjam], [telat], [denda], [totalDenda], [NIK]) VALUES (N'202001050005', CAST(N'2020-01-05' AS Date), 0, 0, CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'30021566326')
INSERT [dbo].[test] ([yayay], [uauauau]) VALUES (1, 2)
go
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
/****** Object:  UserDefinedFunction [dbo].[fcAddIdMenu]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fcAddIdMenu] (@idStatus int)
returns int
as
begin

	declare @No int
	declare @IdMenu int
	set @No =1
		
	
	select @IdMenu = MAX(idMenu)
	from tblHakAkses where idStatusUser=@idStatus 

	if @IdMenu is null 
		set @IdMenu = @no 
	else
		set @IdMenu = @IdMenu + 1
	
	return @IdMenu 
end
GO
/****** Object:  UserDefinedFunction [dbo].[fcKartuPerpus]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fcKartuPerpus]()
returns varchar(10)
as
begin
	declare @nomor varchar(10)
	declare @tgl varchar(8) = (select CONVERT(varchar,GETDATE(),112))
	declare @max varchar(8) = (select top 1 left(kartuperpus,8) from mAnggota order by KartuPerpus desc)
	if not exists(select top 1 KartuPerpus from mAnggota)
		begin
			set @nomor = @tgl + '01'
		end
	else
		begin
			if @tgl > @max
				begin
					set @nomor = @tgl + '01'
				end
			else 
				begin
					set @nomor = (select top 1 CONVERT(int,kartuperpus) + 1 from mAnggota order by KartuPerpus desc)
				end
		end
		--print @nomor
return @nomor
end
GO
/****** Object:  UserDefinedFunction [dbo].[fcNomorPinjam]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fcNomorPinjam]()
returns varchar(12)
as
begin
	declare @nomor varchar(12)
	declare @tgl varchar(8) = (select CONVERT(varchar,GETDATE(),112))
	declare @max varchar(8) = (select top 1 left(nomorPinjaman,8) from tblPeminjaman order by nomorPinjaman desc)
	if not exists(select top 1 nomorPinjaman from tblPeminjaman)
		begin
			set @nomor = @tgl + '0001'
		end
	else
		begin
			if @tgl > @max
				begin
					set @nomor = @tgl + '0001'
				end
			else 
				begin
					set @nomor = (select top 1 CONVERT(bigint,nomorPinjaman) + 1 from tblPeminjaman order by nomorPinjaman desc)
				end
		end
		--print @nomor
return @nomor
end
GO
/****** Object:  StoredProcedure [dbo].[spManggota]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spManggota](
@proses varchar(20),
@kartu varchar(10),
@nama varchar(50),
@jk int,
@alamat varchar(max),
@nomor varchar(15)
)
as 
begin
--exec spManggota 'get','kartu','nama',jk,'alamat','nomor'
--select * from manggota
	if @proses = 'get'
		begin
			select KartuPerpus,namaAnggota,b.jenisKelamin,alamat,noHP from mAnggota a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9
		end
	else
	if	@proses = 'add'
		begin
			insert into mAnggota(namaanggota,idJkelamin,alamat,noHP,status,KartuPerpus) select @nama,@jk,@alamat,@nomor,1,(select dbo.fcKartuPerpus())
		end
	else
	if @proses = 'del'
		begin 
			update mAnggota set status = 9 where kartuPerpus= @kartu
		end 
	else
	if @proses ='upd'
		begin
			update mAnggota set status = 1,namaAnggota=@nama,idJkelamin=@jk,alamat=@alamat,noHP=@nomor where kartuPerpus= @kartu
		end
	else
		if @proses = 'All'
		begin
			select KartuPerpus,namaAnggota,b.jenisKelamin,alamat,noHP from mAnggota a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and (namaAnggota like '%'+ @nama +'%' or KartuPerpus like '%'+ @nama +'%'or alamat like '%'+ @nama +'%')
		end
	else
		if @proses = 'Kartu'
		begin
			select KartuPerpus,namaAnggota,b.jenisKelamin,alamat,noHP from mAnggota a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9and (KartuPerpus like '%'+ @nama +'%')
		end
	else
		if @proses = 'Nama'
		begin
			select KartuPerpus,namaAnggota,b.jenisKelamin,alamat,noHP from mAnggota a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and ( namaAnggota like '%'+ @nama +'%')
		end
	else
		if @proses = 'Alamat'
		begin
			select KartuPerpus,namaAnggota,b.jenisKelamin,alamat,noHP from mAnggota a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and (alamat like '%'+ @nama +'%')
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMbuku]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spMbuku](
--exec spMbuku 'proses','idBuku','idPenerbit','idjenisbuku','judul','jangka','denda','tanggal'
@proses varchar(20),
@idBuku int,
@idPenerbit int,
@idJenisBuku int,
@judulBuku varchar(MAX),
@jangka int,
@denda decimal(18,2),
@tgl date
)
as 
begin
	if @proses = 'get'
		begin
			select c.namaPenerbit,b.jenisBuku,a.idBuku,judulBuku,jangkaWaktu,dendaPerhari,tglTerbit from mbuku a 
			inner join mjenisbuku b on a.idJenisBuku = b.idJenisBuku
			inner join mPenerbit c on a.idPenerbit = c.idPenerbit where a.status <>9
		end
	else
	if @proses = 'Cek'
		begin
			select 1 from mbuku where judulBuku = @judulBuku and idPenerbit =@idPenerbit and idJenisBuku =@idJenisBuku and status <> 9
		end
	else
	if	@proses = 'add'
		begin
			if exists(select 1 from mbuku where judulBuku =@judulBuku and idPenerbit =@idPenerbit and idJenisBuku =@idJenisBuku and status =9)
				begin
					update mbuku set status = 1 where judulBuku =@judulBuku and idPenerbit =@idPenerbit and idJenisBuku =@idJenisBuku and status =9
				end
			else
				begin
					insert into mbuku(idPenerbit,
									  idJenisBuku,
									  judulBuku,
									  jangkaWaktu,
									  dendaPerhari,
									  tglTerbit,
									  status) 
					values (@idPenerbit,@idJenisBuku,@judulBuku,@jangka,@denda,CONVERT(date,@tgl),1)
				end
		end
	else
	if @proses = 'del'
		begin 
			update mbuku set status = 9 where idBuku = @idBuku
		end 
	else
	if @proses ='upd'
		begin
			update mbuku set judulBuku = @judulBuku,
							 idPenerbit=@idPenerbit,
							 idJenisBuku =@idJenisBuku,
							 jangkaWaktu=@jangka,
							 dendaPerhari =@denda where idBuku = @idBuku
		end
	else
	if @proses ='Penerbit'
		begin
			select c.namaPenerbit,b.jenisBuku,a.idBuku,judulBuku,jangkaWaktu,dendaPerhari,tglTerbit from mbuku a 
			inner join mjenisbuku b on a.idJenisBuku = b.idJenisBuku
			inner join mPenerbit c on a.idPenerbit = c.idPenerbit where a.status <>9 and c.namaPenerbit like '%'+@judulBuku+'%'
		end
	else
	if @proses ='Judul Buku'
		begin
			select c.namaPenerbit,b.jenisBuku,a.idBuku,judulBuku,jangkaWaktu,dendaPerhari,tglTerbit from mbuku a 
			inner join mjenisbuku b on a.idJenisBuku = b.idJenisBuku
			inner join mPenerbit c on a.idPenerbit = c.idPenerbit where a.status <>9 and a.judulBuku like '%'+@judulBuku+'%'
		end
	else
	if @proses ='Jenis Buku'
		begin
			select c.namaPenerbit,b.jenisBuku,a.idBuku,judulBuku,jangkaWaktu,dendaPerhari,tglTerbit from mbuku a 
			inner join mjenisbuku b on a.idJenisBuku = b.idJenisBuku
			inner join mPenerbit c on a.idPenerbit = c.idPenerbit where a.status <>9 and b.jenisBuku like '%'+@judulBuku+'%'
		end
		else
	if @proses ='All'
		begin
			select c.namaPenerbit,b.jenisBuku,a.idBuku,judulBuku,jangkaWaktu,dendaPerhari,tglTerbit from mbuku a 
			inner join mjenisbuku b on a.idJenisBuku = b.idJenisBuku
			inner join mPenerbit c on a.idPenerbit = c.idPenerbit where a.status <>9 and (b.jenisBuku like '%'+@judulBuku+'%' or a.judulBuku like '%'+@judulBuku+'%' or c.namaPenerbit like '%'+@judulBuku+'%' )
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMjenisBuku]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spMjenisBuku](
@proses varchar(10),
@id int,
@nama varchar(50)
)
as 
begin

	if @proses = 'get'
		begin
			select idJenisBuku,jenisBuku from mJenisBuku where status <>9
		end
	else
	if @proses = 'Cek'
		begin
			select 1 from mJenisBuku where jenisBuku = @nama and status <> 9
		end
	else
	if	@proses = 'add'
		begin
			if exists(select 1 from mJenisBuku where jenisBuku =@nama and status =9)
				begin
					update mJenisBuku set status = 1 where jenisBuku =@nama and status =9
				end
			else
				begin
					insert into mJenisBuku(jenisBuku,status) values (@nama,1)
				end
		end
	else
	if @proses = 'del'
		begin 
			update mJenisBuku set status = 9 where idJenisBuku = @id
		end 
	else
	if @proses ='upd'
		begin
			update mJenisBuku set jenisBuku = @nama where idJenisBuku = @id
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMpenerbit]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spMpenerbit](
@proses varchar(10),
@id int,
@nama varchar(50)
)
as 
begin

	if @proses = 'get'
		begin
			select idPenerbit,namaPenerbit from mPenerbit where status <>9
		end
	else
	if @proses = 'Cek'
		begin
			select 1 from mpenerbit where namaPenerbit = @nama and status <> 9
		end
	else
	if	@proses = 'add'
		begin
			if exists(select 1 from mPenerbit where namaPenerbit =@nama and status =9)
				begin
					update mPenerbit set status = 1 where namaPenerbit =@nama and status =9
				end
			else
				begin
					insert into mPenerbit(namaPenerbit,status) values (@nama,1)
				end
		end
	else
	if @proses = 'del'
		begin 
			update mPenerbit set status = 9 where idPenerbit = @id
		end 
	else
	if @proses ='upd'
		begin
			update mPenerbit set namaPenerbit = @nama where idPenerbit = @id
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMpetugas]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spMpetugas](
@proses varchar(20),
@nik varchar(12),
@nama varchar(50),
@jk int,
@alamat varchar(max),
@nomor varchar(15),
@email varchar(50)
)
as 
begin
--exec spMpetugas 'get','nik','nama',jk,'alamat','nomor','email'
--select * from mpetugas
	if @proses = 'get'
		begin
			select NIK,namaPetugas,b.jenisKelamin,alamat,noHP,email from mpetugas a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9
		end
	else
	if @proses = 'Cek'
		begin
			select 1 from mpetugas where NIK = @nik and status <> 9
		end
	else
	if	@proses = 'add'
		begin
			if exists(select 1 from mpetugas where NIK =@nik and status =9)
				begin
					update mpetugas set status = 1,namaPetugas=@nama,idJkelamin=@jk,alamat=@alamat,noHP=@nomor,email=@email where NIK =@nik and status =9
				end
			else
				begin
					insert into mpetugas select @nik,@nama,@jk,@alamat,@nomor,@email,1
				end
		end
	else
	if @proses = 'del'
		begin 
			update mpetugas set status = 9 where NIK =@nik
		end 
	else
	if @proses ='upd'
		begin
			update mpetugas set status = 1,namaPetugas=@nama,idJkelamin=@jk,alamat=@alamat,noHP=@nomor,email=@email where NIK =@nik 
		end
	else
		if @proses = 'All'
		begin
			select NIK,namaPetugas,b.jenisKelamin,alamat,noHP,email from mpetugas a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and (NIK like '%'+ @nama +'%' or namaPetugas like '%'+ @nama +'%'or alamat like '%'+ @nama +'%')
		end
	else
		if @proses = 'NIK'
		begin
			select NIK,namaPetugas,b.jenisKelamin,alamat,noHP,email from mpetugas a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and (NIK like '%'+ @nama +'%')
		end
	else
		if @proses = 'Nama'
		begin
			select NIK,namaPetugas,b.jenisKelamin,alamat,noHP,email from mpetugas a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and ( namaPetugas like '%'+ @nama +'%')
		end
	else
		if @proses = 'Alamat'
		begin
			select NIK,namaPetugas,b.jenisKelamin,alamat,noHP,email from mpetugas a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin  where status <>9 and (alamat like '%'+ @nama +'%')
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMRakBuku]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spMRakBuku](
@proses varchar(10),
@id int,
@nama varchar(50)
)
as 
begin

	if @proses = 'get'
		begin
			select idRakBuku,namaRak from mRakBuku where status <>9
		end
	else
	if @proses = 'Cek'
		begin
			select 1 from mRakBuku where namaRak = @nama and status <> 9
		end
	else
	if	@proses = 'add'
		begin
			if exists(select 1 from mRakBuku where namaRak =@nama and status =9)
				begin
					update mRakBuku set status = 1 where namaRak =@nama and status =9
				end
			else
				begin
					insert into mRakBuku(namaRak,status) values (@nama,1)
				end
		end
	else
	if @proses = 'del'
		begin 
			update mRakBuku set status = 9 where idRakBuku = @id
		end 
	else
	if @proses ='upd'
		begin
			update mRakBuku set namaRak = @nama where idRakBuku = @id
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMstatusUser]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spMstatusUser](
@proses varchar (10),
@id int,
@JenisUser varchar (30)
)
as
begin
--exec spMstatusUser 'proses','id','jenisuser'
	if @proses = 'getAll'
		begin

				begin
					select * from mStatusUser
				end
		end
	else
	if @proses = 'get'
		begin

				begin
					select * from mStatusUser where idStatusUser <>1
				end
		end
	else
	if @proses = 'add'
		begin
			insert into mStatususer(jenisUser) values(@JenisUser)
		end
	else
	if @proses ='cek'
		begin
			select 1 from mStatusUser where jenisUser = @JenisUser
		end
	if @proses ='status'
		begin
			select a.NIK,b.jenisUser,c.namaPetugas,b.idStatusUser from mUser a 
			inner join mStatusUser b on a.idStatusUser = b.idStatusUser
			inner join mPetugas c on a.NIK = c.NIK where a.idUser = @JenisUser
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spMuser]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spMuser](
@proses varchar(10),
@NIK varchar(30),
@idUser varchar(30),
@Password varchar(50),
@idStat int
)
as
begin
	--select * from muser
	--exec spMuser 'pro','nik','iduser','pass','idstat'
	if @proses ='get'
		begin
			select a.nik NIK,c.namaPetugas [Nama Petugas],a.idUser[Username],b.jenisUser[Status User],a.password[Password] from mUser a 
			inner join mStatusUser b on a.idStatusUser = b.idStatusUser
			inner join mPetugas c on a.NIK = c.NIK where c.status <> 9
		end
	else
	if @proses ='login'
		begin
			select a.nik NIK,c.namaPetugas [Nama Petugas],a.idUser[Username],b.jenisUser[Status User],a.password[Password],c.status from mUser a 
			inner join mStatusUser b on a.idStatusUser = b.idStatusUser
			inner join mPetugas c on a.NIK = c.NIK where a.idUser = @idUser and a.password = @Password
		end
	else
	if @proses ='email'
		begin
			select c.email,c.namaPetugas,a.password from mUser a 
			inner join mStatusUser b on a.idStatusUser = b.idStatusUser
			inner join mPetugas c on a.NIK = c.NIK where a.idUser = @idUser
		end
	else
	if @proses ='getCB'
		begin
			select a.NIK from mPetugas a 
			left join mUser b on a.NIK = b.NIK where b.idUser is null and a.status <>9
		end
	else
	if @proses ='upd'
		begin
			update mUser set idStatusUser = @idStat where NIK = @NIK
		end
	else
	if @proses ='cek'
		begin
			select 1 from mUser where idUser = @idUser
		end
	else
	if @proses ='add'
		begin
			insert into mUser select @NIK,@idUser,@Password,@idStat
		end
	else
	if @proses ='CPass'
		begin
			select 1 from mUser where NIK = @NIK and password = @Password
		end
	else
	if @proses = 'Upass'
		begin
			update mUser set password = @Password where NIK = @NIK
		end
end
GO
/****** Object:  StoredProcedure [dbo].[spReport]    Script Date: 22/01/2020 15.54.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spReport](
@proses varchar(10),
@tglAwal date,
@tglAkhir date
)
as
--exec spReport 'proses','tglawal','akhir'
begin
	if @proses ='PerBuku'
		begin
		--declare @tglAwal date = getdate()
		--declare @tglAkhir date = getdate()
			select c.idBuku,
				   c.judulBuku,
				   COUNT(a.nomorPinjaman) Pinjam, 
				   COUNT(b.nomorPinjaman) Kembali,
				   d.jumlahBukuTersedia Tersedia,
				   jumlahBukuTerpinjam Dipinjam,
				   @tglAwal Awal,
				   @tglAkhir Akhir
			from tblPeminjaman a
			left join tblPengembalian b on a.nomorPinjaman =b.nomorPinjaman
			inner join mBuku c on a.idBuku = c.idBuku 
			inner join tblJumlahBuku d on c.idbuku = d.idBuku where (a.tglPinjam between @tglAwal and @tglAkhir) or (b.tglPengembalian between @tglAwal and @tglAkhir)
			group by c.idBuku,c.judulBuku,jumlahBukuTerpinjam,jumlahBukuTersedia
		end
	else
	if @proses ='PerTransaksi'
		begin
			select a.nomorPinjaman from tblPeminjaman a 
			left join tblPengembalian b on a.nomorPinjaman = b.nomorPinjaman
		end
	else
	if @proses = 'analisa'
		begin
			select namaPenerbit,jenisBuku,judulBuku,(COUNT(a.nomorPinjaman))totalDipinjam from tblPeminjaman a
			inner join mBuku b on a.idBuku = b.idBuku 
			inner join mJenisBuku c on b.idJenisBuku = c.idJenisBuku
			inner join mPenerbit d on b.idPenerbit = d.idPenerbit
			group by namaPenerbit,jenisBuku,judulBuku
			order by totalDipinjam desc
		end
	else
	if @proses = 'anggota'
		begin
			select KartuPerpus,namaAnggota,jenisKelamin,alamat,noHP from mAnggota a
			inner join mJKelamin b on a.idJkelamin =b.idJkelamin where status <>9
		end
	else
	if @proses = 'buku'
		begin
			select namaPenerbit,jenisBuku,judulBuku,jangkaWaktu,dendaPerhari,tglTerbit from mBuku a
			inner join mPenerbit b on a.idPenerbit = b.idPenerbit
			inner join mJenisBuku c on a.idJenisBuku = c.idJenisBuku where a.status <>9
		end
	else
	if @proses ='user'
		begin
			select a.NIK,namaPetugas,c.idUser,jenisKelamin,alamat,noHP,email,d.jenisUser from mPetugas a
			inner join mJKelamin b on a.idJkelamin = b.idJkelamin
			inner join mUser c on a.NIK = c.NIK 
			inner join mStatusUser d on c.idStatusUser = d.idStatusUser where a.status <>9

		end
end
GO
/****** Object:  StoredProcedure [dbo].[sptblHakakses]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[sptblHakakses](@statusProses varchar(10), @idMenu int,@Idstatus int,@Menu varchar(50),@SubMenu varchar(50))
			as
			begin
			--exec sptblHakakses 'proses','idMenu','idStatus,'menu','submenu'
				if @statusProses = 'Get'
					begin
						select * from tblHakAkses where idStatusUser=@Idstatus
					end
				else
				if @statusProses = 'Add'
				begin
					 
					set @idMenu= (select dbo.fcAddIdMenu(@Idstatus))
					
					if not exists (select 1 from tblHakAkses where idMenu= @idMenu  and idStatusUser=@Idstatus ) 
						begin

							insert into tblHakAkses(idMenu,idStatusUser,Menu,SubMenu)
							values (@idMenu,@Idstatus,@Menu,@SubMenu)
						end 
				end
				else				
				if @statusProses = 'Edit'
					begin
						update tblHakAkses set Menu=@Menu ,SubMenu=@SubMenu
						where idMenu= @idMenu  and idStatusUser= @Idstatus  
					end 					
				else
				if @statusProses = 'Delete'
					begin
						delete tblHakAkses 
						where  idStatusUser= @Idstatus
					end 			
				
			end 
GO
/****** Object:  StoredProcedure [dbo].[spTblJumlahBUku]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spTblJumlahBUku](
@proses varchar(20),
@idBuku int,
@tersedia int,
@idRak int,
@judul varchar(max)
)
as 
begin
--exec spTblJumlahBuku 'proses','idbuku','tersedia','idrak'
--select * from tblJumlahBuku
	if @proses = 'get'
		begin
			select c.namaRak,d.namaPenerbit,e.jenisBuku,b.idbuku,b.judulBuku,a.jumlahBukuTersedia,a.jumlahBukuTerpinjam from tblJumlahBuku a
			inner join mBuku b on a.idBuku = b.idBuku
			inner join mRakBuku c on a.idRakBuku = c.idRakBuku
			inner join mPenerbit d on b.idPenerbit = d.idPenerbit
			inner join mJenisBuku e on b.idJenisBuku = e.idJenisBuku where b.status <>9
		end
	else
	if @proses = 'getAdd'
		begin
			select a.idBuku,a.judulBuku from mBuku a
			left join tblJumlahBuku b on a.idBuku = b.idBuku
			left join mRakBuku c on b.idRakBuku = c.idRakBuku where a.status <>9 and jumlahBukuTersedia is null
		end
	else
	if	@proses = 'add'
		begin
			insert into tblJumlahBuku select @idBuku,@tersedia,0,@idRak
		end
	else
	if @proses ='upd'
		begin
			update tblJumlahBuku set jumlahBukuTersedia = jumlahBukuTersedia+@tersedia,idRakBuku = @idRak where idBuku = @idBuku
		end
	else
	if @proses ='Penerbit'
		begin
			select c.namaRak,d.namaPenerbit,e.jenisBuku,b.idbuku,b.judulBuku,a.jumlahBukuTersedia,a.jumlahBukuTerpinjam from tblJumlahBuku a
			inner join mBuku b on a.idBuku = b.idBuku
			inner join mRakBuku c on a.idRakBuku = c.idRakBuku
			inner join mPenerbit d on b.idPenerbit = d.idPenerbit
			inner join mJenisBuku e on b.idJenisBuku = e.idJenisBuku where b.status <>9 and d.namaPenerbit like '%'+@judul+'%'
		end
	else
	if @proses ='Judul Buku'
		begin
			select c.namaRak,d.namaPenerbit,e.jenisBuku,b.idbuku,b.judulBuku,a.jumlahBukuTersedia,a.jumlahBukuTerpinjam from tblJumlahBuku a
			inner join mBuku b on a.idBuku = b.idBuku
			inner join mRakBuku c on a.idRakBuku = c.idRakBuku
			inner join mPenerbit d on b.idPenerbit = d.idPenerbit
			inner join mJenisBuku e on b.idJenisBuku = e.idJenisBuku where b.status <>9 and b.judulBuku like '%'+@judul+'%'
		end
	else
	if @proses ='Jenis Buku'
		begin
					select c.namaRak,d.namaPenerbit,e.jenisBuku,b.idbuku,b.judulBuku,a.jumlahBukuTersedia,a.jumlahBukuTerpinjam from tblJumlahBuku a
			inner join mBuku b on a.idBuku = b.idBuku
			inner join mRakBuku c on a.idRakBuku = c.idRakBuku
			inner join mPenerbit d on b.idPenerbit = d.idPenerbit
			inner join mJenisBuku e on b.idJenisBuku = e.idJenisBuku where b.status <>9 and e.jenisBuku like '%'+@judul+'%'
		end
		else
	if @proses ='All'
		begin
					select c.namaRak,d.namaPenerbit,e.jenisBuku,b.idbuku,b.judulBuku,a.jumlahBukuTersedia,a.jumlahBukuTerpinjam from tblJumlahBuku a
			inner join mBuku b on a.idBuku = b.idBuku
			inner join mRakBuku c on a.idRakBuku = c.idRakBuku
			inner join mPenerbit d on b.idPenerbit = d.idPenerbit
			inner join mJenisBuku e on b.idJenisBuku = e.idJenisBuku where b.status <>9 and (e.jenisBuku like '%'+@judul+'%' or b.judulBuku like '%'+@judul+'%' or d.namaPenerbit like '%'+@judul+'%' )
		end
end
GO
/****** Object:  StoredProcedure [dbo].[SpTrPerpus]    Script Date: 05/01/2020 23.26.35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpTrPerpus](
@proses varchar(10),
@NIK varchar(20),
@idBuku int,
@nomorPinjam varchar(12),
@idAnggota int
)
as
--exec SpTrPerpus 'proses','nik','idbuku','nomorpinjam','idanggota'
--select * from tblpeminjaman
--select * from tblpengembalian
--select * from tbljumlahbuku
begin
	DECLARE @denda int = (SELECT dendaPerhari FROM mbuku WHERE idBuku = @idBuku)
    DECLARE @jangka int = (SELECT jangkaWaktu from mbuku where idBuku = @idBuku)
    DECLARE @lamaPinjam int
    DECLARE @telat INT 
    DECLARE @totalDenda int
    DECLARE @bukuid int

		if @proses ='pinjam'
			begin
				insert into tblPeminjaman select @nomorPinjam,@idAnggota,@idBuku,GETDATE(),@NIK,'Pinjam'
				update tblJumlahBuku set jumlahBukuTerpinjam = jumlahBukuTerpinjam +1,jumlahBukuTersedia = jumlahBukuTersedia-1 where idBuku = @idBuku
			end
		else
		if @proses = 'kembali'
			begin
				set @lamaPinjam = (select DATEDIFF(DAY,tglpinjam,getdate()) from tblPeminjaman where nomorPinjaman =@nomorPinjam)
				set @bukuid = (select idbuku from tblPeminjaman where nomorPinjaman =@nomorPinjam)
				set @jangka = (select jangkaWaktu from mBuku where idBuku =@bukuid)
				set @denda = (select dendaPerhari from mBuku where idBuku=@bukuid)
				set @telat = (select @lamaPinjam -@jangka)
					if @telat <= 0
						begin
							set @telat = 0
							set @totalDenda =0
						end
					else
						begin 
							set @totalDenda = @telat * @denda
						end
				insert into tblPengembalian select @nomorPinjam,GETDATE(),@lamaPinjam,@telat,@denda,@totalDenda,@NIK
				update tblPeminjaman set statusPeminjaman ='Kembali' where nomorPinjaman =@nomorPinjam
				update tblJumlahBuku set jumlahBukuTerpinjam =jumlahBukuTerpinjam -1,jumlahBukuTersedia = jumlahBukuTersedia+1 where idBuku =@bukuid
			end
		else
		if @proses = 'get'
			begin
				select a.nomorPinjaman,c.KartuPerpus,c.namaAnggota,e.namaPenerbit,d.judulBuku,a.tglPinjam,DATEDIFF(day,a.tglPinjam,getdate())as [Lama Pinjam], b.namaPetugas,a.statusPeminjaman as Status from tblPeminjaman a
				inner join mPetugas b on a.NIK = b.NIK
				inner join mAnggota c on a.idAnggota = c.idAnggota
				inner join mBuku d on a.idBuku = d.idBuku
				inner join mPenerbit e on d.idPenerbit =e.idPenerbit where statusPeminjaman ='Pinjam'
			end
		else
		if @proses = 'anggota'
			begin
				select KartuPerpus,namaAnggota from mAnggota where status <> 9
			end
		else
		if @proses = 'Fanggota'
			begin
				select KartuPerpus,namaAnggota from mAnggota where status <> 9 and(namaAnggota like '%'+@NIK+'%' or KartuPerpus like '%'+@NIK+'%')
			end
		else
		if @proses = 'buku'
			begin
				select namaPenerbit,judulBuku,jumlahBukuTersedia Tersedia,a.idBuku from mBuku a
				inner join mPenerbit b on a.idPenerbit =b.idPenerbit
				inner join tblJumlahBuku c on a.idBuku =c.idBuku where a.status <>9
			end
		else
		if @proses = 'Fbuku'
			begin
				select namaPenerbit,judulBuku,jumlahBukuTersedia Tersedia,a.idBuku from mBuku a
				inner join mPenerbit b on a.idPenerbit =b.idPenerbit
				inner join tblJumlahBuku c on a.idBuku =c.idBuku where a.status <>9 and(namaPenerbit like '%'+@NIK+'%' or judulBuku like '%'+@NIK+'%')
			end
		else
		if @proses ='cekanggota'
			begin
				select idAnggota,namaAnggota from mAnggota where KartuPerpus = @nomorPinjam and status <>9
			end
		else
		if @proses = 'cekbuku'
			begin
				select jumlahBukuTersedia from mBuku a
				inner join mPenerbit b on a.idPenerbit =b.idPenerbit
				inner join tblJumlahBuku c on a.idBuku =c.idBuku where a.status <>9 and a.idBuku = @idBuku
			end
		else
		if @proses = 'getKembali'
			begin
				select a.nomorPinjaman,tglPengembalian,d.namaAnggota,c.judulBuku,lamaPinjam,telat,denda,totalDenda,e.namaPetugas from tblPengembalian a
				inner join tblPeminjaman b on a.nomorPinjaman = b.nomorPinjaman
				inner join mBuku c on b.idBuku = c.idBuku
				inner join mAnggota d on d.idAnggota = b.idAnggota
				inner join mPetugas e on a.NIK = e.nik
			end
		else
		if @proses = 'cmb'
			begin
				select nomorPinjaman from tblPeminjaman where statusPeminjaman ='Pinjam'
			end
		else
		if @proses = 'getData'
			begin
				set @lamaPinjam = (select DATEDIFF(DAY,tglpinjam,getdate()) from tblPeminjaman where nomorPinjaman =@nomorPinjam)
				set @bukuid = (select idBuku from tblpeminjaman WHERE nomorPinjaman = @nomorPinjam)
				SET @jangka = (SELECT jangkaWaktu from mbuku where idBuku = @bukuid)
				SET @denda = (SELECT dendaPerhari FROM mbuku WHERE idBuku = @bukuid)
				SET @telat = (SELECT @lamaPinjam - @jangka)
				if @telat <= 0
					begin
						set @telat =0
						set @totalDenda = 0
					end
				else
					begin
						set @totalDenda = @telat * @denda
					end
				select judulbuku,tglPinjam,jangkaWaktu,@lamaPinjam,@telat,@denda,@totalDenda from tblPeminjaman a
				inner join mBuku b on a.idBuku = b.idBuku where nomorPinjaman = @nomorPinjam
			end
end
GO
USE [master]
GO
ALTER DATABASE [dbPerpustakaan] SET  READ_WRITE 
GO
