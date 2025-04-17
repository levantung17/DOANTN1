package Models;

public class ChucVu {
    private String maChucVu;
    private String tenChucVu;
    private String maChiNhanh;
    private String maPhongBan;
    private String maNhom;
    private int luongCoBan;

    public ChucVu(String maChucVu, String tenChucVu, String maChiNhanh, String maPhongBan, String maNhom, int luongCoBan) {
        this.maChucVu = maChucVu;
        this.tenChucVu = tenChucVu;
        this.maChiNhanh = maChiNhanh;
        this.maPhongBan = maPhongBan;
        this.maNhom = maNhom;
        this.luongCoBan = luongCoBan;
    }

    public ChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }

    public String getMaChucVu() {
        return maChucVu;
    }

    public String getTenChucVu() {
        return tenChucVu;
    }

    public String getMaChiNhanh() {
        return maChiNhanh;
    }

    public String getMaPhongBan() {
        return maPhongBan;
    }

    public String getMaNhom() {
        return maNhom;
    }

    public int getLuongCoBan() {
        return luongCoBan;
    }

    public void setMaChucVu(String maChucVu) {
        this.maChucVu = maChucVu;
    }

    public void setTenChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }

    public void setMaChiNhanh(String maChiNhanh) {
        this.maChiNhanh = maChiNhanh;
    }

    public void setMaPhongBan(String maPhongBan) {
        this.maPhongBan = maPhongBan;
    }

    public void setMaNhom(String maNhom) {
        this.maNhom = maNhom;
    }

    public void setLuongCoBan(int luongCoBan) {
        this.luongCoBan = luongCoBan;
    }
}
