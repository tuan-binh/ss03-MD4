create database quanlybanhang;
use quanlybanhang;

create table khachhang (
	MaKH nvarchar(4) primary key,
    TenKH nvarchar(30) not null,
	DiaChi nvarchar(50),
    NgaySinh datetime,
    SoDT nvarchar(15) unique
);

create table nhanvien (
	MaNV nvarchar(4) primary key	,
    HoTen nvarchar(30) not null,
    GioiTinh bit not null,
    DiaChi nvarchar(50) not null,
    NgaySinh datetime not null,
    DienThoai nvarchar(15),
    Email text,
    NoiSinh nvarchar(20) not null,
    NgayVaoLam datetime,
    MaNQL nvarchar(4)
);

create table nhacungcap (
	MaNCC nvarchar(5) primary key,
    TenNCC nvarchar(50) not null,
    DiaChi nvarchar(50) not null,
    DienThoai nvarchar(15) not null,
    Email nvarchar(30) not null,
    Website nvarchar(30)
);

create table loaisp (
	MaLoaiSP nvarchar(4) primary key,
    TenLoaiSP nvarchar(30) not null,
    GhiChu nvarchar(100) not null
);

create table sanpham (
	MaSP nvarchar(4) primary key,
    MaLoaiSP nvarchar(4) not null,
    DonViTinh nvarchar(10) not null,
    foreign key(MaLoaiSP) references loaisp(MaLoaiSP)
);

create table phieunhap (
	SoPN nvarchar(5) primary key,
    MaNV nvarchar(4) not null,
    MaNCC nvarchar(5) not null,
    NgayNhap datetime not null default now(),
    GhiChu nvarchar(100),
    foreign key(MaNV) references nhanvien(MaNV),
    foreign key(MaNCC) references nhacungcap(MaNCC)
);

create table CTPhieuNhap (
	MaSP nvarchar(4) not null,
    SoPN nvarchar(5) not null,
    Soluong smallint not null default 0,
    GiaNhap double not null check(GiaNhap >= 0),
    primary key(MaSP,SoPN),
    foreign key(MaSP) references sanpham(MaSP),
    foreign key(SoPN) references phieunhap(SoPN)
);

create table phieuxuat (
	SoPX nvarchar(5) primary key,
    MaNV nvarchar(4) not null,
    MaKH nvarchar(4) not null,
    NgayBan datetime not null,
    GhiChu text,
    foreign key(MaNV) references nhanvien(MaNV),
    foreign key(MaKH) references khachhang(MaKH)
);

create table CTphieuXuat (
	SoPX nvarchar(5) not null,
    MaSP nvarchar(4) not null,
    SoLluong smallint not null,
    GiaBan double not null,
    primary key(SoPX,MaSP),
    foreign key(SoPX) references phieuxuat(SoPX),
    foreign key(MaSP) references sanpham(MaSP)
);

-- insert value to table
	-- table khach hang
insert into khachhang (MaKH,TenKH,DiaChi,NgaySinh,SoDT) values
("001","pham tuan binh","ha noi","2001/09/18","0987654321"),
("002","pham trung hai","ha noi","1992/12/22","0987654322"),
("003","tran huu huy","ha noi","1998/02/10","0987654333");

	-- table nhan vien
insert into nhanvien (MaNV,HoTen,GioiTinh,DiaChi,NgaySinh,DienThoai,Email,NoiSinh,NgayVaoLam,MaNQL) values
()