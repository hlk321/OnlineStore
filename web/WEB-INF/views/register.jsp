<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>注册</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${path}/icon/favicon.ico" type="image/x-icon">
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
    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".sbmt_btn").click(function () {
                var data = $("form").serialize();
                console.log(data);
                $.ajax({
                    url: "${path}/register",
                    type: "post",
                    data: data,
                    success: function (res) {
                        console.log(res);
                        if (res.result) {
                            alert("注册成功,去登陆")
                            location = "${path}/login";
                        } else {
                            alert(res.error);
                        }
                    }
                });
                return false;
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

<section class="wrap user_form">
    <div class="lt_img">
        <img src="${path}/images/form_bg.jpg"/>
    </div>
    <div class="rt_form">
        <h2>会员注册</h2>
        <form action="${path}/register" method="post">
            <ul>
                <li class="user_icon">
                    <input type="text" name="userName" class="textbox" placeholder="用户名"/>
                </li>
                <li class="user_icon">
                    <input type="text" name="tel" class="textbox" placeholder="手机号"/>
                </li>
                <li class="user_pwd">
                    <input type="password" name="password1" class="textbox" placeholder="设置密码"/>
                </li>
                <li class="user_pwd">
                    <input type="password" name="password2" class="textbox" placeholder="确认密码"/>
                </li>
                <li class="link_li">
                    <%-- <label><input type="checkbox"/><a>阅读注册协议</a></label>--%>
                    <a href="login" title="登录账号" class="fr">已有账号，立即登录？</a>
                </li>
                <li class="link_li">
                    <input type="button" value="立即注册" class="sbmt_btn"/>
                </li>
            </ul>
        </form>
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
