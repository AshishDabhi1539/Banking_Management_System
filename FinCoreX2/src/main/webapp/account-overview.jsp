<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Overview - FinCoreX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        .account-card {
            background: linear-gradient(135deg, #ffffff, #f8f9fa);
            border: 1px solid #e5e7eb;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .account-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .account-icon {
            font-size: 2rem;
            color: #4f46e5;
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 0.4em 0.8em;
            border-radius: 10px;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <%@ include file="includes/header.jsp" %>
    <div class="d-flex flex-grow-1">
        <%@ include file="includes/sidebar.jsp" %>
        <main class="flex-grow-1 p-4">
            <div class="container-fluid">
                <h3 class="mb-4 text-primary"><i class="fas fa-wallet me-2"></i>Account Overview</h3>
                <c:if test="${empty accounts}">
                    <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle me-2"></i>No accounts found. Please open an account to get started!
                    </div>
                </c:if>
                <c:if test="${not empty accounts}">
                    <div class="row g-4">
                        <c:forEach var="acc" items="${accounts}">
                            <div class="col-md-4">
                                <div class="account-card">
                                    <div class="d-flex align-items-center mb-3">
                                        <i class="account-icon fas fa-piggy-bank"></i>
                                        <h5 class="ms-3 mb-0">${acc.accountNumber}</h5>
                                    </div>
                                    <p class="text-muted mb-2">Account ID: ${acc.accountId}</p>
                                    <p class="mb-2"><strong>Balance:</strong> ₹${acc.balance}</p>
                                    <p class="mb-2"><strong>Type:</strong> ${acc.accountType}</p>
                                    <p class="mb-0">
                                        <strong>Status:</strong>
                                        <span class="status-badge ${acc.status == 'ACTIVE' ? 'text-bg-success' : acc.status == 'CLOSED' ? 'text-bg-secondary' : acc.status == 'BLOCKED' ? 'text-bg-danger' : 'text-bg-warning'}">
                                            ${acc.status}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <a class="btn btn-outline-secondary mt-4" href="${pageContext.request.contextPath}/accounts"><i class="fas fa-arrow-left me-2"></i>Back to Accounts</a>
            </div>
        </main>
    </div>
    <%@ include file="includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>