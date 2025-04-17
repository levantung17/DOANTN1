<%@ page import="Models.ThongTinNguoiDung" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/25/2023
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=Inter:wght@400;500;700&display=swap"
            rel="stylesheet"/>
    <!-- Link boostrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous"/>
    <!-- Link boostrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <!-- Link fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quanli.css"/>
    <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon"/>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <title>Quản lí - Cập nhật thông tin </title>
</head>
<body>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<script>
  window.onload = function () {
    let msg = "<%= request.getAttribute("message")%>";
    if (msg != "null")
      alert(msg);
  }
</script>
<div id="wrapper">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand mb-5">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"
                 class="card-img-top logo-img"/>
        </div>
        <ul class="sidebar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/xemcautruc"><i class="fa fa-building-o"></i>Cấu
                    trúc công ty</a>
            </li>
            <li class="active">
                <a class="mt-3"
                   href="<%=request.getContextPath()%>/infoEmployee"><i
                        class="fa fa-drivers-license"></i>Cập nhật thông tin</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiGuiMail.jsp"><i
                        class="fa fa-commenting-o"></i>Gửi mail</a>
            </li>
            <li>
                <a class="mt-3"
                   href="<%=request.getContextPath()%>/listChiNhanh"><i
                        class="fa fa-location-arrow"></i>Quản lý chi
                    nhánh</a>
            </li>

            <li>
                <a class="mt-3"
                   href="<%=request.getContextPath()%>/listphongban"><i
                        class="fa fa-sitemap"></i>Quản lý phòng
                    ban</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listemployee"><i
                        class="fa fa-users"></i>Quản lý nhân viên</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listSalary"><i
                        class="fa fa-bar-chart"></i>Thống kê tiền lương</a>
            </li>
        </ul>
    </aside>

    <div id="navbar-wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header d-flex justify-content-between align-items-center">
                    <div>
                        <a href="#" class="navbar-brand" id="sidebar-toggle"><i
                                class="fa fa-bars"></i></a>
                    </div>
                    <div ng-app="myApp" ng-controller="myCtrl">
                        <p>
                            Current Time:
                            <b>{{TimeNow}}</b>
                        </p>
                    </div>
                    <div class="navbar-text">
                        <h3>Xin chào Quản trị viên</h3>
                        <a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out icon-size"></i></a>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <section id="content-wrapper">
        <div class="row p-3">
            <div class="col-lg-12">
                <p class="page-header text-center">Cập nhật thông tin</p>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="panel panel-default">
                    <div class="panel-heading">Về cá nhân</div>
                    <form action="<%=request.getContextPath()%>/updateInfoEmployee" method="post"
                          style="min-height: 300px">
                        <c:forEach var="thongtin" items="${thongtincanhan}">
                            <div class="panel-body">
                                <div class="form-group mb-2">
                                    <label>Họ và tên:</label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Họ và tên"
                                            name="HoTen"
                                            id="HoTen"
                                            value="${thongtin.hoTen}"
                                            required
                                    />
                                </div>
                                <div class="form-group mb-2">
                                    <label>Giới tính:</label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Giới tính"
                                            name="GioiTinh"
                                            id="GioiTinh"
                                            value="${thongtin.gioitinh}"
                                            required
                                    />
                                </div>
                                <div class="form-group mb-2">
                                    <label>CCCD:</label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Số CCCD"
                                            name="CCCD"
                                            id="CCCD"
                                            value="${thongtin.cccd}"
                                            required
                                    />
                                </div>
                                <div class="d-flex mb-2 justify-content-between align-items-between">
                                    <div class="form-group w-50 pe-3">
                                        <label>Ngày cấp:</label>
                                        <input
                                                type="date"
                                                class="form-control"
                                                placeholder="mm/dd/yyyy"
                                                name="NgayCap"
                                                id="NgayCap"
                                                value="${thongtin.ngayCap}"
                                                required
                                        />
                                    </div>
                                    <div class="form-group w-50">
                                        <label>Nơi cấp:</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Nơi cấp"
                                                name="NoiCap"
                                                id="NoiCap"
                                                value="${thongtin.noiCap}"
                                                required
                                        />
                                    </div>
                                </div>
                                <div class="d-flex mb-2 justify-content-between align-items-between">

                                    <div class="form-group w-50 pe-3">
                                        <label>Ngày sinh:</label>
                                        <input
                                                type="date"
                                                class="form-control"
                                                placeholder="mm/dd/yyyy"
                                                name="NgaySinh"
                                                id="NgaySinh"
                                                value="${thongtin.ngaySinh}"
                                                required
                                        />
                                    </div>
                                    <div class="form-group w-50">
                                        <label>Số điện thoại:</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Số điện thoại"
                                                name="SoDienThoai"
                                                id="SoDienThoai"
                                                value="${thongtin.sdt}"
                                                required
                                        />
                                    </div>
                                </div>
                                <div class="form-group mb-2">
                                    <label>Email</label>
                                    <input
                                            type="email"
                                            class="form-control"
                                            placeholder="email"
                                            name="Email"
                                            id="Email"
                                            value="${thongtin.email}"
                                            required
                                    />
                                </div>
                                <div class="d-flex mb-2 justify-content-between align-items-between">
                                    <div class="form-group w-50 pe-3">
                                        <label>Số nhà:</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Số nhà"
                                                name="SoNha"
                                                id="SoNha"
                                                value="${thongtin.soNha}"
                                                required
                                        />
                                    </div>
                                    <div class="form-group w-50">
                                        <label>Xã:</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Xã"
                                                name="Xa"
                                                id="Xa"
                                                value="${thongtin.xa}"
                                                required
                                        />
                                    </div>
                                </div>
                                <div class="d-flex mb-2 justify-content-between">
                                    <div class="form-group w-50 pe-3">
                                        <label>Huyện:</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Huyện"
                                                name="Huyen"
                                                id="Huyen"
                                                value="${thongtin.huyen}"
                                                required
                                        />
                                    </div>
                                    <div class="form-group w-50">
                                        <label>Tỉnh:</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Tỉnh"
                                                name="Tinh"
                                                id="Tinh"
                                                value="${thongtin.tinh}"
                                                required
                                        />
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="panel-footer text-center">
                            <button
                                    type="submit"
                                    class="btn w-25 font-weight-bold btn-submit"
                            >
                                Cập nhật
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="${pageContext.request.contextPath}/js/quanli.js"></script>
</body>
</html>
