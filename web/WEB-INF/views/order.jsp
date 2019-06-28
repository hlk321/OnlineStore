<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>订单页</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
</head>
<body>
<!--header-->
<section class="wrap" style="margin-top:20px;overflow:hidden;">
    <table class="order_table">
        <caption>
            <strong>订单商品</strong>
            <a href="${path}/index">回到首页</a>
            <a>|</a>
            <a href="${path}/cart">返回购物车</a>
        </caption>
        <c:forEach items="${requestScope.orderList}" var="order">
            <tr>
                <th style="width: 200px">订单号:${order.ORDERS_ID}</th>
                <th style="width: 200px">下单时间:<fmt:formatDate value="${order.TIME}" type="both"></fmt:formatDate></th>
                    <%--<th style="width: 550px"></th>--%>
            </tr>
            <c:forEach items="${order.products}" var="product" varStatus="status">
                <tr>
                    <td class="center"><img src="${path}/${product.URL}"
                                            style="width:50px;height:50px;"/></td>
                    <td>${product.PRODUCT_NAME}</td>
                    <td class="center"><span class="rmb_icon">${product.PRICE}</span></td>
                    <td class="center"><span>${product.AMOUNT}件</span></td>

                    <c:if test="${status.first}">
                        <td class="center" rowspan="${fn:length(order.products)}">收件人姓名：${order.address.NAME}<br>
                            手机号:${order.address.TEL}<br>
                                ${order.address.ADDRESS_DETAIL}</td>
                        <td class="center" rowspan="${fn:length(order.products)}">总金额:<strong class="rmb_icon">${order.totalPrice}</strong></td>
                    </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
    </table>
    <!--支付与配送-->
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
