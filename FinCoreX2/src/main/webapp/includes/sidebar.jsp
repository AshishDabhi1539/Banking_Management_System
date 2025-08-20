<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="sidebar">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customer/dashboard"><i class="fas fa-home me-2"></i>Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="${pageContext.request.contextPath}/accounts.jsp"><i class="fas fa-wallet me-2"></i>Accounts</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customer/statements"><i class="fas fa-file-alt me-2"></i>Statements</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/loan_status.jsp"><i class="fas fa-hand-holding-usd me-2"></i>My Loans</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/apply_loan.jsp"><i class="fas fa-plus-circle me-2"></i>Apply Loan</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/repay_loan.jsp"><i class="fas fa-money-check-alt me-2"></i>Repay Loan</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/complaints.jsp"><i class="fas fa-exclamation-circle me-2"></i>Complaints</a>
        </li>
    </ul>
</nav>