<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Đánh Giá Sản Phẩm</title>
                    <link rel="stylesheet" href="/client/css/review.css">

                </head>

                <body>
                    <div class="container">
                        <form:form method="post" action="/product-review" enctype="multipart/form-data"
                            modelAttribute="review">
                            <div class="header">
                                <h2>Đánh Giá Sản Phẩm</h2>
                            </div>
                            <div class="scrollable-content">

                                <input type="hidden" name="productId" value="${product.id}"/>
                                <input type="hidden" name="orderDetailId" value="${orderDetailId}"/>
                                <!-- Nội dung có thể cuộn -->
                                <div class="product-info">
                                    <div class="product-details">
                                        <img src="/images/product/${product.image}" alt="Sản phẩm">
                                        <p>${product.name}</p>
                                    </div>
                                    <div class="rating">
                                        <p>Chất lượng sản phẩm</p>
                                        <div class="stars" id="rating-stars" path="rating">
                                            <span class="star" value="1" data-value="1">★</span>
                                            <span class="star" value="2" data-value="2">★</span>
                                            <span class="star" value="3" data-value="3">★</span>
                                            <span class="star" value="4" data-value="4">★</span>
                                            <span class="star" value="5" data-value="5">★</span>
                                        </div>
                                        <form:hidden path="rating" id="rating-input" />
                                        <p class="rating-text" id="rating-text">Chọn số sao</p>
                                    </div>
                                </div>

                                <div class="review-form">

                                    <form:textarea path="comment" />
                                    <p>Hãy chia sẻ những điều bạn thích về sản phẩm này với những người mua khác nhé.
                                    </p>


                                    <div class="media-upload">
                                        <div class="upload-section">
                                            <label class="upload-btn">
                                                <i class="fas fa-camera"></i>
                                                <span>Thêm Hình ảnh</span>
                                                <input type="file" name="imageReivew" accept="image/*" multiple
                                                    id="image-upload" style="display: none;">
                                            </label>
                                            <div class="media-preview" id="image-preview">
                                                <div class="add-more">
                                                    <i class="fas fa-camera"></i>
                                                    <input type="file" accept="image/*" multiple id="image-upload-more"
                                                        style="display: none;">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="upload-section">
                                            <label class="upload-btn">
                                                <i class="fas fa-video"></i>
                                                <span>Thêm Video</span>
                                                <input type="file" name="videoReview" accept="video/mp4"
                                                    id="video-upload" style="display: none;">
                                            </label>
                                            <div class="media-preview" id="video-preview">
                                                <div class="add-more">
                                                    <i class="fas fa-video"></i>
                                                    <input type="file" accept="video/mp4" id="video-upload-more"
                                                        style="display: none;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <!-- <button class="back-btn" type="reset">TRỞ LẠI</button> -->
                                <button class="submit-btn" type="submit">HOÀN THÀNH</button>
                            </div>
                        </form:form>
                    </div>
                    <!-- Template Javascript -->
                    <script src="/client/js/review.js"></script>
                </body>

                </html>