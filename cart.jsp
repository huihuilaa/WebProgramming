<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車 - HIMEHINA Store</title>
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
            <h1 class="page-title">購物車</h1>
            <div class="cart-workspace">
                
                <section class="cart-items-column">
                    <div v-for="(item, index) in cartItems" :key="item.id" :id="'cart-item-' + item.id" class="cart-item-card">
                        <div class="checkbox-wrapper">
                            <input type="checkbox" :id="'check-'+item.id" class="custom-checkbox" v-model="item.selected">
                        </div>
                        <div class="item-details-box">
                            <span class="item-name">[[ item.name ]]</span>
                            <span class="item-price">NT$[[ item.price.toLocaleString() ]]</span>
                            <select v-model="item.quantity" class="qty-select">
                                <option v-for="n in 10" :value="n">[[ n ]]</option>
                            </select>
                            <button type="button" class="action-delete-btn" @click="handleDelete(item.id, index)">刪除</button>
                        </div>
                    </div>
                </section>

                <aside class="checkout-sidebar">
                    <div class="summary-outer-card">
                        <h2>結帳明細</h2>
                        <div class="price-block-card">
                            <span>商品總金額</span>
                            <span class="price-value-text bold-dark">NT$[[ subtotal.toLocaleString() ]]</span>
                        </div>
                        <div class="price-block-card">
                            <span>運費</span>
                            <span class="price-value-text light-slate">NT$[[ shippingFee ]]</span>
                        </div>
                        <div class="price-block-card">
                            <span>結帳金額</span> 
                            <span class="price-value-text hime-pink-highlight">NT$[[ finalTotal.toLocaleString() ]]</span>
                        </div>
                        <div class="btn-container">
                            <button type="button" class="action-checkout-btn" @click="handleCheckoutClick">結帳</button>
                        </div>
                    </div>
                </aside>

            </div>
        </div>
    </main>

    <%@ include file="footer.jspf" %>

</div>

<script type="module" src="app.js"></script>

<script>
$(document).ready(function() {
    $(document).on('click', '.action-delete-btn', function() {
        let $card = $(this).closest('.cart-item-card');
        $card.animate({
            'opacity': 0,
            'margin-left': '-100px'
        }, 350, function() {
            $card.slideUp(200);
        });
    });
});
</script>
</body>
</html>