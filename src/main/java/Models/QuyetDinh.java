package Models;
import java.util.Date;

public class QuyetDinh {
    private String maQuyetDinh;
    private String loaiQuyetDinh;
    private String ngay;
    private String noiDung;
    private String maNhanVien;
    private String maNguoiQuyetDinh;

    public QuyetDinh(String maQuyetDinh, String loaiQuyetDinh, String ngay, String noiDung, String maNhanVien, String maNguoiQuyetDinh) {
        this.maQuyetDinh = maQuyetDinh;
        this.loaiQuyetDinh = loaiQuyetDinh;
        this.ngay = ngay;
        this.noiDung = noiDung;
        this.maNhanVien = maNhanVien;
        this.maNguoiQuyetDinh = maNguoiQuyetDinh;
    }

    public String getMaQuyetDinh() {
        return maQuyetDinh;
    }

    public void setMaQuyetDinh(String maQuyetDinh) {
        this.maQuyetDinh = maQuyetDinh;
    }

    public String getLoaiQuyetDinh() {
        return loaiQuyetDinh;
    }

    public void setLoaiQuyetDinh(String loaiQuyetDinh) {
        this.loaiQuyetDinh = loaiQuyetDinh;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }

    public String getMaNguoiQuyetDinh() {
        return maNguoiQuyetDinh;
    }

    public void setMaNguoiQuyetDinh(String maNguoiQuyetDinh) {
        this.maNguoiQuyetDinh = maNguoiQuyetDinh;
    }
}
