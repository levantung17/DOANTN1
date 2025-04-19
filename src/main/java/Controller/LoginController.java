package Controller;

import DAO.LoginDAO;
import Models.TaiKhoan;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginController", urlPatterns = {"/login", "/EmailSendingServlet", "/logout"})
public class LoginController extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO = null;

    public void init() {
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
                Logout(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra nếu username và password không rỗng
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errMsg", "Tên đăng nhập hoặc mật khẩu không được để trống");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        TaiKhoan taikhoan = new TaiKhoan();
        taikhoan.setTenDangNhap(username);
        taikhoan.setMatKhau(password);

        try {
            TaiKhoan user = loginDAO.validate(taikhoan);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Điều hướng người dùng theo quyền
                if ("admin".equals(user.getQuyen())) {
                    response.sendRedirect("views/quanli/QuanLiCauTruc.jsp");
                } else if ("giamdoc".equals(user.getQuyen())) {
                    response.sendRedirect("views/giamdoc/XemCauTruc.jsp");
                } else if ("truongphong".equals(user.getQuyen())) {
                    response.sendRedirect("views/truongphong/XemCauTruc.jsp");
                } else if ("nhanvien".equals(user.getQuyen())) {
                    response.sendRedirect("views/nhanvien/NhanVienCauTruc.jsp");
                }
            } else {
                request.setAttribute("errMsg", "Tài khoản không tồn tại");
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errMsg", "Lỗi hệ thống, vui lòng thử lại");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void EmailSendingServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException {
        String email = request.getParameter("email");
        String tendangnhap = request.getParameter("tenDangNhap");

        // Kiểm tra xem email và tên đăng nhập có rỗng không
        if (email == null || tendangnhap == null || email.isEmpty() || tendangnhap.isEmpty()) {
            request.setAttribute("errMsg", "Email hoặc tên đăng nhập không hợp lệ");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/forgotPass.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            String mk = LoginDAO.LayMatKhau(tendangnhap, email);
            if (!mk.isEmpty()) {
                LoginDAO.sendEmail(host, port, user, pass, email, tendangnhap);
                response.sendRedirect("views/system/login.jsp");
            } else {
                request.setAttribute("errMsg", "Tài khoản hoặc email không chính xác");
                RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/forgotPass.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errMsg", "Lỗi hệ thống, vui lòng thử lại");
            RequestDispatcher dispatcher = request.getRequestDispatcher("views/system/forgotPass.jsp");
            dispatcher.forward(request, response);
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
