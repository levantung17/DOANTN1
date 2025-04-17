package Controller;

import DAO.QuanLyNhanVienDAO;
import DAO.QuanLyPhongBanDAO;
import Models.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "QuanLyPhongBanController", urlPatterns = {"/listphongban", "/findphongban",
    "/addphongban", "/suaPhongBan", "/deletephongban"})
public class QuanLyPhongBanController extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private QuanLyPhongBanDAO quanLyPhongBanDAO = null;
  private QuanLyNhanVienDAO quanLyNhanVienDAO = null;
  private List<ThongTinTruongPhong> listPhongBanInfo;

  public void init() {
    quanLyNhanVienDAO = new QuanLyNhanVienDAO();
    quanLyPhongBanDAO = new QuanLyPhongBanDAO();
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String action = request.getServletPath();
    try {
      switch (action) {
        case "/listphongban":
          listPhongBan(request, response);
          break;
        case "/findphongban":
          FindDepartment(request, response);
          break;
        case "/addphongban":
          AddPhongBan(request, response);
          break;
        case "/suaPhongBan":
          UpdatePhongBan(request, response);
          break;
        case "/deletephongban":
          DeletePhongBan(request, response);
          break;
        default:
          break;
      }
    } catch (SQLException | ParseException ex) {
      throw new ServletException(ex);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

  private void listPhongBan(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException {
    HttpSession session = request.getSession();
    TaiKhoan login = new TaiKhoan();
    login = (TaiKhoan) session.getAttribute("user");

    if (login == null) {
      response.sendRedirect("views/system/login.jsp");
    } else {
      String maChiNhanh = quanLyPhongBanDAO.LayMaChiNhanh(login.getMaTaiKhoan());
      String maPhongBan = quanLyPhongBanDAO.LayMaPhongBan(login.getMaTaiKhoan());

      List<ThongTinTruongPhong> listTruongPhong = quanLyPhongBanDAO.selectAllPhongBan(maChiNhanh,
          maPhongBan, login.getQuyen());
      listPhongBanInfo = quanLyPhongBanDAO.LoadInfoPhongBan();
      List < PhongBan > listDepartment = quanLyNhanVienDAO.selectAllDepart(maChiNhanh);
      List <ChiNhanh> listChiNhanh = quanLyNhanVienDAO.selectAllBranch();
      List <PhongBan> listPhongBan = quanLyNhanVienDAO.selectAllDepart();

      request.setAttribute("thongTinTruongPhong", listPhongBanInfo);

      if (login.getQuyen().equals("admin")) {
        request.setAttribute("listTruongPhong", listTruongPhong);
        request.setAttribute("listChiNhanh",listChiNhanh);
        request.setAttribute("listPhongBan",listPhongBan);
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/quanli/QuanLiPhongBan.jsp");
        dispatcher.forward(request, response);
      } else if (login.getQuyen().equals("giamdoc")) {
        request.setAttribute("listTruongPhong", listTruongPhong);
        request.setAttribute("tenPhongBan",listDepartment);
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/giamdoc/QuanLyPhongBan.jsp");
        dispatcher.forward(request, response);
      }
    }
  }

  private void AddPhongBan(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException, ParseException {
    HttpSession session = request.getSession();
    TaiKhoan login = new TaiKhoan();
    login = (TaiKhoan) session.getAttribute("user");

    if (login == null) {
      response.sendRedirect("views/system/login.jsp");
    } else {
      String maChiNhanh = request.getParameter("MaChiNhanh");
      String maPhongBan = request.getParameter("MaPhongBan");
      String tenPhongBan = request.getParameter("TenPhongBan");
      String ngayTao = request.getParameter("NgayTao");
      String sdt = request.getParameter("SDT");
      String maChucVu = request.getParameter("MaChucVu");
      String tenChucVu = request.getParameter("TenChucVu");
      String luongCoBan = request.getParameter("LuongCoBan");
      String maTruongPhong = request.getParameter("MaTruongPhong");
      String ngayBatDau = request.getParameter("NgayBatDau");

      tenPhongBan = ConvertToUTF8(tenPhongBan);
      tenChucVu = ConvertToUTF8(tenChucVu);
      int luong = Integer.parseInt(luongCoBan);

      if (quanLyPhongBanDAO.AddPhongBan(maChiNhanh, maPhongBan, tenPhongBan, ngayTao, sdt, maChucVu,
          tenChucVu, luong, maTruongPhong, ngayBatDau)) {
        request.setAttribute("Result", "Thêm Phòng Ban thành công");
      } else {
        request.setAttribute("Result", "Thêm Phòng Ban thất bại");
      }
      if (login.getQuyen().equals("admin")) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/quanli/QuanLiPhongBan.jsp");
        dispatcher.forward(request, response);
      } else if (login.getQuyen().equals("giamdoc")) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/giamdoc/QuanLyPhongBan.jsp");
        dispatcher.forward(request, response);
      }
    }
  }

  private void UpdatePhongBan(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException, ParseException {
    HttpSession session = request.getSession();
    TaiKhoan login = new TaiKhoan();
    login = (TaiKhoan) session.getAttribute("user");

    if (login == null) {
      response.sendRedirect("views/system/login.jsp");
    } else {
      String maChiNhanh = request.getParameter("SuaMaChiNhanh");
      String maPhongBan = request.getParameter("SuaMaPhongBan");
      String tenPhongBan = request.getParameter("SuaTenPhongBan");
      String ngayTao = request.getParameter("SuaNgayTao");
      String sdt = request.getParameter("SuaSDT");
      String maChucVu = request.getParameter("SuaMaChucVu");
      String luongCoBan = request.getParameter("SuaLuongCoBan");
      String maTruongPhong = request.getParameter("SuaMaTruongPhong");
      String ngayBatDau = request.getParameter("SuaNgayBatDau");

      tenPhongBan = ConvertToUTF8(tenPhongBan);
      int luong = Integer.parseInt(luongCoBan);

      if (quanLyPhongBanDAO.SuaPhongBan(maChiNhanh, maPhongBan, tenPhongBan, ngayTao, sdt, maChucVu,
          luong, maTruongPhong, ngayBatDau)) {
        request.setAttribute("Result", "Sửa Phòng Ban thành công");
      } else {
        request.setAttribute("Result", "Sửa Phòng Ban thất bại");
      }
      if (login.getQuyen().equals("admin")) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/quanli/QuanLiPhongBan.jsp");
        dispatcher.forward(request, response);
      } else if (login.getQuyen().equals("giamdoc")) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/giamdoc/QuanLyPhongBan.jsp");
        dispatcher.forward(request, response);
      }
    }
  }

  private void DeletePhongBan(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException, ParseException {
    HttpSession session = request.getSession();
    TaiKhoan login = new TaiKhoan();
    login = (TaiKhoan) session.getAttribute("user");

    if (login == null) {
      response.sendRedirect("views/system/login.jsp");
    } else {
      String maPhongBan = request.getParameter("DeleteMaPhongBan");

      if (quanLyPhongBanDAO.XoaPhongBan(maPhongBan)) {
        request.setAttribute("Result", "Xóa Phòng Ban thành công");
      } else {
        request.setAttribute("Result", "Xóa Phòng Ban thất bại");
      }
      if (login.getQuyen().equals("admin")) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/quanli/QuanLiPhongBan.jsp");
        dispatcher.forward(request, response);
      } else if (login.getQuyen().equals("giamdoc")) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(
            "views/giamdoc/QuanLyPhongBan.jsp");
        dispatcher.forward(request, response);
      }
    }
  }

  private void FindDepartment(HttpServletRequest request, HttpServletResponse response)
      throws SQLException, IOException, ServletException, ParseException {
    HttpSession session = request.getSession();
    TaiKhoan login = new TaiKhoan();
    login = (TaiKhoan) session.getAttribute("user");

    if (login == null) {
      response.sendRedirect("views/system/login.jsp");
    } else {
      String maChiNhanh = quanLyPhongBanDAO.LayMaChiNhanh(login.getMaTaiKhoan());

      String tenPB = request.getParameter("tenPB");
      String tenCN = request.getParameter("tenCN");

      tenPB = ConvertToUTF8(tenPB);

      if(tenPB.equals("Chọn phòng ban"))
        tenPB="%";

      if(tenCN != null)
      {
        tenCN = ConvertToUTF8(tenCN);
        if(tenCN.equals("Chọn chi nhánh"))
          tenCN="%";
      }
      else {
        tenCN = quanLyPhongBanDAO.LayTenChiNhanh(maChiNhanh);
      }

      List<ThongTinTruongPhong> listTruongPhong = quanLyPhongBanDAO.findDepartment(tenCN, tenPB);
      listPhongBanInfo = quanLyPhongBanDAO.LoadInfoPhongBan();
      List < PhongBan > listDepartment = quanLyNhanVienDAO.selectAllDepart(maChiNhanh);
      List <ChiNhanh> listChiNhanh = quanLyNhanVienDAO.selectAllBranch();
      List <PhongBan> listPhongBan = quanLyNhanVienDAO.selectAllDepart();

      request.setAttribute("thongTinTruongPhong", listPhongBanInfo);

      if (login.getQuyen().equals("admin")) {
        request.setAttribute("listTruongPhong", listTruongPhong);
        request.setAttribute("listChiNhanh",listChiNhanh);
        request.setAttribute("listPhongBan",listPhongBan);
        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "views/quanli/QuanLiPhongBan.jsp");
        dispatcher.forward(request, response);
      } else if (login.getQuyen().equals("giamdoc")) {
        request.setAttribute("listTruongPhong", listTruongPhong);
        request.setAttribute("tenPhongBan",listDepartment);
        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "views/giamdoc/QuanLyPhongBan.jsp");
        dispatcher.forward(request, response);
      }
    }
  }

  private String ConvertToUTF8(String item) {
    String result;
    byte[] bytes = item.getBytes(StandardCharsets.ISO_8859_1);
    result = new String(bytes, StandardCharsets.UTF_8);

    return result;
  }

}
