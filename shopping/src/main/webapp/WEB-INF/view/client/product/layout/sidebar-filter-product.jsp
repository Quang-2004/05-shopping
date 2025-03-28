<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <div class="col-lg-3 col-md-4">
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Giá
                        cả</span></h5>
                <div class="bg-light p-4 mb-30" id="priceFilter">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-1" value="duoi-500">
                        <label class="custom-control-label" for="price-1">0 - 500.000 đ</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-2" value="500-den-1-trieu">
                        <label class="custom-control-label" for="price-2">500.000 - 1 triệu</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-3" value="1-den-1-trieu-500">
                        <label class="custom-control-label" for="price-3">1 - 1.5 triệu</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-4"
                            value="1-trieu-500-den-2-trieu">
                        <label class="custom-control-label" for="price-4">1.5 - 2 triệu</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="price-5"
                            value="2-trieu-den-2-trieu-500">
                        <label class="custom-control-label" for="price-5">2- 2.5 triệu</label>
                    </div>
                </div>
                <!-- Price End -->

                <!-- Factory Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Nhãn
                        hàng</span></h5>
                <div class="bg-light p-4 mb-30" id="factoryFilter">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="factory-1" value="NIKE">
                        <label class="custom-control-label" for="factory-1">Nike</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="factory-2" value="ADIDAS">
                        <label class="custom-control-label" for="factory-2">Adidas</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="factory-3" value="HM">
                        <label class="custom-control-label" for="factory-3">H&M</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="factory-4" value="GUCCI">
                        <label class="custom-control-label" for="factory-4">Gucci</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="factory-5" value="ZARA">
                        <label class="custom-control-label" for="factory-5">Zara</label>
                    </div>
                </div>
                <!-- Factory End -->

                <!-- Sort Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Sắp
                        xếp</span></h5>
                <div class="bg-light p-4 mb-30" id="sortFilter">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="sort-1" value="khong-sap-xep"
                            name="radio-sort">
                        <label class="custom-control-label" for="sort-1">Không sắp xếp</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="sort-2" value="tang-dan" name="radio-sort">
                        <label class="custom-control-label" for="sort-2">Tăng dần</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" class="custom-control-input" id="sort-3" value="giam-dan" name="radio-sort">
                        <label class="custom-control-label" for="sort-3">Giảm dần</label>
                    </div>

                </div>
                <!-- Sort End -->

                <div class="d-flex justify-content-center my-4">
                    <button class="btn border-4 btn-outline-success px-4 py-3 rounded-pill w-50 mr-1" id="btnFilter">
                        Lọc sản phẩm</button>
                    <button class="btn border-4 btn-outline-success px-4 py-3 rounded-pill w-50 ml-1"
                        id="btnDeleteFilter">
                        Xóa bộ lọc</button>
                </div>
            </div>