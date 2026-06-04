<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品詳情 - HIMEHINA Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css?v=4">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
<div id="app" class="site-wrapper">

    <%@ include file="header.jspf" %>

    <main class="main-content-area">
        <div class="content-bound">
            
            <section class="detail-main-split">
                <div class="detail-img-box">
                    <img :src="currentProduct.img" :alt="currentProduct.name" onerror="this.src='https://placehold.co/400'">
                </div>

                <div class="detail-control-box">
                    <h1 class="detail-product-title">[[ currentProduct.name ]]</h1>
                    
                    <div class="detail-info-row">
                        <span class="detail-label">價錢：</span>
                        <span class="detail-price-highlight">NT$[[ currentProduct.price ]]</span>
                    </div>

                    <div class="detail-info-row">
                        <span class="detail-label">數量：</span>
                        <div class="qty-counter-group">
                            <button type="button" class="qty-btn btn-minus">-</button>
                            <input type="text" class="qty-input" value="1" readonly>
                            <button type="button" class="qty-btn btn-plus">+</button>
                        </div>
                    </div>

                    <div class="detail-btn-group">
                        <button class="btn-add-to-cart" @click="triggerAddToCart">加入購物車</button>
                    </div>
                </div>
            </section>

            <section class="detail-desc-zone">
                <h2 class="page-title">商品資訊 <span class="sub-lang">PRODUCT INFO</span></h2>
                
                <div class="desc-text-wrapper">
                    <p class="desc-line"><span class="desc-bold-label">預購期間：</span>2026年4月24日 (五) 起開放預購</p>
                    <p class="desc-line"><span class="desc-bold-label">發售日期：</span>預計於 2026年8月底 發售</p>
                    <p class="desc-line">
                        <span class="desc-bold-label">商品配送：</span>預計於 2026年8月底 依訂單順序陸續出貨
                        <span class="desc-sub-note">※ 8月底之後的訂單將依序進行配送</span>
                    </p>
                    <p class="desc-line"><span class="desc-bold-label">商品內容：</span>HIMEHINA [[ currentProduct.name ]] × 1</p>
                    <p class="desc-line"><span class="desc-bold-label">商品規格：</span>全新周邊商品 / 材質：高品質棉、壓克力</p>
                </div>
            </section>

        </div>
    </main>

    <div id="toast-container" class="toast-container"></div>

    <%@ include file="footer.jspf" %>

</div>
<script type="module" src="app.js"></script>

<script>
$(document).ready(function() {
    $(document).on('click', '.btn-plus', function