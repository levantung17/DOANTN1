package Models;

import java.util.Date;

public class CongTac {
    private String maNhanVien;
    private String maChucVu;
    private Date ngayBatDau;
    private Date ngayKetThuc;

    public CongTac(String maNhanVien, String maChucVu, Date ngayBatDau, Date ngayKetThuc) {
        this.maNhanVien = maNhanVien;
        this.maChucVu = maChucVu;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
    }

    public String getMaNhanVien() {
        return maNhanVien;
    }

    public String getMaChucVu() {
        return maChucVu;
    }

    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }

    public void setMaChucVu(String maChucVu) {
        this.maChucVu = maChucVu;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }
}
