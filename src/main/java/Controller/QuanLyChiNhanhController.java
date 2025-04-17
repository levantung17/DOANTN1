package Controller;

import DAO.QuanLyChiNhanhDAO;
import DAO.QuanLyNhanVienDAO;
import JDBCUtils.HandleException;
import Models.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;


@WebServlet(name = "QuanLyChiNhanhController", urlPatterns = {"/listChiNhanh", "/addchinhanh", "/updatechinhanh","/deletechinhanh","/findchinhanh"})
public class QuanLyChiNhanhController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private QuanLyChiNhanhDAO quanLyChiNhanhDAO = null;
    private List <ThongTinNguoiDung> listInfo;
    private List <ChiNhanh> listInfoChiNhanh;
    public void init() {
        quanLyChiNhanhDAO = new QuanLyChiNhanhDAO();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try{
            switch (action)
            {
                case "/listChiNhanh":
                    ListChiNhanh(request,response);
                    break;
                case "/addchinhanh":
                    AddChinhanh(request,response);
                    break;
                case "/updatechinhanh":
                    UpdateChinhanh(request,response);
                    break;
                case "/deletechinhanh":
                    Deletechinhanh(request,response);
                    break;
                case "/findchinhanh":
                    FindInfo(request,response);
                    break;
            }
        }
        catch (SQLException ex){
            HandleException.printSQLException(ex);

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
    private String ConvertToUTF8(String item)
    {
        String result;
        byte[] bytes = item.getBytes(StandardCharsets.ISO_8859_1);
        result = new String(bytes, StandardCharsets.UTF_8);

        return result;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
    private void Deletechinhanh(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            String maChiNhanh = request.getParameter("xoamaChiNhanh");

            if(quanLyChiNhanhDAO.Deletechinhanh(maChiNhanh))
                request.setAttribute("Result","Xóa chi nhánh thành công");
            else
                request.setAttribute("Result","Xóa chi nhánh thất bại");

            RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiChiNhanh.jsp");
            dispatcher.forward(request,response);
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

            tenCN = ConvertToUTF8(tenCN);


            if(tenCN.equals("Chọn tên chi nhánh"))
                tenCN="%";

            List < ChiNhanh > listtenChiNhanh = quanLyChiNhanhDAO.selecttenChiNhanh();
            List < ChiNhanh> listAllChiNhanh = quanLyChiNhanhDAO.findAllChiNhanh(tenCN);
            listInfo = quanLyChiNhanhDAO.loadInfomation();

            request.setAttribute("listtenChiNhanh",listtenChiNhanh);
            request.setAttribute("listChiNhanh",listAllChiNhanh);
            request.setAttribute("ThongTinNguoiDung",listInfo);
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiChiNhanh.jsp");
            dispatcher.forward(request,response);
        }
    }

    private void ListChiNhanh(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            List < ChiNhanh> listChiNhanh = quanLyChiNhanhDAO.selectAllChiNhanh();
            List < ChiNhanh> listtenChiNhanh = quanLyChiNhanhDAO.selecttenChiNhanh();
            listInfo = quanLyChiNhanhDAO.loadInfomation();
            listInfoChiNhanh=quanLyChiNhanhDAO.loadInfomationchinhanh();

            request.setAttribute("listChiNhanh",listChiNhanh);
            request.setAttribute("listtenChiNhanh",listtenChiNhanh);

            request.setAttribute("ThongTinNguoiDung",listInfo);
            request.setAttribute("ChiNhanh",listInfoChiNhanh);

            RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiChiNhanh.jsp");
            dispatcher.forward(request,response);
        }
    }

    private void AddChinhanh(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            ChiNhanh newChinhanh;

            String maChiNhanh = request.getParameter("maChiNhanh");
            String tenChiNhanh = request.getParameter("tenChiNhanh");
            String soNha = request.getParameter("soNha");
            String xa = request.getParameter("xa");
            String huyen = request.getParameter("huyen");
            String tinh = request.getParameter("tinh");
            String ngayTaoChiNhanh = request.getParameter("ngayTaoChiNhanh");
            String sdt = request.getParameter("sdt");
            String maGiamDoc = request.getParameter("maGiamDoc");


            tenChiNhanh = ConvertToUTF8(tenChiNhanh);
            soNha = ConvertToUTF8(soNha);
            xa = ConvertToUTF8(xa);
            huyen = ConvertToUTF8(huyen);
            tinh = ConvertToUTF8(tinh);
            sdt = ConvertToUTF8(sdt);
            maGiamDoc = ConvertToUTF8(maGiamDoc);
            newChinhanh = new ChiNhanh(maChiNhanh,tenChiNhanh,soNha,xa,huyen,tinh,ngayTaoChiNhanh,sdt,maGiamDoc);

            if(quanLyChiNhanhDAO.Addchinhanh(newChinhanh))
                request.setAttribute("Result","Thêm chi nhánh thành công");
            else
                request.setAttribute("Result","Thêm chi nhánh thất bại");

            RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiChiNhanh.jsp");
            dispatcher.forward(request,response);
        }
    }

    private void UpdateChinhanh(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else
        {
            ChiNhanh newChinhanh;

            String maChiNhanh = request.getParameter("maChiNhanh");
            String tenChiNhanh = request.getParameter("tenChiNhanh");
            String soNha = request.getParameter("soNha");
            String xa = request.getParameter("xa");
            String huyen = request.getParameter("huyen");
            String tinh = request.getParameter("tinh");
            String ngayTaoChiNhanh = request.getParameter("ngayTaoChiNhanh");
            String sdt = request.getParameter("sdt");
            String maGiamDoc = request.getParameter("maGiamDoc");

            tenChiNhanh = ConvertToUTF8(tenChiNhanh);
            soNha = ConvertToUTF8(soNha);
            xa = ConvertToUTF8(xa);
            huyen = ConvertToUTF8(huyen);
            tinh = ConvertToUTF8(tinh);
            sdt = ConvertToUTF8(sdt);

            newChinhanh = new ChiNhanh(maChiNhanh,tenChiNhanh,soNha,xa,huyen,tinh,ngayTaoChiNhanh,sdt,maGiamDoc);

            if(quanLyChiNhanhDAO.UpdateChinhanh(newChinhanh))
                request.setAttribute("Result","Thay đổi thông tin chi nhánh thành công");
            else
                request.setAttribute("Result","Thay đổi thông tin chi nhánh thất bại");

            RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiChiNhanh.jsp");
            dispatcher.forward(request,response);
        }
    }


}
