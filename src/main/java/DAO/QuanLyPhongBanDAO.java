package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Models.*;
import JDBCUtils.HandleException;
import JDBCUtils.JDBCUtil;

public class QuanLyPhongBanDAO {

  private static final String SELECT_PHONGBAN_ALL = "SELECT * FROM thongtintruongphong;";
  private static final String SELECT_PHONGBAN_NHANH = "SELECT * FROM thongtintruongphong WHERE MaChiNhanh = ?;";
  private static final String CALL_INSERT_PHONGBAN = "CALL themPhongBan(?, ?, ?, ?, ?, ?, ?, ?,?,?);";
  private static final String CALL_UPDATE_PHONGBAN = "CALL suaPhongBan(?, ?, ?, ?, ?, ?, ?, ?,?);";
  private static final String CALL_DELETE_PHONGBAN = "CALL xoaPhongBan(?);";
  public QuanLyPhongBanDAO() {
  }

  public List<ThongTinTruongPhong> selectAllPhongBan(String maChiNhanh, String maPhongBan,
      String role) {
    List<ThongTinTruongPhong> result = new ArrayList<>();
    String query = "";
    if (role.equals("admin")) {
      query = SELECT_PHONGBAN_ALL;
    } else if (role.equals("giamdoc")) {
      query = SELECT_PHONGBAN_NHANH;
    }
    try (Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(query);) {
      if (role.equals("giamdoc")) {
        preparedStatement.setString(1, maChiNhanh);
      }
      ResultSet rs = preparedStatement.executeQuery();
      while (rs.next()) {
        String MaChiNhanh = rs.getString("MaChiNhanh");
        String TenChiNhanh = rs.getString("TenChiNhanh");
        String MaPhongBan = rs.getString("MaPB");
        String TenPhongBan = rs.getString("TenPB");
        String NgayTao = rs.getString("Ngaytao");
        String Sdt = rs.getString("SDT");
        String Machucvu = rs.getString("MaChucVu");
        String MaTruongPhong = rs.getString("MaNhanVien");
        String TenTruongPhong = rs.getString("HoTen");

        ThongTinTruongPhong thongTinTruongPhong = new ThongTinTruongPhong(MaChiNhanh, TenChiNhanh,
            MaPhongBan, TenPhongBan, NgayTao, Sdt, Machucvu, MaTruongPhong, TenTruongPhong);
        result.add(thongTinTruongPhong);
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public List<ThongTinTruongPhong> findDepartment(String tenChiNhanh, String tenPhongBan)
  {
    List<ThongTinTruongPhong> result = new ArrayList<>();
    try (Connection connection = JDBCUtil.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM thongtintruongphong WHERE TenChiNhanh LIKE ? and  TenPB LIKE ?;");) {

      preparedStatement.setString(1,tenChiNhanh);
      preparedStatement.setString(2,tenPhongBan);

      ResultSet rs = preparedStatement.executeQuery();
      while (rs.next()) {
        String MaChiNhanh = rs.getString("MaChiNhanh");
        String TenChiNhanh = rs.getString("TenChiNhanh");
        String MaPhongBan = rs.getString("MaPB");
        String TenPhongBan = rs.getString("TenPB");
        String NgayTao = rs.getString("Ngaytao");
        String Sdt = rs.getString("SDT");
        String Machucvu = rs.getString("MaChucVu");
        String MaTruongPhong = rs.getString("MaNhanVien");
        String TenTruongPhong = rs.getString("HoTen");

        ThongTinTruongPhong thongTinTruongPhong = new ThongTinTruongPhong(MaChiNhanh, TenChiNhanh,
                MaPhongBan, TenPhongBan, NgayTao, Sdt, Machucvu, MaTruongPhong, TenTruongPhong);
        result.add(thongTinTruongPhong);
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public List<ThongTinTruongPhong> LoadInfoPhongBan() {
    List<ThongTinTruongPhong> result = new ArrayList<>();
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "SELECT * FROM project_web.thongtintruongphong");) {
      ResultSet rs = preparedStatement.executeQuery();
      while (rs.next()) {
        String MaChiNhanh = rs.getString("MaChiNhanh");
        String TenChiNhanh = rs.getString("TenChiNhanh");
        String MaPhongBan = rs.getString("MaPB");
        String TenPhongBan = rs.getString("TenPB");
        String NgayTao = rs.getString("Ngaytao");
        String Sdt = rs.getString("SDT");
        String Machucvu = rs.getString("MaChucVu");
        String MaTruongPhong = rs.getString("MaNhanVien");
        String TenTruongPhong = rs.getString("HoTen");

        ThongTinTruongPhong thongTinTruongPhong = new ThongTinTruongPhong(MaChiNhanh, TenChiNhanh,
            MaPhongBan, TenPhongBan, NgayTao, Sdt, Machucvu, MaTruongPhong, TenTruongPhong);
        result.add(thongTinTruongPhong);
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayMaChiNhanh(String maTaiKhoan) {
    String result = "null";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select MaChiNhanh from congtac inner join chucvu on congtac.MaChucVu=chucvu.MaChucVu where MaNhanVien = ?");) {
      preparedStatement.setString(1, maTaiKhoan);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("MaChiNhanh");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayMaPhongBan(String mataikhoan) {
    String result = "null";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select MaPhongBan from congtac inner join chucvu on congtac.MaChucVu=chucvu.MaChucVu where MaNhanVien = ?");) {
      preparedStatement.setString(1, mataikhoan);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("MaPhongBan");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayTenChiNhanh(String maChiNhanh) {
    String result = "";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select TenChiNhanh from thongtincongtacnhanvien where MaChiNhanh = ?");) {
      preparedStatement.setString(1, maChiNhanh);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("TenChiNhanh");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public String LayTenPhongBan(String maPhongBan) {
    String result = "";
    try (Connection connection = JDBCUtil.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(
            "select TenPB from thongtinphongban where MaPB = ?");) {
      preparedStatement.setString(1, maPhongBan);

      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        result = rs.getString("TenPB");
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
    }
    return result;
  }

  public boolean AddPhongBan(String maChiNhanh, String maPB, String tenPB, String ngayTao,
      String sdt, String maChucVu, String tenChucVu, int luongCoBan, String maTruongPhong,
      String ngayBatDau) {
    try (Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(CALL_INSERT_PHONGBAN);) {
      preparedStatement.setString(1, maChiNhanh);
      preparedStatement.setString(2, maPB);
      preparedStatement.setString(3, tenPB);
      preparedStatement.setString(4, ngayTao);
      preparedStatement.setString(5, sdt);
      preparedStatement.setString(6, maChucVu);
      preparedStatement.setString(7, tenChucVu);
      preparedStatement.setInt(8, luongCoBan);
      preparedStatement.setString(9, maTruongPhong);
      preparedStatement.setString(10, ngayBatDau);

      preparedStatement.executeUpdate();
      return true;
    } catch (SQLException e) {
      HandleException.printSQLException(e);
      return false;
    }
  }
  public boolean SuaPhongBan(String maChiNhanh, String maPB, String tenPB, String ngayTao,
      String sdt, String maChucVu, int luongCoBan, String maTruongPhong, String ngayBatDau) {
    try (Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(CALL_UPDATE_PHONGBAN);) {
      preparedStatement.setString(1, maChiNhanh);
      preparedStatement.setString(2, maPB);
      preparedStatement.setString(3, tenPB);
      preparedStatement.setString(4, ngayTao);
      preparedStatement.setString(5, sdt);
      preparedStatement.setString(6, maChucVu);
      preparedStatement.setInt(7, luongCoBan);
      preparedStatement.setString(8, maTruongPhong);
      preparedStatement.setString(9, ngayBatDau);

      if (preparedStatement.executeUpdate() > 0) {
        return true;
      } else {
        return false;
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
      return false;
    }
  }

  public boolean XoaPhongBan(String maPhongBan) {
    try (Connection connection = JDBCUtil.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(CALL_DELETE_PHONGBAN);) {
      preparedStatement.setString(1, maPhongBan);

      if (preparedStatement.executeUpdate() > 0) {
        return true;
      } else {
        return false;
      }
    } catch (SQLException e) {
      HandleException.printSQLException(e);
      return false;
    }
  }

  public static void main(String[] args) {
    QuanLyPhongBanDAO quanLyPhongBanDAO = new QuanLyPhongBanDAO();
    String maChiNhanh = quanLyPhongBanDAO.LayMaChiNhanh("TK006");
    String maPhongBan = quanLyPhongBanDAO.LayMaPhongBan("TK006");
//    List<ThongTinTruongPhong> result = quanLyPhongBanDAO.selectAllPhongBan(maChiNhanh, maPhongBan,
//        "giamdoc");
//    for (ThongTinTruongPhong thongTinPhongBan : result) {
//      System.out.println(thongTinPhongBan.getMaChiNhanh());
//      System.out.println(thongTinPhongBan.getTenChiNhanh());
//      System.out.println(thongTinPhongBan.getMaPB());
//      System.out.println(thongTinPhongBan.getTenPB());
//      System.out.println(thongTinPhongBan.getNgayTao());
//      System.out.println(thongTinPhongBan.getSdt());
//      System.out.println(thongTinPhongBan.getMaChucVu());
//      System.out.println(thongTinPhongBan.getMaNhanVien());
//      System.out.println(thongTinPhongBan.getHoTen());
////    }
//    boolean result = quanLyPhongBanDAO.AddPhongBan("CN101", "PB101", "Test",
//        "2023-12-06", "9844037288", "CV101", "Phong Ki Thuat", 10000000, "NV101", "2023-12-06");
//    System.out.println(result);
    boolean result = quanLyPhongBanDAO.XoaPhongBan("PB101");
    System.out.println(result);
  }
}
