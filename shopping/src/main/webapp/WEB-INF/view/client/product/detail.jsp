<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>${product.name}</title>
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

                <meta name="_csrf" content="${_csrf.token}" />
                <!-- default header is X-CSRF_TOKEN-->
                <meta name="_csrf_header" content="${_csrf.headerName}" />
                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">
            </head>

            <body>

                
                <!-- Navbar Start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Navbar End -->

                <!-- Breadcrumb Start -->
                <div class="container-fluid" style="margin-top: 160px !important;">
                    <div class="row px-xl-5">
                        <div class="col-12">
                            <nav class="breadcrumb bg-light mb-30">
                                <a class="breadcrumb-item text-dark" href="/">Trang chủ</a>
                                <span class="breadcrumb-item active">Chi tiết sản phẩm</span>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->


                <!-- Shop Detail Start -->
                <div class="container-fluid pb-5">
                    <div class="row px-xl-5">
                        <div class="col-lg-5 mb-30">
                            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner bg-light">
                                    <div class="carousel-item active">
                                        <img class="w-100 h-100" src="/images/product/${product.image}" alt="Image">
                                    </div>
                                    <c:forEach items="${imageDetails}" var="imageDetail">
                                        <div class="carousel-item">
                                            <img class="w-100 h-100" src="/images/product/${imageDetail.imageProduct}"
                                                alt="Image">
                                        </div>
                                    </c:forEach>
                                </div>
                                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                                </a>
                                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-7 h-auto mb-30">
                            <div class="h-100 bg-light p-30">
                                <h3>${product.name}</h3>
                                <div class="d-flex mb-3">
                                    <div class="text-primary mr-2">
                                        <small class="fas fa-star"></small>
                                        <small class="fas fa-star"></small>
                                        <small class="fas fa-star"></small>
                                        <small class="fas fa-star"></small>
                                        <small class="fas fa-star"></small>
                                    </div>
                                    <small class="pt-1">(${product.totalReview} Reviews)</small>
                                </div>
                                <h3 class="font-weight-semi-bold mb-4">
                                    <fmt:formatNumber type="number" value="${product.price}" /> đ
                                </h3>
                                <p class="mb-4">${product.shortDesc}</p>
                                <div class="d-flex mb-3">
                                    <strong class="text-dark mr-3">Sizes:</strong>
                                    <div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="size-1" name="size">
                                            <label class="custom-control-label" for="size-1">XS</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="size-2" name="size">
                                            <label class="custom-control-label" for="size-2">S</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="size-3" name="size">
                                            <label class="custom-control-label" for="size-3">M</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="size-4" name="size">
                                            <label class="custom-control-label" for="size-4">L</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="size-5" name="size">
                                            <label class="custom-control-label" for="size-5">XL</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex mb-4">
                                    <strong class="text-dark mr-3">Colors:</strong>
                                    <div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="color-1" name="color">
                                            <label class="custom-control-label" for="color-1">Black</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="color-2" name="color">
                                            <label class="custom-control-label" for="color-2">White</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="color-3" name="color">
                                            <label class="custom-control-label" for="color-3">Red</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="color-4" name="color">
                                            <label class="custom-control-label" for="color-4">Blue</label>
                                        </div>
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" class="custom-control-input" id="color-5" name="color">
                                            <label class="custom-control-label" for="color-5">Green</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-4 pt-2">
                                    <div class="input-group quantity mr-3" style="width: 130px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-primary btn-minus">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control bg-secondary border-0 text-center"
                                            value="1" data-cart-detail-index="0">
                                        <div class="input-group-btn">
                                            <button class="btn btn-primary btn-plus">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- <form action="/add-product-to-cart" method="POST" modelAttribute="product"> -->
                                        <!-- csrf token -->
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="text" class="form-control d-none" value="${product.id}"
                                            name="id" />
                                        <input type="text" class="form-control d-none" id="cartDetails0.quantity"
                                            name="quantity" value="1" />
                                        <button data-product-id="${product.id}" class="btnAddToCart btn btn-primary px-3 m-lg-1">
                                            <i class="fa fa-shopping-cart mr-1"></i>Thêm vào giỏ hàng
                                        </button>
                                    <!-- </form> -->

                                    <button class="btn btn-primary px-3 mt-3">Mua hàng ngay</button>
                                </div>
                                <div class="d-flex pt-2">
                                    <strong class="text-dark mr-2">Share on:</strong>
                                    <div class="d-inline-flex">
                                        <a class="text-dark px-2" href="">
                                            <i class="fab fa-facebook-f"></i>
                                        </a>
                                        <a class="text-dark px-2" href="">
                                            <i class="fab fa-twitter"></i>
                                        </a>
                                        <a class="text-dark px-2" href="">
                                            <i class="fab fa-linkedin-in"></i>
                                        </a>
                                        <a class="text-dark px-2" href="">
                                            <i class="fab fa-pinterest"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--NAV TAB DESCRIPTION AND REVIEW-->
                    <jsp:include page="layout/nav-tabs-detail.jsp" />
                    <!--END NAV TAB DESCRIPTION AND REVIEW-->

                
                </div>
                <!-- Shop Detail End -->


                <!-- Products Suggesions Start -->
                <jsp:include page="layout/product-suggesion.jsp" />
                <!-- Products End -->


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
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
                <!-- JavaScript -->
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        // Lấy tất cả các nút lọc
                        const filterButtons = document.querySelectorAll(".filter-btn");

                        filterButtons.forEach(button => {
                            button.addEventListener("click", function () {
                                // Bỏ class 'btn-outline-danger active' khỏi tất cả các nút
                                filterButtons.forEach(btn => {
                                    btn.classList.remove("btn-outline-danger", "active");
                                    btn.classList.add("btn-light");
                                });

                                // Thêm class 'btn-outline-danger active' cho nút được chọn
                                this.classList.remove("btn-light");
                                this.classList.add("btn-outline-danger", "active");
                            });
                        });
                    });

                    
                </script>
            </body>

            </html>