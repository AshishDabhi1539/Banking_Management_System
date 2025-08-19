<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Approvals - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Loan Approvals</h3>
  <form class="row g-2" method="post" action="${pageContext.request.contextPath}/loan/approve">
    <div class="col-md-4"><input class="form-control" name="loanId" placeholder="Loan ID" required></div>
    <div class="col-md-2"><button class="btn btn-success w-100" type="submit">Approve</button></div>
  </form>
  <form class="row g-2 mt-2" method="post" action="${pageContext.request.contextPath}/loan/reject">
    <div class="col-md-4"><input class="form-control" name="loanId" placeholder="Loan ID" required></div>
    <div class="col-md-2"><button class="btn btn-danger w-100" type="submit">Reject</button></div>
  </form>
  <a class="btn btn-outline-secondary mt-3" href="${pageContext.request.contextPath}/admin/dashboard">Back</a>
</div>
</body>
</html>