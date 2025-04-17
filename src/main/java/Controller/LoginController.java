package Controller;

import DAO.LoginDAO;
import Models.TaiKhoan;
import java.io.IOException;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(name = "LoginController", urlPatterns = {"/login","/EmailSendingServlet","/logout"})
public class LoginController extends HttpServlet
{
    private String host;
    private String port;
    private String user;
    private String pass;
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO=null;

    public void init()
    {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
        loginDAO = new LoginDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        switch (action) {
            case "/EmailSendingServlet":

                try {
                    EmailSendingServlet(request, response);
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }

                break;
            case "/login":
                authenticate(request, response);
                break;
            case "/logout":
                Logout(request,response);
                break;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doGet(request,response);
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        TaiKhoan taikhoan = new TaiKhoan();
        taikhoan.setTenDangNhap(username);
        taikhoan.setMatKhau(password);

        try {
            TaiKhoan user = loginDAO.validate(taikhoan);
            if(user != null)
            {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if (user.getQuyen().equals("admin")) {
                    response.sendRedirect("views/quanli/QuanLiCauTruc.jsp");
                } else if (user.getQuyen().equals("giamdoc")) {
                    response.sendRedirect("views/giamdoc/XemCauTruc.jsp");
                } else if (user.getQuyen().equals("truongphong")) {
                    response.sendRedirect("views/truongphong/XemCauTruc.jsp");
                } else if (user.getQuyen().equals("nhanvien")) {
                    response.sendRedirect("views/nhanvien/NhanVienCauTruc.jsp");
                }
            }
            else {
                request.setAttribute("errMsg", "Tài khoản không tồn tại");
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void EmailSendingServlet(HttpServletRequest request,
                                     HttpServletResponse response) throws ServletException, IOException, MessagingException {
        // reads form fields
        String email = request.getParameter("email");
        String tendangnhap = request.getParameter("tenDangNhap");
        try
        {
            String mk=LoginDAO.LayMatKhau(tendangnhap,email);
            if(mk != "") {
                LoginDAO.sendEmail(host, port, user, pass, email, tendangnhap);
                response.sendRedirect("views/system/login.jsp");
            }
            else{
                request.setAttribute("errMsg", "Tài khoản hoặc email không chính xác");
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/forgotPass.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void Logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.invalidate();
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/login.jsp");
        dispatcher.forward(request, response);
    }
}


