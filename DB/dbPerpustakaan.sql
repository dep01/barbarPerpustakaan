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
/****** Object:  Table [dbo].[mAnggota]    Script Date: 01/01/2020 16.46.39 ******/
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
PRIMARY KEY CLUSTERED 
(
	[idAnggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mBuku]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mJenisBuku]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mJKelamin]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mPenerbit]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mPetugas]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mRakBuku]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mStatusUser]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[mUser]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[settingEmail]    Script Date: 01/01/2020 16.46.40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settingEmail](
	[email] [varchar](50) NULL,
	[passEmail] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHakAkses]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[tblJumlahBuku]    Script Date: 01/01/2020 16.46.40 ******/
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
/****** Object:  Table [dbo].[tblPeminjaman]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  Table [dbo].[tblPengembalian]    Script Date: 01/01/2020 16.46.41 ******/
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

INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status]) VALUES (1, N'Diaz ', 1, N'Bekasi', N'812178906', 1)
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status]) VALUES (2, N'Erlangga', 1, N'Bekasi', N'812178907', 1)
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status]) VALUES (3, N'Djendra', 2, N'Bekasi', N'812178908', 1)
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status]) VALUES (4, N'Wisnu', 1, N'Bekasi', N'812178909', 1)
INSERT [dbo].[mAnggota] ([idAnggota], [namaAnggota], [idJkelamin], [alamat], [noHP], [status]) VALUES (5, N'Putra', 1, N'Bekasi', N'812178910', 1)
SET IDENTITY_INSERT [dbo].[mAnggota] OFF
SET IDENTITY_INSERT [dbo].[mBuku] ON 

INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (1, 2, 1, N'Cara Cepat Jadi Kaya', 20, CAST(100000 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (2, 1, 1, N'Hidup Sederhana Secangkir Kopi panas', 15, CAST(1000 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (3, 2, 1, N'Ilmu Gendam dan Black Magic', 20, CAST(500 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (4, 1, 4, N'Fungsi ajaib VPN', 45, CAST(2000 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (5, 3, 3, N'Naruto Shippuden vol 18', 10, CAST(1500 AS Decimal(18, 0)), CAST(N'2018-03-04' AS Date), 9)
INSERT [dbo].[mBuku] ([idBuku], [idPenerbit], [idJenisBuku], [judulBuku], [jangkaWaktu], [dendaPerhari], [tglTerbit], [status]) VALUES (6, 1, 1, N'Kunci Sukses Ahli Neraka', 30, CAST(666 AS Decimal(18, 0)), CAST(N'2015-03-04' AS Date), 1)
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
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566327', N'Cinta', 2, N'Bekasi', N'8156632266', N'cinta@yahoo.com', 1)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566328', N'Lutfi', 1, N'Bekasi', N'8156632267', N'Lutfi@yahoo.com', 1)
INSERT [dbo].[mPetugas] ([NIK], [namaPetugas], [idJkelamin], [alamat], [noHP], [email], [status]) VALUES (N'30021566329', N'Bambang', 1, N'Bekasi', N'8156632268', N'bams@yahoo.com', 1)
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
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (1, 2, N'Akun', N'Akun')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (2, 1, N'User', N'Akun')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (4, 1, N'Master', N'Master')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (6, 1, N'Master', N'Petugas')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (8, 1, N'Master', N'Add User')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (9, 1, N'Master', N'Hak Akses')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (11, 1, N'Pengembalian', N'Pengembalian')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (2, 2, N'Akun', N'Ganti Password')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (3, 2, N'Akun', N'Log Out')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (5, 2, N'Master', N'Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (6, 2, N'Buku', N'Master Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (8, 2, N'Buku', N'Master Jenis Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (9, 2, N'Buku', N'Master Rak Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (10, 2, N'Buku', N'Lokasi Dan Jumlah Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (14, 2, N'Master', N'Hak Akses')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (3, 1, N'User', N'Log Out')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (5, 1, N'Master', N'Buku')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (17, 2, N'Laporan', N'Harian')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (1, 1, N'User', N'User')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (7, 1, N'Master', N'Anggota')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (10, 1, N'Peminjaman', N'Peminjaman')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (4, 2, N'Master', N'Master')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (12, 2, N'Master', N'Anggota')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (15, 2, N'Peminjaman', N'Peminjaman')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (13, 2, N'Master', N'User')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (7, 2, N'Buku', N'Master Penerbit')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (11, 2, N'Master', N'Petugas')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (18, 2, N'Laporan', N'Pertanggal')
INSERT [dbo].[tblHakAkses] ([idMenu], [idStatusUser], [Menu], [SubMenu]) VALUES (16, 2, N'Pengembalian', N'Pengembalian')
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (1, 50, 0, 1)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (2, 62, 0, 2)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (3, 50, 0, 3)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (4, 51, 0, 4)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (5, 50, 0, 2)
INSERT [dbo].[tblJumlahBuku] ([idBuku], [jumlahBukuTersedia], [jumlahBukuTerpinjam], [idRakBuku]) VALUES (6, 26, 0, 1)
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
/****** Object:  StoredProcedure [dbo].[spMbuku]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  StoredProcedure [dbo].[spMjenisBuku]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  StoredProcedure [dbo].[spMpenerbit]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  StoredProcedure [dbo].[spMRakBuku]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  StoredProcedure [dbo].[spMstatusUser]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  StoredProcedure [dbo].[spMuser]    Script Date: 01/01/2020 16.46.41 ******/
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
	--exec spMuser 'pro','nik','iduser','pass','idstat'
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
/****** Object:  StoredProcedure [dbo].[sptblHakakses]    Script Date: 01/01/2020 16.46.41 ******/
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
/****** Object:  StoredProcedure [dbo].[spTblJumlahBUku]    Script Date: 01/01/2020 16.46.41 ******/
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
USE [master]
GO
ALTER DATABASE [dbPerpustakaan] SET  READ_WRITE 
GO
