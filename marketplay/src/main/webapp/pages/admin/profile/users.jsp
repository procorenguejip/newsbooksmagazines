<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="content-box-large">
	<div class="panel-heading">
		<div class="panel-title">
			<s:message code="menu.users" text="Users" />
		</div>
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th><s:message code="label.generic.firstname" text="First name" /> </th>
						<th><s:message code="label.generic.lastname" text="Last name" /> </th>
						<th><s:message code="label.generic.username" text="User name" /> </th>
						<th><s:message code="label.generic.email" text="Email" /> </th>
						<th><s:message code="label.entity.active" text="Active" /> </th>
						<th><s:message code="label.profile.lastaccess" text="Last access" /> </th>
						<th><s:message code="label.generic.language" text="Language" /> </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user" varStatus="j">
						
						<c:choose>
					        <c:when test="${ j.count % 2 == 0}">
					            <tr class="even">
					            	<td> <c:out value="${user.firstName }"/> </td>
					            	<td> <c:out value="${user.lastName }"/> </td>
					            	<td> <c:out value="${user.adminName }"/> </td>
					            	<td> <c:out value="${user.adminEmail }"/> </td>
					            	<td> <c:out value="${user.active }"/> </td>
					            	<td> <fmt:formatDate type="both" dateStyle="long" value="${user.lastAccess}" /></td>
					            	<td> <c:out value="${user.defaultLanguage.code }"/> </td>
								</tr>
					        </c:when>
					        <c:otherwise>
					            <tr class="odd">
					            	<td> <c:out value="${user.firstName }"/> </td>
					            	<td> <c:out value="${user.lastName }"/> </td>
					            	<td> <c:out value="${user.adminName }"/> </td>
					            	<td> <c:out value="${user.adminEmail }"/> </td>
					            	<td> <c:out value="${user.active }"/> </td>
					            	<td> <fmt:formatDate type="both" dateStyle="long" value="${user.lastAccess}" /></td>
					            	<td> <c:out value="${user.defaultLanguage.code }"/> </td>
								</tr>
					        </c:otherwise>
    					</c:choose> 
						
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>