<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Verify OTP</title>
            <link rel="stylesheet" href="/client/css/otp.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body class="container-fluid bg-body-tertiary d-block">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                    <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                        <div class="card-body p-5 text-center">
                            <form:form action="/account_verifications" method="post" modelAttribute="otpRequest">
                                <c:set var="errorOtp">
                                <form:errors path="otp"
                                    cssClass="invalid-feedback" />
                            </c:set>
                                <h4>Xác thực tài khoản</h4>
                                <p>Nhập mã đã được gửi qua email của bạn!</p>

                                <div class="otp-field mb-4">
                                    <input type="number" />
                                    <input type="number" disabled />
                                    <input type="number" disabled />
                                    <input type="number" disabled />
                                    <input type="number" disabled />
                                    <input type="number" disabled />
                                </div>
                                <form:input path="otp" type="hidden" id="otpHidden" />
                                <form:input path="email" type="hidden" />

                                ${errorOtp}
                                <form:errors value="error" />

                                <button type="submit" class="btn btn-primary mb-3">
                                    Xác nhận
                                </button>

                                <p class="resend text-muted mb-0">
                                    Không nhận được mã? <a href="">Gửi lại mã.</a>
                                </p>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>

            <script src="/client/js/otp.js"></script>
        </body>

        </html>