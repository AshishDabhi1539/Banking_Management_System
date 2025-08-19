<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Withdraw</h3>
  <form class="row g-2" method="post" action="${pageContext.request.contextPath}/customer/withdraw">
    <div class="col-md-4"><input class="form-control" name="accountId" placeholder="Account ID" required></div>
    <div class="col-md-4"><input class="form-control" name="amount" placeholder="Amount" required></div>
    <div class="col-md-4"><button class="btn btn-warning w-100" type="submit">Withdraw</button></div>
  </form>
  <a class="btn btn-outline-secondary mt-3" href="${pageContext.request.contextPath}/accounts.jsp">Back to Accounts</a>
</div>
</body>
</html>