<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Customers - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Manage Customers</h3>
  <div class="alert alert-info">Hook this table to `${customers}` via JSTL when provided in request scope.</div>
  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/dashboard">Back</a>
</div>
</body>
</html>