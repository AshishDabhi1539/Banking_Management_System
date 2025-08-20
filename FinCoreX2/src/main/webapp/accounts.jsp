<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accounts - FinCoreX</title>
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
                <h3 class="mb-4 text-primary"><i class="fas fa-wallet me-2"></i>Accounts</h3>
                <c:if test="${param.opened == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Account opened successfully.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.success == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Transaction completed successfully.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Open New Account</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/customer/open-account">
                            <div class="col-md-3">
                                <label class="form-label">Customer ID</label>
                                <input class="form-control" name="customerId" placeholder="Enter Customer ID" required pattern="^[0-9]+$" title="Numbers only">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Account Number</label>
                                <input class="form-control" name="accountNumber" placeholder="Enter Account Number" required minlength="6" maxlength="20">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Account Type</label>
                                <select class="form-select" name="accountType">
                                    <option value="SAVINGS">Savings</option>
                                    <option value="CURRENT">Current</option>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex align-items-end">
                                <button class="btn btn-primary w-100" type="submit"><i class="fas fa-plus me-2"></i>Open Account</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="accordion" id="accountActions">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#depositForm">
                                <i class="fas fa-money-bill-wave me-2"></i>Deposit
                            </button>
                        </h2>
                        <div id="depositForm" class="accordion-collapse collapse show">
                            <div class="accordion-body">
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
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#withdrawForm">
                                <i class="fas fa-money-bill-alt me-2"></i>Withdraw
                            </button>
                        </h2>
                        <div id="withdrawForm" class="accordion-collapse collapse">
                            <div class="accordion-body">
                                <form class="row g-3" method="post" action="${pageContext.request.contextPath}/customer/withdraw">
                                    <div class="col-md-4">
                                        <label class="form-label">Account ID</label>
                                        <input class="form-control" name="accountId" placeholder="Enter Account ID" required pattern="^[0-9]+$" title="Numbers only">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Amount</label>
                                        <input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Enter Amount" required>
                                    </div>
                                    <div class="col-md-4 d-flex align-items-end">
                                        <button class="btn btn-warning w-100" type="submit"><i class="fas fa-arrow-down me-2"></i>Withdraw</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#transferForm">
                                <i class="fas fa-exchange-alt me-2"></i>Transfer
                            </button>
                        </h2>
                        <div id="transferForm" class="accordion-collapse collapse">
                            <div class="accordion-body">
                                <form class="row g-3" method="post" action="${pageContext.request.contextPath}/customer/transfer">
                                    <div class="col-md-3">
                                        <label class="form-label">From Account ID</label>
                                        <input class="form-control" name="fromAccountId" placeholder="Enter From Account ID" required pattern="^[0-9]+$" title="Numbers only">
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">To Account Number</label>
                                        <input class="form-control" name="toAccountNumber" placeholder="Enter To Account Number" required>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">Amount</label>
                                        <input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Enter Amount" required>
                                    </div>
                                    <div class="col-md-3 d-flex align-items-end">
                                        <button class="btn btn-info w-100" type="submit"><i class="fas fa-paper-plane me-2"></i>Transfer</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="btn btn-outline-secondary mt-4" href="${pageContext.request.contextPath}/customer/dashboard"><i class="fas fa-arrow-left me-2"></i>Back to Dashboard</a>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>