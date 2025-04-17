package Models;

import java.util.Date;

public class ChiNhanh {
    private String maChiNhanh;
    private String tenChiNhanh;
    private String soNha;
    private String xa;
    private String huyen;
    private String tinh;
    private String ngayTaoChiNhanh;
    private String sdt;
    private String maGiamDoc;

    public ChiNhanh(String maChiNhanh, String tenChiNhanh, String soNha, String xa, String huyen, String tinh, String ngayTaoChiNhanh, String sdt, String maGiamDoc) {
        this.maChiNhanh = maChiNhanh;
        this.tenChiNhanh = tenChiNhanh;
        this.soNha = soNha;
        this.xa = xa;
        this.huyen = huyen;
        this.tinh = tinh;
        this.ngayTaoChiNhanh = ngayTaoChiNhanh;
        this.sdt = sdt;
        this.maGiamDoc = maGiamDoc;
    }
    public ChiNhanh( String tenChiNhanh) {

        this.tenChiNhanh = tenChiNhanh;

    }
    public String getMaChiNhanh() {
        return maChiNhanh;
    }

    public String getTenChiNhanh() {
        return tenChiNhanh;
    }

    public String getSoNha() {
        return soNha;
    }

    public String getXa() {
        return xa;
    }

    public String getHuyen() {
        return huyen;
    }

    public String getTinh() {
        return tinh;
    }

    public String getNgayTaoChiNhanh() {
        return ngayTaoChiNhanh;
    }

    public String getSdt() {
        return sdt;
    }

    public String getMaGiamDoc() {
        return maGiamDoc;
    }

    public void setMaChiNhanh(String maChiNhanh) {
        this.maChiNhanh = maChiNhanh;
    }

    public void setTenChiNhanh(String tenChiNhanh) {
        this.tenChiNhanh = tenChiNhanh;
    }

    public void setSoNha(String soNha) {
        this.soNha = soNha;
    }

    public void setXa(String xa) {
        this.xa = xa;
    }

    public void setHuyen(String huyen) {
        this.huyen = huyen;
    }

    public void setTinh(String tinh) {
        this.tinh = tinh;
    }

    public void setNgayTaoChiNhanh(String ngayTaoChiNhanh) {
        this.ngayTaoChiNhanh = ngayTaoChiNhanh;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public void setMaGiamDoc(String maGiamDoc) {
        this.maGiamDoc = maGiamDoc;
    }
}
