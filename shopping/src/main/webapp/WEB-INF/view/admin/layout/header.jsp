<%@ page contentType="text/html;charset=UTF-8"%>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/admin">MultiShop</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Name User-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <h5 style="color:aliceblue">Welcome, ${sessionScope.fullName}</h5>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li><a class="dropdown-item" href="/">MultiShop Home</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <form method="post" action="/logout">
                        <input type="hidden" name="${_csrf.parameterName}"
                            value="${_csrf.token}" />
                        <button class="dropdown-item">Logout</button>
                    </form>
                    
                </ul>
            </li>
        </ul>
    </nav>
</body>

