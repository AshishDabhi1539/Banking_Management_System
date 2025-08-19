<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background: #f5f7fb; }
.card { border: none; box-shadow: 0 10px 25px rgba(0,0,0,0.08); }
.brand { font-weight: 800; color: #4f46e5; }
</style>
 </head>
<body>
<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="card p-4 p-lg-5">
        <h2 class="mb-4"><span class="brand">FinCoreX</span> Customer Registration</h2>
        <form method="post" action="${pageContext.request.contextPath}/register">
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Username</label>
              <input type="text" name="username" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Password</label>
              <input type="password" name="password" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Full Name</label>
              <input type="text" name="fullName" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Email</label>
              <input type="email" name="email" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Phone</label>
              <input type="text" name="phone" class="form-control" required>
            </div>
            <div class="col-md-6">
              <label class="form-label">Address</label>
              <input type="text" name="address" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label">Aadhar No</label>
              <input type="text" name="aadhar" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label">PAN No</label>
              <input type="text" name="pan" class="form-control">
            </div>
          </div>
          <div class="d-flex mt-4 gap-2">
            <button class="btn btn-primary px-4" type="submit">Register</button>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/login.jsp">Back to Login</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>