<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Admin Dashboard</h2>
    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>
  <div class="row g-3">
    <div class="col-md-3">
      <div class="card text-bg-primary">
        <div class="card-body">
          <h6 class="card-title">Customers</h6>
          <h3 class="card-text">${summary.customers}</h3>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-bg-success">
        <div class="card-body">
          <h6 class="card-title">Accounts</h6>
          <h3 class="card-text">${summary.accounts}</h3>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-bg-warning">
        <div class="card-body">
          <h6 class="card-title">Transactions</h6>
          <h3 class="card-text">${summary.transactions}</h3>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card text-bg-danger">
        <div class="card-body">
          <h6 class="card-title">Loans</h6>
          <h3 class="card-text">${summary.loans}</h3>
        </div>
      </div>
    </div>
  </div>
  <div class="mt-4 d-flex gap-2">
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/customers">Manage Customers</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/accounts">Manage Accounts</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/transactions">View Transactions</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/loans">Loan Approvals</a>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/complaints">Complaints</a>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/logs">Activity Logs</a>
  </div>
</div>
</body>
</html>