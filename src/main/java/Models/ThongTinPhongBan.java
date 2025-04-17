package Models;

public class ThongTinPhongBan {

  private String maChiNhanh;
  private String tenChiNhanh;
  private String maPhongBan;
  private String tenPB;
  private String ngayTao;
  private String sdt;

  public ThongTinPhongBan(String maChiNhanh, String tenChiNhanh, String maPhongBan, String tenPB,
      String ngayTao, String sdt) {
    this.maChiNhanh = maChiNhanh;
    this.tenChiNhanh = tenChiNhanh;
    this.maPhongBan = maPhongBan;
    this.tenPB = tenPB;
    this.ngayTao = ngayTao;
    this.sdt = sdt;
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

  public String getMaPhongBan() {
    return maPhongBan;
  }

  public void setMaPhongBan(String maPhongBan) {
    this.maPhongBan = maPhongBan;
  }

  public String getTenPB() {
    return tenPB;
  }

  public void setTenPB(String tenPB) {
    this.tenPB = tenPB;
  }

  public String getNgayTao() {
    return ngayTao;
  }

  public void setNgayTao(String ngayTao) {
    this.ngayTao = ngayTao;
  }

  public String getSdt() {
    return sdt;
  }

  public void setSdt(String sdt) {
    this.sdt = sdt;
  }


}
