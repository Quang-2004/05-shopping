<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Show User - Table Users</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    .myLink {
                        text-decoration: none;
                        color: white;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <!-- HEADER -->
                <jsp:include page="../layout/header.jsp"></jsp:include>
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp"></jsp:include>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a> / Users</li>
                                </ol>
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h2>Table Users</h2>
                                            <button type="button" class="btn btn-primary"><a href="/admin/user/create"
                                                    class="myLink">Create a user</a></button>

                                        </div>
                                        <hr>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col">Role</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <c:forEach var="user" items="${users}">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">${user.getId()}</th>
                                                        <td>${user.getEmail()}</td>
                                                        <td>${user.getFullName()}</td>
                                                        <td>${user.getRole().getName()}</td>
                                                        <td>
                                                            <a href="/admin/user/${user.uuid}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/user/update/${user.uuid}"
                                                                class="btn btn-warning">Update</a>
                                                            <a href="/admin/user/delete/${user.uuid}"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>
                                        </table>
                                        <!--PAGINATION-->
                                        <c:if test="${totalPages gt 1}">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="page-link ${currentPage eq 1 ? 'disabled ' : ''}"
                                                            href="/admin/user?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>

                                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">

                                                        <li
                                                            class="page-item ${currentPage eq loop.index ? 'active ' : ''}">
                                                            <a class="page-link" href="/admin/user?page=${loop.index}">
                                                                ${loop.index}
                                                            </a>
                                                        </li>
                                                    </c:forEach>

                                                    <li class="page-item">
                                                        <a class="page-link ${currentPage eq totalPages ? 'disabled ' : ''}"
                                                            href="/admin/user?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </c:if>

                                        <!--END PAGINATION-->
                                    </div>
                                </div>
                            </div>

                        </main>
                        <!-- FOOTER -->
                        <jsp:include page="../layout/footer.jsp"></jsp:include>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>