package Models;

public class YeuCau {
    private String maYeuCau;
    private String maPhongBan;
    private String viTriLamViec;
    private String trinhDo;
    private int soLuong;
    private String trangThai;

    public YeuCau(String maYeuCau, String maPhongBan, String viTriLamViec, String trinhDo, int soLuong, String trangThai) {
        this.maYeuCau = maYeuCau;
        this.maPhongBan = maPhongBan;
        this.viTriLamViec = viTriLamViec;
        this.trinhDo = trinhDo;
        this.soLuong = soLuong;
        this.trangThai = trangThai;
    }

    public String getMaYeuCau() {
        return maYeuCau;
    }

    public void setMaYeuCau(String maYeuCau) {
        this.maYeuCau = maYeuCau;
    }

    public String getMaPhongBan() {
        return maPhongBan;
    }

    public void setMaPhongBan(String maPhongBan) {
        this.maPhongBan = maPhongBan;
    }

    public String getViTriLamViec() {
        return viTriLamViec;
    }

    public void setViTriLamViec(String viTriLamViec) {
        this.viTriLamViec = viTriLamViec;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        this.trinhDo = trinhDo;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}
