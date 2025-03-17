<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

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
            <div class="container-fluid  hero-header" style="margin-top: 146px !important;">
                <div class="row px-xl-5">
                    <div class="col-lg-8">
                        <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0"
                            data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#header-carousel" data-slide-to="1"></li>
                                <li data-target="#header-carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item position-relative active" style="height: 430px;">
                                    <img class="position-absolute w-100 h-100" src="/client/img/carousel-1.jpg"
                                        style="object-fit: cover;">
                                    <div
                                        class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">
                                                Men Fashion</h1>
                                            <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum
                                                magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam
                                                elitr ipsum diam</p>
                                            <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                                href="#">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item position-relative" style="height: 430px;">
                                    <img class="position-absolute w-100 h-100" src="/client/img/carousel-2.jpg"
                                        style="object-fit: cover;">
                                    <div
                                        class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">
                                                Women Fashion</h1>
                                            <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum
                                                magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam
                                                elitr ipsum diam</p>
                                            <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                                href="#">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item position-relative" style="height: 430px;">
                                    <img class="position-absolute w-100 h-100" src="/client/img/carousel-3.jpg"
                                        style="object-fit: cover;">
                                    <div
                                        class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                        <div class="p-3" style="max-width: 700px;">
                                            <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">
                                                Kids Fashion</h1>
                                            <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Lorem rebum
                                                magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam
                                                elitr ipsum diam</p>
                                            <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
                                                href="#">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="product-offer mb-30" style="height: 200px;">
                            <img class="img-fluid" src="/client/img/offer-1.jpg" alt="">
                            <div class="offer-text">
                                <h6 class="text-white text-uppercase">Save 20%</h6>
                                <h3 class="text-white mb-3">Special Offer</h3>
                                <a href="" class="btn btn-primary">Shop Now</a>
                            </div>
                        </div>
                        <div class="product-offer mb-30" style="height: 200px;">
                            <img class="img-fluid" src="/client/img/offer-2.jpg" alt="">
                            <div class="offer-text">
                                <h6 class="text-white text-uppercase">Save 20%</h6>
                                <h3 class="text-white mb-3">Special Offer</h3>
                                <a href="" class="btn btn-primary">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carousel End -->



            <!-- Categories Start -->
            <div class="container-fluid pt-5">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span
                        class="bg-secondary pr-3">Categories</span></h2>
                <div class="row px-xl-5 pb-3">
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-1.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-2.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-3.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-4.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-4.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-3.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-2.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-1.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-2.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-1.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-4.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <a class="text-decoration-none" href="">
                            <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                    <img class="img-fluid" src="/client/img/cat-3.jpg" alt="">
                                </div>
                                <div class="flex-fill pl-3">
                                    <h6>Category Name</h6>
                                    <small class="text-body">100 Products</small>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- Categories End -->


            <!-- Products Start -->
            <div class="container-fluid pt-5 pb-3">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span
                        class="bg-secondary pr-3">Featured Products</span></h2>

                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 px-xl-5">
                    <c:forEach items="${products}" var="product">
                        <div class="col pb-1">
                            <div class="product-item bg-light mb-3">
                                <div class="product-img position-relative overflow-hidden">
                                    <a href="/product/${product.id}">
                                        <img class="img-fluid w-100" src="/images/product/${product.image}" alt="">
                                    </a>
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href="">${product.name}</a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5>${product.price} Đ</h5>
                                        <h6 class="text-muted ml-2"><del>${product.price} Đ</del></h6>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center mb-1">
                                        <small class="fa fa-star text-primary mr-1"></small>
                                        <small class="fa fa-star text-primary mr-1"></small>
                                        <small class="fa fa-star text-primary mr-1"></small>
                                        <small class="fa fa-star text-primary mr-1"></small>
                                        <small class="fa fa-star text-primary mr-1"></small>
                                        <small>(99)</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>


            <!-- Products End -->


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