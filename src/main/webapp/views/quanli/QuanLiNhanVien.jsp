<%@ page import="Models.ThongTinNguoiDung" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/25/2023
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <!-- Link boostrap css -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <!-- Link boostrap js -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
    ></script>
    <!-- Link fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quanli.css" />
    <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon" />
    <script
            src="https://kit.fontawesome.com/a076d05399.js"
            crossorigin="anonymous"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/jszip.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/xlsx.js"></script>



    <title>Quản lý Nhân viên</title>
</head>
<body>

<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<%
    List<ThongTinNguoiDung> listInfo = (List<ThongTinNguoiDung>) request.getAttribute("thongTinNhanVien");
    Gson gson = new Gson();
    String json = gson.toJson(listInfo);
%>

<script>
    window.onload = function(){
        let msg = "<%= request.getAttribute("Result")%>";
        if(msg != "null")
            alert(msg);
    }
</script>

<div id="wrapper">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand mb-5">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo" class="card-img-top logo-img" />
        </div>
        <ul class="sidebar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/xemcautruc"><i class="fa fa-building-o"></i>Cấu trúc công ty</a>
            </li>

            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/infoEmployee"
                ><i class="fa fa-drivers-license"></i>Cập nhật thông tin</a
                >
            </li>

            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiGuiMail.jsp"
                ><i class="fa fa-commenting-o"></i>Gửi mail</a
                >
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listChiNhanh"
                ><i class="fa fa-location-arrow"></i>Quản lý chi nhánh</a
                >
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listphongban"
                ><i class="fa fa-sitemap"></i>Quản lý phòng ban</a
                >
            </li>
            <li class="active">
                <a class="mt-3" href="<%=request.getContextPath()%>/listemployee"
                ><i class="fa fa-users"></i>Quản lý nhân viên</a
                >
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listSalary"
                ><i class="fa fa-bar-chart"></i>Thống kê tiền lương</a
                >
            </li>
        </ul>
    </aside>

    <div id="navbar-wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div
                        class="navbar-header d-flex justify-content-between align-items-center"
                >
                    <div>
                        <a href="#" class="navbar-brand" id="sidebar-toggle"
                        ><i class="fa fa-bars"></i
                        ></a>
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
        <div class="row mb-3">
            <div class="col-lg-12">
                <p class="page-header text-center">Quản lí nhân viên</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7 d-flex flex-column">
                <div class="panel panel-default">
                    <div class="panel-heading">Danh sách nhân viên</div>
                    <div class="panel-body">
                        <div class="scroll-bar">
                            <div class="table-responsive" style="overflow-x: scroll;">
                                <table
                                        class="table table-striped table-bordered table-hover"
                                        id="dtVerticalScrollExample"
                                        onclick="DisplayInfo(event)"
                                >
                                    <thead>
                                    <tr>
                                        <th style="min-width: 150px;">Mã nhân viên</th>
                                        <th style="min-width: 150px;">Tên nhân viên</th>
                                        <th style="min-width: 90px;">Giới tính</th>
                                        <th style="min-width: 100px;">Ngày sinh</th>
                                        <th style="min-width: 160px;">Chức vụ</th>
                                        <th style="min-width: 150px;">Chi nhánh</th>
                                        <th style="min-width: 150px;">Phòng ban</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <c:forEach var="info" items="${listEmployee}">
                                        <tr>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.manhanvien}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.tennhanvien}" />
                                            </td>
                                            <td style="min-width: 90px;">
                                                <c:out value="${info.gioitinh}" />
                                            </td>
                                            <td style="min-width: 100px;">
                                                <c:out value="${info.date}" />
                                            </td>
                                            <td style="min-width: 160px;">
                                                <c:out value="${info.chucvu}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.chinhanh}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.phongban}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- } -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <a href="<%=request.getContextPath()%>/listemployee">Hiển thị danh sách</a>
                    </div>
                </div>
                <form action="<%=request.getContextPath()%>/findemployee" method="post">
                    <div>
                        <div class="panel-heading" style="font-weight: 600">Tìm kiếm</div>
                        <div class="d-flex justify-content-around align-items-around">
                            <select class="form-select w-25 ms-3" name="tenCN" id="tenCN">
                                <option selected>Chọn chi nhánh</option>
                                <c:forEach var="listChiNhanh" items="${listChiNhanh}">
                                    <option value="${listChiNhanh.tenChiNhanh}"><c:out value="${listChiNhanh.tenChiNhanh}" /></option>
                                </c:forEach>
                            </select>
                            <select class="form-select w-25 ms-3" name="tenPB" id="tenPB">
                                <option selected>Chọn phòng ban</option>
                                <c:forEach var="listPhongBan" items="${listPhongBan}">
                                    <option value="${listPhongBan.tenPhongBan}"><c:out value="${listPhongBan.tenPhongBan}" /></option>
                                </c:forEach>
                            </select>

                            <select class="form-select w-25 ms-3" name="tenCV" id="tenCV">
                                <option selected>Chọn chức vụ</option>
                                <c:forEach var="listChucVu" items="${listChucVu}">
                                    <option value="${listChucVu.tenChucVu}"><c:out value="${listChucVu.tenChucVu}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div
                                class="d-flex mt-3 justify-content-around align-items-around"
                        >
                            <input class="form-control w-50" placeholder="Tìm kiếm" name="text_box_find" id="text_box_find" onkeyup = "Search()"/>
                            <button
                                    type="submit"
                                    class="btn w-25 ms-3 font-weight-bold btn-submit"
                            >
                                Tìm
                            </button>
                        </div>
                    </div>
                </form>

                <div>
                    <form action="<%=request.getContextPath()%>/addexcel" method="post">
                        <div class="panel-heading mt-3" style="font-weight: 600">
                            Thêm danh sách nhân viên
                        </div>
                        <div
                                class="d-flex mb-3 justify-content-evenly align-items-center"
                        >
                            <input
                                    type="file"
                                    class="form-control w-50"
                                    placeholder="Chọn file"
                                    onchange="readExcelFile(event)"
                                    accept=".xlsx"
                            />
                            <button
                                    type="submit"
                                    class="btn w-25 ms-5 font-weight-bold btn-submit"
                            >
                                <i class="fa fa-file-excel-o"></i> Thêm
                            </button>
                        </div>
                        <input type="hidden" id="jsondata" name="jsondata"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-5 d-flex flex-column">
                <div class="panel panel-default">
                    <div class="panel-heading">Thông tin</div>
                    <div class="panel-body">
                        <!-- <div class="panel-heading" style="font-weight: 600">
                        Thông tin
                      </div> -->
                        <form action="">
                            <div class="form-group ms-3 mb-3">
                                <label>Mã nhân viên:</label>
                                <input
                                        id="MaNhanVien"
                                        class="form-control"
                                        placeholder="Mã nhân viên"
                                        name="manhanvien"
                                        disabled
                                />
                            </div>

                            <div class="form-group ms-3 mb-3">
                                <label>Họ và tên:</label>
                                <input
                                        id="HoVaTen"
                                        class="form-control"
                                        placeholder="Họ và tên"
                                        disabled
                                />
                            </div>

                            <div class="form-group ms-3 mb-3">
                                <label>Ngày sinh:</label>
                                <input
                                        id="NgaySinh"
                                        type="date"
                                        class="form-control"
                                        placeholder="05-01-2003"
                                        disabled
                                />
                            </div>
                            <div class="form-group ms-3 mb-3">
                                <label>Giới tính:</label>
                                <input
                                        id="GioiTinh"
                                        type="text"
                                        class="form-control"
                                        placeholder="Nam"
                                        disabled
                                />
                            </div>
                            <div class="form-group ms-3 mb-3">
                                <label>Địa chỉ:</label>
                                <input
                                        id="DiaChi"
                                        type="text"
                                        class="form-control"
                                        placeholder="Địa chỉ"
                                        disabled
                                />
                            </div>
                            <div class="form-group ms-3 mb-3">
                                <label>Email:</label>
                                <input
                                        id="Email"
                                        type="email"
                                        class="form-control"
                                        placeholder="Email"
                                        disabled
                                />
                            </div>
                            <div class="form-group ms-3 mb-3">
                                <label>Số điện thoại:</label>
                                <input
                                        id="SoDienThoai"
                                        type="text"
                                        class="form-control"
                                        placeholder="SĐT"
                                        disabled
                                />
                            </div>
                            <div
                                    class="d-flex justify-content-between align-items-between"
                            >
                                <div class="form-group ms-3 mb-3">
                                    <label>Hệ số lương:</label>
                                    <input
                                            id="HeSoLuong"
                                            type="text"
                                            class="form-control"
                                            placeholder="Hệ số"
                                            disabled
                                    />
                                </div>
                                <div class="form-group">
                                    <label>Ngày vào làm:</label>
                                    <input
                                            id="NgayVaoLam"
                                            type="date"
                                            class="form-control"
                                            placeholder="05-01-2003"
                                            disabled
                                    />
                                </div>
                            </div>
                            <div
                                    class="d-flex justify-content-between align-items-between"
                            >
                                <div class="form-group ms-3 mb-3">
                                    <label>CCCD:</label>
                                    <input
                                            id="CCCD"
                                            type="text"
                                            class="form-control"
                                            placeholder="CCCD"
                                            disabled
                                    />
                                </div>
                                <div class="form-group">
                                    <label>Trạng thái:</label>
                                    <input
                                            id="TrangThai"
                                            type="text"
                                            class="form-control"
                                            placeholder="Đang làm việc"
                                            disabled
                                    />
                                </div>
                            </div>
                        </form>
                        <div class="d-flex justify-content-around align-items-center">
                            <button
                                    type="submit"
                                    class="btn w-25 font-weight-bold btn-submit"
                                    data-bs-toggle="modal"
                                    data-bs-target="#ThemNhanVien"
                            >
                                Thêm
                            </button>
                            <button
                                    type="submit"
                                    class="btn w-25 font-weight-bold btn-submit"
                                    data-bs-toggle="modal"
                                    data-bs-target="#SuaNhanVien"
                            >
                                Sửa
                            </button>
                            <button
                                    type="submit"
                                    class="btn w-25 font-weight-bold btn-submit"
                                    data-bs-toggle="modal"
                                    data-bs-target="#XoaNhanVien"
                                    onclick="ConfirmEmpID()"
                            >
                                Xóa
                            </button>
                        </div>
                        <div>
                            <div class="panel-heading" style="font-weight: 600">
                                Tùy chọn
                            </div>
                            <div class="d-flex justify-content-around align-items-around">
                                <button
                                        type="submit"
                                        class="btn w-50 font-weight-bold btn-warning"
                                        data-bs-toggle="modal"
                                        data-bs-target="#ThemKhenThuong"
                                >
                                    Khen thưởng
                                </button>
                                <button
                                        type="submit"
                                        class="btn w-25 font-weight-bold btn-danger"
                                        data-bs-toggle="modal"
                                        data-bs-target="#ThemKyLuat"
                                >
                                    Kỷ luật
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- TODO: Edit Modal HTML -->
<!-- ? Nhân viên -->
<!-- Thêm nhân viên -->
<div
        class="modal fade"
        id="ThemNhanVien"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm nhân viên</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="<%=request.getContextPath()%>/addemployee" method="post">
                <div class="modal-body">
                    <div class="form-group ms-3 mb-3">
                        <label>Mã nhân viên:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="TK001"
                                name="MaNhanVien"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Họ và tên:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Nguyễn Văn A"
                                name="HoVaTen"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Ngày sinh:</label>
                        <input
                                type="date"
                                class="form-control"
                                name="NgaySinh"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Giới tính:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Nam"
                                name="GioiTinh"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>CCCD:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="CCCD"
                                name="CCCD"
                                required
                        />
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Nơi cấp:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Công An tỉnh Đồng Nai"
                                    name="NoiCap"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Ngày cấp:</label>
                            <input
                                    type="date"
                                    class="form-control"
                                    name="NgayCap"
                                    required
                            />
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Số nhà:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="01, Lý Tự Trọng"
                                    name="SoNha"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Xã (Phường):</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Linh Chiểu"
                                    name="Xa"
                                    required
                            />
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Huyện (Quận):</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Quận 9"
                                    name="Huyen"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Tỉnh (Thành Phố):</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Thủ Đức"
                                    name="Tinh"
                                    required
                            />
                        </div>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Email:</label>
                        <input
                                type="email"
                                class="form-control"
                                placeholder="Email"
                                name="Email"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Số điện thoại:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Số điện thoại"
                                name="SDT"
                                required
                        />
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Hệ số lương:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Hệ số lương"
                                    name="HeSo"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Ngày vào làm:</label>
                            <input
                                    type="date"
                                    class="form-control"
                                    name="NgayVaoLam"
                                    required
                            />
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Trình độ:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Đại học"
                                    name="TrinhDo"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Trạng thái:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Đang làm việc"
                                    name="TrangThai"
                                    required
                            />
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
                    <button
                            type="button submit"
                            class="btn w-25 font-weight-bold btn-submit"
                    >
                        Thêm
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Sửa nhân viên -->
<div
        class="modal fade"
        id="SuaNhanVien"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Sửa nhân viên</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="<%= request.getContextPath()%>/updateemployee" method="post">
                <div class="modal-body">
                    <div class="form-group ms-3 mb-3">
                        <label>Mã nhân viên:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="TK001"
                                name="MaNhanVien"
                                id="updateMaNhanVien"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Họ và tên:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Nguyễn Văn A"
                                name="HoVaTen"
                                id="updateHoVaTen"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Ngày sinh:</label>
                        <input
                                type="date"
                                class="form-control"
                                name="NgaySinh"
                                id="updateNgaySinh"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Giới tính:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Nam"
                                name="GioiTinh"
                                id="updateGioiTinh"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>CCCD:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="CCCD"
                                name="CCCD"
                                id="updateCCCD"
                                required
                        />
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Nơi cấp:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Công An tỉnh Đồng Nai"
                                    name="NoiCap"
                                    id="updateNoiCap"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Ngày cấp:</label>
                            <input
                                    type="date"
                                    class="form-control"
                                    name="NgayCap"
                                    id="updateNgayCap"
                                    required
                            />
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Số nhà:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="01, Lý Tự Trọng"
                                    name="SoNha"
                                    id="updateSoNha"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Xã (Phường):</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Linh Chiểu"
                                    name="Xa"
                                    id="updateXa"
                                    required
                            />
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Huyện (Quận):</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Quận 9"
                                    name="Huyen"
                                    id="updateHuyen"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Tỉnh (Thành Phố):</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Thủ Đức"
                                    name="Tinh"
                                    id="updateTinh"
                                    required
                            />
                        </div>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Email:</label>
                        <input
                                type="email"
                                class="form-control"
                                placeholder="Email"
                                name="Email"
                                id="updateEmail"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Số điện thoại:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Số điện thoại"
                                name="SDT"
                                id="updateSDT"
                                required
                        />
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Hệ số lương:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Hệ số lương"
                                    name="HeSo"
                                    id="updateHeSo"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Ngày vào làm:</label>
                            <input
                                    type="date"
                                    class="form-control"
                                    name="NgayVaoLam"
                                    id="updateNgayVaoLam"
                                    required
                            />
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-between">
                        <div class="form-group ms-3 mb-3">
                            <label>Trình độ:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Đại học"
                                    name="TrinhDo"
                                    id="updateTrinhDo"
                                    required
                            />
                        </div>
                        <div class="form-group">
                            <label>Trạng thái:</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Đang làm việc"
                                    name="TrangThai"
                                    id="updateTrangThai"
                                    required
                            />
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
                    <button
                            type="button submit"
                            class="btn w-25 font-weight-bold btn-submit"
                    >
                        Sửa
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Xóa trưởng phòng -->
<div
        class="modal fade"
        id="XoaNhanVien"
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
                    Xóa nhân viên này!?
                </h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form action="<%=request.getContextPath()%>/deleteemployee" method="post">
                <div class="modal-body">
                    <p style="font-size: 16px" id = "ConfirmID">
                    </p>
                    <input value="" name="MaNhanVien" id="confirm" type="hidden"/>

                </div>
                <div class="modal-footer">
                    <button
                            type="button"
                            class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal"
                    >
                        Đóng
                    </button>
                    <button type="button submit" class="btn w-25 font-weight-bold btn-danger">
                        Xóa
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- ? KHen thưởng và kỉ luật -->
<!-- Thêm khen thưởng -->
<div
        class="modal fade"
        id="ThemKhenThuong"
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
                    Thêm khen thưởng
                </h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="<%= request.getContextPath()%>/addreward" method="post">
                <div class="modal-body">
                    <div class="form-group ms-3 mb-3">
                        <label>Mã quyết định:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="QD001"
                                name="MaQuyetDinh"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Mã nhân viên:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="TK001"
                                name="MaNhanVien"
                                id="MaNV"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Mã người ký quyết định:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="TK005"
                                name="MaNguoiKy"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Loại quyết định:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="QD001"
                                value="Khen Thưởng"
                                name="Loai"
                                required
                                disabled
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Ngày ký quyết định:</label>
                        <input
                                type="date"
                                class="form-control"
                                placeholder="mm/dd/yyyy"
                                name="Ngay"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Nội dung:</label>
                        <textarea type="text" class="form-control" required name="NoiDung"></textarea>
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
                    <button
                            type="button submit"
                            class="btn w-25 font-weight-bold btn-submit"
                    >
                        Xác nhận
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Thêm kỷ luật -->
<div
        class="modal fade"
        id="ThemKyLuat"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm kỷ luật</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="<%=request.getContextPath()%>/discipline" method="post">
                <div class="modal-body">
                    <div class="form-group ms-3 mb-3">
                        <label>Mã quyết định:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="QD001"
                                name="MaQuyetDinh"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Mã nhân viên:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="TK001"
                                name="MaNhanVien"
                                id="MaNV"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Mã người ký quyết định:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="TK005"
                                name="MaNguoiKy"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Loại quyết định:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="QD001"
                                value="Kỷ luật"
                                name="Loai"
                                required
                                disabled
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Ngày ký quyết định:</label>
                        <input
                                type="date"
                                class="form-control"
                                placeholder="mm/dd/yyyy"
                                name="Ngay"
                                required
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Nội dung:</label>
                        <textarea type="text" class="form-control" required name="NoiDung"></textarea>
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
                    <button
                            type="button submit"
                            class="btn w-25 font-weight-bold btn-submit"
                    >
                        Xác nhận
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/quanli.js"></script>

<script>

    function Search() {
        var searchValue = document.getElementById('text_box_find').value;

        var searchTable = document.getElementById('dtVerticalScrollExample');
        var searchColCount;

        for (var rowIndex = 0; rowIndex < searchTable.rows.length; rowIndex++) {
            var rowData = '';

            if (rowIndex == 0) {
                searchColCount = searchTable.rows.item(rowIndex).cells.length;
                continue;
            }

            for (var colIndex = 0; colIndex < searchColCount; colIndex++) {
                rowData += searchTable.rows.item(rowIndex).cells.item(colIndex).textContent;
            }

            if (rowData.indexOf(searchValue) == -1)
                searchTable.rows.item(rowIndex).style.display = 'none';
            else
                searchTable.rows.item(rowIndex).style.display = 'table-row';
        }
    }

    function DisplayInfo(e) {
        let list = <%= json%>;
        let row = e.target.parentNode;
        let manv = row.cells[0].innerHTML;
        document.getElementById("MaNhanVien").value = manv;
        ClearSpaces("MaNhanVien");

        for (var i = 0; i < list.length; i++) {
            let emp = list[i];
            if(emp.mataikhoan == document.getElementById("MaNhanVien").value)
            {
                document.getElementById("updateMaNhanVien").value = emp.mataikhoan;
                document.getElementById("MaNV").value = emp.mataikhoan;

                document.getElementById("HoVaTen").value = emp.hoTen;
                document.getElementById("updateHoVaTen").value = emp.hoTen;

                document.getElementById("NgaySinh").value = emp.ngaySinh;
                document.getElementById("updateNgaySinh").value = emp.ngaySinh;

                document.getElementById("GioiTinh").value = emp.gioitinh;
                document.getElementById("updateGioiTinh").value = emp.gioitinh;

                document.getElementById("DiaChi").value = emp.soNha + ", " + emp.xa + ", " + emp.huyen + ", " + emp.tinh;
                document.getElementById("updateSoNha").value = emp.soNha;
                document.getElementById("updateXa").value = emp.xa;
                document.getElementById("updateHuyen").value = emp.huyen;
                document.getElementById("updateTinh").value = emp.tinh;

                document.getElementById("Email").value = emp.email;
                document.getElementById("updateEmail").value = emp.email;

                document.getElementById("SoDienThoai").value = emp.sdt;
                document.getElementById("updateSDT").value = emp.sdt;

                document.getElementById("HeSoLuong").value = emp.heSoLuong;
                document.getElementById("updateHeSo").value = emp.heSoLuong;

                document.getElementById("NgayVaoLam").value = emp.ngayBatDauLam;
                document.getElementById("updateNgayVaoLam").value = emp.ngayBatDauLam;

                document.getElementById("CCCD").value = emp.cccd;
                document.getElementById("updateCCCD").value = emp.cccd;

                document.getElementById("TrangThai").value = emp.trangThai;
                document.getElementById("updateTrangThai").value = emp.trangThai;

                document.getElementById("updateNoiCap").value = emp.noiCap;
                document.getElementById("updateNgayCap").value = emp.ngayCap;
                document.getElementById("updateTrinhDo").value = emp.trinhDo;
            }
        }
    }

    function ClearSpaces(id){
        var value = document.getElementById(id).value; // get the value of the input element
        var newValue = value.replace(/\s+/g, ""); // replace all whitespace characters with an empty string
        document.getElementById(id).value = newValue; // set the new value of the input element
    }

    function ConfirmEmpID(){
        let id = document.getElementById("MaNhanVien").value;
        document.getElementById("confirm").value = id;
        if(id != "")
            document.getElementById("ConfirmID").innerHTML = "Bạn có chắc chắn muốn xóa nhân viên "+id+" không? Hành động này không thể hoàn tác.";
        else
            document.getElementById("ConfirmID").innerHTML = "Hãy chọn một nhân viên trước khi thực hiện thao tác này."
    }

    function readExcelFile(event) {
        const input = event.target;
        const reader = new FileReader();
        reader.onload = function(){
            const fileData = reader.result;
            const wb = XLSX.read(fileData, {type : 'binary'});
            const wsname = wb.SheetNames[0];
            const ws = wb.Sheets[wsname];
            const data = XLSX.utils.sheet_to_json(ws);
            var stringData = JSON.stringify(data);
            document.getElementById("jsondata").value = stringData;
        };
        reader.readAsBinaryString(input.files[0]);
    }
</script>

</body>
</html>
