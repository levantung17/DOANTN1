package DAO;

import JDBCUtils.HandleException;
import JDBCUtils.JDBCUtil;
import Models.Luong;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThongKeLuongDAO {
    public ThongKeLuongDAO(){}

    public List< Luong > selectInfoSalary ()
    {
        List <Luong> info = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM thongtinluong");) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String manv = rs.getString("MaNhanVien");
                String hoten = rs.getString("HoTen");
                float heso = rs.getFloat("HeSoLuong");
                String tencv = rs.getString("TenChucVu");
                int luongcoban = rs.getInt("LuongCoBan");
                double luongchinhthuc = rs.getDouble("LuongChinhThuc");

                info.add(new Luong(manv,hoten,heso,tencv,luongcoban,luongchinhthuc));
            }
        } catch (SQLException e) {
            HandleException.printSQLException(e);
        }
        return info;
    }

    public List< Luong > selectInfoSalaryForBranch (String maChiNhanh)
    {
        List <Luong> info = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM thongtinluong where MaChiNhanh = ?");) {
            preparedStatement.setString(1,maChiNhanh);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String manv = rs.getString("MaNhanVien");
                String hoten = rs.getString("HoTen");
                float heso = rs.getFloat("HeSoLuong");
                String tencv = rs.getString("TenChucVu");
                int luongcoban = rs.getInt("LuongCoBan");
                double luongchinhthuc = rs.getDouble("LuongChinhThuc");

                info.add(new Luong(manv,hoten,heso,tencv,luongcoban,luongchinhthuc));
            }
        } catch (SQLException e) {
            HandleException.printSQLException(e);
        }
        return info;
    }

    public List< Luong > selectInfoSalaryForDepart(String maChiNhanh, String maPhongBan)
    {
        List <Luong> info = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM thongtinluong where MaChiNhanh = ? and MaPhongBan = ?");) {
            preparedStatement.setString(1,maChiNhanh);
            preparedStatement.setString(2,maPhongBan);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String manv = rs.getString("MaNhanVien");
                String hoten = rs.getString("HoTen");
                float heso = rs.getFloat("HeSoLuong");
                String tencv = rs.getString("TenChucVu");
                int luongcoban = rs.getInt("LuongCoBan");
                double luongchinhthuc = rs.getDouble("LuongChinhThuc");

                info.add(new Luong(manv,hoten,heso,tencv,luongcoban,luongchinhthuc));
            }
        } catch (SQLException e) {
            HandleException.printSQLException(e);
        }
        return info;
    }

    public List< Luong > findListSalary (String tenCN, String tenPB, String tenCV)
    {
        List <Luong> info = new ArrayList<>();

        try (Connection connection = JDBCUtil.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT * FROM thongtinluong where TenChiNhanh LIKE ? and TenPB LIKE ? and TenChucVu LIKE ?");) {

            preparedStatement.setString(1,tenCN);
            preparedStatement.setString(2,tenPB);
            preparedStatement.setString(3,tenCV);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String manv = rs.getString("MaNhanVien");
                String hoten = rs.getString("HoTen");
                float heso = rs.getFloat("HeSoLuong");
                String tencv = rs.getString("TenChucVu");
                int luongcoban = rs.getInt("LuongCoBan");
                double luongchinhthuc = rs.getDouble("LuongChinhThuc");

                info.add(new Luong(manv,hoten,heso,tencv,luongcoban,luongchinhthuc));
            }
        } catch (SQLException e) {
            HandleException.printSQLException(e);
        }
        return info;
    }
}
