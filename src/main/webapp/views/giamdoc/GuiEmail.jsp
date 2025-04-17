<%-- Created by IntelliJ IDEA. User: GIGABYTE Date: 11/24/2023 Time: 10:06 AM To change this template use File |
    Settings | File Templates. --%>
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
                rel="stylesheet" />

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/giamdoc.css" />
            <link href="${pageContext.request.contextPath}/img/logo.png" rel="icon" />
            <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
            <title>Giám đốc - Gửi mail</title>
        </head>

        <body>
            <script src="https://use.fontawesome.com/f59bcd8580.js"></script>
            <script>
                window.onload = function () {
                    let msg = "<%= request.getAttribute("Result")%>";
                    if (msg != "null")
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
                            <a class="mb-3" href="<%=request.getContextPath()%>/xemcautruc"><i class="fa fa-building-o"></i>Cấu trúc công ty</a>
                        </li>
                        <li>
                            <a class="mb-3" href="<%=request.getContextPath()%>/infoEmployee"><i class="fa fa-drivers-license"></i>Cập nhật
                                thông tin</a>
                        </li>
                        <li class="active">
                            <a class="mb-3" href="<%=request.getContextPath()%>/views/giamdoc/GuiEmail.jsp"><i class="fa fa-commenting-o"></i>Gửi mail</a>
                        </li>
                        <li>
                            <a class="mb-3" href="<%=request.getContextPath()%>/listphongban"><i class="fa fa-sitemap"></i>Quản lý phòng
                                ban</a>
                        </li>
                        <li>
                            <a class="mb-3" href="<%=request.getContextPath()%>/listemployee"><i class="fa fa-users"></i>Quản lý nhân viên</a>
                        </li>
                        <li>
                            <a class="mb-3" href="<%=request.getContextPath()%>/listSalary"><i class="fa fa-bar-chart"></i>Thống kê tiền lương</a>
                        </li>
                    </ul>
                </aside>

                <div id="navbar-wrapper">
                    <nav class="navbar navbar-inverse">
                        <div class="container-fluid">
                            <div class="navbar-header d-flex justify-content-between align-items-center">
                                <div>
                                    <a href="#" class="navbar-brand" id="sidebar-toggle"><i class="fa fa-bars"></i></a>
                                </div>
                                <div ng-app="myApp" ng-controller="myCtrl">
                                    <p>
                                        Current Time:
                                        <b>{{TimeNow}}</b>
                                    </p>
                                </div>
                                <div class="navbar-text">
                                    <h3>Xin chào giám đốc</h3>
                                    <a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out icon-size"></i></a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>

                <section id="content-wrapper">
                    <div class="row p-3">
                        <div class="col-lg-12">
                            <p class="page-header text-center">Gửi mail</p>
                        </div>
                        <div class="col-lg-12">
                            <div class="container my-5">
                                <div class="row justify-content-center">
                                    <div class="col-lg-9">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <form action="<%=request.getContextPath()%>/sendemail" method="post">
                                                    <div class="row g-3">
                                                        <div class="col-md-12">
                                                            <label for="received-email" class="form-label">Địa chỉ mail
                                                                nhận:
                                                                <i class="required-place">*</i>
                                                            </label>
                                                            <input type="email" class="form-control" id="received-email"
                                                                name="received-email" required />
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="title-email" class="form-label">Tiêu đề:
                                                            </label>
                                                            <input type="text" class="form-control" id="title-email"
                                                                name="title-email" />
                                                        </div>
                                                        <div class="col-12">
                                                            <label for="content-email" class="form-label">Nội dung:
                                                                <i class="required-place">*</i>
                                                            </label>
                                                            <textarea class="form-control" id="content-email"
                                                                name="content-email" rows="5" required></textarea>
                                                        </div>
                                                        <div class="col-12 text-center">
                                                            <button type="submit"
                                                                class="btn w-25 font-weight-bold btn-submit">
                                                                Gửi
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <script src="${pageContext.request.contextPath}/js/NhanVien.js"></script>
        </body>

        </html>