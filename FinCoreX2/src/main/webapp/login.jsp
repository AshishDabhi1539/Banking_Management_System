<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - FinCoreX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
	<%@ include file="includes/header.jsp"%>
	<main class="flex-grow-1 d-flex align-items-center py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5 col-md-6">
					<div class="glass-card p-4 p-lg-5">
						<div class="text-center mb-4">
							<h2 class="text-primary mb-1">
								<i class="fas fa-lock me-2"></i>FinCoreX
							</h2>
							<p class="text-muted small">Secure Banking Portal</p>
						</div>
						<c:if test="${param.registered == '1'}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								<i class="fas fa-check-circle me-2"></i>Registration successful!
								Please log in.
								<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							</div>
						</c:if>
						<!-- Error Messages -->
						<c:if test="${not empty errors}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<i class="fas fa-exclamation-triangle me-2"></i>${errors}
								<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							</div>
						</c:if>
						<c:if test="${param.error == '1' && empty errors}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								<i class="fas fa-exclamation-triangle me-2"></i>Invalid
								credentials.
								<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							</div>
						</c:if>

						<!-- Login Form -->
						<form method="post"
							action="${pageContext.request.contextPath}/login">
							<div class="mb-3">
								<label class="form-label">Username</label> <input
									class="form-control" name="username"
									placeholder="Enter Username" required autofocus>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									class="form-control" type="password" name="password"
									placeholder="Enter Password" required>
							</div>
							<button class="btn btn-primary w-100 py-2 mb-3" type="submit">
								<i class="fas fa-sign-in-alt me-2"></i>Login
							</button>
						</form>

						<!-- Register Link -->
						<div class="text-center">
							<p class="small text-muted mb-0">Don't have an account?</p>
							<a href="${pageContext.request.contextPath}/register.jsp"
								class="small text-primary fw-medium text-decoration-none">
								Register here </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="includes/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>