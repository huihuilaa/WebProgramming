<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>所有商品 - HIMEHINA Store</title>
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
            
            <!-- 上面推薦商品：維持三個一排大卡片不變 -->
            <section class="featured-carousel-zone">
                <div class="carousel-track">
                    <div class="featured-card" @click="goToDetail('1')">
                        <img src="./picture/hime-doll.webp" alt="娃娃" style="cursor: pointer;">
                        <h3 style="cursor: pointer;">ヒメヒナミニぬい ver.ひめ</h3>
                    </div>
                    <div class="featured-card" @click="goToDetail('2')">
                        <img src="./picture/hina-doll.webp" alt="娃娃" style="cursor: pointer;">
                        <h3 style="cursor: pointer;">ヒメヒナミニぬい ver.ひな</h3>
                    </div>
                    <div class="featured-card" @click="goToDetail('3')">
                        <img src="./picture/joji-doll.webp" alt="娃娃" style="cursor: pointer;">
                        <h3 style="cursor: pointer;">ヒメヒナミニぬい ver.ジョジうさ</h3>
                    </div>
                </div>
            </section>
            
            <hr class="section-divider">
            <div class="products-filter-bar">
                <h2 class="page-title" style="margin-bottom:0;">所有商品 <span class="sub-lang">ALL PRODUCTS</span></h2>
                <!-- 🌟 已為您完美拔除最新上架的 select 按鈕 -->
            </div>
            
            <hr class="section-divider" style="margin-top:20px; margin-bottom:35px;">
            
            <!-- 下面所有商品：精準縮小、改為四個一排 -->
            <section class="products-grid-layout">
                <div v-for="prod in allProducts" :key="prod.id" class="product-item-box-mini" @click="goToDetail(prod.id)">
                    <div class="product-img-wrapper-mini">
                        <img :src="prod.img">
                    </div>
                    <div class="product-info-mini">
                        <h4 class="product-title-text-mini">[[ prod.name ]]</h4>
                        <span class="product-price-text-mini">NT$[[ prod.price ]]</span>
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