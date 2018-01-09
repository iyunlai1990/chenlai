<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/12/27
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/frontweb/include/head.jsp" %>
</head>
<body class="bg-grey" gtools_scp_screen_capture_injected="true">
<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
<header id="header" class="header bg-white">
    <%@ include file="/WEB-INF/views/frontweb/layouts/header.jsp" %>
</header>
<div class="main-content index-page clearfix">
    <div class="post-lists">
        <div class="post-lists-body">
            <c:forEach items="${articleList}" var="item">
                <div class="post-list-item">
                    <div class="post-list-item-container">
                        <div class="item-thumb bg-deepgrey" style="background-image:url(${item.image});"></div>
                        <div class="item-desc">
                            <p> ${item.description}。
                                ...</p>
                        </div>
                        <%--<a href="${pageContext.request.contextPath}/front/view-${item.category.id}-${item.id}${fns:getUrlSuffix()}" target="_blank">

                        </a>--%>
                        <div class="item-slant reverse-slant bg-deepgrey"></div>
                        <div class="item-slant"></div>
                        <div class="item-label">
                            <div class="item-title"><a href="${pageContext.request.contextPath}/front/view-${item.category.id}-${item.id}${fns:getUrlSuffix()}" target="_blank">${item.title}</a>
                            </div>
                            <div class="item-meta clearfix">
                                 <div class="item-meta-cat">
                                     <a href="${pageContext.request.contextPath}/front/jumpArticleCategory?id=${item.category.id}" target="_blank">
                                             ${item.category.name}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="lists-navigator clearfix">
        <ol class="page-navigator">
            <%--
                        <li  class="current" ><a href="/page/1">1</a></li>
                        <li ><a href="/page/2">2</a></li>

                        <li class="next"><a href="/page/2">→</a></li>--%>
        </ol>
    </div>
</div>
<footer id="footer" class="footer bg-white">
    <%@ include file="/WEB-INF/views/frontweb/layouts/footer.jsp" %>
</footer>


</body>
</html>
