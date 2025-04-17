
<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/21/2023
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=Inter:wght@400;500;700&display=swap"
            rel="stylesheet"
    />

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgotPass.css" />
    <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
    <script>
        $("#commonForm").validate();
    </script>

    <title>Quên mật khẩu</title>
</head>
<body>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<%
    String err = (String) request.getAttribute("errMsg");
    String mk = (String) session.getAttribute("mk");
%>
<div class="container">
    <div class="row m-6 mt-3 bg-white no-gutters shadow-lg">
        <h2 class="text-center mt-3 p-1">Hệ Thống Quản Lí Nhân Sự Công Ty</h2>

        <div class="col-md-6 d-none d-md-block">
            <img src="${pageContext.request.contextPath}/img/4565.jpg" class="img-fluid main-logo" />
        </div>
        <div
                class="col-md-5 bg-white m-5 p-5 border border-4 border-gray rounded"
        >
            <p>
            <span class="sympol">&larr;</span
            ><a href="login.jsp"> Quay lại</a>
            </p>
            <h3 class="pb-3 mt-2 text-center">Quên mật khẩu</h3>
            <div class="form-style">
                <form action="<%=request.getContextPath()%>/EmailSendingServlet",id="commonForm" method="post">
                    <div
                            class="form-group pb-3 d-flex align-items-center justify-content-around"
                    >
                <span>
                  <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke-width="1.5"
                          stroke="currentColor"
                          class="icon-sgv"
                  >
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"
                    />
                  </svg>
                </span>
                        <input
                                type="username"
                                placeholder="Tên đăng nhập"
                                class="form-control w-75"
                                id="tenDangNhap"
                                name="tenDangNhap"
                                aria-describedby="username"
                                required
                        />
                    </div>
                    <div
                            class="form-group pb-3 d-flex align-items-center justify-content-around"
                    >
                <span>
                  <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke-width="1.5"
                          stroke="currentColor"
                          class="icon-sgv"
                  >
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75"
                    />
                  </svg>
                </span>
                        <input
                                type="email"
                                placeholder="Email"
                                class="form-control w-75"
                                id="email"
                                name="email"
                                required
                        />
                    </div>
                    <% if (err!=null) {%>
                    <p style="color: red; text-align: center"><b><%= err %></b></p>
                    <%} %>
                    <div class="pb-2 mb-4 text-center">
                        <button
                                type="submit"
                                class="btn w-25 font-weight-bold mt-2 btn-DangNhap"
                        >
                            Xác nhận
                        </button>
                    </div>
                    <div class="d-flex justify-content-center">
                        <p><strong>Chú ý:</strong> Hệ thống sẽ gửi mật khẩu mới qua email</p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

