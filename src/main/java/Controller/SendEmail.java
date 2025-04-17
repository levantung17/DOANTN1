package Controller;

import DAO.EmailDAO;
import Models.TaiKhoan;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "SendEmail", urlPatterns = {"/sendemail"})
public class SendEmail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        TaiKhoan login = new TaiKhoan();
        login=(TaiKhoan)session.getAttribute("user");

        if(login == null)
            response.sendRedirect("views/system/login.jsp");
        else{
            String recipient = request.getParameter("received-email");
            String subject = request.getParameter("title-email");
            String content = request.getParameter("content-email");

            recipient = ConvertToUTF8(recipient);
            subject = ConvertToUTF8(subject);
            content = ConvertToUTF8(content);

            String resultMessage = "";

            try {
                EmailDAO.sendEmail(host, port, user, pass, recipient, subject,
                        content);
                resultMessage = "Gửi email thành công";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "Đã có lỗi xảy ra: " + ex.getMessage();
            } finally {
                request.setAttribute("Result", resultMessage);

                if(login.getQuyen().equals("admin"))
                {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("views/quanli/QuanLiGuiMail.jsp");
                    dispatcher.forward(request, response);
                }
                else if(login.getQuyen().equals("giamdoc"))
                {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("views/giamdoc/GuiEmail.jsp");
                    dispatcher.forward(request, response);
                }
                else if(login.getQuyen().equals("truongphong"))
                {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("views/truongphong/GuiEmail.jsp");
                    dispatcher.forward(request, response);
                }
                else if(login.getQuyen().equals("nhanvien"))
                {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("views/nhanvien/NhanVienGuiMail.jsp");
                    dispatcher.forward(request, response);
                }
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
