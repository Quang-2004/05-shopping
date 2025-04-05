<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Login - MultiShop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    

                    .login-text {
                        color: #888;
                        font-size: 16px;
                        margin-top: 20px;
                        justify-content: center;
                        display: flex;
                    }

                    .social-buttons {
                        display: flex;
                        gap: 20px;
                        justify-content: center;
                    }

                    .social-btn {
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        border: none;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        cursor: pointer;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                        transition: transform 0.1s ease-in-out;
                    }

                    .social-btn:hover {
                        transform: scale(1.1);
                    }

                    .github-btn {
                        background-color: #fff;
                        color: #3b5998;
                        /* Facebook blue */
                        font-size: 24px;
                        font-weight: bold;
                    }

                    .google-btn {
                        background-color: #fff;
                        color: #4285f4;
                        /* Google blue */
                        font-size: 24px;
                        font-weight: bold;
                    }

                    .facebook-btn {
                        background-color: #fff;
                        color: #153c7a;
                        /* Google blue */
                        font-size: 24px;
                        font-weight: bold;
                    }

                    .github-btn {
                        background: url('https://cdn-icons-png.flaticon.com/512/25/25231.png') no-repeat center;
                        background-size: 30px;
                    }

                    .google-btn {
                        background: url('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png') no-repeat center;
                        background-size: 30px;
                    }

                    .facebook-btn {
                        background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiXN9xSEe8unzPBEQOeAKXd9Q55efGHGB9BA&s') no-repeat center;
                        background-size: 30px;
                    }
                </style>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form action="/login" method="POST">
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Invalid email or password.
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: rgb(36, 168, 100);">Logout
                                                            successful.
                                                        </div>
                                                    </c:if>
                                                    <div class="form-floating mb-3">
                                                        <input name="username" class="form-control" type="email"
                                                            placeholder="name@example.com" />
                                                        <label>Email address</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input name="password" class="form-control" type="password"
                                                            placeholder="Password" />
                                                        <label>Password</label>
                                                    </div>

                                                    <!-- csrf token -->
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />

                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Login
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                                
                                                    <p class="login-text">Or login with</p>
                                                    <div class="social-buttons">
                                                        <form action="/oauth2/authorization/github" method="get">
                                                            <button class="social-btn github-btn">
                                                            </button>
                                                        </form>
                                                        
                                                        <form action="/oauth2/authorization/google" method="get">
                                                            <button class="social-btn google-btn">
                                                            </button>
                                                        </form>
                                                        
                                                        <!-- <form action="/oauth2/authorization/facebook" method="get">
                                                            <button class="social-btn facebook-btn">
                                                            </button>
                                                        </form> -->
                                                    </div>
                                                
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Need an account? Sign up!</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>