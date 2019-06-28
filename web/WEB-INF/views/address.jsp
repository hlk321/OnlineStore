<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>我的地址-用户中心</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${path}/css/style.css"/>
    <script src="${path}/js/html5.js"></script>
    <script src="${path}/js/jquery.js"></script>
    <script>$(document).ready(function () {
        $("nav .indexAsideNav").hide();
        $("nav .category").mouseover(function () {
            $(".asideNav").slideDown();
        });
        $("nav .asideNav").mouseleave(function () {
            $(".asideNav").slideUp();
        });
    });</script>
    <script type="text/javascript">
        $(function () {
            $("#update_save").click(function () {
                var addressId = $(this).parent().children("input[name='addressId']").val();
                console.log(addressId==null);
                var table = $(this).parent().parent().parent();
                var name = table.children().find("input")[0].value;
                var tel = table.children().find("input")[1].value
                var address = table.children().find("input")[2].value + table.children().find("input")[3].value;
                if (addressId == null){
                    $.ajax({
                        url:"${path}/saveAddress",
                        type:"get",
                        data:{
                            name:name,
                            tel:tel,
                            address:address
                        },
                        success:function (res) {
                            if (res.result) {
                                alert("添加成功");
                                location = "${path}/address";
                            }
                            console.log(res);
                        }
                    });
                }else{
                    $.ajax({
                        url:"${path}/updateAddress",
                        type:"get",
                        data:{
                            addressId:addressId,
                            name:name,
                            tel:tel,
                            address:address
                        },
                        success:function (res) {
                            if (res.result) {
                                alert("修改成功");
                                location = "${path}/address";
                            }else {
                                alert("修改失败")
                            }
                        }
                    });
                }

            });
            $(".btn-delete").click(function () {
                var result = confirm("确定要删除？");
                if(result){
                    var addressId = $(this).parent().children("input[name='addressId']").val();
                    console.log(addressId);

               $.ajax({
                   url:"${path}/address/delete",
                   type:"get",
                   data:{
                       addressId:addressId
                   },
                   success:function (res) {
                       if (res.result) {
                           alert("删除成功");
                           location = "${path}/address";
                       }else {
                           alert("删除失败")
                       }
                   }
               });
                };
            });
          $(".btn-update").click(function () {
              var addressId = $(this).parent().children("input[name='addressId']").val();
              var input = "";
              $(".readd").children("input[name='addressId']").remove();
              input = "<input name="+'addressId'+" type="+'hidden'+" value=\"" + addressId + "\"/>"
              $("#update_save").parent().append(input);
          });
        });

    </script>
</head>
<body>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/city-picker.data.js"></script>
<script src="js/city-picker.js"></script>
<script src="js/main.js"></script>
<section class="wrap user_center_wrap"><!--左侧导航-->
    <aside class="user_aside_nav">
        <dl>
            <dt>买家中心</dt>
            <dd><a href="${path}/order">我的订单</a></dd>
            <%--<dd><a href="${path}/}${path}/}favorite.html">我的收藏</a></dd>--%>
            <dd><a href="${path}/address">地址管理</a></dd>
            <dd><a href="${path}/index">回到首页</a></dd>
        </dl>
    </aside>
    <!--右侧：内容区域-->
    <div class="user_rt_cont">
        <div class="top_title">
            <strong>我的地址列表</strong>
        </div>
        <table class="order_table">
            <tr>
                <td width="100" align="right">收件人：</td>
                <td><input type="text" placeholder="输入收件人姓名" class="textbox"/></td>
            </tr>
            <tr>
                <td width="100" align="right">联系电话：</td>
                <td><input type="text" placeholder="收件人手机号码" class="textbox"/></td>
            </tr>
            <tr>
                <td width="100" align="right">收件地址：</td>
                <td>
                    <div class="docs-methods">
                        <form class="form-inline">
                            <div id="distpicker">
                                <div class="form-group">
                                    <div style="position: relative;">
                                        <input id="city-picker3" class="form-control" readonly type="text" value=""
                                               data-toggle="city-picker">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-warning" id="reset" type="button">重置</button>
                                    <button class="btn btn-danger" id="destroy" type="button">确定</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="100" align="right">详细地址：</td>
                <td><input type="text" placeholder="街道门牌号" class="textbox textbox_295"/></td>
            </tr>
            <tr>
                <td width="100" align="right"></td>
                <td><input type="button" id="update_save" value="更新保存" class="group_btn"/></td>
            </tr>
        </table>
        <table class="order_table address_tbl">
            <tr>
                <th width="140">收件人</th>
                <th width="140">联系电话</th>
                <th>收件地址</th>
                <th width="240">操作</th>
            </tr>
            <c:forEach items="${requestScope.address}" var="address">
                <tr>
                    <td>${address.NAME}</td>
                    <td>${address.TEL}</td>
                    <td>
                        <address style="text-align: center">
                                ${address.ADDRESS_DETAIL}
                        </address>
                    </td>
                    <td style="text-align: center">
                        <%--<label><input type="radio" name="moren"/>设为默认地址</label>--%>
                        <input type="hidden" name="addressId" value="${address.ADDRESS_ID}"/>
                        <input type="button" value="编辑" class="btn-update"/>
                        <input type="button" value="删除" class="btn-delete"/>
                        <%--<span style="display: none" class="addressId"></span>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
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
