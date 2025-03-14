<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
        <div class="container-fluid fixed-top ">
            <div class="container-fluid">

                <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
                    <div class="col-lg-4">
                        <a href="/" class="text-decoration-none">
                            <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                            <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
                        </a>
                    </div>
                    <div class="col-lg-4 col-6 text-left">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for products">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-transparent text-primary">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Topbar End -->
            <div class="container-fluid bg-dark mb-30">
                <div class="row px-xl-5">
                    <div class="col-lg-3 d-none d-lg-block">
                        <a class="btn d-flex align-items-center justify-content-between bg-primary w-100"
                            data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                            <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Thể loại</h6>
                            <i class="fa fa-angle-down text-dark"></i>
                        </a>
                        <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                            id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                            <div class="navbar-nav w-100">
                                <div class="nav-item dropdown dropright">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Váy <i
                                            class="fa fa-angle-right float-right mt-1"></i></a>
                                    <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                                        <a href="" class="dropdown-item">Váy phụ nữ</a>
                                        <a href="" class="dropdown-item">Váy trẻ em</a>
                                    </div>
                                </div>
                                <a href="" class="nav-item nav-link">Áo sơ mi</a>
                                <a href="" class="nav-item nav-link">Quần Jean</a>
                                <a href="" class="nav-item nav-link">Đồ bơi</a>
                                <a href="" class="nav-item nav-link">Đồ ngủ</a>
                                <a href="" class="nav-item nav-link">Đồ thể thao</a>
                                <a href="" class="nav-item nav-link">Áo khoác</a>
                                <a href="" class="nav-item nav-link">Giày</a>
                            </div>
                        </nav>
                    </div>
                    <div class="col-lg-9">
                        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                            <a href="" class="text-decoration-none d-block d-lg-none">
                                <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                                <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                            </a>
                            <button type="button" class="navbar-toggler" data-toggle="collapse"
                                data-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav mr-auto py-0">
                                    <a href="/" class="nav-item nav-link active">Trang chủ</a>
                                    <a href="shop.html" class="nav-item nav-link">Sản phẩm</a>
                                    <div class="nav-item dropdown">
                                    </div>
                                    <div class="navbar-nav py-lg-0 d-flex m-3 me-0">
                                        <div class="btn px-0">
                                            <div class="dropdown my-auto">

                                                <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                                    data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <i class="fas fa-user fa-1.5x"></i>
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end p-4" aria- labelledby="dropdownMenuLink">
            
                                                    <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
            
                                                        <c:if test="${not empty sessionScope.avatar}">
                                                            <img style="width: 120px; height: 120px; border-radius: 50%; overflow: hidden;"
                                                                src="/images/avatar/${sessionScope.avatar}" />
                                                        </c:if>
                                                        <c:if test="${empty sessionScope.avatar}">
                                                            <img style="width: 120px; height: 120px; border-radius: 50%; overflow: hidden;"
                                                                src="/images/avatar/defaut-avatar.jpg" />
                                                        </c:if>
            
                                                        <div class="text-center my-3">
                                                            <c:out value="${sessionScope.fullName}" />
                                                        </div>
            
                                                    </li>
                                                    <li><a class="dropdown-item" href="/account/my-profile">Tài khoản của tôi</a>
                                                    </li>
                                                    <li><a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a></li>
                                                    <li>
                                                        <hr class="dropdown-divider">
                                                    </li>
                                                    <li>
                                                        <form method="post" action="/logout">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button class="dropdown-item">Đăng xuất</button>
                                                        </form>
                                                    </li>
                                                </ul>
            
                                            </div>
                                        </div>
                                        <a href="" class="btn px-0 ml-3">
                                            <i class="fas fa-shopping-cart text-primary"></i>
                                            <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                                        </a>
                                    </div>
                                </div>
                                
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar Start -->