<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("isLoggedIn") != null && (Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("profile.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入 - HIMEHINA Store</title>
    
    <!-- Import Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Import CSS -->
    <link rel="stylesheet" href="style.css">

    <!-- Import jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Import Vue -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    
</head>
<body>
<div id="app" class="site-wrapper">

    <%@ include file="header.jspf" %>

    <main class="main-content-area">
        <div class="content-bound flex-center">
            <div class="auth-card">
                <h1 class="auth-title">登入</h1>
                
                <form @submit.prevent="handleLogin" class="auth-form" action="LoginServlet" method="POST">
                    <div class="auth-form-group">
                        <label>電子信箱</label>
                        <input type="email" name="userEmail" v-model="loginForm.email" class="auth-input" required>
                    </div>
                    <div class="auth-form-group">
                        <label>密碼</label>
                        <input type="password" name="userPassword" v-model="loginForm.password" class="auth-input" required>
                    </div>
                    <button type="submit" class="action-login-btn">登入</button>
                    <div class="auth-switch">還沒有帳號？<a href="register.jsp">立即註冊</a></div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="footer.jspf" %>

</div>
<script type="module" src="app.js"></script>
</body>
</html>