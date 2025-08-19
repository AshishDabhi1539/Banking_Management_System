<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Customer Dashboard</h2>
    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>
  <div class="row g-3">
    <div class="col-md-4">
      <a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/accounts.jsp">My Accounts</a>
    </div>
    <div class="col-md-4">
      <a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/loan_status.jsp">My Loans</a>
    </div>
    <div class="col-md-4">
      <a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/complaints.jsp">My Complaints</a>
    </div>
  </div>
</div>
</body>
</html>