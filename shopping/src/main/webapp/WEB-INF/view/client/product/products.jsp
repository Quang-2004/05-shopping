<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>MultiShop - Online Shop Website Template</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="Free HTML Templates" name="keywords">
                <meta content="Free HTML Templates" name="description">

                <!-- Favicon -->
                <link href="img/favicon.ico" rel="icon">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.gstatic.com">
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
                    rel="stylesheet">

                <!-- Font Awesome -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/animate/animate.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

            </head>

            <body>
                <!-- Header Start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Header End -->


                <!-- Breadcrumb Start -->
                <div class="container-fluid " style="margin-top: 146px !important;">
                    <div class="row px-xl-5">
                        <div class="col-12">
                            <nav class="breadcrumb bg-light mb-30">
                                <a class="breadcrumb-item text-dark" href="#">Home</a>
                                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                                <span class="breadcrumb-item active">Shop List</span>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->


                <!-- Shop Start -->
                <div class="container-fluid">
                    <div class="row px-xl-5">
                        <!-- Shop Sidebar Start -->
                        <jsp:include page="layout/sidebar-filter-product.jsp" />
                        <!-- Shop Sidebar End -->


                        <!-- Shop Product Start -->
                        <div class="col-lg-9 col-md-8">
                            <div class="row pb-3">
                                <div class="col-12 pb-1">
                                    <div class="d-flex align-items-center justify-content-between mb-4">

                                        <div style="margin-top: 20px;">
                                            <c:if test="${totalProducts gt 0}">
                                                <p>Tìm thấy ${totalProducts} kết quả.</p>
                                            </c:if>
                                        </div>
                                        <div class="ml-2">
                                            <div class="btn-group">Sắp xếp theo</div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-light dropdown-toggle"
                                                    data-toggle="dropdown">Sắp xếp</button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#">Giá cả: Tăng dần</a>
                                                    <a class="dropdown-item" href="#">Giá cả: Giảm dần</a>
                                                    <a class="dropdown-item" href="#">Đánh giá tốt nhất</a>
                                                </div>
                                            </div>
                                            <div class="btn-group ml-2">
                                                <button type="button" class="btn btn-sm btn-light dropdown-toggle"
                                                    data-toggle="dropdown">Số sản phẩm</button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#">10</a>
                                                    <a class="dropdown-item" href="#">20</a>
                                                    <a class="dropdown-item" href="#">30</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${totalPages eq 0}">
                                    <div class="container">
                                        <div class="row d-flex justify-content-center align-items-center"
                                            style="min-height: 300px;">
                                            <div class="col text-center">
                                                <img src="/client/img/cant-find-product.png" alt="Can't find product"
                                                    style="width: 400px; height: 270px;"> <br>
                                                Rất tiếc, chúng tôi không tìm thấy sản phẩm. <br> <br>
                                                <button class="btn btnDeleteFilter border-4 btn-outline-success px-4 py-3 rounded-pill">
                                                    Xóa bộ lọc</button>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                                <c:forEach items="${products}" var="product">
                                    <div class="col-6 col-sm-6 col-md-6 col-lg-3 pb-1">
                                        <div class="product-item bg-light mb-4">
                                            <div class="product-img position-relative overflow-hidden">
                                                <a href="/product/${product.id}">
                                                    <img class="img-fluid w-100" src="/images/product/${product.image}"
                                                        alt="">
                                                </a>
                                            </div>
                                            <div class="text-left py-4">
                                                <div class="h6 text-decoration-none text-truncate product-name ml-3">
                                                    ${product.name}</div>
                                                <div class="d-flex align-items-center justify-content-start mt-3">
                                                    <h5 class="product-price  ml-3" style="color: rgb(234, 129, 23);">
                                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                    </h5>
                                                    <h6 class="text-muted ml-2" style="color: rgb(234, 129, 23) !important;">
                                                        -10%</h6>
                                                </div>
                                                <div
                                                    class="d-flex align-items-center justify-content-start mb-1 product-rating ml-3">
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <c:if test="${product.totalRating eq 0}">
                                                        <small>(0)</small>
                                                    </c:if>
                                                    <c:if test="${product.totalRating gt 0}">
                                                        <small>(<fmt:formatNumber value="${product.totalRating / product.totalReview}" pattern="#.##" />)</small>
                                                    </c:if>
                                                    <span class="ml-3"><small>Đã bán 345k</small></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                                <!--PAGINATION-->
                                <c:if test="${totalPages gt 1}">

                                    <div class="col-12">
                                        <nav>
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ${currentPage eq 1 ? 'disabled' :''}"><a
                                                        class="page-link"
                                                        href="/products?page=${currentPage - 1}${queryString}">&#8592;</a>
                                                </li>
                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                    <li
                                                        class="page-item  ${currentPage eq loop.index ? 'active ' : ''}">
                                                        <a class="page-link"
                                                            href="/products?page=${loop.index}${loop.index ne currentPage ? queryString : ''}">
                                                            ${loop.index}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item ${currentPage eq totalPages ? 'disabled' :''}"><a
                                                        class="page-link"
                                                        href="/products?page=${currentPage + 1}${queryString}">&#8594;</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </c:if>
                                <!--END PAGINATION-->
                            </div>
                        </div>
                        <!-- Shop Product End -->
                    </div>
                </div>
                <!-- Shop End -->


                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

                <!-- Contact Javascript File -->
                <script src="/client/mail/jqBootstrapValidation.min.js"></script>
                <script src="/client/mail/contact.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>