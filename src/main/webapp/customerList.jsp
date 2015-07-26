<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="pagerForm" method="post" action="purchase/list">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="name" value="${name}" />
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="purchase/list" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					名称：<input type="text" name="Q_t.name_like" value="" />
				</td>
				<td>
					编号：<input type="text" name="Q_t.no_like" value="" />
				</td>
				<td>
					建档日期：<input type="text" class="date" name="Q_t.createDate_>=" readonly="true" />
				</td>
				<td>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">检 索</button></div></div>
				</td>
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="customer/add" rel="customerAdd" target="navTab"><span>添加</span></a></li>
			<li class="line">line</li>
			<li><a class="delete" href="customer/delete、{e_id}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" href="customer/edit/{e_id}" rel="customerEdit" target="navTab"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" onclick="navTab.reload();" ><span>刷新列表</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>编号</th>
				<th>名称</th>
				<th>类型</th>
				<th>开发人员</th>
				<th>开发部门</th>
				<th>联系人</th>
				<th>联系电话</th>
				<th>通讯地址</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pages.data}" var="e">
			<tr target="e_id" rel="${e.id}">
				<td>${e.no}</td>
				<td>${e.name}</td>
				<td>${e.type}</td>
				<td>${e.createUser.name}</td>
				<td>${e.createUser.name}</td>
				<td>${e.contactPerson}</td>
				<td>${e.phone}</td>
				<td>${e.address}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示${pages.numPerPage}</span><span>条，共${pages.totalCount}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${pages.totalCount}" numPerPage="${pages.numPerPage}" pageNumShown="${pages.pageNumShown}" currentPage="${pages.currentPage}"></div>
	</div>
</div>
    