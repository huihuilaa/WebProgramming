<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單完成 - HIMEHINA Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css?v=5">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
<div id="app" class="site-wrapper">

    <%@ include file="header.jspf" %>

    <main class="main-content-area">
        <div class="content-bound">
            
            <section class="summary-outer-card" style="text-align: center; margin-bottom: 30px; padding: 40px;">
                <div style="font-size: 50px; margin-bottom: 15px;">🎉</div>
                <h1 class="hime-pink-highlight" style="font-size: 28px; margin-bottom: 10px;">完成付款！</h1>
                <p style="color: #666; margin-bottom: 20px;">感謝您的支持，我們將盡快為您安排出貨！</p>
                <p style="background: #f9f9f9; padding: 10px; display: inline-block; border-radius: 4px; font-weight: bold;">
                    訂單編號：#[[ generatedOrderId ]]
                </p>
            </section>

            <hr class="section-divider">

            <section class="cart-workspace" style="display: block; max-width: 800px; margin: 0 auto;">
                <h2 class="page-title" style="font-size: 22px; margin-bottom: 20px;">🛒 本次購買明細</h2>
                
                <div class="cart-items-column" style="margin-bottom: 25px;">
                    <div v-for="prod in receiptItems" :key="prod.id" class="cart-item-card" style="padding: 15px 20px;">
                        <div class="item-details-box" style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                            <span class="item-name" style="font-weight: 500;">[[ prod.name ]]</span>
                            <div>
                                <span class="price-value-text bold-dark" style="margin-right: 20px;">NT$[[ prod.price.toLocaleString() ]]</span>
                                <span class="light-slate" style="font-size: 16px;">數量：[[ prod.quantity ]]</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="summary-outer-card">
                    <div class="price-block-card">
                        <span>商品小計</span>
                        <span>NT$[[ receiptSubtotal.toLocaleString() ]]</span>
                    </div>
                    <div class="price-block-card">
                        <span>運費</span>
                        <span>NT$[[ receiptShipping ]]</span>
                    </div>
                    <div class="price-block-card" style="border-top: 1px dashed #ccc; padding-top: 15px; margin-top: 15px;">
                        <span style="font-weight: bold; font-size: 18px;">實付總金額</span>
                        <span class="price-value-text hime-pink-highlight" style="font-size: 24px;">NT$[[ receiptTotal.toLocaleString() ]]</span>
                    </div>
                    
                    <div style="display: flex; margin-top: 25px;">
                        <a href="products.jsp" class="action-checkout-btn" style="text-align: center; text-decoration: none; background: #56ccf2; width: 100%; box-sizing: border-box;">繼續逛逛</a>
                    </div>
                </div>
            </section>

        </div>
    </main>

    <%@ include file="footer.jspf" %>

</div>

<script type="module" src="app.js"></script>
</body>
</html>