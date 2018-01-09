<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文章内容引用模块管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/cmsArticleDataGuide/">文章内容引用模块列表</a></li>
		<shiro:hasPermission name="cms:cmsArticleDataGuide:edit"><li><a href="${ctx}/cms/cmsArticleDataGuide/form">文章内容引用模块添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cmsArticleDataGuide" action="${ctx}/cms/cmsArticleDataGuide/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>父级编号：</label>
			</li>
			<li><label>所有父级编号：</label>
				<form:input path="parentIds" htmlEscape="false" maxlength="2000" class="input-medium"/>
			</li>
			<li><label>文章内容id：</label>
				<form:input path="articleDataId" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>内容块id：</label>
				<form:input path="articledivtitle" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>创建者：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cmsArticleDataGuide.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新者：</label>
				<form:input path="updateBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${cmsArticleDataGuide.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注信息：</label>
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>删除标记：</label>
				<form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li><label>内容块引用：</label>
				<form:input path="articledivhref" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>父级编号</th>
				<th>所有父级编号</th>
				<th>文章内容id</th>
				<th>内容块id</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<th>删除标记</th>
				<th>内容块引用</th>
				<shiro:hasPermission name="cms:cmsArticleDataGuide:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cmsArticleDataGuide">
			<tr>
				<td><a href="${ctx}/cms/cmsArticleDataGuide/form?id=${cmsArticleDataGuide.id}">
					${cmsArticleDataGuide.id}
				</a></td>
				<td>
					${cmsArticleDataGuide.parent.id}
				</td>
				<td>
					${cmsArticleDataGuide.parentIds}
				</td>
				<td>
					${cmsArticleDataGuide.articleDataId}
				</td>
				<td>
					${cmsArticleDataGuide.articledivtitle}
				</td>
				<td>
					${cmsArticleDataGuide.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${cmsArticleDataGuide.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${cmsArticleDataGuide.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${cmsArticleDataGuide.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${cmsArticleDataGuide.remarks}
				</td>
				<td>
					${fns:getDictLabel(cmsArticleDataGuide.delFlag, 'del_flag', '')}
				</td>
				<td>
					${cmsArticleDataGuide.articledivhref}
				</td>
				<shiro:hasPermission name="cms:cmsArticleDataGuide:edit"><td>
    				<a href="${ctx}/cms/cmsArticleDataGuide/form?id=${cmsArticleDataGuide.id}">修改</a>
					<a href="${ctx}/cms/cmsArticleDataGuide/delete?id=${cmsArticleDataGuide.id}" onclick="return confirmx('确认要删除该文章内容引用模块吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>