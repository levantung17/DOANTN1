package Models;

public class TaiKhoan {
    private String tenDangNhap;
    private String matKhau;
    private String maTaiKhoan;
    private String quyen;

    public TaiKhoan()
    { }

    public TaiKhoan(String tenDangNhap, String matKhau, String maTaiKhoan, String quyen) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.maTaiKhoan = maTaiKhoan;
        this.quyen = quyen;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(String maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getQuyen() {
        return quyen;
    }

    public void setQuyen(String quyen) {
        this.quyen = quyen;
    }
}
