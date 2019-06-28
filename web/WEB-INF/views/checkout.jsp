<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>确认订单</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn-submit").click(function () {
                var url = "${path}/submit?"
                var addressId = $(":radio[name='addressId']:checked").val();
                var address = $(":radio[name='addressId']:checked");
                if(address.length === 0){
                    alert("请选择地址");
                    return;
                }
                url += "addressId="+addressId+"&";
                $(":hidden[name='productId']").each(function () {
                    url += "productId="+this.value+"&"
                });
                $.ajax({
                    url:url,
                    type:"get",
                    success:function (res) {
                        if(res.success){
                            alert("下单成功");
                            location = "${path}/order";
                        }else {
                            alert("下单失败，请返回重试");
                            location = "${path}/cart";
                        }
                    }
                })
            });
        });
    </script>
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
        <c:forEach items="${requestScope.productList}" var="product">
                <tr>
                    <td class="center">
                        <input type="hidden" name="productId" value="${product.PRODUCT_ID}">
                        <img src="${path}/${product.URL}" style="width:50px;height:50px;"/>
                    </td>
                    <td>${product.PRODUCT_NAME}</td>
                    <td class="center"><span class="rmb_icon">${product.PRICE}</span></td>
                    <td class="center"><span>${product.AMOUNT}件</span></td>
                </tr>
        </c:forEach>
    </table>
    <!--支付与配送-->
    <ul class="order_choice">
        <div style="height: 30px">
        <li style="float: right">
            <dl>
               <%-- <dt>支付</dt>--%>
                <%--<dd>
                    <label class="radio istrue"><input type="radio" name="pay"/>支付宝</label>
                    <label class="radio"><input type="radio" name="pay"/>货到付款</label>
                </dd>--%>
                <dd>
                    <label>
                        <a class="link_btn_01 buy_btn" style="color: black">共${requestScope.total.TOTAL_AMOUNT}件</a>
                        <input type="text" value="￥${requestScope.total.TOTAL_PRICE}" class="textbox" style="color: black; background-color:#ffffff;font-size: 16px" readonly/>
                        <br>
                        <mark>当前账户余额<strong class="rmb_icon" style="color: #808080">${requestScope.user.MONEY}</strong></mark>
                    </label>
                </dd>
            </dl>
        </li>
        </div>
        <li>
            <dl>
                <dt>选择地址</dt>
                <div style="height: 90px">
                <c:forEach items="${requestScope.addressList}" var="address">
                    <dd style="float: left"><input type="radio" name="addressId" value="${address.ADDRESS_ID}"/>
                        <label class="radio"><input type="radio" name="peisong"/><td class="center" rowspan="${fn:length(order.products)}">收件人姓名：${address.NAME}<br>
                            联系方式:${address.TEL}<br>
                                收件地址：${address.ADDRESS_DETAIL}</td>
                        </label>
                    </dd>
                </c:forEach>
                </div>

            </dl>
        </li>

       <%-- <li>
            <dl>
                <dt>配送方式</dt>
                <dd>
                    <label class="radio"><input type="radio" name="peisong"/>物流</label>
                    <label class="radio istrue"><input type="radio" name="peisong"/>自配送</label>
                    <label class="radio"><input type="radio" name="peisong"/>快递</label>
                </dd>
            </dl>
        </li>--%>
        <li>
            <dl>
                <dt>订单留言</dt>
                <dd>
                    <textarea></textarea>
                </dd>
            </dl>
        </li>
    </ul>
    <div class="order_btm_btn">
        <a <%--href="${path}/system_prompts.html"--%> id="btn-submit" class="link_btn_02 add_btn"/>提交订单</a>
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
