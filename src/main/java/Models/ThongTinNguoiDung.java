package Models;

public class ThongTinNguoiDung {
    private String mataikhoan;
    private String hoTen;
    private String gioitinh;
    private String cccd;
    private String ngayCap;
    private String noiCap;
    private String ngaySinh;
    private String sdt;
    private String email;
    private String soNha;
    private String xa;
    private String huyen;
    private String tinh;
    private float heSoLuong;
    private String trangThai;
    private String trinhDo;
    private String ngayBatDauLam;

    public ThongTinNguoiDung(String mataikhoan, String hoTen, String gioitinh, String cccd, String ngayCap, String noiCap, String ngaySinh, String sdt, String email, String soNha, String xa, String huyen, String tinh, float heSoLuong, String trangThai, String trinhDo, String ngayBatDauLam) {
        this.mataikhoan = mataikhoan;
        this.hoTen = hoTen;
        this.gioitinh = gioitinh;
        this.cccd = cccd;
        this.ngayCap = ngayCap;
        this.noiCap = noiCap;
        this.ngaySinh = ngaySinh;
        this.sdt = sdt;
        this.email = email;
        this.soNha = soNha;
        this.xa = xa;
        this.huyen = huyen;
        this.tinh = tinh;
        this.heSoLuong = heSoLuong;
        this.trangThai = trangThai;
        this.trinhDo = trinhDo;
        this.ngayBatDauLam = ngayBatDauLam;
    }

    public ThongTinNguoiDung(String mataikhoan, String hoTen, String gioitinh, String cccd,
        String ngayCap, String noiCap, String ngaySinh, String sdt, String email, String soNha,
        String xa, String huyen, String tinh) {
        this.mataikhoan = mataikhoan;
        this.hoTen = hoTen;
        this.gioitinh = gioitinh;
        this.cccd = cccd;
        this.ngayCap = ngayCap;
        this.noiCap = noiCap;
        this.ngaySinh = ngaySinh;
        this.sdt = sdt;
        this.email = email;
        this.soNha = soNha;
        this.xa = xa;
        this.huyen = huyen;
        this.tinh = tinh;
    }

    public ThongTinNguoiDung(){}

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getMataikhoan() {
        return mataikhoan;
    }

    public void setMataikhoan(String mataikhoan) {
        this.mataikhoan = mataikhoan;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getNgayCap() {
        return ngayCap;
    }

    public void setNgayCap(String ngayCap) {
        this.ngayCap = ngayCap;
    }

    public String getNoiCap() {
        return noiCap;
    }

    public void setNoiCap(String noiCap) {
        this.noiCap = noiCap;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSoNha() {
        return soNha;
    }

    public void setSoNha(String soNha) {
        this.soNha = soNha;
    }

    public String getXa() {
        return xa;
    }

    public void setXa(String xa) {
        this.xa = xa;
    }

    public String getHuyen() {
        return huyen;
    }

    public void setHuyen(String huyen) {
        this.huyen = huyen;
    }

    public String getTinh() {
        return tinh;
    }

    public void setTinh(String tinh) {
        this.tinh = tinh;
    }

    public float getHeSoLuong() {
        return heSoLuong;
    }

    public void setHeSoLuong(float heSoLuong) {
        this.heSoLuong = heSoLuong;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        this.trinhDo = trinhDo;
    }

    public String getNgayBatDauLam() {
        return ngayBatDauLam;
    }

    public void setNgayBatDauLam(String ngayBatDauLam) {
        this.ngayBatDauLam = ngayBatDauLam;
    }
}
