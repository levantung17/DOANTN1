<%@ page import="Models.ThongTinNguoiDung" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="Models.QuyetDinh" %>
<%-- Created by IntelliJ IDEA. User: GIGABYTE Date: 11/24/2023 Time: 8:59 AM To change this template use File | Settings
  | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous"/>
    <!-- Link boostrap js -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nhanvien.css"/>
    <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon"/>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <title>Nhân Viên - Thông tin</title>
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
                <a class="mb-3"
                   href="<%=request.getContextPath()%>/xemcautruc"><i
                        class="fa fa-building-o"></i>Cấu
                    trúc công ty</a>
            </li>
            <li class="active">
                <a class="mb-3" href="<%=request.getContextPath()%>/infoEmployee"><i
                        class="fa fa-drivers-license"></i>Cập nhật thông
                    tin</a>
            </li>
            <li>
                <a class="mb-3"
                   href="<%=request.getContextPath()%>/views/nhanvien/NhanVienGuiMail.jsp"><i
                        class="fa fa-commenting-o"></i>Gửi
                    mail</a>
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
                        <h3>Xin chào nhân viên</h3>
                        <a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out icon-size"></i></a>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <section id="content-wrapper">
        <div class="row p-3">
            <div class="col-lg-12">
                <p class="page-header text-center">Thông tin nhân viên</p>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
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
            <!-- /.col-lg-6 -->
            <div class="col-lg-6 d-flex flex-column">
                <div class="panel panel-default">
                    <div class="panel-heading">Về lịch sử công việc</div>
                    <div class="panel-body">
                        <div class="scroll-bar">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th style="min-width: 50px;">Họ và tên</th>
                                        <th style="min-width: 50px;">Tên chức vụ</th>
                                        <th style="min-width: 50px;">Tên chi nhánh</th>
                                        <th style="min-width: 50px;">Tên phòng ban</th>
                                        <th style="min-width: 50px;">Ngày bắt đầu</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="thongtinCongTy" items="${thongtincanhanCongTy}">
                                    <tr>
                                        <td style="min-width: 50px;">
                                            <c:out value="${thongtinCongTy.tennhanvien}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${thongtinCongTy.chucvu}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${thongtinCongTy.chinhanh}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${thongtinCongTy.phongban}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${thongtinCongTy.date}"/>
                                        </td>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-around align-items-center">
                    <p class="panel-heading" style="font-weight: 600">
                        Khen thưởng và kỉ luật
                    </p>
                    <button
                            type="submit"
                            class="btn w-25 font-weight-bold btn-submit"
                            data-bs-toggle="modal"
                            data-bs-target="#XemKhenThuongVaKyLuat"
                    >
                        Xem
                    </button>
                </div>
            </div>
        </div>
        <div class="row p-3">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Về Công ty</div>
                    <div class="panel-body">
                        <form role="form">
                            <c:forEach var="thongtinCongTy" items="${thongtincanhanCongTy}"
                                       varStatus="loopStatus">
                                <c:if test="${loopStatus.last}">
                                    <div class="row p-3">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Mã tài khoản:</label>
                                                <input
                                                        class="form-control"
                                                        type="text"
                                                        placeholder="Vai trò"
                                                        value="${thongtinCongTy.manhanvien}"
                                                        disabled
                                                />
                                            </div>
                                            <div class="form-group">
                                                <label>Chức vụ:</label>
                                                <input
                                                        class="form-control"
                                                        type="text"
                                                        placeholder="Vai trò"
                                                        value="${thongtinCongTy.chucvu}"
                                                        disabled
                                                />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Chi nhánh</label>
                                                <input
                                                        class="form-control"
                                                        type="text"
                                                        placeholder="Chi nhánh"
                                                        value="${thongtinCongTy.chinhanh}"
                                                        disabled
                                                />
                                            </div>
                                            <div class="form-group">
                                                <label>Phòng</label>
                                                <input
                                                        class="form-control"
                                                        id="disabledInput"
                                                        type="text"
                                                        placeholder="Phòng"
                                                        value="${thongtinCongTy.phongban}"
                                                        disabled
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </section>
</div>
<!-- Xme khen thưởng và kỉ luật -->
<div
        class="modal fade"
        id="XemKhenThuongVaKyLuat"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    Xem khen thưởng và kỉ luật
                </h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="">
                <div class="modal-body">
                    <div class="form-group ms-3 mb-3">
                        <div class="scroll-bar">
                            <!-- Tạo table chứa nội dung khen thưởng kỉ luật (ngày, nội dung, khen thưởng hay kỉ luật) -->
                            <table class="table table-bordered text-center"
                                   style="overflow-x: scroll;">
                                <thead>
                                <tr>
                                    <th>Mã quyết định</th>
                                    <th>Loại quyết định</th>
                                    <th>Ngày</th>
                                    <th>Nội dung</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="qd" items="${quyetdinh}">
                                    <tr>
                                        <td style="min-width: 50px;">
                                            <c:out value="${qd.maQuyetDinh}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${qd.loaiQuyetDinh}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${qd.ngay}"/>
                                        </td>
                                        <td style="min-width: 50px;">
                                            <c:out value="${qd.noiDung}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button
                            type="button"
                            class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal"
                    >
                        Đóng
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/NhanVien.js"></script>

</body>

</html>