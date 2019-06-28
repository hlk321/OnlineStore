<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>首页</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
    <script src="${path}/js/swiper.min.js"></script>
    <script>
        $(document).ready(function () {
            //焦点图
            var mySwiper = new Swiper('#slide', {
                autoplay: 5000,
                visibilityFullFit: true,
                loop: true,
                pagination: '.pagination',
            });
        })
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
            $(".inputWrap input[type='text']").attr("placeholder", "输入产品关键词或货号");
        });
        $("#shangjia").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入商家店铺名");
        });
    });

</script>

<!--advertisment area-->
<section class="wrap">
    <!--ctCont-->
    <div class="IdxmainArea">
        <!--slide-->
        <div id="slide">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="${path}/#">
                        <img src="${path}/upload/slide01.jpg"/>
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="${path}/#">
                        <img src="${path}/upload/slide02.jpg"/>
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="${path}/#">
                        <img src="${path}/upload/slide03.jpg"/>
                    </a>
                </div>
            </div>
            <div class="pagination"></div>
        </div>
        <!--singleAd-->
        <div class="singleAd">
            <a href="${path}/#">
                <img src="${path}/upload/sigleAd.jpg"/>
            </a>
        </div>
        <!--bestShop-->
        <dl class="bestShop">
            <dt>
                <strong>优秀商家推荐</strong>
                <a href="${path}/shop_list" class="fr">更多</a>
            </dt>
            <dd style="width: auto">
                <c:forEach items="${requestScope.brands}" var="brand">
                    <a style="float: left" href="${path}/product_list?brandId=${brand.BRAND_ID}">
                        <img src=${brand.URL}>
                    </a>
                </c:forEach>
            </dd>
        </dl>
    </div>
    <!--asdCont-->
    <div class="IdxAsideRt">
        <!--login-->
        <div class="idxRtLogin">
            <div class="fstArea">
                <a href="${path}/#" class="userIcon">
                    <img src="${path}/images/icon/DefaultAvatar.jpg">
                </a>
                <div class="rtInfor">
                    <p>Hi!你好<b>${sessionScope.user.USER_NAME}</b></p>
                </div>
            </div>
            <div class="secArea">
                <c:if test="${sessionScope.user != null}">
                    <a href="${path}/logout"><span class="cr">退出登录</span></a>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <a href="${path}/login"><span class="cr">登录</span></a>
                    <a href="${path}/register">注册</a>
                </c:if>

            </div>
        </div>
        <dl class="idxRtAtc">
            <dt>
                <em class="obviousText">最新公告</em>
                <a href="${path}/#">more</a>
            </dt>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
            <dd><a href="${path}/#">啦啦啦啦啦啦啦啦啦啦啦啦</a></dd>
        </dl>
    </div>
</section>
<!--productList-->
<section class="wrap idxproLi">
    <h2>
        <strong>
            <a href="${path}/product_list">产品展示区</a>
        </strong>
        <span class="classLi">
                <c:forEach items="${requestScope.navNv}" var="navNv">
                        <div style="display:none" class="title">
                            <a href="${path}/product_list?classId=${navNv.CLASS_ID}"></a>
                        </div>

                            <a href="${path}/product_list?classId=${navNv.CLASS_ID}">${navNv.CLASS_NAME}</a>
                </c:forEach>
                <c:forEach items="${requestScope.navNan}" var="navNan">
                        <div style="display: none" class="title">
                            <a href="${path}/product_list?classId=${navNan.CLASS_ID}"></a>
                        </div>

                            <a href="${path}/product_list?classId=${navNan.CLASS_ID}">${navNan.CLASS_NAME}</a>

                </c:forEach>
        </span>
    </h2>
    <div class="ltArea">
        <!--ad:category pic-->
        <a href="${path}/product_list"><img src="${path}/upload/bestCategoryPic01.jpg"/></a>
    </div>
    <div class="ctLi">
        <ul>
                <c:forEach items="${requestScope.hot}" var="product">
                   <li>
                       <a href="${path}/product?productId=${product.PRODUCT_ID}">
                           <img src="${path}/${product.URL}"/>
                           <h4>${product.PRODUCT_NAME}</h4>
                       </a>
                   </li>
               </c:forEach>
        </ul>
    </div>
</section>
</footer>
</body>
</html>
