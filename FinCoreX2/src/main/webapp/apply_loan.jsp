<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for a Loan - FinCoreX</title>
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
                <h3 class="mb-4 text-primary"><i class="fas fa-hand-holding-usd me-2"></i>Apply for a Loan</h3>
                <c:if test="${param.applied == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Loan application submitted.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Loan Application</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/loan/apply">
                            <div class="col-md-2">
                                <label class="form-label">Customer ID</label>
                                <input class="form-control" name="customerId" placeholder="Enter Customer ID" required pattern="^[0-9]+$" title="Numbers only">
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Loan Type</label>
                                <select class="form-select" name="loanType">
                                    <option value="PERSONAL">Personal</option>
                                    <option value="HOME">Home</option>
                                    <option value="CAR">Car</option>
                                    <option value="EDUCATION">Education</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Amount</label>
                                <input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Enter Amount" required>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Interest Rate (%)</label>
                                <input class="form-control" type="number" step="0.01" min="0.01" name="interestRate" placeholder="Enter Interest %" required>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Tenure (Months)</label>
                                <input class="form-control" type="number" min="1" step="1" name="tenureMonths" placeholder="Enter Months" required>
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <button class="btn btn-primary w-100" type="submit"><i class="fas fa-paper-plane me-2"></i>Apply</button>
                            </div>
                        </form>
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