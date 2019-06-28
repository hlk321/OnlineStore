<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>购物车</title>
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
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#select-all").click(function () {
                $(":checkbox[name='productId']").prop("checked",this.checked);
                queryTotal();
            });
            $(":checkbox[name='productId']").click(function () {
                $("#select-all").prop("checked",$(":checkbox[name='productId']").length === $(":checkbox[name='productId']:checked").length);
                queryTotal();
            });
            $("#btn-checkout").click(function () {
                var inputs = $(":checkbox[name='productId']:checked");
                if(inputs.length === 0){
                    alert("请至少选择一个商品")
                    return;
                }
                var url = "${path}/checkout?";
                inputs.each(function () {
                    url += "productId="+this.value+"&"

                });
                location = url;
            });
        });

        function queryTotal() {
            var inputs = $(":checkbox[name='productId']:checked");
            if(inputs.length === 0){
                $("#total_amount").text(0);
                $("#total_price").text(0);
                return;
            }
            var url = "${path}/cartTotal?";
            inputs.each(function () {
               // console.log(this.value);
                url += "productId="+this.value+"&"

            });
            //console.log(url);
            $.ajax({
                url:url,
                type:"get",
                success:function (res) {
                    $("#total_amount").text(res.TOTAL_AMOUNT);
                    $("#total_price").text(res.TOTAL_PRICE);
                }
            });
        }

        function updateAmount(e) {
            var strong = $("#totalPrice")[0];
            var tr = $(e).parent().parent();
            var input = tr.children(":first").children("input");
            input.prop("checked",true);
            var productId = tr.children(":first").children().val();
            var td = tr.children("td")[3];
            var total = tr.children("td")[5].children[0];
            var price = td.children[0].innerText;
            var action = "add";
            if($(e).val() === "-"){
                action = "sub";
            }else {
                var stock = parseInt($(e).parent().children(":last")[0].innerText);
                console.log(stock);
                var inp = parseInt($(e).parent().children(".number").val());
                console.log(inp);
                if(inp >= stock){
                    alert("超出库存");
                    queryTotal();
                    return;
                }
            }
            var input = $(e).parent().children(".number");
            $.ajax({
                url:"${path}/updateAmount",
                type:"get",
                data:{
                    productId:productId,
                    action:action
                },
                success:function (res) {
                    queryTotal();
                    if(res.success){
                        var amount = input.val();
                        if(action === "add"){
                            input.val(++amount);
                            total.innerText = input.val() * price;
                            totalPrice = parseInt(strong.innerText);
                        }else{
                            input.val(--amount);
                            total.innerText = input.val() * price;
                            totalPrice = parseInt(strong.innerText);
                        }
                    }else {
                        del(e);
                    }
                }
            });
        };
        function del(e) {
            var result = confirm("确定要删除？");
            if(result){
            var tr = $(e).parent().parent();
            var productId = tr.children(":first").children().val();
            //console.log($(e).parent().parent().children(":first").children().val());
            $.ajax({
                url:"${path}/cart/delete",
                type:"get",
                data:{
                    productId:productId
                },
                success:function (res) {
                    queryTotal();
                    if(res.success){
                        alert("删除成功");
                        tr.remove();
                    }else{
                        alert("删除失败");
                    }
                }
            })
        }
        }
    </script>
</head>
<body>
<!--header-->
<%@include file="_header.jsp" %>
<section class="wrap" style="margin-top:20px;overflow:hidden;">
    <table class="order_table">
        <tr>
            <th class="center"><input type="checkbox" id="select-all"/></th>
            <th>产品</th>
            <th>名称</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${requestScope.products}" var="product">
            <tr>
                <td class="center"><input type="checkbox" name="productId" value="${product.PRODUCT_ID}"/></td>
                <td class="center"><a href="${path}/product?productId=${product.PRODUCT_ID}"><img src="${path}/${product.URL}"
                                                                  style="width:50px;height:50px;"/></a></td>
                <td><a href="${path}/product?productId=${product.PRODUCT_ID}">${product.PRODUCT_NAME}</a></td>
                <td class="center"><span class="rmb_icon">${product.PRICE}</span></td>
                <td class="center">
                    <input type="button" value="-" class="jj_btn" onclick="updateAmount(this)"/>
                    <input type="text" value="${product.AMOUNT}" class="number" readonly/>
                    <input type="button" value="+" class="jj_btn" onclick="updateAmount(this)"/>
                    <span style="display: none" class="stock">${product.STOCK}</span>
                </td>
                <td class="center totalPrice"><strong class="rmb_icon">${product.PRICE * product.AMOUNT}</strong></td>
                <td class="center">
                    <a type="button" onclick="del(this)">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="order_btm_btn">
        <a href="#" class="link_btn_01 buy_btn"/>共<span id="total_amount">0</span>件</a>
        <a href="${path}/product_list" class="link_btn_01 buy_btn"/>继续购买</a>
        <a id="btn-checkout" class="link_btn_02 add_btn"/>共计金额
        <strong id="totalPrice" class="rmb_icon"><span id="total_price">0.00</span></strong>立即结算
        </a>
    </div>
</section>
<!--footer-->
<footer>
    <div class="wrap btmInfor">
        <p style="width: auto">© 2013 DeathGhost.cn 版权所有 网络文化经营许可证：浙网文[2013]***-027号 增值电信业务经营许可证：浙B2-200***24-1
            信息网络传播视听节目许可证：1109***4号</p>
        <address>联系地址：陕西省西安市雁塔区XXX号</address>
    </div>
</footer>
</body>
</html>
