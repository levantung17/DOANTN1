<%@ page import="Models.TaiKhoan" %><%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/21/2023
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <link href="${pageContext.request.contextPath}/img/logo1.png" rel="icon" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
    <script>
        $("#commonForm").validate();
    </script>

    <title>Đăng nhập</title>
</head>
<body>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<%
    String err = (String) request.getAttribute("errMsg");
    TaiKhoan account = (TaiKhoan) session.getAttribute("user");
%>
<div class="container">
    <div class="row m-6 mt-3 bg-white no-gutters shadow-lg">
        <h2 class="text-center mt-3 p-1">Hệ Thống Quản Lí Nhân Sự Công Ty</h2>

        <div class="col-md-6 d-none d-md-block">
            <img src="${pageContext.request.contextPath}/img/7.jpg" class="img-fluid main-logo" />
        </div>
        <div
                class="col-md-5 bg-white m-5 p-5 border border-4 border-gray rounded"
        >
            <img src="${pageContext.request.contextPath}/img/logo1.png" alt="logo" class="card-img-top logo-img" />
            <h3 class="pb-3 mt-2 text-center">Đăng nhập</h3>
            <div class="form-style">
                <form id="commonForm" action="<%=request.getContextPath()%>/login" method="post">
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
                                id="username"
                                name="username"
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
                            d="M15.75 5.25a3 3 0 013 3m3 0a6 6 0 01-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1121.75 8.25z"
                    />
                  </svg>
                </span>
                        <input
                                type="password"
                                placeholder="Mật khẩu"
                                class="form-control w-75"
                                id="password"
                                name="password"
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
                            Đăng nhập
                        </button>
                    </div>
                    <div class="d-flex justify-content-center">
                        <p class="p-1">Quên mật khẩu?</p>
                        <a class="p-1" href="<%=request.getContextPath()%>/views/system/forgotPass.jsp">Đặt lại mật khẩu</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>

