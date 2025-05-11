CREATE DATABASE IF NOT EXISTS project_web;
USE project_web;
-- 1. Tạo các bảng độc lập không có khóa ngoại trước
CREATE TABLE IF NOT EXISTS chucvu (
    MaChucVu VARCHAR(10) PRIMARY KEY,
    TenChucVu VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS nhom (
    MaNhom VARCHAR(10) PRIMARY KEY,
    TenNhom VARCHAR(100) NOT NULL,
    MoTaNhiemVu VARCHAR(1000)
);

-- 2. Tạo bảng chinhanh (tạm thời không có khóa ngoại)
CREATE TABLE IF NOT EXISTS chinhanh (
    MaChiNhanh VARCHAR(10) PRIMARY KEY,
    TenChiNhanh VARCHAR(100) NOT NULL,
    SoNha VARCHAR(100),
    Xa VARCHAR(100),
    Huyen VARCHAR(100),
    Tinh VARCHAR(100),
    NgayTaoChiNhanh DATE NOT NULL,
    SoDienThoai VARCHAR(15),
    MaTongGiamDoc VARCHAR(10)
);

-- 3. Tạo bảng thongtinnguoidung (tạm thời không có khóa ngoại đến phongban)
CREATE TABLE thongtinnguoidung (
    MaTaiKhoan VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    GioiTinh VARCHAR(10),
    CCCD VARCHAR(12) UNIQUE,
    NgayCap DATE,
    NoiCap VARCHAR(100),
    NgaySinh DATE,
    SoDienThoai VARCHAR(15),
    Email VARCHAR(100),
    SoNha VARCHAR(100),
    Xa VARCHAR(100),
    Huyen VARCHAR(100),
    Tinh VARCHAR(100),
    HeSoLuong FLOAT,
    TrangThai VARCHAR(50),
    TrinhDo VARCHAR(100),
    NgayBatDauLam DATE,
    MaChucVu VARCHAR(20),
    MaPhongBan VARCHAR(20),
    MaChiNhanh VARCHAR(20)
);

-- 4. Bây giờ mới tạo bảng phongban (đã có các bảng tham chiếu)
CREATE TABLE IF NOT EXISTS phongban (
    MaPB VARCHAR(10) PRIMARY KEY,
    TenPB VARCHAR(100) NOT NULL,
    MaChiNhanh VARCHAR(10),
    NgayTao DATE NOT NULL,
    SDT VARCHAR(15),
    MaChucVu VARCHAR(10),
    MaNhanVien VARCHAR(10),
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaChucVu) REFERENCES chucvu(MaChucVu) ON DELETE SET NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE SET NULL
);

-- 5. Thêm khóa ngoại vào bảng thongtinnguoidung sau khi phongban đã được tạo
ALTER TABLE thongtinnguoidung
ADD FOREIGN KEY (MaChucVu) REFERENCES chucvu (MaChucVu),
ADD FOREIGN KEY (MaPhongBan) REFERENCES phongban (MaPB),
ADD FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh (MaChiNhanh);

-- 6. Thêm khóa ngoại vào bảng chinhanh
ALTER TABLE chinhanh
ADD FOREIGN KEY (MaTongGiamDoc) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE SET NULL;

-- 7. Tạo bảng taikhoan
CREATE TABLE IF NOT EXISTS taikhoan (
    TenDangNhap VARCHAR(20) PRIMARY KEY,
    MatKhau VARCHAR(100) NOT NULL,
    MaTaiKhoan VARCHAR(10) UNIQUE,
    Quyen VARCHAR(45) NOT NULL,
    FOREIGN KEY (MaTaiKhoan) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE CASCADE
);

-- 8. Tạo các bảng còn lại theo thứ tự phù hợp
CREATE TABLE IF NOT EXISTS thongtinchitietchucvu (
    MaChucVu VARCHAR(10) PRIMARY KEY,
    TenChucVu VARCHAR(45) NOT NULL,
    MaChiNhanh VARCHAR(10),
    MaPhongBan VARCHAR(10),
    MaNhom VARCHAR(10),
    LuongCoBan INT CHECK (LuongCoBan > 0),
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaPhongBan) REFERENCES phongban(MaPB) ON DELETE SET NULL,
    FOREIGN KEY (MaNhom) REFERENCES nhom(MaNhom) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS phanbophongban (
    MaChiNhanh VARCHAR(10),
    MaPB VARCHAR(10),
    NgayTao DATE,
    SDT VARCHAR(11),
    PRIMARY KEY (MaChiNhanh, MaPB),
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaPB) REFERENCES phongban(MaPB) ON DELETE CASCADE
);

-- Lưu ý: Bảng yeucau tham chiếu đến thongtinphongban nhưng bảng này không tồn tại trong script của bạn
-- Tôi giả sử bạn muốn tham chiếu đến phongban
CREATE TABLE IF NOT EXISTS yeucau (
    MaYeuCau VARCHAR(10) PRIMARY KEY,
    MaPhongBan VARCHAR(10),
    ViTriLamViec VARCHAR(100) NOT NULL,
    TrinhDo VARCHAR(100),
    SoLuong INT CHECK (SoLuong > 0),
    TrangThaiTuyenDung VARCHAR(45),
    FOREIGN KEY (MaPhongBan) REFERENCES phongban(MaPB) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS quyetdinh (
    MaQuyetDinh VARCHAR(10) PRIMARY KEY,
    LoaiQuyetDinh VARCHAR(45) NOT NULL,
    Ngay DATE NOT NULL,
    NoiDung VARCHAR(1000),
    MaNhanVien VARCHAR(10),
    MaNguoiQuyetDinh VARCHAR(10),
    FOREIGN KEY (MaNhanVien) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE SET NULL,
    FOREIGN KEY (MaNguoiQuyetDinh) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS congtac (
    MaNhanVien VARCHAR(10),
    MaChucVu VARCHAR(10),
    MaPhongBan VARCHAR(10),
    MaChiNhanh VARCHAR(10),
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE,
    PRIMARY KEY (MaNhanVien, MaPhongBan),
    FOREIGN KEY (MaNhanVien) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE CASCADE,
    FOREIGN KEY (MaChucVu) REFERENCES chucvu(MaChucVu) ON DELETE CASCADE,
    FOREIGN KEY (MaPhongBan) REFERENCES phongban(MaPB) ON DELETE CASCADE,
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh(MaChiNhanh) ON DELETE CASCADE
);

CREATE TABLE thongtinluong (
    MaNhanVien VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    HeSoLuong FLOAT NOT NULL,
    TenChucVu VARCHAR(100) NOT NULL,
    LuongCoBan INT NOT NULL,
    LuongChinhThuc DOUBLE NOT NULL,
    MaChiNhanh VARCHAR(20) NOT NULL,
    MaPhongBan VARCHAR(20) NOT NULL,
    TenChiNhanh VARCHAR(100) NOT NULL,
    TenPB VARCHAR(100) NOT NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES thongtinnguoidung (MaTaiKhoan) ON DELETE CASCADE,
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh (MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaPhongBan) REFERENCES phongban (MaPB) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS thongtincongtacnhanvien (
    MaTaiKhoan VARCHAR(10) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    GioiTinh VARCHAR(3) CHECK (GioiTinh IN ('Nam', 'Nu')),
    NgaySinh DATE,
    TenChucVu VARCHAR(100),
    MaChiNhanh VARCHAR(10),
    TenChiNhanh VARCHAR(100),
    MaPhongBan VARCHAR(10),
    TenPhongBan VARCHAR(100),
    NgayBD DATE,
    FOREIGN KEY (MaTaiKhoan) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE CASCADE,
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh(MaChiNhanh) ON DELETE SET NULL,
    FOREIGN KEY (MaPhongBan) REFERENCES phongban(MaPB) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS thongtintruongphong (
    MaChiNhanh VARCHAR(10),
    TenChiNhanh VARCHAR(100),
    MaPB VARCHAR(10),
    TenPB VARCHAR(100),
    NgayTao DATE,
    SDT VARCHAR(15),
    MaChucVu VARCHAR(10),
    MaNhanVien VARCHAR(10),
    HoTen VARCHAR(100),
    PRIMARY KEY (MaPB),
    FOREIGN KEY (MaChiNhanh) REFERENCES chinhanh(MaChiNhanh) ON DELETE CASCADE,
    FOREIGN KEY (MaChucVu) REFERENCES chucvu(MaChucVu) ON DELETE SET NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES thongtinnguoidung(MaTaiKhoan) ON DELETE SET NULL
);
-- 1. Thêm dữ liệu vào bảng không có khóa ngoại trước
INSERT INTO chucvu (MaChucVu, TenChucVu) VALUES
('CV01', 'Tổng giám đốc'),
('CV02', 'Trưởng phòng'),
('CV03', 'Phó phòng'),
('CV04', 'Nhân viên'),
('CV05', 'Kế toán trưởng');

INSERT INTO nhom (MaNhom, TenNhom, MoTaNhiemVu) VALUES
('N01', 'Nhóm Kế toán', 'Quản lý tài chính và kế toán'),
('N02', 'Nhóm Nhân sự', 'Tuyển dụng và quản lý nhân sự'),
('N03', 'Nhóm Kinh doanh', 'Phát triển kinh doanh');

-- 2. Thêm dữ liệu vào bảng chinhanh (tạm thời không có MaTongGiamDoc)
INSERT INTO chinhanh (MaChiNhanh, TenChiNhanh, SoNha, Xa, Huyen, Tinh, NgayTaoChiNhanh, SoDienThoai) VALUES
('CN01', 'Trụ sở chính Hà Nội', '123', 'Mai Dịch', 'Cầu Giấy', 'Hà Nội', '2020-01-15', '0241234567'),
('CN02', 'Chi nhánh TP.HCM', '456', 'Bến Nghé', 'Quận 1', 'TP.HCM', '2020-03-20', '0287654321'),
('CN03', 'Chi nhánh Đà Nẵng', '789', 'Hải Châu', 'Hải Châu', 'Đà Nẵng', '2021-05-10', '0236111222');

-- 3. Thêm dữ liệu vào thongtinnguoidung (tạm thời không có MaPhongBan)
INSERT INTO thongtinnguoidung (MaTaiKhoan, HoTen, GioiTinh, CCCD, NgayCap, NoiCap, NgaySinh, SoDienThoai, Email, SoNha, Xa, Huyen, Tinh, HeSoLuong, TrangThai, TrinhDo, NgayBatDauLam, MaChucVu, MaChiNhanh) VALUES
('TK01', 'Nguyễn Văn A', 'Nam', '001100123456', '2020-01-10', 'CA Hà Nội', '1980-05-15', '0912345678', 'nguyenvana@company.com', '123', 'Mai Dịch', 'Cầu Giấy', 'Hà Nội', 5.0, 'Đang làm việc', 'Thạc sĩ', '2020-02-01', 'CV01', 'CN01'),
('TK02', 'Trần Thị B', 'Nữ', '001100654321', '2019-11-20', 'CA Hà Nội', '1985-08-25', '0987654321', 'tranthib@company.com', '456', 'Mai Dịch', 'Cầu Giấy', 'Hà Nội', 3.5, 'Đang làm việc', 'Đại học', '2020-02-01', 'CV05', 'CN01'),
('TK03', 'Lê Văn C', 'Nam', '001100987654', '2021-03-05', 'CA TP.HCM', '1990-12-10', '0978123456', 'levanc@company.com', '789', 'Bến Nghé', 'Quận 1', 'TP.HCM', 2.5, 'Đang làm việc', 'Cao đẳng', '2021-04-01', 'CV04', 'CN02');

-- 4. Cập nhật MaTongGiamDoc cho chinhanh
UPDATE chinhanh SET MaTongGiamDoc = 'TK01' WHERE MaChiNhanh = 'CN01';
UPDATE chinhanh SET MaTongGiamDoc = 'TK03' WHERE MaChiNhanh = 'CN02';

-- 5. Thêm dữ liệu vào phongban
INSERT INTO phongban (MaPB, TenPB, MaChiNhanh, NgayTao, SDT, MaChucVu, MaNhanVien) VALUES
('PB01', 'Phòng Kế toán', 'CN01', '2020-02-01', '0241112222', 'CV05', 'TK02'),
('PB02', 'Phòng Nhân sự', 'CN01', '2020-02-01', '0241113333', 'CV02', NULL),
('PB03', 'Phòng Kinh doanh', 'CN02', '2020-04-01', '0282223333', 'CV02', NULL);

-- 6. Cập nhật MaPhongBan cho thongtinnguoidung
UPDATE thongtinnguoidung SET MaPhongBan = 'PB01' WHERE MaTaiKhoan = 'TK02';
UPDATE thongtinnguoidung SET MaPhongBan = 'PB03' WHERE MaTaiKhoan = 'TK03';

-- 7. Thêm dữ liệu vào các bảng còn lại
INSERT INTO taikhoan (TenDangNhap, MatKhau, MaTaiKhoan, Quyen) VALUES
('admin', '123456', 'TK01', 'admin'),
('manager', '123456', 'TK02', 'manager'),
('staff', '123456', 'TK03', 'staff');

INSERT INTO thongtinchitietchucvu (MaChucVu, TenChucVu, MaChiNhanh, MaPhongBan, MaNhom, LuongCoBan) VALUES
('CV01', 'Tổng giám đốc', 'CN01', NULL, NULL, 30000000),
('CV02', 'Trưởng phòng', 'CN01', 'PB01', 'N01', 20000000),
('CV05', 'Kế toán trưởng', 'CN01', 'PB01', 'N01', 25000000);

INSERT INTO phanbophongban (MaChiNhanh, MaPB, NgayTao, SDT) VALUES
('CN01', 'PB01', '2020-02-01', '0241112222'),
('CN01', 'PB02', '2020-02-01', '0241113333'),
('CN02', 'PB03', '2020-04-01', '0282223333');

INSERT INTO yeucau (MaYeuCau, MaPhongBan, ViTriLamViec, TrinhDo, SoLuong, TrangThaiTuyenDung) VALUES
('YC01', 'PB01', 'Nhân viên kế toán', 'Đại học', 2, 'Đang tuyển'),
('YC02', 'PB02', 'Chuyên viên nhân sự', 'Cao đẳng', 1, 'Đã đủ'),
('YC03', 'PB03', 'Nhân viên kinh doanh', 'Trung cấp', 3, 'Đang tuyển');

INSERT INTO quyetdinh (MaQuyetDinh, LoaiQuyetDinh, Ngay, NoiDung, MaNhanVien, MaNguoiQuyetDinh) VALUES
('QD01', 'Tuyển dụng', '2021-01-15', 'Tuyển dụng nhân viên mới', 'TK03', 'TK01'),
('QD02', 'Khen thưởng', '2021-06-20', 'Khen thưởng nhân viên xuất sắc', 'TK02', 'TK01'),
('QD03', 'Kỷ luật', '2021-09-10', 'Cảnh cáo nhân viên đi muộn', 'TK03', 'TK02');

INSERT INTO congtac (MaNhanVien, MaChucVu, MaPhongBan, MaChiNhanh, NgayBatDau, NgayKetThuc) VALUES
('TK01', 'CV01','PB01', 'CN01', '2020-02-01', NULL),
('TK02', 'CV05', 'PB01', 'CN01', '2020-02-01', NULL),
('TK03', 'CV04', 'PB03', 'CN02', '2021-04-01', NULL);

INSERT INTO thongtinluong (MaNhanVien, HoTen, HeSoLuong, TenChucVu, LuongCoBan, LuongChinhThuc, MaChiNhanh, MaPhongBan, TenChiNhanh, TenPB) VALUES
('TK01', 'Nguyễn Văn A', 5.0, 'Tổng giám đốc', 30000000, 150000000, 'CN01', 'PB01', 'Trụ sở chính Hà Nội', 'kkkk'),
('TK02', 'Trần Thị B', 3.5, 'Kế toán trưởng', 25000000, 87500000, 'CN01', 'PB01', 'Trụ sở chính Hà Nội', 'Phòng Kế toán'),
('TK03', 'Lê Văn C', 2.5, 'Nhân viên', 10000000, 25000000, 'CN02', 'PB03', 'Chi nhánh TP.HCM', 'Phòng Kinh doanh');

INSERT INTO thongtincongtacnhanvien (MaTaiKhoan, HoTen, GioiTinh, NgaySinh, TenChucVu, MaChiNhanh, TenChiNhanh, MaPhongBan, TenPhongBan, NgayBD) VALUES
('TK01', 'Nguyễn Văn A', 'Nam', '1980-05-15', 'Tổng giám đốc', 'CN01', 'Trụ sở chính Hà Nội', 'PB01', 'kkkk', '2020-02-01'),
('TK02', 'Trần Thị B', 'Nu', '1985-08-25', 'Kế toán trưởng', 'CN01', 'Trụ sở chính Hà Nội', 'PB01', 'Phòng Kế toán', '2020-02-01'),
('TK03', 'Lê Văn C', 'Nam', '1990-12-10', 'Nhân viên', 'CN02', 'Chi nhánh TP.HCM', 'PB03', 'Phòng Kinh doanh', '2021-04-01');

INSERT INTO thongtintruongphong (MaChiNhanh, TenChiNhanh, MaPB, TenPB, NgayTao, SDT, MaChucVu, MaNhanVien, HoTen) VALUES
('CN01', 'Trụ sở chính Hà Nội', 'PB01', 'Phòng Kế toán', '2020-02-01', '0241112222', 'CV05', 'TK02', 'Trần Thị B'),
('CN01', 'Trụ sở chính Hà Nội', 'PB02', 'Phòng Nhân sự', '2020-02-01', '0241113333', 'CV02', NULL, NULL),
('CN02', 'Chi nhánh TP.HCM', 'PB03', 'Phòng Kinh doanh', '2020-04-01', '0282223333', 'CV02', NULL, NULL);