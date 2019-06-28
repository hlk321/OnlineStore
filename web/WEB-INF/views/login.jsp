<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script src="js/html5.js"></script>
    <script src="js/jquery.js"></script>
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
    <%-- <link rel="stylesheet" href="${path}/css/bootstrap.min.css">--%>
    <script type="text/javascript" src="${path}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#login_submit").click(function () {
                var data = $("form").serialize();
                $.ajax({
                    url: "${path}/login",
                    type: "post",
                    data: data,
                    success: function (res) {
                        console.log(res);
                        if (res.error != null){
                            alert(res.error);
                            return;
                        }
                        if (res.uri) {
                            location = res.uri;
                        } else {
                            location = "${path}/index";
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
<%@include file="_header.jsp"%>
<section class="wrap user_form">
    <div class="lt_img">
        <img src="images/form_bg.jpg"/>
    </div>
    <div class="rt_form">
        <h2>会员登录</h2>
        <form action="${path}/login" method="post">
            <ul>
                <c:if test="${param.uri != null}">
                    <input value="${param.uri}" type="hidden" name="uri"/>
                </c:if>
                <li class="user_icon">
                    <input value="tom" type="text" name="username" class="textbox" placeholder="用户名"/>
                </li>
                <li class="user_pwd">
                    <input value="123456" type="password" name="password" class="textbox" placeholder="密码"/>
                </li>
                <li class="link_li">
                    <a href="${path}/register" title="注册新用户" class="fl">注册新用户</a>
                    <a href="find_pwd.jsp" title="忘记密码" class="fr">忘记密码？</a>
                </li>
                <li class="link_li">
                    <input type="button" id="login_submit" value="立即登录" class="sbmt_btn"/>
                </li>
            </ul>
        </form>
    </div>
</section>
<!--footer-->
<footer>
    <div class="wrap btmInfor">
        <p>© 2019 HLK.cn 版权所有 </p>
        <address>联系地址：山东省济宁市高新区XXX号</address>
    </div>
</footer>
</body>
</html>
