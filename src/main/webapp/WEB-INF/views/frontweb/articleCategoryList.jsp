<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page contentType='text/html;charset=UTF-8' %>
<%@ include file='/WEB-INF/views/include/taglib.jsp' %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/12/27
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType='text/html;charset=UTF-8' language='java' %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/frontweb/include/head.jsp" %>
</head>
<body class='bg-grey' gtools_scp_screen_capture_injected='true'>
<!--[if lt IE 8]>
<div class='browsehappy' role='dialog'>
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href='http://browsehappy.com/' target='_blank'>升级你的浏览器</a>。
</div>
<![endif]-->
<header id='header' class='header bg-white'>
    <%@ include file='/WEB-INF/views/frontweb/layouts/header.jsp' %>
</header>

<div class="main-content common-page clearfix">
    <c:forEach items="${categoryList}" var="item">
        <div class="categorys-item">
            <div class="common-title">
                类型：<a href="${pageContext.request.contextPath}/front/jumpArticleCategory?id=${item.id}" target="_blank" >${item.name}</a>
            </div>
            <%--<div class="post-lists">
                <div class="post-lists-body">
                    <c:forEach items="${fnc:getArticleList(item.site.id, item.id, 4, '')}" var="article">
                        <div class="post-list-item">
                            <div class="post-list-item-container">
                                <div class="item-label">
                                    <div class="item-title">
                                        <a href="${pageContext.request.contextPath}/front/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}"
                                           target="_blank">
                                                ${article.title}</a>
                                    </div>
                                    <div class="item-meta clearfix">
                                        <div class="item-meta-date">发布于 <fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>--%>
        </div>
    </c:forEach>
</div>

<footer id='footer' class='footer bg-white'>
    <%@ include file='/WEB-INF/views/frontweb/layouts/footer.jsp' %>
</footer>


</body>
</html>
