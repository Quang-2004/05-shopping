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
            </head>

            <body>

                <!-- Header Start -->
                <jsp:include page="../layout/header.jsp" />
                <!-- Header End -->

                <!-- Breadcrumb Start -->
                <div class="container-fluid" style="margin-top: 160px !important;">
                    <div class="row px-xl-5">
                        <div class="col-12">
                            <nav class="breadcrumb bg-light mb-30">
                                <a class="breadcrumb-item text-dark" href="#">Home</a>
                                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                                <span class="breadcrumb-item active">Checkout</span>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->


                <!-- Cart Start -->
                <div class="container-fluid">
                    <div class="row px-xl-5">
                        <div class="col-lg-12 table-responsive mb-5">
                            <table class="table table-light table-borderless table-hover text-center mb-0">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Tên</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tổng</th>
                                    </tr>
                                </thead>
                                <tbody class="align-middle">
                                    <c:forEach items="${cartDetails}" var="cartDetail" varStatus="status">
                                        <tr>
                                            <td class="align-items-start"><img
                                                    src="/images/product/${cartDetail.product.image}" alt=""
                                                    style="width: 50px;"></td>
                                            <td class="align-middle">${cartDetail.product.name}</td>
                                            <td class="align-middle">
                                                <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                            </td>
                                            <td class="align-middle">
                                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                                    <input type="text" disabled="true"
                                                        class="form-control form-control-sm bg-secondary border-0 text-center"
                                                        value="${cartDetail.quantity}">
                                                </div>
                                            </td>
                                            <td>
                                                <p class="align-middle">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                </p>
                                            </td>
                                            
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="row col-lg-12">
                            <div class="col">
                                <h5 class="section-title position-relative text-uppercase mb-3"><span
                                        class="bg-secondary pr-3"><i class="fas fa-map-marker-alt" style="color: red;"></i> Địa chỉ nhận hàng</span></h5>
                                <div class="bg-light p-30 mb-5">
                                    <c:if test="${not empty address}">
                                        <div class="border-bottom pb-2">
                                            <div class="d-flex justify-content-between">
                                                <p data-cart-total-price="${totalPrice}">
                                                    ${address.receiverName} ( ${address.receiverPhone} )
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h6 class="font-weight-medium">${address.receiverAddress}</h6>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <a href="/account/change-address">+ Thay đổi</a>
                                            </div>
                                        </div>
                                    </c:if>
                                    
                                    
                                </div>
                            </div>
                            <div class="col">
                                <h5 class="section-title position-relative text-uppercase mb-3"><span
                                        class="bg-secondary pr-3">Chi tiết giỏ hàng</span></h5>
                                <div class="bg-light p-30 mb-5">
                                    <div class="border-bottom pb-2">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h6>Tạm tính</h6>
                                            <p data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="font-weight-medium">Phí ship</h6>
                                            <h6 class="font-weight-medium">0</h6>
                                        </div>
                                    </div>
                                    <div class="pt-2">
                                        <div class="d-flex justify-content-between mt-2">
                                            <h5>Tổng</h5>
                                            <p data-cart-total-price="${totalPrice}">
                                                <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                            </p>
                                        </div>
                                        <form action="/place-order" method="get">
                                            <button type="submit" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Thanh
                                                toán</button>
                                        </form>
                                           
                                        
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>

                </div>



                <!-- Cart End -->


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