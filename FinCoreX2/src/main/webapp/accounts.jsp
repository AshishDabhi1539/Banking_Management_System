<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accounts - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Accounts</h3>
  <c:if test="${param.opened == '1'}"><div class="alert alert-success alert-dismissible fade show" role="alert">Account opened successfully.<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div></c:if>
  <c:if test="${param.success == '1'}"><div class="alert alert-success alert-dismissible fade show" role="alert">Transaction completed successfully.<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div></c:if>
  <form class="row g-2 mb-4" method="post" action="${pageContext.request.contextPath}/customer/open-account">
    <div class="col-md-3">
      <input class="form-control" name="customerId" placeholder="Customer ID" required pattern="^[0-9]+$" title="Numbers only">
    </div>
    <div class="col-md-3">
      <input class="form-control" name="accountNumber" placeholder="Account Number" required minlength="6" maxlength="20">
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

  <div class="card p-3 mb-4">
    <h5>Deposit</h5>
    <form class="row g-2" method="post" action="${pageContext.request.contextPath}/customer/deposit">
      <div class="col-md-4"><input class="form-control" name="accountId" placeholder="Account ID" required pattern="^[0-9]+$" title="Numbers only"></div>
      <div class="col-md-4"><input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Amount" required></div>
      <div class="col-md-4"><button class="btn btn-success w-100" type="submit">Deposit</button></div>
    </form>
  </div>

  <div class="card p-3 mb-4">
    <h5>Withdraw</h5>
    <form class="row g-2" method="post" action="${pageContext.request.contextPath}/customer/withdraw">
      <div class="col-md-4"><input class="form-control" name="accountId" placeholder="Account ID" required pattern="^[0-9]+$" title="Numbers only"></div>
      <div class="col-md-4"><input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Amount" required></div>
      <div class="col-md-4"><button class="btn btn-warning w-100" type="submit">Withdraw</button></div>
    </form>
  </div>

  <div class="card p-3 mb-4">
    <h5>Transfer</h5>
    <form class="row g-2" method="post" action="${pageContext.request.contextPath}/customer/transfer">
      <div class="col-md-3"><input class="form-control" name="fromAccountId" placeholder="From Account ID" required pattern="^[0-9]+$" title="Numbers only"></div>
      <div class="col-md-3"><input class="form-control" name="toAccountNumber" placeholder="To Account Number" required></div>
      <div class="col-md-3"><input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Amount" required></div>
      <div class="col-md-3"><button class="btn btn-info w-100" type="submit">Transfer</button></div>
    </form>
  </div>

  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/customer/dashboard">Back to Dashboard</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>