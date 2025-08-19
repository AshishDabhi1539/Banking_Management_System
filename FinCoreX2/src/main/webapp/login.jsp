<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background: linear-gradient(135deg, #eef2ff, #f5f7fb); height: 100vh; }
.card { border: none; box-shadow: 0 20px 40px rgba(0,0,0,0.08); border-radius: 16px; }
.brand { font-weight: 800; color: #4f46e5; }
</style>
</head>
<body>
<div class="container h-100 d-flex align-items-center">
  <div class="row w-100 justify-content-center">
    <div class="col-md-6 col-lg-4">
      <div class="card p-4 p-lg-5">
        <h2 class="mb-4 text-center"><span class="brand">FinCoreX</span> Login</h2>
        <form method="post" action="${pageContext.request.contextPath}/login">
          <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
          </div>
          <button class="btn btn-primary w-100" type="submit">Sign in</button>
        </form>
        <div class="mt-3 text-center">
          <a href="${pageContext.request.contextPath}/register.jsp">Create an account</a>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>