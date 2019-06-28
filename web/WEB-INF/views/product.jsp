<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>产品详情</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
    <script src="${path}/js/jquery.jqzoom.js"></script>
    <script src="${path}/js/base.js"></script>
    <script>
        $(document).ready(function () {
            $("nav .indexAsideNav").hide();
            $("nav .category").mouseover(function () {
                $(".asideNav").slideDown();
            });
            $("nav .asideNav").mouseleave(function () {
                $(".asideNav").slideUp();
            });
            //detail tab
            $(".product_detail_btm .item_tab a").click(function () {
                var liindex = $(".product_detail_btm .item_tab a").index(this);
                $(this).addClass("curr_li").parent().siblings().find("a").removeClass("curr_li");
                $(".cont_wrap").eq(liindex).fadeIn(150).siblings(".cont_wrap").hide();
            });
            //radio
            $(".horizontal_attr label").click(function () {
                $(this).addClass("isTrue").siblings().removeClass("isTrue");
            });
        });
    </script>
    <script type="text/javascript">
        function updateAmount(e) {
            var input = $("input[name = 'amount']");
            console.log(input.val());
            var stock = parseInt($("#stock")[0].innerText);
            console.log(stock);
            //console.log(input.value);
            var amount = input.val();
            if($(e).val() === "-"){
                if(amount <= 1){
                    alert("不能再减少了");
                    return;
                }
                input.val(--amount);


            }else {
                if(amount >= stock){
                    alert("超出库存");
                    return;
                }
                input.val(++amount);

            }

            return;
        }

        $(function () {
            $("#btn_add2cart").click(function () {
                var productId = "${param.productId}";
                var amount = $("input[name = 'amount']").val();
                $.ajax({
                    url:"${path}/add2cart",
                    type:"get",
                    data:{
                        productId:productId,
                        amount:amount
                    },
                    success:function (res) {
                        if (res.isLogin === false) {
                            alert("添加失败,请先登录");
                            location = "${path}/login?uri="+res.uri;
                            return;
                        }
                        if(res.success){
                            var result = confirm("添加成功，去购物车？");
                            if(result){
                            location = "${path}/cart";
                            }
                        }else {
                            alert("添加失败");
                        }
                    }
                })
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
            $(".inputWrap input[type='text']").attr("placeholder", "输入产品关键词或货号");
        });
        $("#shangjia").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入商家店铺名");
        });
        $("#zixun").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入关键词查找文章内容");
        });
        $("#wenku").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入关键词查找文库内容");
        });
    });

</script>

<!--导航指向-->
<aside class="wrap insideLink">

</aside>
<section class="wrap product_detail">
    <!--img:left-->
    <div class="gallery">
        <div>
            <div id="preview" class="spec-preview"><span <%--class="jqzoom"--%>><img style="height: 420px"
                                                                                     jqimg="upload/goods.jpg"
                                                                                     src="${path}/${requestScope.product.URL}"/></span>
            </div>
        </div>
    </div>
    <!--text:right-->
    <div class="rt_infor">
        <!--lt_infor-->
        <div class="goods_infor">
            <h1><b>${requestScope.product.PRODUCT_NAME}<h4><em>货号[${requestScope.product.PRODUCT_ID}]</em></h4></b></h1>
            <ul>
                <li>
                    <dl class="horizontal">
                        <dt>价格：</dt>
                        <dd><strong class="rmb_icon univalent">${requestScope.product.PRICE}</strong></dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>品牌：</dt>
                        <dd><em>${requestScope.product.brand.BRAND_NAME}</em></dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>分类：</dt>
                        <dd><em>${requestScope.product.category.CLASS_NAME}</em></dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>上架时间：</dt>
                        <dd>
                            <time>${requestScope.product.ADD_TIME}</time>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal">
                        <dt>月销量：</dt>
                        <dd>
                            <time>${requestScope.product.SALE}</time>
                        </dd>
                    </dl>
                </li>
                <li>
                    <dl class="horizontal horizontal_attr">
                        <dt>数量：</dt>
                        <dd>
                           <%-- <input type="button" value="-" class="jj_btn"/>
                            <input name="amount" type="text" value="1" readonly class="num"/>
                            <input type="button" value="+" class="jj_btn"/>
                            <span>库存：${requestScope.product.STOCK}</span>--%>
                               <input type="button" value="-" class="jj_btn" onclick="updateAmount(this)"/>
                               <input name="amount" type="text" value="1" readonly class="num"/>
                               <input type="button" value="+" class="jj_btn" onclick="updateAmount(this)"/>
                               库存：<span id="stock">${requestScope.product.STOCK}</span>
                        </dd>
                    </dl>
                </li>
                <li class="last_li">
                    <input type="button" value="立即购买" class="buy_btn"
                           onClick="javascript:location.href='${path}/cart.html'"/>
                    <input id="btn_add2cart" type="button" value="加入购物车" class="add_btn"/>
                </li>
            </ul>
        </div>

    </div>
</section>
<!--detail-->
<section class="wrap product_detail_btm">
    <article>
        <ul class="item_tab">
            <li><a class="curr_li">商品详情</a></li>
            <li><a>商品评价（2893）</a></li>
        </ul>
        <!--商品详情-->
        <div class="cont_wrap active">
            <img src="${path}/${requestScope.product.URL}"/><br/>
        </div>
        <!--商品评价-->
        <div class="cont_wrap">
            <table class="table">
                <tr>
                    <td width="20%" align="center">李*锋</td>
                    <td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
                    <td width="20%" align="center">
                        <time>2013-01-13 15:06</time>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="center">彭**法</td>
                    <td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
                    <td width="20%" align="center">
                        <time>2013-01-13 15:06</time>
                    </td>
                </tr>
                <tr>
                    <td width="20%" align="center">代**彭</td>
                    <td width="60%">
                        这里是评论内容哦这里是评论内容哦这里是评论内容哦容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦
                    </td>
                    <td width="20%" align="center">
                        <time>2013-01-13 15:06</time>
                    </td>
                </tr>
            </table>
            <!--分页-->
            <div class="paging">
                <a>第一页</a>
                <a class="active">2</a>
                <a>3</a>
                <a>...</a>
                <a>89</a>
                <a>最后一页</a>
            </div>
        </div>
    </article>
    <aside>
        <dl class="aside_pro_list">
            <dt>
                <strong>精品推荐</strong>
                <a href="${path}/product_list">更多</a>
            </dt>
            <c:forEach items="${requestScope.hot}" var="product">
                <dd>
                    <a href="${path}/product?brandId=${product.BRAND_ID}&productId=${product.PRODUCT_ID}" class="goods_img"><img src="${product.URL}"/></a>
                    <div class="rt_infor">
                        <h3><a href="${path}/#">${product.PRODUCT_NAME}</a></h3>
                        <p><strong class="rmb_icon">${product.PRICE}</strong></p>
                    </div>
                </dd>
            </c:forEach>
        </dl>
    </aside>
</section>
</body>
</html>
