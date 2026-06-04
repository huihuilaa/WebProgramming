<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心 - HIMEHINA Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css?v=3">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
<div id="app" class="site-wrapper">

    <%@ include file="header.jspf" %>

    <main class="main-content-area">
        <div class="content-bound">
            <h1 class="page-title">會員中心</h1>
            <div class="tabs-header">
                <button type="button" class="tab-btn" :class="{ active: activeTab === 'orders' }" @click="activeTab = 'orders'">訂單資訊</button>
                <button type="button" class="tab-btn" :class="{ active: activeTab === 'profile' }" @click="activeTab = 'profile'">個人資料</button>
            </div>
            
            <div class="profile-outer-box">
                <div v-if="activeTab === 'orders'" class="orders-tab-content">
                    <div v-for="order in orderList" :key="order.id" class="order-group-wrapper">
                        <div class="order-list-card">
                            <span class="order-id-text">訂單編號 [[ order.id ]]</span><span class="order-status-text">[[ order.status ]]</span>
                            <span class="order-total-text">總額：<span class="pink-highlight">NT$[[ order.total ]]</span></span>
                            <button type="button" class="action-detail-btn">訂單明細</button>
                        </div>
                        <div :id="'details-' + order.rawId" class="order-details-subpanel" style="display: none;">
                            <div v-for="subItem in order.items" :key="subItem.name" class="subpanel-item-row">
                                <span class="sub-item-name">[[ subItem.name ]]</span><span class="sub-item-qty">數量：[[ subItem.qty ]]</span>
                                <span class="sub-item-unit-price">NT$[[ subItem.price ]]</span><span class="sub-item-subtotal">NT$[[ subItem.price * subItem.qty ]]</span>
                            </div>
                        </div>
                    </div>
                </div>

                <form v-else @submit.prevent="saveProfile" class="profile-form">
                    <div class="form-group"><label>姓名</label><input type="text" v-model="profile.name" class="profile-input"></div>
                    <div class="form-group"><label>電子郵件</label><input type="email" v-model="profile.email" class="profile-input" readonly style="background-color: var(--bg-card); cursor: not-allowed;"></div>
                    <div class="form-group"><label>地址</label><input type="text" v-model="profile.address" class="profile-input"></div>
                    <div class="form-group"><label>電話號碼</label><input type="text" v-model="profile.phone" class="profile-input"></div>
                    <div class="form-actions-right"><button type="button" class="action-logout-btn" @click="handleLogout">登出</button><button type="submit" class="action-save-btn">儲存</button></div>
                </form>
            </div>
        </div>
    </main>

    <%@ include file="footer.jspf" %>

</div>
<script type="module" src="app.js"></script>
<script>
$(document).ready(function() {
    $(document).on('click', '.action-detail-btn', function(e) {
        e.preventDefault();
        e.stopPropagation();
        let $wrapper = $(this).closest('.order-group-wrapper');
        let $subpanel = $wrapper.find('.order-details-subpanel');
        $subpanel.slideToggle(250);
    });
});
</script>
</body>
</html>