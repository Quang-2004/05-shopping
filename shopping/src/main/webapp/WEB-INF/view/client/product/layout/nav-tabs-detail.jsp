<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="bg-light p-30">
                        <div class="nav nav-tabs mb-4">
                            <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
                            <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Đánh giá
                                (${product.totalReview})</a>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab-pane-1">
                                <h4 class="mb-3">Mô tả sản phẩm</h4>
                                <p>${product.detailDesc}</p>
                            </div>
                            <div class="tab-pane fade" id="tab-pane-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="review-section">
                                            <div class="row align-items-start justify-content-start">
                                                <!-- Điểm trung bình và ngôi sao -->
                                                <div class="col-md-2 text-center" style="color: red; font-size: 20px;">
                                                    <c:if test="${product.totalRating eq 0}">
                                                        <div class="rating-score">0 trên 5</div>
                                                    </c:if>
                                                    <c:if test="${product.totalRating gt 0}">
                                                        <div class="rating-score">

                                                            <fmt:formatNumber
                                                                value="${product.totalRating /product.totalReview}"
                                                                pattern="#.##" /> trên 5
                                                        </div>
                                                    </c:if>

                                                    <div class="stars">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>
                                                </div>
                                                <!-- Các nút lọc -->
                                                <div class="col-md-10">
                                                    <div class="d-flex flex-wrap me-auto">
                                                        <div class="nav nav-tabs">
                                                            <button class="btn btn-outline-danger filter-btn active"
                                                                data-filter="0">
                                                                <a class="nav-item nav-link text-dark active"
                                                                    data-toggle="tab" href="#tab-all">Tất cả</a>
                                                            </button>
                                                            <button class="btn btn-light filter-btn" data-filter="5">
                                                                <a class="nav-item nav-link text-dark" data-toggle="tab"
                                                                    href="#tab-rating-5">5 Sao
                                                                    (${total_rating_5})</a>
                                                            </button>
                                                            <button class="btn btn-light filter-btn" data-filter="4">
                                                                <a class="nav-item nav-link text-dark" data-toggle="tab"
                                                                    href="#tab-rating-4">4 Sao
                                                                    (${total_rating_4})</a>
                                                            </button>
                                                            <button class="btn btn-light filter-btn" data-filter="3">
                                                                <a class="nav-item nav-link text-dark" data-toggle="tab"
                                                                    href="#tab-rating-3">3 Sao
                                                                    (${total_rating_3})</a>
                                                            </button>
                                                            <button class="btn btn-light filter-btn" data-filter="2">
                                                                <a class="nav-item nav-link text-dark" data-toggle="tab"
                                                                    href="#tab-rating-2">2 Sao
                                                                    (${total_rating_2})</a>
                                                            </button>
                                                            <button class="btn btn-light filter-btn" data-filter="1">
                                                                <a class="nav-item nav-link text-dark" data-toggle="tab"
                                                                    href="#tab-rating-1">1 Sao
                                                                    (${total_rating_1})</a>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="media mb-4"></div>
                                        <div class="tab-content container-fluid align-items-start ">
                                            <!--FILTER ALL COMMENT-->
                                            <div class="tab-pane fade show active" id="tab-all">
                                                <c:if test="${not empty allComments}">
                                                    <c:forEach items="${allComments}" var="review">
                                                        <img src="/images/avatar/defaut-avatar.jpg" alt="Image"
                                                            class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">
                                                            <h6>${review.user.fullName}<small> -
                                                                    <i>${review.postingDate}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                            <div class="filled-stars" style="width: 0;"></div>
                                                            <p>${review.comment}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty allComments}">
                                                    <div class="col-sm-12 empty-cart-cls text-center">
                                                        <h4>Chưa có đánh giá</h4>
                                                    </div>
                                                </c:if>

                                            </div>
                                            <!--END FILTER ALL COMMENT-->
                                            <!--FILTER RATING 5-->
                                            <div class="tab-pane fade" id="tab-rating-5">
                                                <c:if test="${not empty reviews_rating_5}">
                                                    <c:forEach items="${reviews_rating_5}" var="review">
                                                        <img src="/images/avatar/defaut-avatar.jpg" alt="Image"
                                                            class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">
                                                            <h6>${review.user.fullName}<small> -
                                                                    <i>${review.postingDate}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                            <p>${review.comment}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty reviews_rating_5}">
                                                    <div class="col-sm-12 empty-cart-cls text-center">
                                                        <h4>Chưa có đánh giá</h4>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--END FILTER RATING 5-->
                                            <!--FILTER RATING 4-->
                                            <div class="tab-pane fade" id="tab-rating-4">
                                                <c:if test="${not empty reviews_rating_4}">
                                                    <c:forEach items="${reviews_rating_4}" var="review">
                                                        <img src="/images/avatar/defaut-avatar.jpg" alt="Image"
                                                            class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">
                                                            <h6>${review.user.fullName}<small> -
                                                                    <i>${review.postingDate}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                            <p>${review.comment}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty reviews_rating_4}">
                                                    <div class="col-sm-12 empty-cart-cls text-center">
                                                        <h4>Chưa có đánh giá</h4>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--END FILTER RATING 4-->
                                            <!--FILTER RATING 3-->
                                            <div class="tab-pane fade" id="tab-rating-3">
                                                <c:if test="${not empty reviews_rating_3}">
                                                    <c:forEach items="${reviews_rating_3}" var="review">
                                                        <img src="/images/avatar/defaut-avatar.jpg" alt="Image"
                                                            class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">
                                                            <h6>${review.user.fullName}<small> -
                                                                    <i>${review.postingDate}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                            <p>${review.comment}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty reviews_rating_3}">
                                                    <div class="col-sm-12 empty-cart-cls text-center">
                                                        <h4>Chưa có đánh giá</h4>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--END FILTER RATING 3-->
                                            <!--FILTER RATING 2-->
                                            <div class="tab-pane fade" id="tab-rating-2">
                                                <c:if test="${not empty reviews_rating_2}">
                                                    <c:forEach items="${reviews_rating_2}" var="review">
                                                        <img src="/images/avatar/defaut-avatar.jpg" alt="Image"
                                                            class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">
                                                            <h6>${review.user.fullName}<small> -
                                                                    <i>${review.postingDate}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                            <p>${review.comment}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty reviews_rating_2}">
                                                    <div class="col-sm-12 empty-cart-cls text-center">
                                                        <h4>Chưa có đánh giá</h4>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--END FILTER RATING 2-->
                                            <!--FILTER RATING 1-->
                                            <div class="tab-pane fade" id="tab-rating-1">
                                                <c:if test="${not empty reviews_rating_1}">
                                                    <c:forEach items="${reviews_rating_1}" var="review">
                                                        <img src="/images/avatar/defaut-avatar.jpg" alt="Image"
                                                            class="img-fluid mr-3 mt-1" style="width: 45px;">
                                                        <div class="media-body">
                                                            <h6>${review.user.fullName}<small> -
                                                                    <i>${review.postingDate}</i></small></h6>
                                                            <div class="text-primary mb-2">
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                                <i class="fas fa-star"></i>
                                                            </div>
                                                            <p>${review.comment}</p>
                                                        </div>

                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${empty reviews_rating_1}">
                                                    <div class="col-sm-12 empty-cart-cls text-center">
                                                        <h4>Chưa có đánh giá</h4>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--END FILTER RATING 1-->
                                            <div class="tab-pane fade" id="tab-have-image-video">
                                                af
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>