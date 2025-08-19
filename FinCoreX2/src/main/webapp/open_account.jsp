<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Account - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Open New Account</h3>
  <form class="row g-2 mb-4" method="post" action="${pageContext.request.contextPath}/customer/open-account">
    <div class="col-md-3">
      <input class="form-control" name="customerId" placeholder="Customer ID" required>
    </div>
    <div class="col-md-3">
      <input class="form-control" name="accountNumber" placeholder="Account Number" required>
    </div>
    <div class="col-md-3">
      <select class="form-select" name="accountType">
        <option value="SAVINGS">SAVINGS</option>
        <option value="CURRENT">CURRENT</option>
      </select>
    </div>
    <div class="col-md-3">
      <button class="btn btn-primary w-100" type="submit">Open Account</button>
    </div>
  </form>
  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/accounts.jsp">Back to Accounts</a>
</div>
</body>
</html>