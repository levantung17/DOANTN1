package Controller;

import DAO.CauTrucCongTyDAO;
import JDBCUtils.HandleException;
import Models.CayChiNhanh;
import Models.TaiKhoan;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CauTrucCongTyController", urlPatterns = {"/xemcautruc"})
public class CauTrucCongTyController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CauTrucCongTyDAO cauTrucCongTyDAO = null;

    public void init() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
            LoadStructure(request,response);
        }
        catch (SQLException ex){
            HandleException.printSQLException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    private void LoadStructure(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException
    {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
        {
            response.sendRedirect("views/system/login.jsp");
        }
        else {
            cauTrucCongTyDAO = new CauTrucCongTyDAO();
            List <CayChiNhanh> structure = cauTrucCongTyDAO.LoadStructure();

            request.setAttribute("CauTrucCongTy",structure);

            if(login.getQuyen().equals("admin"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiCauTruc.jsp");
                dispatcher.forward(request,response);
            }
            else if(login.getQuyen().equals("giamdoc"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/XemCauTruc.jsp");
                dispatcher.forward(request,response);
            }
            else if(login.getQuyen().equals("truongphong"))
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/XemCauTruc.jsp");
                dispatcher.forward(request,response);
            }
            else
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/nhanvien/NhanVienCauTruc.jsp");
                dispatcher.forward(request,response);
            }
        }
    }
}
