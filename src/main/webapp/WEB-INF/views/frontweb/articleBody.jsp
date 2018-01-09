<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page contentType='text/html;charset=UTF-8' %>
<%@ include file='/WEB-INF/views/include/taglib.jsp'%>
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

<article class='main-content page-page' itemscope itemtype='http://schema.org/Article'>
    <div class='post-header'>
        <h1 class='post-title' itemprop='name headline'>
            <a href='${pageContext.request.contextPath}/front/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}'>${article.title}</a>
        </h1>
        <div class='post-data'>
            <time datetime='2017-02-25' itemprop='datePublished'>发布于 <fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd"/></time>
            / <a href='/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB'>${article.category.name}</a> / <a id="commentList" href='#comments'>  ${commentPage.list.size()}条评论</a> /
            ${article.hits}浏览
        </div>
    </div>
    <div id='post-content' class='post-content' itemprop='articleBody'>
        <p class='post-tags'></p>
        <p></p>
        ${article.articleData.content}
    </div>
</article>
</body>
</html>
