
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div class="module">
	<div class="module-head">
    	<h3>DataTables</h3>
    </div>
    <div class="module-body table">
    	<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display" width="100%">
    		<thead>
    			<tr>
    				<th>Rendering engine</th>
                    <th>
                        Browser
                    </th>
                    <th>
                        Platform(s)
                    </th>
                    <th>
                        Engine version
                    </th>
                    <th>
                        CSS grade
                    </th>
                </tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${groupsJSON}" var="itemGroup">
			        <sec:authorize access="hasRole('${subsubmenu.role}') and fullyAuthenticated">
			        	<tr class="odd gradeX">
                          <td>
                              ${itemGroup.groupId}
                          </td>
                          <td>
                              ${itemGroup.name}
                          </td>
                          <td>
                              ${itemGroup.type}
                          </td>
                          <td class="center">
                          	 <div class="editable">
                          	 	${itemGroup.name}
                          	 </div>
                          </td>
                          <td class="center">
                              ${itemGroup.description}
                          </td>
                      </tr>
			        </sec:authorize>
			     </c:forEach>
    		</tbody>
    		<tfoot>
    			<tr>
    				<th>Rendering engine</th>
                    <th>
                        Browser
                    </th>
                    <th>
                        Platform(s)
                    </th>
                    <th>
                        Engine version
                    </th>
                    <th>
                        CSS grade
                    </th>
                </tr>
    		</tfoot>
    	</table>
    </div>
	
</div> 


<div class="tabbable">

 					
  					
  					 <div class="tab-content">

    					<div class="tab-pane active" id="catalogue-section">



								<div class="sm-ui-component">
								<h3><s:message code="label.groups.title" text="Groups" /></h3>	
								<br/>
								
								
								<!-- Listing grid include -->
								 <c:set value="/admin/groups/paging.html" var="pagingUrl" scope="request"/>
								 <c:set value="/admin/groups/editGroup.html?id=${group.id}" var="editUrl" scope="request"/>
								 <c:set var="entityId" value="groupId" scope="request"/>
								 <c:set var="expandDetails" value="description" scope="request"/>
								 <c:set var="componentTitleKey" value="label.groups.title" scope="request"/>
								 <c:set var="gridHeader" value="/pages/admin/profile/groups-gridHeader.jsp" scope="request"/>
								 <c:set var="canRemoveEntry" value="false" scope="request"/>
				
				            	 
								 <!-- End listing grid include -->
								
								
	
			      			     
			      			     
      					</div>


   					</div>


  					</div>

				</div>		      			     
				