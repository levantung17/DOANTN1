package Models;

import java.util.Date;

public class PhanBoPhongBan {
    private String maChiNhanh;
    private String maPhongBan;
    private Date ngayTao;
    private String sdt;

    public PhanBoPhongBan(String maChiNhanh, String maPhongBan, Date ngayTao, String sdt) {
        this.maChiNhanh = maChiNhanh;
        this.maPhongBan = maPhongBan;
        this.ngayTao = ngayTao;
        this.sdt = sdt;
    }

    public String getMaChiNhanh() {
        return maChiNhanh;
    }

    public void setMaChiNhanh(String maChiNhanh) {
        this.maChiNhanh = maChiNhanh;
    }

    public String getMaPhongBan() {
        return maPhongBan;
    }

    public void setMaPhongBan(String maPhongBan) {
        this.maPhongBan = maPhongBan;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }
}
