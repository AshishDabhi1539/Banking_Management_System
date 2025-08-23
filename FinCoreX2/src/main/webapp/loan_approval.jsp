<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Approvals - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex">
        <%@ include file="includes/admin_sidebar.jsp" %>
        <main class="flex-grow-1 p-4">
            <div class="container-fluid">
                <h3 class="mb-4 text-primary"><i class="fas fa-hand-holding-usd me-2"></i>Loan Approvals</h3>
                <c:if test="${param.updated == '1'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i>Loan status updated successfully.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty errors}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${errors}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>Loan List</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Loan ID</th>
                                        <th scope="col">Customer ID</th>
                                        <th scope="col">Loan Type</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Interest Rate</th>
                                        <th scope="col">Tenure (Months)</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Applied Date</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="loan" items="${loans}">
                                        <tr>
                                            <td>${loan.loanId}</td>
                                            <td>${loan.customerId}</td>
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
                                                    <c:when test="${loan.status == 'CLOSED'}">
                                                        <span class="badge text-bg-secondary">Closed</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>${loan.appliedDate}</td>
                                            <td>
                                                <form method="post" action="${pageContext.request.contextPath}/admin/loan/update-status" class="d-inline">
                                                    <input type="hidden" name="loanId" value="${loan.loanId}">
                                                    <select class="form-select form-select-sm" name="status" required>
                                                        <option value="" disabled ${loan.status == null ? 'selected' : ''}>Select Status</option>
                                                        <c:if test="${loan.status != 'PENDING'}"><option value="PENDING">Pending</option></c:if>
                                                        <c:if test="${loan.status != 'APPROVED'}"><option value="APPROVED">Approved</option></c:if>
                                                        <c:if test="${loan.status != 'REJECTED'}"><option value="REJECTED">Rejected</option></c:if>
                                                        <c:if test="${loan.status != 'CLOSED'}"><option value="CLOSED">Closed</option></c:if>
                                                    </select>
                                                    <button type="submit" class="btn btn-sm btn-primary mt-2">Update</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="9">Total Loans: ${loans != null ? loans.size() : 0}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <a class="btn btn-outline-secondary mt-4" href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-arrow-left me-2"></i>Back to Dashboard</a>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>