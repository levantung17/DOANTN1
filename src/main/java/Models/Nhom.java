package Models;

public class Nhom {
    private String maNhom;
    private String tenNhom;
    private String moTaNhiemVu;
    private String maPhongBan;
    private String maTruongPhong;

    public Nhom(String maNhom, String tenNhom, String moTaNhiemVu, String maPhongBan, String maTruongPhong) {
        this.maNhom = maNhom;
        this.tenNhom = tenNhom;
        this.moTaNhiemVu = moTaNhiemVu;
        this.maPhongBan = maPhongBan;
        this.maTruongPhong = maTruongPhong;
    }

    public String getMaNhom() {
        return maNhom;
    }

    public void setMaNhom(String maNhom) {
        this.maNhom = maNhom;
    }

    public String getTenNhom() {
        return tenNhom;
    }

    public void setTenNhom(String tenNhom) {
        this.tenNhom = tenNhom;
    }

    public String getMoTaNhiemVu() {
        return moTaNhiemVu;
    }

    public void setMoTaNhiemVu(String moTaNhiemVu) {
        this.moTaNhiemVu = moTaNhiemVu;
    }

    public String getMaPhongBan() {
        return maPhongBan;
    }

    public void setMaPhongBan(String maPhongBan) {
        this.maPhongBan = maPhongBan;
    }

    public String getMaTruongPhong() {
        return maTruongPhong;
    }

    public void setMaTruongPhong(String maTruongPhong) {
        this.maTruongPhong = maTruongPhong;
    }
}
