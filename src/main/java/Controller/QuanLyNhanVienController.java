package Controller;

import DAO.QuanLyNhanVienDAO;
import JDBCUtils.HandleException;
import Models.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet(name = "QuanLyNhanVienController", urlPatterns = {"/listemployee", "/findemployee", "/addemployee", "/deleteemployee", "/updateemployee", "/addreward", "/discipline","/addexcel"})
public class QuanLyNhanVienController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuanLyNhanVienDAO quanLyNhanVienDAO = null;
    private List <ThongTinNguoiDung> listInfo;
    public void init() {
        quanLyNhanVienDAO = new QuanLyNhanVienDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try{
            switch (action)
            {
                case "/listemployee":
                    ListEmployee(request,response);
                    break;
                case "/findemployee":
                    FindInfo(request,response);
                    break;
                case "/addemployee":
                    AddEmployee(request,response);
                    break;
                case "/deleteemployee":
                    DeleteEmployee(request,response);
                    break;
                case "/updateemployee":
                    UpdateEmployee(request,response);
                    break;
                case "/addreward":
                    AddReward(request,response);
                    break;
                case "/discipline":
                    AddDiscipline(request,response);
                    break;
                case "/addexcel":
                    AddExcel(request,response);
                    break;
            }
        }
        catch (SQLException ex){
            HandleException.printSQLException(ex);

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    private void ListEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            String maChiNhanh = quanLyNhanVienDAO.LayMaChiNhanh(login.getMaTaiKhoan());
            String maPhongBan = quanLyNhanVienDAO.LayMaPhongBan(login.getMaTaiKhoan());

            List < ThongTinCongTac> listEmployee = quanLyNhanVienDAO.selectAllUsers(maChiNhanh,maPhongBan,login.getQuyen());
            listInfo = quanLyNhanVienDAO.loadInfomation();
            request.setAttribute("thongTinNhanVien",listInfo);

            if(login.getQuyen().equals("giamdoc"))
            {
                String tenChiNhanh = quanLyNhanVienDAO.LayTenChiNhanh(maChiNhanh);
                List < PhongBan > listDepartment = quanLyNhanVienDAO.selectAllDepart(maChiNhanh);
                List < ChucVu > listTitle = quanLyNhanVienDAO.selectAllTitle(maChiNhanh);

                request.setAttribute("listEmployee",listEmployee);
                request.setAttribute("tenChiNhanh",tenChiNhanh);
                request.setAttribute("tenPhongBan",listDepartment);
                request.setAttribute("tenChucVu",listTitle);

                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                String tenChiNhanh = quanLyNhanVienDAO.LayTenChiNhanh(maChiNhanh);
                String tenPhongBan = quanLyNhanVienDAO.LayTenPhongBan(maPhongBan);
                List < ChucVu > listTitle = quanLyNhanVienDAO.selectAllTitleOfDepart(maChiNhanh,maPhongBan);

                request.setAttribute("listEmployee",listEmployee);
                request.setAttribute("tenChiNhanh",tenChiNhanh);
                request.setAttribute("tenPhongBan",tenPhongBan);
                request.setAttribute("tenChucVu",listTitle);

                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                List <ChiNhanh> listChiNhanh = quanLyNhanVienDAO.selectAllBranch();
                List <PhongBan> listPhongBan = quanLyNhanVienDAO.selectAllDepart();
                List <ChucVu> listChucVu = quanLyNhanVienDAO.selectAllTitle();

                request.setAttribute("listEmployee",listEmployee);
                request.setAttribute("listChiNhanh",listChiNhanh);
                request.setAttribute("listPhongBan",listPhongBan);
                request.setAttribute("listChucVu",listChucVu);

                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void FindInfo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            String tenCN = request.getParameter("tenCN");
            String tenPB = request.getParameter("tenPB");
            String tenCV = request.getParameter("tenCV");

            tenCN = ConvertToUTF8(tenCN);
            tenPB = ConvertToUTF8(tenPB);
            tenCV = ConvertToUTF8(tenCV);

            String maChiNhanh = quanLyNhanVienDAO.LayMaChiNhanh(login.getMaTaiKhoan());
            String maPhongBan = quanLyNhanVienDAO.LayMaPhongBan(login.getMaTaiKhoan());

            if(tenCN.equals("Chọn chi nhánh"))
                tenCN = "%";
            if(tenPB.equals("Chọn phòng ban"))
                tenPB = "%";
            if(tenCV.equals("Chọn chức vụ"))
                tenCV = "%";

            if(login.getQuyen().equals("giamdoc"))
            {
                List < ThongTinCongTac> listEmployee = quanLyNhanVienDAO.findAllEmployee(tenCN, tenPB, tenCV);
                String tenChiNhanh = quanLyNhanVienDAO.LayTenChiNhanh(maChiNhanh);
                List < PhongBan > listDepartment = quanLyNhanVienDAO.selectAllDepart(maChiNhanh);
                List < ChucVu > listTitle = quanLyNhanVienDAO.selectAllTitle(maChiNhanh);

                request.setAttribute("listEmployee",listEmployee);
                request.setAttribute("tenChiNhanh",tenChiNhanh);
                request.setAttribute("tenPhongBan",listDepartment);
                request.setAttribute("tenChucVu",listTitle);
                request.setAttribute("thongTinNhanVien",listInfo);

                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            }
            else if (login.getQuyen().equals("truongphong"))
            {
                List < ThongTinCongTac> listEmployee = quanLyNhanVienDAO.findAllEmployee(tenCN, tenPB, tenCV);
                String tenChiNhanh = quanLyNhanVienDAO.LayTenChiNhanh(maChiNhanh);
                String tenPhongBan = quanLyNhanVienDAO.LayTenPhongBan(maPhongBan);
                List < ChucVu > listTitle = quanLyNhanVienDAO.selectAllTitleOfDepart(maChiNhanh,maPhongBan);

                request.setAttribute("listEmployee",listEmployee);
                request.setAttribute("tenChiNhanh",tenChiNhanh);
                request.setAttribute("tenPhongBan",tenPhongBan);
                request.setAttribute("tenChucVu",listTitle);
                request.setAttribute("thongTinNhanVien",listInfo);

                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            }
            else if (login.getQuyen().equals("admin"))
            {
                List < ThongTinCongTac> listEmployee = quanLyNhanVienDAO.findAllEmployee(tenCN, tenPB, tenCV);
                List <ChiNhanh> listChiNhanh = quanLyNhanVienDAO.selectAllBranch();
                List <PhongBan> listPhongBan = quanLyNhanVienDAO.selectAllDepart();
                List <ChucVu> listChucVu = quanLyNhanVienDAO.selectAllTitle();

                request.setAttribute("listEmployee",listEmployee);
                request.setAttribute("listChiNhanh",listChiNhanh);
                request.setAttribute("listPhongBan",listPhongBan);
                request.setAttribute("listChucVu",listChucVu);
                request.setAttribute("thongTinNhanVien",listInfo);

                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void AddEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {

        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            ThongTinNguoiDung newEmployee;

            String manv = request.getParameter("MaNhanVien");
            String hoten = request.getParameter("HoVaTen");
            String ngaysinh = request.getParameter("NgaySinh");
            String gioitinh = request.getParameter("GioiTinh");
            String cccd = request.getParameter("CCCD");
            String ngaycap = request.getParameter("NgayCap");
            String noicap = request.getParameter("NoiCap");
            String sonha = request.getParameter("SoNha");
            String xa = request.getParameter("Xa");
            String huyen = request.getParameter("Huyen");
            String tinh = request.getParameter("Tinh");
            String email = request.getParameter("Email");
            String sdt = request.getParameter("SDT");
            String heso = request.getParameter("HeSo");
            String ngaylam = request.getParameter("NgayVaoLam");
            String trinhdo = request.getParameter("TrinhDo");
            String trangthai = request.getParameter("TrangThai");

            hoten = ConvertToUTF8(hoten);
            gioitinh = ConvertToUTF8(gioitinh);
            noicap = ConvertToUTF8(noicap);
            sonha = ConvertToUTF8(sonha);
            xa = ConvertToUTF8(xa);
            huyen = ConvertToUTF8(huyen);
            tinh = ConvertToUTF8(tinh);
            trinhdo = ConvertToUTF8(trinhdo);
            trangthai = ConvertToUTF8(trangthai);

            float hesoluong = Float.parseFloat(heso);

            newEmployee = new ThongTinNguoiDung(manv,hoten,gioitinh,cccd,ngaycap,noicap,ngaysinh,sdt,email,sonha,xa,huyen,tinh,hesoluong,trangthai,trinhdo,ngaylam);

            if(quanLyNhanVienDAO.AddEmployee(newEmployee))
                request.setAttribute("Result","Thêm nhân viên thành công");
            else
                request.setAttribute("Result","Thêm nhân viên thất bại");

            if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void DeleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            String manv = request.getParameter("MaNhanVien");

            if(quanLyNhanVienDAO.DeleteEmployee(manv))
                request.setAttribute("Result","Xóa nhân viên thành công");
            else
                request.setAttribute("Result","Xóa nhân viên thất bại");

            if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void UpdateEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            ThongTinNguoiDung newEmployee;

            String manv = request.getParameter("MaNhanVien");
            String hoten = request.getParameter("HoVaTen");
            String ngaysinh = request.getParameter("NgaySinh");
            String gioitinh = request.getParameter("GioiTinh");
            String cccd = request.getParameter("CCCD");
            String ngaycap = request.getParameter("NgayCap");
            String noicap = request.getParameter("NoiCap");
            String sonha = request.getParameter("SoNha");
            String xa = request.getParameter("Xa");
            String huyen = request.getParameter("Huyen");
            String tinh = request.getParameter("Tinh");
            String email = request.getParameter("Email");
            String sdt = request.getParameter("SDT");
            String heso = request.getParameter("HeSo");
            String ngaylam = request.getParameter("NgayVaoLam");
            String trinhdo = request.getParameter("TrinhDo");
            String trangthai = request.getParameter("TrangThai");

            hoten = ConvertToUTF8(hoten);
            gioitinh = ConvertToUTF8(gioitinh);
            noicap = ConvertToUTF8(noicap);
            sonha = ConvertToUTF8(sonha);
            xa = ConvertToUTF8(xa);
            huyen = ConvertToUTF8(huyen);
            tinh = ConvertToUTF8(tinh);
            trinhdo = ConvertToUTF8(trinhdo);
            trangthai = ConvertToUTF8(trangthai);

            float hesoluong = Float.parseFloat(heso);

            newEmployee = new ThongTinNguoiDung(manv,hoten,gioitinh,cccd,ngaycap,noicap,ngaysinh,sdt,email,sonha,xa,huyen,tinh,hesoluong,trangthai,trinhdo,ngaylam);

            if(quanLyNhanVienDAO.UpdateEmployee(newEmployee))
                request.setAttribute("Result","Thay đổi thông tin nhân viên thành công");
            else
                request.setAttribute("Result","Thay đổi thông tin nhân viên thất bại");

            if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void AddReward(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");
        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            QuyetDinh quyetDinh;

            String maQD = request.getParameter("MaQuyetDinh");
            String loai = "Khen thưởng";
            String ngay = request.getParameter("Ngay");
            String noiDung = request.getParameter("NoiDung");
            String manv = request.getParameter("MaNhanVien");
            String manguoiky = request.getParameter("MaNguoiKy");

            noiDung = ConvertToUTF8(noiDung);

            quyetDinh = new QuyetDinh(maQD,loai,ngay,noiDung,manv,manguoiky);
            if(quanLyNhanVienDAO.AddReward(quyetDinh))
                request.setAttribute("Result","Thêm văn bản khen thưởng thành công");
            else
                request.setAttribute("Result","Thêm văn bản khen thưởng thất bại");

            if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void AddDiscipline(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            QuyetDinh quyetDinh;

            String maQD = request.getParameter("MaQuyetDinh");
            String loai = "Kỷ luật";
            String ngay = request.getParameter("Ngay");
            String noiDung = request.getParameter("NoiDung");
            String manv = request.getParameter("MaNhanVien");
            String manguoiky = request.getParameter("MaNguoiKy");

            noiDung = ConvertToUTF8(noiDung);

            quyetDinh = new QuyetDinh(maQD,loai,ngay,noiDung,manv,manguoiky);
            if(quanLyNhanVienDAO.AddReward(quyetDinh))
                request.setAttribute("Result","Thêm văn bản kỷ luật thành công");
            else
                request.setAttribute("Result","Thêm văn bản kỷ luật thất bại");

            if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private void AddExcel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            Boolean result = null;
            int errorLine = 0;

            String json = request.getParameter("jsondata");
            String newJson = ConvertToUTF8(json);
            newJson = newJson.replaceAll("/","-");
            Type listType = new TypeToken<List<ThongTinNguoiDung>>(){}.getType();
            Gson gson = new Gson();
            List<ThongTinNguoiDung> list = gson.fromJson(newJson,listType);

            for (int i = 0; i < list.size(); i++)
            {
                result = (quanLyNhanVienDAO.AddEmployee(list.get(i)));
                if(!result)
                {
                    errorLine = i+1;
                    break;
                }
            }

            if(result == true)
            {
                request.setAttribute("Result","Thêm danh sách nhân viên thành công");
            }
            else
            {
                request.setAttribute("Result","Thêm danh sách nhân viên gặp lỗi từ dòng " + errorLine);
            }

            if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("truongphong")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/QuanLyNhanVien.jsp");
                dispatcher.forward(request,response);
            } else if (login.getQuyen().equals("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiNhanVien.jsp");
                dispatcher.forward(request,response);
            }
        }
    }

    private String ConvertToUTF8(String item)
    {
        String result;
        byte[] bytes = item.getBytes(StandardCharsets.ISO_8859_1);
        result = new String(bytes, StandardCharsets.UTF_8);

        return result;
    }
}
