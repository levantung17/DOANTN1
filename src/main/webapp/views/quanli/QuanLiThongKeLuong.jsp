<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/25/2023
  Time: 10:51 PM
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
            rel="stylesheet" />
    <!-- Link boostrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous" />
    <!-- Link boostrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <!-- Link fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/quanli.css" />
    <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <title>Quản lí - Lương</title>
</head>
<body>
<script src="https://use.fontawesome.com/f59bcd8580.js"></script>
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
                <a class="mt-3" href="<%=request.getContextPath()%>/infoEmployee"><i class="fa fa-drivers-license"></i>Cập nhật thông tin</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/views/quanli/QuanLiGuiMail.jsp"><i class="fa fa-commenting-o"></i>Gửi mail</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listChiNhanh"><i class="fa fa-location-arrow"></i>Quản lý chi
                    nhánh</a>
            </li>

            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listphongban"><i class="fa fa-sitemap"></i>Quản lý phòng
                    ban</a>
            </li>
            <li>
                <a class="mt-3" href="<%=request.getContextPath()%>/listemployee"><i class="fa fa-users"></i>Quản lý nhân viên</a>
            </li>
            <li class="active">
                <a class="mt-3" href="<%=request.getContextPath()%>/listSalary"><i class="fa fa-bar-chart"></i>Thống kê tiền lương</a>
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
                <p class="page-header text-center">Thống kê lương</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 d-flex flex-column">
                <div class="panel panel-default">
                    <div class="panel-heading">Danh sách lương nhân viên</div>
                    <div class="panel-body">
                        <div class="scroll-bar">
                            <div class="table-responsive">
                                <table
                                        class="table table-striped table-bordered table-hover"
                                        id="dtVerticalScrollExample"
                                >
                                    <thead>
                                    <tr>
                                        <th>Mã nhân viên</th>
                                        <th>Tên nhân viên</th>
                                        <th>Vị trí công tác</th>
                                        <th>Hệ số lương</th>
                                        <th>Lương cơ bản</th>
                                        <th>Tổng lương</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="info" items="${listInfoSalary}">
                                        <tr>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.maNV}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.hoTen}" />
                                            </td>
                                            <td style="min-width: 90px;">
                                                <c:out value="${info.tenChucVu}" />
                                            </td>
                                            <td style="min-width: 100px;">
                                                <c:out value="${info.heSo}" />
                                            </td>
                                            <td style="min-width: 160px;">
                                                <c:out value="${info.luongcoban}" />
                                            </td>
                                            <td style="min-width: 150px;">
                                                <c:out value="${info.tongluong}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <a href="<%=request.getContextPath()%>/listSalary">Hiển thị danh sách</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-flex flex-column">
                <form action="<%=request.getContextPath()%>/findSalary" method="post">
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
                                class="d-flex ms-3 mt-3 justify-content-around align-items-around"
                        >
                            <input class="form-control w-50" placeholder="Tìm kiếm" name="text_box_find" id="text_box_find" onkeyup = "Search()"/>
                            <button
                                    type="button submit"
                                    class="btn w-25 ms-3 font-weight-bold btn-submit"
                            >
                                Tìm
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-5 d-flex flex-column">
                <div class="panel-heading" style="font-weight: 600">
                    Các tùy chọn khác
                </div>
                <div class="d-flex justify-content-evenly align-items-between">
                    <div class="panel-heading" style="font-weight: 400">
                        Xuất ra excel
                    </div>
                    <button
                            type="submit"
                            class="btn w-25 ms-5 font-weight-bold btn-success"
                            id="export"
                    >
                        <i class="fa fa-file-excel-o"></i> Xuất
                    </button>
                </div>
                <div class="d-flex mt-3 justify-content-evenly align-items-between">
                    <div class="panel-heading" style="font-weight: 400">
                        Tổng lương
                    </div>
                    <button
                            type="submit"
                            class="btn w-25 ms-5 font-weight-bold btn-submit"
                            data-bs-toggle="modal"
                            data-bs-target="#XemTongLuong"
                            onclick="CalculateSalary()"
                    >
                        Xem tổng
                    </button>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- TODO: Edit Modal HTML -->
<!-- ? Xem tong luong -->
<div
        class="modal fade"
        id="XemTongLuong"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Tổng lương</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <div class="panel-heading text-center" style="font-weight: 400">
                    Số tiền
                </div>
                <input
                        type="text"
                        class="form-control text-center"
                        placeholder="X.000.000VNĐ"
                        id="SumSalary"
                        disabled
                />
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn w-25 font-weight-bold btn-submit"
                        data-bs-dismiss="modal"
                >
                    Đóng
                </button>
            </div>
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

    function CalculateSalary()
    {
        let table = document.getElementById("dtVerticalScrollExample");
        let currecy = new Intl.NumberFormat("en-US");
        let totalSalary;
        let sum = 0;

        for (let i = 1; i < table.rows.length; i++) {
            let row = table.rows[i];

            if (row.style.display != "none") {

                let cell = row.cells[5].textContent;
                let number = cell.replace(/\,|,/g, "");
                let value = Number(number);
                sum += value;
            }
        }
        totalSalary = currecy.format(sum);
        document.getElementById("SumSalary").value = totalSalary + " VND";
    }
</script>

<script>
    document.getElementById('export').onclick=function(){
        var tableId= document.getElementById('dtVerticalScrollExample').id;
        htmlTableToExcel(tableId, filename = '');
    }

    var htmlTableToExcel= function(tableId, fileName = ''){

        var excelFileName='excel_table_data';
        var TableDataType = 'application/vnd.ms-excel';
        var selectTable = document.getElementById(tableId);
        var htmlTable = selectTable.outerHTML.replace(/ /g, '%20');

        filename = filename?filename+'.xls':excelFileName+'.xls';
        var excelFileURL = document.createElement("a");
        document.body.appendChild(excelFileURL);

        if(navigator.msSaveOrOpenBlob){
            var blob = new Blob(['\ufeff', htmlTable], {
                type: TableDataType
            });
            navigator.msSaveOrOpenBlob( blob, fileName);
        }else{

            excelFileURL.href = 'data:' + TableDataType + ', ' + htmlTable;
            excelFileURL.download = fileName;
            excelFileURL.click();
        }
    }
</script>

</body>
</html>
