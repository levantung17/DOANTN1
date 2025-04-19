CREATE DATABASE IF NOT EXISTS project_web;
USE project_web;

-- Table for user information
CREATE TABLE IF NOT EXISTS thongtinnguoidung (
    MaTaiKhoan VARCHAR(10) PRIMARY KEY,
    HoTen VARCHAR(50),
    GioiTinh VARCHAR(3),
    CCCD VARCHAR(11),
    NgayCap DATE,
    NoiCap VARCHAR(100),
    NgaySinh DATE,
    SoDienThoai VARCHAR(11),
    Email VARCHAR(45),
    SoNha VARCHAR(45),
    Xa VARCHAR(45),
    Huyen VARCHAR(45),
    Tinh VARCHAR(45),
    HeSoLuong FLOAT,
    TrangThai VARCHAR(45),
    TrinhDo VARCHAR(100),
    NgayBatDauLam DATE
);

-- Table for account details
CREATE TABLE IF NOT EXISTS taikhoan (
    TenDangNhap VARCHAR(20) PRIMARY KEY,
    MatKhau VARCHAR(45),
    MaTaiKhoan VARCHAR(10),
    Quyen VARCHAR(45),
    FOREIGN KEY (MaTaiKhoan) REFERENCES thongtinnguoidung(MaTaiKhoan)
);

-- Table for recruitment requests
CREATE TABLE IF NOT EXISTS yeucau (
    MaYeuCau VARCHAR(10) PRIMARY KEY,
    MaPhongBan VARCHAR(10),
    ViTriLamViec VARCHAR(100),
    TrinhDo VARCHAR(100),
    SoLuong INT,
    TrangThaiTuyenDung VARCHAR(45)
);

-- Table for decisions
CREATE TABLE IF NOT EXISTS quyetdinh (
    MaQuyetDinh VARCHAR(10) PRIMARY KEY,
    LoaiQuyetDinh VARCHAR(45),
    Ngay DATE,
    NoiDung VARCHAR(100),
    MaNhanVien VARCHAR(10),
    MaNguoiQuyetDinh VARCHAR(10)
);

-- Table for branch information
CREATE TABLE IF NOT EXISTS chinhanh (
    MaChiNhanh VARCHAR(10) PRIMARY KEY,
    TenChiNhanh VARCHAR(100),
    SoNha VARCHAR(45),
    Xa VARCHAR(45),
    Huyen VARCHAR(45),
    Tinh VARCHAR(45),
    NgayTaoChiNhanh DATE,
    SoDienThoai VARCHAR(11),
    MaTongGiamDoc VARCHAR(10)
);

-- Table for job positions
CREATE TABLE IF NOT EXISTS chucvu (
    MaChucVu VARCHAR(10) PRIMARY KEY,
    TenChucVu VARCHAR(45),
    MaChiNhanh VARCHAR(10),
    MaPhongBan VARCHAR(10),
    MaNhom VARCHAR(10),
    LuongCoBan INT
);

-- Table for department information
CREATE TABLE IF NOT EXISTS thongtinphongban (
    MaPB VARCHAR(10) PRIMARY KEY,
    TenPB VARCHAR(100),
    MoTa VARCHAR(1000)
);

-- Table for department assignments
CREATE TABLE IF NOT EXISTS phanbophongban (
    MaChiNhanh VARCHAR(10),
    MaPB VARCHAR(10),
    NgayTao DATE,
    SDT VARCHAR(11),
    PRIMARY KEY (MaChiNhanh, MaPB)
);

-- Table for employee assignments to positions
CREATE TABLE IF NOT EXISTS congtac (
    MaNhanVien VARCHAR(10),
    MaChucVu VARCHAR(10),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    PRIMARY KEY (MaNhanVien, MaChucVu)
);

-- Table for team details
CREATE TABLE IF NOT EXISTS nhom (
    MaNhom VARCHAR(10) PRIMARY KEY,
    TenNhom VARCHAR(100),
    MoTaNhiemVu VARCHAR(1000)
);

-- Inserting data into ThongTinNguoiDung table
INSERT INTO thongtinnguoidung (MaTaiKhoan, HoTen, GioiTinh, CCCD, NgayCap, NoiCap, NgaySinh, SoDienThoai, Email, SoNha, Xa, Huyen, Tinh, HeSoLuong, TrangThai, TrinhDo, NgayBatDauLam)
VALUES
('TK001', 'Nguyen Van A', 'Nam', '12345678901', '2020-05-01', 'Hanoi', '1990-03-12', '0901234567', 'a@example.com', '123A', 'Xa 1', 'Huyen 1', 'Tinh 1', 3.5, 'Active', 'Bachelor', '2021-01-01'),
('TK002', 'Tran Thi B', 'Nu', '23456789012', '2021-06-15', 'Hanoi', '1992-07-25', '0902345678', 'b@example.com', '456B', 'Xa 2', 'Huyen 2', 'Tinh 2', 2.8, 'Inactive', 'Master', '2021-02-01'),
('TK003', 'Le Minh C', 'Nam', '34567890123', '2019-03-18', 'Hanoi', '1985-11-02', '0903456789', 'c@example.com', '789C', 'Xa 3', 'Huyen 3', 'Tinh 3', 4.0, 'Active', 'PhD', '2020-10-01'),
('TK004', 'Pham Thanh D', 'Nu', '45678901234', '2022-08-20', 'Hanoi', '1995-05-10', '0904567890', 'd@example.com', '101D', 'Xa 4', 'Huyen 4', 'Tinh 4', 3.0, 'Active', 'Bachelor', '2022-09-01');

-- Inserting data into TaiKhoan table
INSERT INTO taikhoan (TenDangNhap, MatKhau, MaTaiKhoan, Quyen)
VALUES
('admin01', 'password123', 'TK001', 'Admin'),
('user02', 'password456', 'TK002', 'User'),
('user03', 'password789', 'TK003', 'User'),
('admin04', 'password000', 'TK004', 'Admin');

-- Inserting data into YeuCau table
INSERT INTO yeucau (MaYeuCau, MaPhongBan, ViTriLamViec, TrinhDo, SoLuong, TrangThaiTuyenDung)
VALUES
('YC001', 'PB01', 'Developer', 'Bachelor', 5, 'Open'),
('YC002', 'PB02', 'Designer', 'Master', 3, 'Closed'),
('YC003', 'PB03', 'Manager', 'PhD', 2, 'Open'),
('YC004', 'PB04', 'Tester', 'Bachelor', 4, 'Open');

-- Inserting data into QuyetDinh table
INSERT INTO quyetdinh (MaQuyetDinh, LoaiQuyetDinh, Ngay, NoiDung, MaNhanVien, MaNguoiQuyetDinh)
VALUES
('QD001', 'Hire', '2021-02-10', 'Hired as Developer', 'NV001', 'QD001'),
('QD002', 'Promotion', '2022-01-05', 'Promoted to Senior Developer', 'NV002', 'QD002'),
('QD003', 'Hire', '2023-03-15', 'Hired as Designer', 'NV003', 'QD003'),
('QD004', 'Leave', '2023-05-20', 'On leave due to health reasons', 'NV004', 'QD004');

-- Inserting data into ChiNhanh table
INSERT INTO chinhanh (MaChiNhanh, TenChiNhanh, SoNha, Xa, Huyen, Tinh, NgayTaoChiNhanh, SoDienThoai, MaTongGiamDoc)
VALUES
('CN001', 'ChiNhanh 1', '123B', 'Xa 1', 'Huyen 1', 'Tinh 1', '2020-05-01', '0907654321', 'TG001'),
('CN002', 'ChiNhanh 2', '456C', 'Xa 2', 'Huyen 2', 'Tinh 2', '2021-06-15', '0908765432', 'TG002'),
('CN003', 'ChiNhanh 3', '789D', 'Xa 3', 'Huyen 3', 'Tinh 3', '2022-07-20', '0909876543', 'TG003'),
('CN004', 'ChiNhanh 4', '101E', 'Xa 4', 'Huyen 4', 'Tinh 4', '2023-08-01', '0901237890', 'TG004');

-- Inserting data into ChucVu table
INSERT INTO chucvu (MaChucVu, TenChucVu, MaChiNhanh, MaPhongBan, MaNhom, LuongCoBan)
VALUES
('CV001', 'Developer', 'CN001', 'PB01', 'Nhom1', 10000),
('CV002', 'Designer', 'CN002', 'PB02', 'Nhom2', 12000),
('CV003', 'Manager', 'CN003', 'PB03', 'Nhom3', 15000),
('CV004', 'Tester', 'CN004', 'PB04', 'Nhom4', 9000);

-- Inserting data into ThongTinPhongBan table
INSERT INTO thongtinphongban (MaPB, TenPB, MoTa)
VALUES
('PB01', 'IT Department', 'Responsible for software development and maintenance'),
('PB02', 'Design Department', 'Handles all design-related tasks'),
('PB03', 'Management Department', 'Oversees project management and team coordination'),
('PB04', 'Quality Assurance', 'Ensures quality control and testing of all products');

-- Inserting data into PhanBoPhongBan table
INSERT INTO phanbophongban (MaChiNhanh, MaPB, NgayTao, SDT)
VALUES
('CN001', 'PB01', '2020-05-01', '0907654321'),
('CN002', 'PB02', '2021-06-15', '0908765432'),
('CN003', 'PB03', '2022-07-20', '0909876543'),
('CN004', 'PB04', '2023-08-01', '0901237890');

-- Inserting data into CongTac table
INSERT INTO congtac (MaNhanVien, MaChucVu, NgayBatDau, NgayKetThuc)
VALUES
('NV001', 'CV001', '2021-01-01', '2023-12-31'),
('NV002', 'CV002', '2022-03-10', '2023-12-31'),
('NV003', 'CV003', '2023-01-15', '2025-12-31'),
('NV004', 'CV004', '2023-06-01', '2024-06-01');

-- Inserting data into Nhom table
INSERT INTO nhom (MaNhom, TenNhom, MoTaNhiemVu)
VALUES
('Nhom1', 'Development Team', 'Responsible for building and maintaining software applications'),
('Nhom2', 'Design Team', 'Responsible for designing the user interface and experience'),
('Nhom3', 'Management Team', 'Oversees project planning and resource allocation'),
('Nhom4', 'QA Team', 'Responsible for testing and ensuring the quality of products');
