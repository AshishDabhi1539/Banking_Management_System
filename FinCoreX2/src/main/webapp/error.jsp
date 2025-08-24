<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
    <%@ include file="includes/header.jsp" %>

    <main class="flex-grow-1 d-flex align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow-sm text-bg-danger">
                        <div class="card-body p-4">
                            <h4 class="card-title"><i class="fas fa-exclamation-triangle me-2"></i> Something Went Wrong</h4>

                            <!-- Display exception message -->
                            <c:if test="${not empty errors}">
                                <p class="card-text fw-bold">${errors}</p>
                            </c:if>

                            <!-- If no custom error passed, display generic message -->
                            <c:if test="${empty errors}">
                                <p class="card-text">An unexpected error occurred. Please try again later.</p>
                            </c:if>

                            <!-- Debugging stack trace (optional, only for dev) -->
                            <c:if test="${not empty exception}">
                                <hr>
                                <pre style="white-space: pre-wrap; color: #fff;">${exception}</pre>
                            </c:if>

                            <hr>
                            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/login.jsp">
                                <i class="fas fa-home me-2"></i> Go Home
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
