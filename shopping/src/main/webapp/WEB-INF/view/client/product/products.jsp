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
                        <div class="col-lg-3 col-md-4">
                            <!-- Price Start -->
                            <h5 class="section-title position-relative text-uppercase mb-3"><span
                                    class="bg-secondary pr-3">Giá cả</span></h5>
                            <div class="bg-light p-4 mb-30" id="priceFilter">
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="price-1" value="duoi-500">
                                    <label class="custom-control-label" for="price-1">0 - 500.000 đ</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="price-2"
                                        value="500-den-1-trieu">
                                    <label class="custom-control-label" for="price-2">500.000 - 1 triệu</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="price-3"
                                        value="1-den-1-trieu-500">
                                    <label class="custom-control-label" for="price-3">1 - 1.5 triệu</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="price-4"
                                        value="1-trieu-500-den-2-trieu">
                                    <label class="custom-control-label" for="price-4">1.5 - 2 triệu</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                                    <input type="checkbox" class="custom-control-input" id="price-5"
                                        value="2-trieu-den-2-trieu-500">
                                    <label class="custom-control-label" for="price-5">2- 2.5 triệu</label>
                                </div>
                            </div>
                            <!-- Price End -->

                            <!-- Factory Start -->
                            <h5 class="section-title position-relative text-uppercase mb-3"><span
                                    class="bg-secondary pr-3">Nhãn hàng</span></h5>
                            <div class="bg-light p-4 mb-30" id="factoryFilter">
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="factory-1" value="NIKE">
                                    <label class="custom-control-label" for="factory-1">Nike</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="factory-2" value="ADIDAS">
                                    <label class="custom-control-label" for="factory-2">Adidas</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="factory-3" value="HM">
                                    <label class="custom-control-label" for="factory-3">H&M</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" id="factory-4" value="GUCCI">
                                    <label class="custom-control-label" for="factory-4">Gucci</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                                    <input type="checkbox" class="custom-control-input" id="factory-5" value="ZARA">
                                    <label class="custom-control-label" for="factory-5">Zara</label>
                                </div>
                            </div>
                            <!-- Factory End -->

                            <!-- Sort Start -->
                            <h5 class="section-title position-relative text-uppercase mb-3"><span
                                    class="bg-secondary pr-3">Sắp xếp</span></h5>
                            <div class="bg-light p-4 mb-30" id="sortFilter">
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" id="sort-1" value="khong-sap-xep"
                                        name="radio-sort">
                                    <label class="custom-control-label" for="sort-1">Không sắp xếp</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" id="sort-2" value="tang-dan"
                                        name="radio-sort">
                                    <label class="custom-control-label" for="sort-2">Tăng dần</label>
                                </div>
                                <div
                                    class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio" class="custom-control-input" id="sort-3" value="giam-dan"
                                        name="radio-sort">
                                    <label class="custom-control-label" for="sort-3">Giảm dần</label>
                                </div>

                            </div>
                            <!-- Sort End -->

                            <div class="d-flex justify-content-center my-4">
                                <button class="btn border-4 btn-outline-success px-4 py-3 rounded-pill w-100"
                                    id="btnFilter">
                                    Lọc sản phẩm</button>
                            </div>
                        </div>
                        <!-- Shop Sidebar End -->


                        <!-- Shop Product Start -->
                        <div class="col-lg-9 col-md-8">
                            <div class="row pb-3">
                                <div class="col-12 pb-1">
                                    <div class="d-flex align-items-center justify-content-between mb-4">

                                        <div>
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
                                                <button
                                                    class="btn border-4 btn-outline-success px-4 py-3 rounded-pill"
                                                    id="btnDeleteFilter">
                                                    Xóa bộ lọc</button>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                                <c:forEach items="${products}" var="product">
                                    <div class="col-lg-3 col-md-6 col-sm-6 pb-1">
                                        <div class="product-item bg-light mb-4">
                                            <div class="product-img position-relative overflow-hidden">
                                                <a href="/product/${product.id}">
                                                    <img class="img-fluid w-100" src="/images/product/${product.image}"
                                                        alt="">
                                                </a>
                                            </div>
                                            <div class="text-center py-4">
                                                <div class="h6 text-decoration-none text-truncate">${product.name}</div>
                                                <div class="d-flex align-items-center justify-content-center mt-2">
                                                    <h5>
                                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                    </h5>
                                                    <h6 class="text-muted ml-2"><del>
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            đ
                                                        </del></h6>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-center mb-1">
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small class="fa fa-star text-primary mr-1"></small>
                                                    <small>(${product.totalReview})</small>
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
                                                        href="/products?page=${currentPage - 1}${queryString}">Previous</a>
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
                                                        href="/products?page=${currentPage + 1}${queryString}">Next</a>
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