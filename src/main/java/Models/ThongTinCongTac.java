package Models;
import java.text.DateFormat;
import java.util.Date;
import java.text.SimpleDateFormat;

public class ThongTinCongTac {
    String manhanvien;
    String tennhanvien;
    String gioitinh;
    Date ngaysinh;
    String chucvu;
    String machinhanh;
    String chinhanh;
    String maphongban;
    String phongban;
    String date;

    public ThongTinCongTac(String manhanvien, String tennhanvien, String gioitinh, Date ngaysinh, String chucvu, String machinhanh, String chinhanh, String maphongban, String phongban, String date) {
        super();
        this.manhanvien = manhanvien;
        this.tennhanvien = tennhanvien;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.chucvu = chucvu;
        this.machinhanh = machinhanh;
        this.chinhanh = chinhanh;
        this.maphongban = maphongban;
        this.phongban = phongban;
        this.date=date;
    }

    public ThongTinCongTac(String manhanvien, String tennhanvien, String gioitinh, Date ngaysinh, String chucvu, String machinhanh, String chinhanh, String maphongban, String phongban) {
        super();
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        this.manhanvien = manhanvien;
        this.tennhanvien = tennhanvien;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.chucvu = chucvu;
        this.machinhanh = machinhanh;
        this.chinhanh = chinhanh;
        this.maphongban = maphongban;
        this.phongban = phongban;
        this.date=formatter.format(this.ngaysinh);
    }

    public String getDate() {
        return date;
    }

    public ThongTinCongTac()
    {
        super();
    }

    public String getManhanvien() {
        return manhanvien;
    }

    public void setManhanvien(String manhanvien) {
        this.manhanvien = manhanvien;
    }

    public String getTennhanvien() {
        return tennhanvien;
    }

    public void setTennhanvien(String tennhanvien) {
        this.tennhanvien = tennhanvien;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getChucvu() {
        return chucvu;
    }

    public void setChucvu(String chucvu) {
        this.chucvu = chucvu;
    }

    public String getChinhanh() {
        return chinhanh;
    }

    public void setChinhanh(String chinhanh) {
        this.chinhanh = chinhanh;
    }

    public String getPhongban() {
        return phongban;
    }

    public void setPhongban(String phongban) {
        this.phongban = phongban;
    }

    public String getMachinhanh() {
        return machinhanh;
    }

    public void setMachinhanh(String machinhanh) {
        this.machinhanh = machinhanh;
    }

    public String getMaphongban() {
        return maphongban;
    }

    public void setMaphongban(String maphongban) {
        this.maphongban = maphongban;
    }
}
