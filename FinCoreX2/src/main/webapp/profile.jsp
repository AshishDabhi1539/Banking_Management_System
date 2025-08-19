<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Change Password</h3>
  <form class="row g-2" method="post" action="${pageContext.request.contextPath}/change-password">
    <div class="col-md-4"><input class="form-control" type="password" name="oldPassword" placeholder="Old Password" required></div>
    <div class="col-md-4"><input class="form-control" type="password" name="newPassword" placeholder="New Password" required></div>
    <div class="col-md-2"><button class="btn btn-primary w-100" type="submit">Update</button></div>
  </form>
  <div class="mt-3 text-success">${message}</div>
  <a class="btn btn-outline-secondary mt-3" href="${pageContext.request.contextPath}/customer/dashboard">Back</a>
</div>
</body>
</html>