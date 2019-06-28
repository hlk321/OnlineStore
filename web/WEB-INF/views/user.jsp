<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户中心</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
</head>
<body><!--header-->
<section class="wrap user_center_wrap">
    <!--左侧导航-->
    <aside class="user_aside_nav">
        <dl>
            <dt>买家中心</dt>
            <dd><a href="${path}/order">我的订单</a></dd>
            <%--<dd><a href="${path}/}favorite.html">我的收藏</a></dd>--%>
            <dd><a href="${path}/address">地址管理</a></dd>
            <dd><a href="${path}/index">回到首页</a></dd>
        </dl>
    </aside>
    <!--右侧：内容区域-->
    <div class="user_rt_cont">
        <div class="top_title">
            <strong>欢迎回到用户中心</strong>
        </div>
        <!--用户信息-->
        <div class="user_factbook">
           <%-- <a href="${path}/}profile.html" class="user_icon">
                <img src="${path}}s/icon/DefaultAvatar.jpg"/>
                <span>修改头像</span>
            </a>--%>
               <a class="user_icon">
                   <img src="${path}/${requestScope.user.URL}"/>
               </a>
            <div class="user_infor">
                <p><strong>${requestScope.user.USER_NAME}</strong></p>
                <p>注册时间：<fmt:formatDate value="${requestScope.user.LOGIN}" pattern="yyyy-MM-dd"/></p>
                <p>账户余额：<strong class="rmb_icon">${requestScope.user.MONEY}</strong><a href="${path}/account" class="btn">充值</a>
                    <%--<a href="${path}/}account.html" class="btn">提现</a>--%>
                </p>
            </div>
        </div>
        <!--买家订单提醒-->
        <dl class="user_order_tips">
            <dt>买家订单提醒</dt>
            <dd>
                <a href="${path}/order_list.html">
                    <strong>20</strong>
                    <em>待付款订单</em>
                </a>
            </dd>
            <dd>
                <a href="${path}/order_list.html">
                    <strong>10</strong>
                    <em>待发货订单</em>
                </a>
            </dd>
            <dd>
                <a href="${path}/order_list.html">
                    <strong>30</strong>
                    <em>待确认订单</em>
                </a>
            </dd>
            <dd>
                <a href="${path}/order_list.html">
                    <strong>15</strong>
                    <em>待评价订单</em>
                </a>
            </dd>
        </dl>
    </div>
</section>
<!--footer-->
<footer>
    <div class="wrap btmInfor">
        <p>© 2013 DeathGhost.cn 版权所有 网络文化经营许可证：浙网文[2013]***-027号 增值电信业务经营许可证：浙B2-200***24-1 信息网络传播视听节目许可证：1109***4号</p>
        <address>联系地址：陕西省西安市雁塔区XXX号</address>
    </div>
</footer>
</body>
</html>
