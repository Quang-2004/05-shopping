<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - SB Product</title>
                    <link href="../css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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
                                    <h1 class="mt-4">Dashboard</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">
                                            <a href="/admin">Dashboard</a> / Products
                                        </li>
                                    </ol>
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h2>Table Products</h2>
                                                <button type="button" class="btn btn-primary"><a
                                                        href="/admin/product/create" class="myLink">Create a
                                                        product</a></button>

                                            </div>
                                            <hr>
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Factory</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <c:forEach var="product" items="${products}">
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">${product.getId()}</th>
                                                            <td>${product.getName()}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.getPrice()}" /> đ
                                                            </td>
                                                            <td>${product.getFactory()}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.slug}-${product.getId()}"
                                                                    class="btn btn-success">View</a>
                                                                <a href="/admin/product/update/${product.slug}-${product.getId()}"
                                                                    class="btn btn-warning">Update</a>
                                                                <a href="/admin/product/delete/${product.slug}-${product.getId()}"
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
                                                                href="/admin/product?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">

                                                            <li
                                                                class="page-item ${currentPage eq loop.index ? 'active ' : ''}">
                                                                <a class="page-link"
                                                                    href="/admin/product?page=${loop.index}">
                                                                    ${loop.index}
                                                                </a>
                                                            </li>
                                                        </c:forEach>

                                                        <li class="page-item">
                                                            <a class="page-link ${currentPage eq totalPages ? 'disabled ' : ''}"
                                                                href="/admin/product?page=${currentPage + 1}"
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