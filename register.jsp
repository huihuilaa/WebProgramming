<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊 - HIMEHINA Store</title>
    
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
                <h1 class="auth-title">註冊</h1>
                
                <form @submit.prevent="handleRegister" class="auth-form" action="RegisterServlet" method="POST">
                    <div class="auth-form-group">
                        <label>電子信箱</label>
                        <input type="email" name="regEmail" v-model="registerForm.email" class="auth-input" required>
                    </div>
                    <div class="auth-form-group">
                        <label>密碼</label>
                        <input type="password" name="regPassword" v-model="registerForm.password" class="auth-input" required>
                    </div>
                    <button type="submit" class="action-login-btn">註冊</button>
                    <div class="auth-switch">已經有帳號了？<a href="login.jsp">立即登入</a></div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="footer.jspf" %>

</div>
<script type="module" src="app.js"></script>
</body>
</html>