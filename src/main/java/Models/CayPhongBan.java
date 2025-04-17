package Models;

import java.util.ArrayList;
import java.util.List;

public class CayPhongBan {
    private String maPhongBan;
    private String tenPhongBan;
    private List<CayNhom> nhoms = new ArrayList<>();

    public CayPhongBan(String maPhongBan, String tenPhongBan) {
        this.maPhongBan = maPhongBan;
        this.tenPhongBan = tenPhongBan;
    }

    public String getMaPhongBan() {
        return maPhongBan;
    }

    public void setMaPhongBan(String maPhongBan) {
        this.maPhongBan = maPhongBan;
    }

    public String getTenPhongBan() {
        return tenPhongBan;
    }

    public void setTenPhongBan(String tenPhongBan) {
        this.tenPhongBan = tenPhongBan;
    }

    public List<CayNhom> getNhoms() {
        return nhoms;
    }

    public void setNhoms(List<CayNhom> nhoms) {
        this.nhoms = nhoms;
    }
}
