<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set><!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>我的账户-用户中心</title>
<meta name="keywords"  content="DeathGhost" />
<meta name="description" content="DeathGhost" />
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/style.css" /><script src="js/html5.js"></script>
<script src="js/jquery.js"></script>
<script>
$(document).ready(function(){
  $("nav .indexAsideNav").hide();
  $("nav .category").mouseover(function(){
	  $(".asideNav").slideDown();
	  });
  $("nav .asideNav").mouseleave(function(){
	  $(".asideNav").slideUp();
	  });
  //测试效果
  $("#chongzhi").click(function(){
	  $(".sums").show();
	  $(".sums input").attr("placeholder","输入充值金额")
	  $(".group_btn").val("立即充值");
	  });
  $("#tixian").click(function(){
	  $(".sums").show();
	  $(".sums input").attr("placeholder","输入提现金额")
	  $(".group_btn").val("立即提现");
	  });
});
</script>
 <script type="text/javascript">
  $(function () {
   $(":button").click(function () {
    var charge = $(this).parent().children(":first").children().val();
    $.ajax({
     url:"${path}/charge",
     type:"get",
     data:{
      money:charge
     },
     success:function (res) {
      if (res.result){
       alert("充值成功！");
       location="${path}/user";
      }else {
       alert("充值失败！")
      }
     }
    })
   });
  });
 </script>
</head>
<body>
<%@include file="_header.jsp"%>
 <script>
 $(document).ready(function(){
   //测试效果，程序对接如需变动重新编辑
   $(".switchNav li").click(function(){
     $(this).addClass("active").siblings().removeClass("active");
     });
   $("#chanpin").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入产品关键词或货号");
     });
   $("#shangjia").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入商家店铺名");
     });
   $("#zixun").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入关键词查找文章内容");
     });
   $("#wenku").click(function(){
     $(".inputWrap input[type='text']").attr("placeholder","输入关键词查找文库内容");
     });
   });
   
 </script>
 
<section class="wrap user_center_wrap">
 <!--左侧导航-->
  <aside class="user_aside_nav">
  <dl>
   <dt>买家中心</dt>
   <dd><a href="order_list.html">我的订单</a></dd>
   <dd><a href="price_list.html">我的询价单</a></dd>
   <dd><a href="favorite.html">我的收藏</a></dd>
   <dd><a href="address.html">我的地址库</a></dd>
  </dl>
  <dl>
   <dt>商家管理中心</dt>
   <dd><a href="authenticate.html">我要开店</a></dd>
   <dd><a href="setting.html">店铺设置</a></dd>
   <dd><a href="seller_product_list.html">商品列表</a></dd>
   <dd><a href="seller_order_list.html">订单列表</a></dd>
   <dd><a href="offer_list.html">询价单</a></dd>
  </dl>
  <dl>
   <dt>控制面板</dt>
   <dd><a href="message.html">站内短消息</a></dd>
   <dd><a href="account.html">资金管理</a></dd>
   <dd><a href="profile.html">个人资料</a></dd>
   <dd><a href="change_password.html">修改密码</a></dd>
  </dl>
 </aside>
 <!--右侧：内容区域-->
 <div class="user_rt_cont">
  <div class="top_title">
   <strong>资金管理</strong>
  </div>
  <dl class="user_account">
   <dt>账户余额：</dt>
   <dd>
    <strong class="rmb_icon">${requestScope.user.MONEY}</strong>
    <a class="link_btn" id="chongzhi">充值</a>
    <a class="link_btn" id="tixian">提现</a>
    <span class="sums">
     <label>充值金额：<input type="text" class="textbox"/>元</label>
     <input type="button" value="确认按钮" class="group_btn"/>
    </span>
   </dd>
  </dl>
  <table class="order_table">
   <caption><span class="fl">资金变动明细</span></caption>
   <tr>
    <th>类型</th>
    <th>交易金额</th>
    <th>当前余额</th>
    <th>交易时间</th>
    <th>操作</th>
   </tr>
   <tr>
    <td class="center">充值</td>
    <td class="center"><strong class="rmb_icon">58.00</strong></td>
    <td class="center"><span class="rmb_icon">2359.00</span></td>
    <td class="center"><time>2013-01-15 16:59:21</time></td>
    <td class="center">充值完成！</td>
   </tr>
   <tr>
    <td class="center">提现</td>
    <td class="center"><strong class="rmb_icon">129.00</strong></td>
    <td class="center"><span class="rmb_icon">2359.00</span></td>
    <td class="center"><time>2013-01-15 16:59:21</time></td>
    <td class="center">等待处理！</td>
   </tr>
   <tr>
    <td class="center">订单：201301151702</td>
    <td class="center"><strong class="rmb_icon">129.00</strong></td>
    <td class="center"><span class="rmb_icon">2359.00</span></td>
    <td class="center"><time>2013-01-15 16:59:21</time></td>
    <td class="center">交易完成！</td>
   </tr>
   <tr>
    <td class="center">充值</td>
    <td class="center"><strong class="rmb_icon">58.00</strong></td>
    <td class="center"><span class="rmb_icon">2359.00</span></td>
    <td class="center"><time>2013-01-15 16:59:21</time></td>
    <td class="center">充值完成！</td>
   </tr>
   <tr>
    <td class="center">提现</td>
    <td class="center"><strong class="rmb_icon">129.00</strong></td>
    <td class="center"><span class="rmb_icon">2359.00</span></td>
    <td class="center"><time>2013-01-15 16:59:21</time></td>
    <td class="center">等待处理！</td>
   </tr>
   <tr>
    <td class="center">订单：201301151702</td>
    <td class="center"><strong class="rmb_icon">129.00</strong></td>
    <td class="center"><span class="rmb_icon">2359.00</span></td>
    <td class="center"><time>2013-01-15 16:59:21</time></td>
    <td class="center">交易完成！</td>
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
</section>
<!--footer-->
<footer>
 <!--help-->
 <ul class="wrap help">
  <li>
   <dl>
    <dt>消费者保障</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>新手上路</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>付款方式</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>服务保障</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
 </ul>
 <dl class="wrap otherLink">
  <dt>友情链接</dt>
  <dd><a href="#" target="_blank">素材网站</a></dd>
  <dd><a href="#/pins/24448.html">HTML5模块化后台管理模板</a></dd>
  <dd><a href="#/pins/15966.html">绿色清爽后台管理系统模板</a></dd>
  <dd><a href="#/pins/14931.html">黑色的cms商城网站后台管理模板</a></dd>
  <dd><a href="http://www.bootstrapmb.com" target="_blank">前端博客</a></dd>
  <dd><a href="http://www.bootstrapmb.com" target="_blank">博客</a></dd>
  <dd><a href="http://www.bootstrapmb.com" target="_blank">新码笔记</a></dd>
  <dd><a href="http://www.bootstrapmb.com" target="_blank">DethGhost</a></dd>
  <dd><a href="#">当当</a></dd>
  <dd><a href="#">优酷</a></dd>
  <dd><a href="#">土豆</a></dd>
  <dd><a href="#">新浪</a></dd>
  <dd><a href="#">钉钉</a></dd>
  <dd><a href="#">支付宝</a></dd>
 </dl>
 <div class="wrap btmInfor">
  <p>© 2013 DeathGhost.cn 版权所有 网络文化经营许可证：浙网文[2013]***-027号 增值电信业务经营许可证：浙B2-200***24-1 信息网络传播视听节目许可证：1109***4号</p>
  <address>联系地址：陕西省西安市雁塔区XXX号</address>
 </div>
</footer>
</body>
</html>
