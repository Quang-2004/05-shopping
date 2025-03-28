<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <div class="container-fluid py-5">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
                    <span class="bg-secondary pr-3">Có thể bạn sẽ thích</span>
                </h2>
                <div class="row px-xl-5">
                    <c:forEach items="${productSuggestions}" var="product">
                        <div class="col-lg-2 col-md-4 col-6 mb-4">
                            <!-- 6 cột trên màn lớn, 4 cột trên md, 2 cột trên sm -->
                            <div class="product-item bg-light">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="/images/product/${product.image}" alt="">
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href="">${product.name}</a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5 class="product-price ml-3" style="color: rgb(234, 129, 23);">
                                            <fmt:formatNumber type="number" value="${product.price}" /> đ
                                        </h5>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center mb-1">
                                        <small class="fa fa-star text-primary mr-1"></small>
                                        <c:if test="${product.totalRating eq 0}">
                                            <small>(0)</small>
                                        </c:if>
                                        <c:if test="${product.totalRating gt 0}">
                                            <small>(
                                                <fmt:formatNumber value="${product.totalRating / product.totalReview}"
                                                    pattern="#.##" />)
                                            </small>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>