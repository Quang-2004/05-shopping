<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            const selectAllCheckbox = document.getElementById("selectAll");
                            const itemCheckboxes = document.querySelectorAll(".item-checkbox");
                
                            // Khi chọn "Chọn tất cả"
                            selectAllCheckbox.addEventListener("change", function() {
                                itemCheckboxes.forEach(checkbox => {
                                    checkbox.checked = selectAllCheckbox.checked;
                                });
                            });
                
                            // Khi chọn/bỏ chọn từng sản phẩm
                            itemCheckboxes.forEach(checkbox => {
                                checkbox.addEventListener("change", function() {
                                    selectAllCheckbox.checked = [...itemCheckboxes].every(cb => cb.checked);
                                });
                            });
                        });
                    </script>
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
                                    <span class="breadcrumb-item active">Shopping Cart</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Breadcrumb End -->


                    <!-- Cart Start -->
                    <div class="container-fluid">
                        <c:if test="${empty cartDetails}">
                            <div class="container">
                               
                            </div>
                            <div class="col-sm-12 empty-cart-cls text-center">
                                <img src="https://cdn-icons-png.flaticon.com/512/11329/11329060.png" width="200" height="200"
                                    class="img-fluid mb-4 mr-3">
                                <h3><strong>Giỏ hàng của bạn trống trơn hà</strong></h3>
                                <h4>Đi lựa đồ thôi nè :)</h4>
                                <a href="/" class="btn btn-primary cart-btn-transform m-3">Mua sắm
                                    thôi!</a>


                            </div>
                        </c:if>
                        <c:if test="${not empty cartDetails}">
                            <div class="row px-xl-5">
                                <div class="col-lg-12 table-responsive mb-5">
                                    <table class="table table-light table-borderless table-hover text-center mb-0">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>
                                                    <input class="align-middle" type="checkbox" id="selectAll">
                                                </th>
                                                <th>Sản phẩm</th>
                                                <th>Tên</th>
                                                <th>Giá</th>
                                                <th>Số lượng</th>
                                                <th>Tổng</th>
                                                <th>Xóa</th>
                                            </tr>
                                        </thead>
                                        <tbody class="align-middle">
                                            <c:forEach items="${cartDetails}" var="cartDetail" varStatus="status">
                                                <tr>
                                                    <th class="align-middle">
                                                        <input class="align-middle item-checkbox" type="checkbox" value="" aria-checked="false">
                                                    </th>
                                                    <td class="align-items-start"><img
                                                            src="/images/product/${cartDetail.product.image}" alt=""
                                                            style="width: 50px;"></td>
                                                    <td class="align-middle">${cartDetail.product.name}</td>
                                                    <td class="align-middle">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                    </td>
                                                    <td class="align-middle">
                                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-sm btn-minus">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text"
                                                                class="form-control form-control-sm bg-secondary border-0 text-center"
                                                                value="${cartDetail.quantity}"
                                                                data-cart-detail-id="${cartDetail.id}"
                                                                data-cart-detail-price="${cartDetail.price}"
                                                                data-cart-detail-index="${status.index}">
                                                            <div class="input-group-btn">
                                                                <button class="btn btn-sm btn-plus">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle">
                                                        <p style="margin-top: 20px !important;" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                        </p>
                                                    </td>
                                                    <td class="align-middle">
                                                        <form method="post" action="/delete-product-from-cart/${cartDetail.product.id}">
                                                            <!-- csrf token -->
                                                            <input type="hidden"
                                                            name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                            <button class="btn btn-md rounded-circle bg-light border">
                                                                <i class="fa fa-times text-danger"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                    
                                                    
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-lg-12">
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
                                            <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div style="display: none;">
                                                    <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                        varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.id}"
                                                                    path="cartDetails[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.quantity}"
                                                                    path="cartDetails[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button type="submit"
                                                    class="btn btn-block btn-primary font-weight-bold my-3 py-3">Xác
                                                    nhận
                                                    thanh
                                                    toán</button>
                                            </form:form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>


                    </div>



                    <!-- Cart End -->


                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script
                        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
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