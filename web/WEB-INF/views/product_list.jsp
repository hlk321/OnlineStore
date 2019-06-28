<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>分类列表</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $("nav .indexAsideNav").hide();
            $("nav .category").mouseover(function () {
                $(".asideNav").slideDown();
            });
            $("nav .asideNav").mouseleave(function () {
                $(".asideNav").slideUp();
            });
            //冒泡
            $(".favorite_list li a").click(function () {
                window.location.href = '${path}/product.html';
            });
            $(".favorite_list li .shop_collect_goods").click(function () {
                event.stopPropagation();
            });
        });
    </script>
</head>
<body>
<!--header-->
<%@include file="_header.jsp" %>
<script>
    $(document).ready(function () {
        //测试效果，程序对接如需变动重新编辑
        $(".switchNav li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
        $("#chanpin").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入产品关键词");
        });
        $("#shangjia").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入商家店铺名");
        });
    });
    document.oncontextmenu = new Function("event.returnValue=false;");
    document.onselectstart = new Function("event.returnValue=false;");
</script>

<section class="wrap list_class_page">
    <div class="lt_area">
        <div class="attr_filter">
            <h2>属性筛选</h2>
            <ul>
                <li>
                    <dl>
                        <dt>按品牌筛选：</dt>
                        <dd>
                            <c:forEach items="${requestScope.brands}" var="brand">
                                <div style="display: none" class="title">

                                    <a href="${path}/product_list?brandId=${brand.BRAND_ID}"></a>
                                </div>

                                <a href="${path}/product_list?brandId=${brand.BRAND_ID}">${brand.BRAND_NAME}</a>
                            </c:forEach>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>按价格筛选：</dt>
                        <dd>
                            <a>0~99元</a>
                            <a>100~199元</a>
                            <a>200~299元</a>
                            <a>>300元</a>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>按分类筛选：</dt>
                        <dd>
                            <a href="${path}/product_list?classId=2000"><b>女装</b></a>
                            <c:forEach items="${requestScope.navNv}" var="navNv">
                                <div style="display:none" class="title">
                                    <a href="${path}/product_list?classId=${navNv.CLASS_ID}"></a>
                                </div>

                                <a href="${path}/product_list?classId=${navNv.CLASS_ID}">${navNv.CLASS_NAME}</a>

                            </c:forEach>

                            <a href="${path}/product_list?classId=2001"><b>男装</b></a>
                            <c:forEach items="${requestScope.navNan}" var="navNan">
                                <div style="display: none" class="title">
                                    <a href="${path}/product_list?classId=${navNan.CLASS_ID}"></a>
                                </div>

                                <a href="${path}/product_list?classId=${navNan.CLASS_ID}">${navNan.CLASS_NAME}</a>

                            </c:forEach>
                        </dd>

                    </dl>
                </li>
            </ul>
        </div>
        <!--产品列表-->
        <section class="shop_goods_li">
            <h2>店铺产品</h2>
            <ul class="favorite_list">
                <c:forEach items="${requestScope.list}" var="product">
                    <li>
                        <a href="${path}/product?brandId=${product.BRAND_ID}&productId=${product.PRODUCT_ID}">
                            <img src="${path}/${product.URL}"/>
                            <h3>${product.PRODUCT_NAME}</h3>
                            <p class="price"><span class="rmb_icon">${product.PRICE}</span></p>
                            <p class="shop_collect_goods">销量：${product.SALE}</p>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <!--分页-->
            <div class="paging">
                <a>第一页</a>
                <a class="active">2</a>
                <a>3</a>
                <a>...</a>
                <a>89</a>
                <a>最后一页</a>
            </div>
        </section>

    </div>
    <aside class="rtWrap">
        <dl class="rtLiTwoCol">
            <dt>热门推荐</dt>

            <c:forEach items="${requestScope.hot}" var="product">
            <dd>
                 <a href="${path}/product?brandId=${product.BRAND_ID}&productId=${product.PRODUCT_ID}">
                     <img src="${path}/${product.URL}"/>
                     <p>${product.PRICE}</p>
                 </a>
            </dd>
            </c:forEach>
        </dl>
    </aside>
</section>
</body>
</html>
