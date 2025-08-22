<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - FinCoreX</title>
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
                <h3 class="mb-4 text-primary"><i class="fas fa-chart-bar me-2"></i>Reports</h3>
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="fas fa-file-alt me-2"></i>Generate Report</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3" method="post" action="${pageContext.request.contextPath}/admin/reports">
                            <div class="col-md-4">
                                <label class="form-label">Report Type</label>
                                <select class="form-select" name="reportType">
                                    <option value="DAILY">Daily</option>
                                    <option value="MONTHLY">Monthly</option>
                                    <option value="ANNUAL">Annual</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Date</label>
                                <input class="form-control" type="date" name="date" required>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button class="btn btn-primary w-100" type="submit"><i class="fas fa-download me-2"></i>Generate</button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:if test="${not empty report}">
                    <div class="card shadow-sm mt-4">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"><i class="fas fa-chart-pie me-2"></i>Generated Report</h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Total Transactions:</strong> ${report.totalTransactions}</p>
                            <p><strong>Total Amount:</strong> ${report.totalAmount}</p>
                            <p><strong>Date Range:</strong> ${report.dateRange}</p>
                        </div>
                    </div>
                </c:if>
                <a class="btn btn-outline-secondary mt-4" href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-arrow-left me-2"></i>Back to Dashboard</a>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>