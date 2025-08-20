<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex">
        <%@ include file="includes/sidebar.jsp" %>
        <main class="flex-grow-1 p-4">
            <div class="container-fluid">
                <h3 class="mb-4 text-primary"><i class="fas fa-money-bill-wave me-2"></i>Deposit</h3>
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-arrow-up me-2"></i>Deposit Funds</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/customer/deposit">
                            <div class="col-md-4">
                                <label class="form-label">Account ID</label>
                                <input class="form-control" name="accountId" placeholder="Enter Account ID" required pattern="^[0-9]+$" title="Numbers only">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Amount</label>
                                <input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Enter Amount" required>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button class="btn btn-success w-100" type="submit"><i class="fas fa-arrow-up me-2"></i>Deposit</button>
                            </div>
                        </form>
                    </div>
                </div>
                <a class="btn btn-outline-secondary mt-4" href="${pageContext.request.contextPath}/accounts.jsp"><i class="fas fa-arrow-left me-2"></i>Back to Accounts</a>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>