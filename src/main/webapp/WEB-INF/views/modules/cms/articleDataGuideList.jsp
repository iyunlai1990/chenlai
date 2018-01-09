<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文章内容引导管理</title>
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
		<li class="active"><a href="${ctx}/cms/articleDataGuide/">文章内容引导列表</a></li>
		<shiro:hasPermission name="cms:articleDataGuide:edit"><li><a href="${ctx}/cms/articleDataGuide/form">文章内容引导添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="articleDataGuide" action="${ctx}/cms/articleDataGuide/" method="post" class="breadcrumb form-search">
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
			<li><label>栏目名称：</label>
				<form:input path="articleDataId" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>描述：</label>
				<form:input path="articledivtitle" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>创建者：</label>
				<form:input path="createBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${articleDataGuide.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>更新者：</label>
				<form:input path="updateBy.id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>更新时间：</label>
				<input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${articleDataGuide.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注信息：</label>
				<form:input path="remarks" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>删除标记：</label>
				<form:radiobuttons path="delFlag" items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
				<th>栏目名称</th>
				<th>描述</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="cms:articleDataGuide:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="articleDataGuide">
			<tr>
				<td><a href="${ctx}/cms/articleDataGuide/form?id=${articleDataGuide.id}">
					${articleDataGuide.id}
				</a></td>
				<td>
					${articleDataGuide.parent.id}
				</td>
				<td>
					${articleDataGuide.parentIds}
				</td>
				<td>
					${articleDataGuide.articleDataId}
				</td>
				<td>
					${articleDataGuide.articledivtitle}
				</td>
				<td>
					${articleDataGuide.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${articleDataGuide.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${articleDataGuide.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${articleDataGuide.remarks}
				</td>
				<shiro:hasPermission name="cms:articleDataGuide:edit"><td>
    				<a href="${ctx}/cms/articleDataGuide/form?id=${articleDataGuide.id}">修改</a>
					<a href="${ctx}/cms/articleDataGuide/delete?id=${articleDataGuide.id}" onclick="return confirmx('确认要删除该文章内容引导吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>