<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Status - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Apply for a Loan</h3>
  <form class="row g-2" method="post" action="${pageContext.request.contextPath}/loan/apply">
    <div class="col-md-2"><input class="form-control" name="customerId" placeholder="Customer ID" required></div>
    <div class="col-md-2">
      <select class="form-select" name="loanType">
        <option value="PERSONAL">PERSONAL</option>
        <option value="HOME">HOME</option>
        <option value="CAR">CAR</option>
        <option value="EDUCATION">EDUCATION</option>
      </select>
    </div>
    <div class="col-md-2"><input class="form-control" name="amount" placeholder="Amount" required></div>
    <div class="col-md-2"><input class="form-control" name="interestRate" placeholder="Interest %" required></div>
    <div class="col-md-2"><input class="form-control" name="tenureMonths" placeholder="Months" required></div>
    <div class="col-md-2"><button class="btn btn-primary w-100" type="submit">Apply</button></div>
  </form>
  <a class="btn btn-outline-secondary mt-3" href="${pageContext.request.contextPath}/customer/dashboard">Back</a>
</div>
</body>
</html>