<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="sidebar bg-light p-3" style="width: 250px; min-height: 100vh;">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/dashboard">
                <i class="fas fa-home me-2"></i>Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/accounts">
                <i class="fas fa-wallet me-2"></i>My Accounts
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/statements">
                <i class="fas fa-file-alt me-2"></i>Statements
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/loan_status">
                <i class="fas fa-hand-holding-usd me-2"></i>My Loans
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/apply_loan">
                <i class="fas fa-plus-circle me-2"></i>Apply Loan
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/repay_loan">
                <i class="fas fa-money-check-alt me-2"></i>Repay Loan
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/customer/complaints">
                <i class="fas fa-exclamation-circle me-2"></i>My Complaints
            </a>
        </li>
    </ul>
</nav>