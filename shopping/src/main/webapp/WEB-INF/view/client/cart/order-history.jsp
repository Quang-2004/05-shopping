<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>MultiShop - Order history</title>
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


                <jsp:include page="../layout/header.jsp" />

                <!-- Breadcrumb Start -->
                <div class="container-fluid" style="margin-top: 160px !important;">
                    <div class="row px-xl-5">
                        <div class="col-12">
                            <nav class="breadcrumb bg-light mb-30">
                                <a class="breadcrumb-item text-dark" href="/">Trang chủ</a>
                                <span class="breadcrumb-item active">Lịch sử mua hàng</span>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb End -->
                <div class="container-fluid">
                    <div class="row px-xl-5">
                        <div class="col-lg-12 table-responsive mb-5">
                            <table class="table table-light table-borderless table-hover text-center mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Tên sản phẩm</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Thành tiền</th>
                                        <th scope="col">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody class="align-middle">
                                    <c:forEach var="order" items="${orders}">
                                        <tr class="table-danger">
                                            <th scope="row">
                                                <div class="align-middle">
                                                    <label>Order id = ${order.id}</label>
                                                </div>
                                            </th>
                                            <td>
                                            </td>
                                            <td>
                                                <div class="align-middle">
                                                    <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group quantity mt-4" style="width: 100px;">
                                                </div>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <div class="align-middle">
                                                    <label>${order.status}</label>
                                                </div>
                                            </td>

                                        </tr>

                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <tr>
                                                <td class="align-middle">
                                                    <div class="align-middle">
                                                        <img src="/images/product/${orderDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </td>
                                                <td class="align-middle">
                                                    <p>
                                                        <a href="/product/${orderDetail.product.id}">
                                                            ${orderDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td class="align-middle">
                                                    <p>
                                                        <fmt:formatNumber type="number" value="${orderDetail.price}" />
                                                        đ
                                                    </p>
                                                </td>
                                                <td class="align-middle">
                                                    <p>
                                                        ${orderDetail.quantity}
                                                    </p>
                                                </td>
                                                <td class="align-middle">
                                                    <p data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${orderDetail.price * orderDetail.quantity}" />
                                                        đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <form action="/product-review" method="get">
                                                        <input type="hidden" name="productId"
                                                            value="${orderDetail.product.id}">
                                                        <input type="hidden" name="orderDetailId"
                                                            value="${orderDetail.id}">
                                                        <c:if test="${orderDetail.evaluated eq false}">
                                                            <div class="align-items-center"
                                                                style="margin-top: 20px !important;">
                                                                <button
                                                                    class="btn border-4 btn-outline-success px-4 py-3 rounded-pill">
                                                                    Đánh giá</button>
                                                            </div>
                                                        </c:if>
                                                    </form>
                                                    <c:if test="${orderDetail.evaluated eq true}">
                                                        <div class="align-items-center"
                                                            style="margin-top: 20px !important;">
                                                            <button
                                                                class="btn border-4 btn-outline-success px-4 py-3 rounded-pill">
                                                                Mua lại</button>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <jsp:include page="../layout/footer.jsp" />


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