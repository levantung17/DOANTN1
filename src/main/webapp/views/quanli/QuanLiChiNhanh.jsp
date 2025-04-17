<%-- Created by IntelliJ IDEA. User: GIGABYTE Date: 11/25/2023 Time: 7:48 AM To change this template use File | Settings
    | File Templates. --%>
<%@ page import="Models.ChiNhanh" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="Models.ThongTinNguoiDung" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>Quản lí - Cấu trúc</title>
</head>

<body>
<%
    List<ThongTinNguoiDung> listInfo = (List<ThongTinNguoiDung>) request.getAttribute("ThongTinNguoiDung");
    Gson gson = new Gson();
    String json = gson.toJson(listInfo);
%>
<%
    List<ChiNhanh> listInfoChiNhanh = (List<ChiNhanh>) request.getAttribute("ChiNhanh");
    Gson gsonchinhanh = new Gson();
    String jsonchinhanh = gson.toJson(listInfoChiNhanh);
%>
<script>
    window.onload = function(){
        let msg = "<%= request.getAttribute("Result")%>";
        if(msg != "null")
            alert(msg);
    }
</script>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
<div id="wrapper">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand mb-5">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"
                 class="card-img-top logo-img"/>
        </div>
        <ul class="sidebar-nav">
            <li>
                <a href="<%=request.getContextPath()%>/xemcautruc"><i class="fa fa-building-o"></i>Cấu trúc công ty</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/infoEmployee"><i
                        class="fa fa-drivers-license"></i>Cập nhật thông tin</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiGuiMail.jsp"><i class="fa fa-commenting-o"></i>Gửi
                    mail</a>
            </li>
            <li class="active">
                <a class="mt-3" href="<%=request.getContextPath()%>/listInfoChiNhanh"><i class="fa fa-location-arrow"></i>Quản
                    lý chi
                    nhánh</a>
            </li>

            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listphongban"><i class="fa fa-sitemap"></i>Quản lý
                    phòng
                    ban</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listemployee"><i class="fa fa-users"></i>Quản lý nhân
                    viên</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listSalary"><i class="fa fa-bar-chart"></i>Thống
                    kê tiền lương</a>
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
        <div class="row mb-3">
            <div class="col-lg-12">
                <p class="page-header text-center">Quản lí chi nhánh</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7 d-flex flex-column">
                <div class="panel panel-default">
                    <div class="panel-heading">Danh sách chi nhánh</div>
                    <div class="panel-body">
                        <div class="scroll-bar">
                            <div class="table-responsive" style = "height: 480px;">
                                <table class="table table-striped table-bordered table-hover"
                                       id="dtVerticalScrollExample"
                                       onclick="DisplayInfo(event),DisplayInfoChiNhanh(event),ConfirmID(event)"


                                >

                                    <thead>
                                    <tr>
                                        <th style="min-width: 150px;">Mã Chi Nhánh </th>
                                        <th style="min-width: 150px;">Tên Chi Nhánh</th>
                                        <th style="min-width: 90px;">Số Nhà </th>
                                        <th style="min-width: 100px;">Xã</th>
                                        <th style="min-width: 160px;">Huyện</th>
                                        <th style="min-width: 150px;">Tỉnh</th>
                                        <th style="min-width: 150px;">Ngày tạo chi nhánh</th>
                                        <th style="min-width: 150px;">Số điện thoại </th>
                                        <th style="min-width: 150px;">Mã giám đốc</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <%!
                                        private boolean json;
                                    %><c:forEach var="info" items="${listChiNhanh}">
                                        <tr>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.maChiNhanh}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.tenChiNhanh}" />
                                            </td>
                                            <td style="min-width: 50px;">
                                                <c:out value="${info.soNha}" />
                                            </td>
                                            <td style="min-width: 100px;">
                                                <c:out value="${info.xa}" />
                                            </td>
                                            <td style="min-width: 160px;">
                                                <c:out value="${info.huyen}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.tinh}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.ngayTaoChiNhanh}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.sdt}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.maGiamDoc}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- } -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <a href="<%=request.getContextPath()%>/listChiNhanh">Hiển thị danh sách</a>
                </div>
                <form action="<%=request.getContextPath()%>/findchinhanh" method="post">

                    <div>
                        <div class="panel-heading" style="font-weight: 600">Tìm kiếm</div>
                        <div class="d-flex justify-content-around align-items-around">
                            <select class="form-select w-25 ms-3" name="tenCN" id="tenCN">
                                <option selected>Chọn chi nhánh</option>
                                <c:forEach var="listtenChiNhanh" items="${listtenChiNhanh}">
                                    <option value="${listtenChiNhanh.tenChiNhanh}"><c:out value="${listtenChiNhanh.tenChiNhanh}" /></option>
                                </c:forEach>
                            </select>
                            <div
                                    class="d-flex mt-3 justify-content-around align-items-around"
                            >

                                <input class="form-control w-50" placeholder="Tìm kiếm" name="text_box_find" id="text_box_find" onkeyup = "Search()"/>
                                <button type="submit" class="btn w-25 font-weight-bold btn-submit">
                                    Tìm
                                </button>
                            </div>

                        </div>
                    </div>
                </form>

                <div>
                    <div class="panel-heading" style="font-weight: 600">
                        Tùy chọn chi nhánh
                    </div>
                    <div class="d-flex justify-content-around align-items-around">
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#ThemChiNhanh">
                            Thêm
                        </button>
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#SuaChiNhanh">
                            Sửa
                        </button>
                        <button type="submit" class="btn w-25 font-weight-bold btn-submit"
                                data-bs-toggle="modal" data-bs-target="#XoaChiNhanh">
                            Xóa
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 d-flex flex-column">
                <div>
                    <div class="panel-heading" style="font-weight: 600">
                        Thông tin giám đốc
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>ID:</label>
                        <input id="MaNhanVien" class="form-control" placeholder="ID" disabled/>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Họ và tên:</label>
                        <input id="HoVaTen" class="form-control" placeholder="Họ và tên" disabled/>
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Ngày sinh:</label>
                        <input
                                type="date"
                                class="form-control"
                                id="NgaySinh"
                                disabled
                        />
                    </div>
                    <div class="form-group ms-3 mb-3">
                        <label>Giới tính:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Giới tính"
                                id="GioiTinh"
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

            </div>
        </div>
    </section>
</div>




<!-- ? CHi nhánh -->
<!-- THêm chi nhánh -->
<div
        class="modal fade"
        id="ThemChiNhanh"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm chi nhánh</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="<%=request.getContextPath()%>/addchinhanh" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="ma-chi-nhanh" class="col-form-label">Mã chi nhánh : </label>
                        <input
                                type="text"
                                class="form-control"
                                id="ma-chi-nhanh"
                                placeholder="Mã chi nhánh"
                                name="maChiNhanh"
                                required
                        />
                        <label for="ten-chi-nhanh" class="col-form-label">Tên: </label>
                        <input
                                type="text"
                                class="form-control"
                                id="ten-chi-nhanh"
                                placeholder="Tên chi nhánh"
                                name="tenChiNhanh"

                                required
                        />
                        <label for="SoNha" class="col-form-label">Số nhà:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="SoNha"
                                placeholder="Số nhà"
                                name="soNha"
                                required
                        />
                        <label for="Xa" class="col-form-label">Xã:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="Xa"
                                placeholder="Xã"
                                name="xa"
                                required
                        />
                        <label for="Huyen" class="col-form-label">Huyện:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="Huyen"
                                placeholder="Huyện"
                                name="huyen"
                                required
                        />
                        <label for="Tinh" class="col-form-label">Tỉnh:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="Tinh"
                                placeholder="Tỉnh"
                                name="tinh"
                                required
                        />
                        <label for="NgayTao" class="col-form-label"
                        >Ngày tạo chi nhánh</label
                        >
                        <input
                                type="date"
                                class="form-control"
                                id="NgayTao"
                                placeholder="Ngày tạo chi nhánh"
                                name="ngayTaoChiNhanh"
                                required
                        />
                        <label for="SDT" class="col-form-label">Số điện thoại</label>
                        <input
                                type="text"
                                class="form-control"
                                id="SDT"
                                placeholder="Số điện thoại"
                                name="sdt"
                                required
                        />
                        <label for="maGiamDoc" class="col-form-label">Mã giám đốc</label>
                        <input
                                type="text"
                                class="form-control"
                                id="maGiamDoc"
                                placeholder="Mã giám đốc"
                                name="maGiamDoc"
                                required
                        />
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
<!-- Sửa chi nhánh -->
<div
        class="modal fade"
        id="SuaChiNhanh"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Sửa chi nhánh</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form id="commonForm" action="<%= request.getContextPath()%>/updatechinhanh" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label  class="col-form-label">Mã chi nhánh: </label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatemaChiNhanh"
                                name="maChiNhanh"
                                placeholder="Mã chi nhánh"
                                required
                        />
                        <label  class="col-form-label">Tên: </label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatetenChiNhanh"
                                name="tenChiNhanh"
                                placeholder="Tên chi nhánh"
                                required
                        />
                        <label  class="col-form-label">Số nhà:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatesoNha"
                                name="soNha"
                                placeholder="Số nhà"
                                required
                        />
                        <label  class="col-form-label">Xã:</label>
                        <input
                                type="text"
                                class="form-control"
                                placeholder="Xã"
                                id="updatexa"
                                name="xa"
                                required
                        />
                        <label  class="col-form-label">Huyện:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatehuyen"
                                name="huyen"
                                placeholder="Huyện"
                                required
                        />
                        <label  class="col-form-label">Tỉnh:</label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatetinh"
                                name="tinh"
                                placeholder="Tỉnh"
                                required
                        />
                        <label  class="col-form-label">Ngày tạo chi nhánh</label
                        >
                        <input
                                type="date"
                                class="form-control"
                                id="updatengayTaoChiNhanh"
                                name="updatengayTaoChiNhanh"
                                placeholder="mm/dd/yyyy"
                                required
                        />
                        <label  class="col-form-label">Số điện thoại</label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatesdt"
                                name="sdt"
                                placeholder="Số điện thoại"
                                required
                        />
                        <label   class="col-form-label">Mã giám đốc</label>
                        <input
                                type="text"
                                class="form-control"
                                id="updatemagiamdoc"
                                name="maGiamDoc"
                                placeholder="Mã giám đốc"
                                required
                        />
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
<!-- Xóa chi nhánh -->
<div class="modal fade" id="XoaChiNhanh" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">
                    Bạn có muốn xóa chi nhánh này!?
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="<%=request.getContextPath()%>/deletechinhanh" method="post">
                <div class="modal-body">
                    <p style="font-size: 16px" id = "ConfirmID">
                    </p>
                    <input  name="xoamaChiNhanh" id="xoamaChiNhanh" type="hidden" required/>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn w-25 font-weight-bold btn-warning"
                            data-bs-dismiss="modal">
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
        let magiamdoc = row.cells[8].innerHTML;
        document.getElementById("MaNhanVien").value = magiamdoc;
        ClearSpaces("MaNhanVien");

        for (var i = 0; i < list.length; i++) {
            let emp = list[i];
            if(emp.mataikhoan == document.getElementById("MaNhanVien").value)
            {

                document.getElementById("MaNhanVien").value = emp.mataikhoan;
                document.getElementById("HoVaTen").value = emp.hoTen;
                document.getElementById("NgaySinh").value = emp.ngaySinh;
                document.getElementById("GioiTinh").value = emp.gioitinh;
                document.getElementById("DiaChi").value = emp.soNha + ", " + emp.xa + ", " + emp.huyen + ", " + emp.tinh;
                document.getElementById("Email").value = emp.email;
                document.getElementById("SoDienThoai").value = emp.sdt;
                document.getElementById("HeSoLuong").value = emp.heSoLuong;
                document.getElementById("NgayVaoLam").value = emp.ngayBatDauLam;
                document.getElementById("CCCD").value = emp.cccd;
                document.getElementById("TrangThai").value = emp.trangThai;
            }

        }

    }
    function DisplayInfoChiNhanh(e) {
        let list = <%= jsonchinhanh%>;
        let row = e.target.parentNode;
        let machinhanh = row.cells[0].innerHTML;
        document.getElementById("updatemaChiNhanh").value = machinhanh;
        ClearSpaces("updatemaChiNhanh");

        for (var i = 0; i < list.length; i++) {
            let emp = list[i];

            if(emp.maChiNhanh == document.getElementById("updatemaChiNhanh").value)
            {
                document.getElementById("updatemaChiNhanh").value = emp.maChiNhanh;
                document.getElementById("updatetenChiNhanh").value = emp.tenChiNhanh;
                document.getElementById("updatesoNha").value = emp.soNha;
                document.getElementById("updatexa").value = emp.xa;
                document.getElementById("updatehuyen").value = emp.huyen;
                document.getElementById("updatetinh").value = emp.tinh;
                document.getElementById("updatengayTaoChiNhanh").value = emp.ngayTaoChiNhanh;
                document.getElementById("updatesdt").value = emp.sdt;
                document.getElementById("updatemagiamdoc").value = emp.maGiamDoc;
            }

        }

    }
    function ClearSpaces(id){
        var value = document.getElementById(id).value; // get the value of the input element
        var newValue = value.replace(/\s+/g, ""); // replace all whitespace characters with an empty string
        document.getElementById(id).value = newValue; // set the new value of the input element
    }

    function ConfirmID(e){
        let row = e.target.parentNode;
        let maChiNhanh = row.cells[0].innerHTML
        ClearSpaces("updatemaChiNhanh");

        document.getElementById("xoamaChiNhanh").value = maChiNhanh;
        ClearSpaces("xoamaChiNhanh");
        if(maChiNhanh != null)
            document.getElementById("ConfirmID").innerHTML = "Bạn có chắc chắn muốn xóa chi nhánh "+maChiNhanh+" không? Hành động này không thể hoàn tác.";
        else
            document.getElementById("ConfirmID").innerHTML = "Hãy chọn một chi nhánh trước khi thực hiện thao tác này."
    }
</script>
</body>

</html>