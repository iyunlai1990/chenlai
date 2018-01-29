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
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
    <legend>文章图表</legend>
    <div>
        <a target="_blank" href="/front/articleCategoryByDate?style=1">年</a>
        <a target="_blank" href="/front/articleCategoryByDate?style=2">月</a>
        <a target="_blank" href="/front/articleCategoryByDate?style=4">周</a>
        <a target="_blank" href="/front/articleCategoryByDate?style=3">日</a>
    </div>
</fieldset>


<script src="${ctxStatic}/layer/layer.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

</body>
</html>
