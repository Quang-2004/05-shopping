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
                <link href="/client/img/favicon.ico" rel="icon">

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

            </head>

            <body>


                <!-- Header Start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Header End -->


                <!-- Carousel Start -->
                <jsp:include page="layout/carousel.jsp" />
                <!-- Carousel End -->


                <!-- Products Start -->
                <div class="container-fluid pt-5 pb-3">
                    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
                        <span class="bg-secondary pr-3">Sản phẩm nổi bật</span>
                    </h2>

                    <div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 px-xl-5">
                        <c:forEach items="${products}" var="product">
                            <div class="col pb-1">
                                <div class="product-item bg-light mb-3">
                                    <div class="product-img position-relative overflow-hidden">
                                        <a href="/product/${product.id}">
                                            <img class="img-fluid w-100" src="/images/product/${product.image}" alt="">
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
                    </div>
                </div>
                <!-- Products End -->

                <!--PAGINATION-->
                <c:if test="${totalPages gt 1}">
                    <div class="col-12">
                        <nav>
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${currentPage eq 1 ? 'disabled' :''}">
                                    <a class="page-link" href="/?page=${currentPage - 1}">&#8592;</a>
                                </li>
                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                    <li class="page-item ${currentPage eq loop.index ? 'active ' : ''}">
                                        <a class="page-link" href="/?page=${loop.index}">
                                            ${loop.index}
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${currentPage eq totalPages ? 'disabled' :''}">
                                    <a class="page-link" href="/?page=${currentPage + 1}">&#8594;</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:if>
                <!--END PAGINATION-->



                <!-- Featured Start -->
                <jsp:include page="../layout/feature.jsp" />
                <!-- Featured End -->

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

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

                <script>
                    // Toggle dropdown menu khi click
                    const avatar = document.querySelector('.starlitCircle');
                    const dropdownMenu = document.querySelector('#dropdownMenu');

                    avatar.addEventListener('click', () => {
                        dropdownMenu.classList.toggle('active');
                    });

                    // Đóng dropdown khi click ra ngoài
                    document.addEventListener('click', (e) => {
                        if (!avatar.contains(e.target) && !dropdownMenu.contains(e.target)) {
                            dropdownMenu.classList.remove('active');
                        }
                    });
                </script>
            </body>

            </html>