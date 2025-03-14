<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Update User - Table Users</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <style>
            .myLink {
                text-decoration: none;
                color: white;
            }
        </style>
        <script>
            $(document).ready(() => {
                const avatarFile = $("#avatarFile");
                avatarFile.change(function (e) {
                    const imgURL = URL.createObjectURL(e.target.files[0]);
                    $("#avatarPreview").attr("src", imgURL);
                    $("#avatarPreview").css({ "display": "block" });
                });
            });
        </script>
    </head>
    <body class="sb-nav-fixed">
        <!-- HEADER -->
        <jsp:include page="../layout/header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Manage Users</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">
                                <a href="/admin">Dashboard</a> / 
                                <a href="/admin/user">User</a> /
                                Update </li>
                        </ol>
                        <div class="container col-6">
                            <h3>Update a user</h3> <hr>
                            <form:form action="/admin/user/update" method="POST" modelAttribute="updateUser">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <c:set var="errorFullname">
                                    <form:errors path="fullName" cssClass="invalid-feedback"/>
                                </c:set>

                                <div class="mb-3" style="display: none;">
                                    <form:input type="text" class="form-control" path="id"/>
                                </div>
                                <div class="mb-3" style="display: none;">
                                    <form:input type="text" class="form-control" path="password"/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email: </label>
                                    <form:input type="email" class="form-control" path="email" disabled="true"/>
                                </div>
                               
                                <div class="mb-3">
                                    <label class="form-label">Full name: </label>
                                    <form:input type="text" 
                                        class="form-control ${not empty errorFullname ? 'is-invalid' : ''}" path="fullName"/>
                                    ${errorFullname}
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Phone Number: </label>
                                    <form:input type="text" class="form-control" path="phoneNumber"/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Sex: </label> <br>
                    
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sex" value="Boy" <c:if test="${updateUser.sex == 'Boy'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio1">Boy</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sex" value="Girl" <c:if test="${updateUser.sex == 'Girl'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio2">Girl</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sex" value="Different" <c:if test="${updateUser.sex == 'Different'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio2">Different</label>
                                      </div>
                                </div>
                            
                                <div class="mb-3 col-6">
                                    <label for="avatarFile" class="form-label">Avatar: </label>
                                    <input type="file" class="form-control" id="avatarFile" name="avatarPreview" 
                                        accept=".png, .jpg, .jpeg"/>	
                                </div>
                            
                               
                                <div class="row">
                                    <div class="col-6">
                                        <c:if test="${not empty updateUser.avatar}">
                                            <img id="avatarPreview" style="max-height: 250px;" 
                                            src="/images/avatar/${updateUser.avatar}" 
                                             alt="Avatar Image">
                                        </c:if>
                                        <c:if test="${empty updateUser.avatar}">
                                            <img id="avatarPreview" style="max-height: 250px;" 
                                            src="/images/avatar/defaut-avatar.jpg" 
                                             alt="Avatar Image">
                                        </c:if>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form:form>
                        </div>
                        
                    </div>
                    
                </main>
                <!-- FOOTER -->
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>
</html>
