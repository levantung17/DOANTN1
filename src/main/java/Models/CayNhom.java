package Models;

public class CayNhom {
    private String maNhom;
    private String tenNhom;

    public CayNhom(String maNhom, String tenNhom) {
        this.maNhom = maNhom;
        this.tenNhom = tenNhom;
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
}
