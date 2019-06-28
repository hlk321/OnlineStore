<%@ page pageEncoding="UTF-8" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<header>
    <!--topNavBg-->
    <div class="topNavBg">
        <div class="wrap">
            <!--topLeftNav-->
            <ul class="topLtNav">
                <%--<li><a href="${path}/login" class="obviousText">登录</a></li>
                <li><a href="${path}/WEB-INF/views/register.jsp">注册</a></li>--%>
                    <c:if test="${sessionScope.user != null}">
                        <a href="#"><span class="cr">${sessionScope.user.USER_NAME}</span></a>
                        <a href="${path}/logout"><span class="cr">退出登录</span></a>
                    </c:if>
                    <c:if test="${sessionScope.user == null}">
                        <a href="${path}/login"><span class="cr">登录</span></a>
                        <a href="${path}/register">注册</a>
                    </c:if>

            </ul>
            <!--topRightNav-->
            <ul class="topRtNav">
                <li><a href="${path}/user">个人中心</a></li>
                <li><a href="${path}/cart" class="cartIcon">购物车</a></li>
                <%--<li><a href="${path}/favorite.jsp" class="favorIcon">收藏夹</a></li>--%>
            </ul>
        </div>
    </div>
    <!--logoArea-->
    <div class="wrap logoSearch">
        <!--logo-->
        <div class="logo">
            <h1><img src="${path}/images/logo.png"/></h1>
        </div>
        <!--search-->
        <div class="search">
            <ul class="switchNav">
                <li class="active" id="chanpin">商品</li>
            </ul>
            <div class="searchBox">
                <form method="get" action="${path}/product_list">
                    <div class="inputWrap">
                        <input type="text" value="${param.name}" placeholder="输入产品关键词" name="name"/>
                    </div>
                    <div class="btnWrap" >
                        <input type="submit" value="搜索"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--nav-->
    <nav>
        <ul class="wrap navList">
            <li class="category">
                <a href="${path}/product_list">全部产品</a>
                <dl class="asideNav indexAsideNav">
                    <dt><a href="${path}/product_list?classId=2000">女装</a></dt>
                    <c:forEach items="${requestScope.navNv}" var="navNv">

                        <div style="display:none" class="title">
                            <a href="${path}/product_list?classId=${navNv.CLASS_ID}"></a>
                        </div>
                        <dd>
                            <a href="${path}/product_list?classId=${navNv.CLASS_ID}">${navNv.CLASS_NAME}</a>
                        </dd>
                    </c:forEach>
                    <dt><a href="${path}/product_list?classId=2001">男装</a></dt>
                    <c:forEach items="${requestScope.navNan}" var="navNan">
                        <div style="display: none" class="title">
                            <a href="${path}/product_list?classId=${navNan.CLASS_ID}"></a>
                        </div>
                        <dd>
                            <a href="${path}/product_list?classId=${navNan.CLASS_ID}">${navNan.CLASS_NAME}</a>
                        </dd>
                    </c:forEach>
                </dl>
            </li>
            <li>
                <a href="${path}/index" class="active">首页</a>
            </li>
        </ul>
    </nav>
</header>

