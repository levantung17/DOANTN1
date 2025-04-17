package Models;

import java.util.ArrayList;
import java.util.List;

public class CayChiNhanh {
    private String maChiNhanh;
     private String tenChiNhanh;
     private List <CayPhongBan> phongbans = new ArrayList<>();

    public CayChiNhanh(String maChiNhanh, String tenChiNhanh) {
        this.maChiNhanh = maChiNhanh;
        this.tenChiNhanh = tenChiNhanh;
    }

    public String getMaChiNhanh() {
        return maChiNhanh;
    }

    public void setMaChiNhanh(String maChiNhanh) {
        this.maChiNhanh = maChiNhanh;
    }

    public String getTenChiNhanh() {
        return tenChiNhanh;
    }

    public void setTenChiNhanh(String tenChiNhanh) {
        this.tenChiNhanh = tenChiNhanh;
    }

    public List<CayPhongBan> getPhongbans() {
        return phongbans;
    }

    public void setPhongbans(List<CayPhongBan> phongbans) {
        this.phongbans = phongbans;
    }
}
