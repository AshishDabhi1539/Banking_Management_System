<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Status - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex flex-grow-1">
        <%@ include file="includes/sidebar.jsp" %>
        <main class="flex-grow-1 p-4">
            <div class="container-fluid">
                <h3 class="mb-4 text-primary"><i class="fas fa-hand-holding-usd me-2"></i>My Loans</h3>
                <c:if test="${param.updated == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Loan status updated successfully.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>Loan Status</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Loan ID</th>
                                    <th scope="col">Loan Type</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Interest Rate</th>
                                    <th scope="col">Tenure (Months)</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="loan" items="${loans}">
                                    <tr>
                                        <td>${loan.loanId}</td>
                                        <td>${loan.loanType}</td>
                                        <td>${loan.amount}</td>
                                        <td>${loan.interestRate}%</td>
                                        <td>${loan.tenureMonths}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${loan.status == 'PENDING'}">
                                                    <span class="badge text-bg-warning">Pending</span>
                                                </c:when>
                                                <c:when test="${loan.status == 'APPROVED'}">
                                                    <span class="badge text-bg-success">Approved</span>
                                                </c:when>
                                                <c:when test="${loan.status == 'REJECTED'}">
                                                    <span class="badge text-bg-danger">Rejected</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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