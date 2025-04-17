package Models;

import java.text.DecimalFormat;

public class Luong {
    private String maNV;
    private String hoTen;
    private float heSo;
    private String tenChucVu;
    private int luongCoBan;
    private double tongLuong;
    private String tongluong;
    private String luongcoban;

    public Luong(String maNV, String hoTen, float heSo, String tenChucVu, int luongCoBan, double tongLuong) {
        this.maNV = maNV;
        this.hoTen = hoTen;
        this.heSo = heSo;
        this.tenChucVu = tenChucVu;
        this.luongCoBan = luongCoBan;
        this.tongLuong = tongLuong;
        DecimalFormat df = new DecimalFormat("#,###");
        this.tongluong = df.format(tongLuong);
        this.luongcoban = df.format(luongCoBan);
    }

    public String getTongluong() {
        return tongluong;
    }

    public String getLuongcoban() {
        return luongcoban;
    }

    public void setLuongcoban(String luongcoban) {
        this.luongcoban = luongcoban;
    }

    public void setTongluong(String tongluong) {
        this.tongluong = tongluong;
    }

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public float getHeSo() {
        return heSo;
    }

    public void setHeSo(float heSo) {
        this.heSo = heSo;
    }

    public String getTenChucVu() {
        return tenChucVu;
    }

    public void setTenChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }

    public int getLuongCoBan() {
        return luongCoBan;
    }

    public void setLuongCoBan(int luongCoBan) {
        this.luongCoBan = luongCoBan;
    }

    public double getTongLuong() {
        return tongLuong;
    }

    public void setTongLuong(double tongLuong) {
        this.tongLuong = tongLuong;
    }
}
