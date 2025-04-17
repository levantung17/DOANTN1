package Models;

public class ThongTinTruongPhong {
  private String maChiNhanh;
  private String tenChiNhanh;
  private String maPB;
  private String tenPB;
  private String ngayTao;
  private String sdt;
  private String maChucVu;
  private String maNhanVien;
  private String hoTen;

  public ThongTinTruongPhong(String maChiNhanh, String tenChiNhanh, String maPB, String tenPB,
      String ngayTao, String sdt, String maChucVu, String maNhanVien, String hoTen) {
    this.maChiNhanh = maChiNhanh;
    this.tenChiNhanh = tenChiNhanh;
    this.maPB = maPB;
    this.tenPB = tenPB;
    this.ngayTao = ngayTao;
    this.sdt = sdt;
    this.maChucVu = maChucVu;
    this.maNhanVien = maNhanVien;
    this.hoTen = hoTen;
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

  public String getMaPB() {
    return maPB;
  }

  public void setMaPB(String maPB) {
    this.maPB = maPB;
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

  public String getMaChucVu() {
    return maChucVu;
  }

  public void setMaChucVu(String maChucVu) {
    this.maChucVu = maChucVu;
  }

  public String getMaNhanVien() {
    return maNhanVien;
  }

  public void setMaNhanVien(String maNhanVien) {
    this.maNhanVien = maNhanVien;
  }

  public String getHoTen() {
    return hoTen;
  }

  public void setHoTen(String hoTen) {
    this.hoTen = hoTen;
  }
}
