<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Calendar" %>
 
<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
 <c:set var="lang" scope="request" value="${requestScope.locale.language}"/> 
 
 
 <html xmlns="http://www.w3.org/1999/xhtml"> 

 
     <head>
     
     
        	 	<meta http-equiv="X-UA-Compatible" content="text/html; charset=UTF-8; IE=edge">
        	 	<meta charset="utf-8">
    			<title><s:message code="label.storeadministration" text="Store administration" /></title>
    			<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    			
    			<link type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
        		<link type="text/css" href="<c:url value="/resources/css/bootstrap-responsive.min.css" />" rel="stylesheet">
				
				<!-- Font Awesome -->
    			<link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.css" />">
    			<link type="text/css" href="<c:url value="/resources/styles/layout.css" />" rel="stylesheet">
				
        		<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
            	<link href="<c:url value="/resources/datatables/dataTables.bootstrap.css" />" rel="stylesheet" media="screen">
            	
 	</head>

<body>
	<nav class="navbar navbar-fixed-top nav-custom-style">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/admin/home.html"/>">NewsBoosMagazines</a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <b class="caret"></b></a>
                  <ul class="dropdown-menu animated fadeInUp">
                    <li><a href="#"><i class="fa fa-user"></i> <s:message code="label.my.profile" text="My Profile" /> </a></li>
                      <li><a href="#"><i class="fa fa-pencil-square-o"></i> <s:message code="label.my.profile" text="My Profile" /> </a></li>
                      <li><a href="#"><i class="fa fa-cog"></i> <s:message code="menu.accounts-conf" text="Account Settings" /> </a></li>
                      <li class="divider"></li>
                      <li>

                      	<a href="${logoutUrl}">
                      		<i class="fa fa-sign-out"></i><s:message code="button.label.logout" text="Logout" />
                      	</a>
                      </li>
                  </ul>
	            </li>

            </ul>
            
            <c:if test="${fn:length(requestScope.ADMIN_STORE.languages)>1}">
			   	<ul class="nav pull-right">
					<li class="dropdown">
						
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="fa fa-globe"></i> 
								<s:message code="label.generic.language" text="Language"/>
							<b class="caret"></b>
						</a>
						
						<ul class="dropdown-menu">
							<c:forEach items="${requestScope.ADMIN_STORE.languages}" var="lang">
								<li><a href="<c:url value="/admin?locale=${lang.code}" />"><s:message code="${lang.code}" text="${lang.code}" /></a></li>
							</c:forEach>
						</ul>
					</li>
			   	</ul>
			</c:if>
			<div class="container">
	            <ul class="nav navbar-default">
	                        	
	                 <c:forEach items="${requestScope.MENULIST}" var="menu">
			  			<sec:authorize access="hasRole('${menu.role}') and fullyAuthenticated">
			  			<li <c:if test="${activeMenus[menu.code]!=null}"> class="active"</c:if>>
							<a href="<c:url value="${menu.url}" />" title="<s:message code='menu.${menu.code}' text='${menu.code}'/>">
								<c:choose>
									<c:when test="${fn:contains(menu.icon, 'glyphicon')}">
										<i class="glyphicon ${menu.icon}"></i>
									</c:when>
									<c:otherwise>
										<i class="fa ${menu.icon}"></i>
									</c:otherwise>
								</c:choose>
								
							</a>
			  			</li>
			  			</sec:authorize>
				  	</c:forEach>
				
	            </ul>
            </div>
          </div> <!-- /.navbar-collapse -->
        </div> <!-- /.container-fluid -->
    </nav>
    
	<div class="container-fluid contain-page">
		<div class="row">
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    
                    <c:forEach items="${requestScope.MENULIST}" var="menu">
                    	<sec:authorize access="hasRole('${menu.role}') and fullyAuthenticated">
                    		<c:if test="${fn:length(menu.menus)>0}">
  								<li class="submenu <c:if test="${activeMenus[menu.code]!=null}">active</c:if>" >
									<a href="<c:url value="${menu.url}" />" >
										<c:choose>
											<c:when test="${fn:contains(menu.icon, 'glyphicon')}">
												<i class="glyphicon ${menu.icon}"></i>
											</c:when>
											<c:otherwise>
												<i class="fa ${menu.icon}"></i>
											</c:otherwise>
										</c:choose>
										
										<s:message code="menu.${menu.code}" text="${menu.code}"/>
										<span class="caret pull-right"></span>
									</a>
									<c:forEach items="${menu.menus}" var="submenu">
										<sec:authorize access="hasRole('${submenu.role}') and fullyAuthenticated">
											<!-- Sub menu -->
					                        <ul>
					                        	<li <c:if test="${activeMenus[submenu.code]!=null}"> class="active"</c:if>>
													<a href="<c:url value="${submenu.url}" />">
														<i class="fa ${submenu.icon}"></i>
															<s:message code="menu.${submenu.code}" text="${submenu.code}"/>
													</a>
				  								</li>
					                        </ul>
										</sec:authorize>
									</c:forEach>
				  				</li>
	  						</c:if>
                    	</sec:authorize>
                    </c:forEach>
                    
                </ul>
             </div>
		  </div>
		  
		  
		  <div class="col-md-10">
		  	<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<i class="fa fa-shopping-bag fa-5x"></i>
						<div class="count">6.674</div>
						<div class="title"><s:message code="label.order.recent" text="Recent orders"/></div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<i class="fa fa-shopping-cart fa-5x"></i>
						<div class="count">7.538</div>
						<div class="title"><s:message code="label.order.pastorders" text="Past orders"/></div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box dark-bg">
						<i class="fa fa-thumbs-o-up fa-5x"></i>
						<div class="count">4.362</div>
						<div class="title"><s:message code="label.generic.subscription" text="Subscriptions"/></div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box green-bg">
						<i class="fa fa-cubes fa-5x"></i>
						<div class="count">1.426</div>
						<div class="title"><s:message code="menu.store" text="Stores"/></div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
			</div><!--/.row-->
			
			<tiles:insertAttribute name="body"/>
			
		  </div>
		  
		</div>
	</div>
	
	
	
	<div class="footer">
        <div class="container">
            
        	<div class="row">
        		<div class="col-xs-12 col-md-6 col-lg-3">
        			<p><s:message code="label.store.information" text="Store information" /></p>
        			<p>
						<address>
							<strong><c:out value="${store.storename}"/></strong><br/>
							<c:if test="${not empty store.storeaddress}">
								<c:out value="${store.storeaddress}"/><br/>
							</c:if>
							<c:if test="${not empty store.storecity}">
								<c:out value="${store.storecity}"/>,
							</c:if>
							<c:choose>
							<c:when test="${not empty store.zone}">
								<c:out value="${store.zone.code}"/>,
							</c:when>
							<c:otherwise>
								<c:if test="${not empty store.storestateprovince}">
									<c:out value="${store.storestateprovince}"/>,
								</c:if>
							</c:otherwise>
							</c:choose>
							<c:if test="${not empty store.storepostalcode}">
								<c:out value="${store.storepostalcode}"/>
							</c:if>
							<br/><c:out value="${country.name}"/>
							<c:if test="${not empty store.storephone}">
								<br/><c:out value="${store.storephone}"/>
							</c:if>
						</address>
						
					</p>
					<p>
						<i class="fa fa-user"></i> 
						<sec:authentication property="principal.username" /><br/>
						<i class="fa fa-calendar-check-o"></i> <s:message code="label.profile.lastaccess" text="Last access"/>: <fmt:formatDate type="both" dateStyle="long" value="${user.lastAccess}" />
					</p>
        		</div>
        		<div class="col-xs-12 col-md-6 col-lg-3">
        			<b class="copyright">&copy; <%=Calendar.getInstance().get(Calendar.YEAR)%> NewsBooksMagazines - NewsBooksMagazines.com </b>All rights reserved.
        		</div>
        	</div>
        </div>
    </div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-button.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-modal.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-tab.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-transition.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-alert.js" />"></script>
    
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-dropdown.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-scrollspy.js" />"></script>
    
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-tooltip.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-popover.js" />"></script>
    
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-collapse.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-carousel.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap/bootstrap-typeahead.js" />"></script>
    <script src="<c:url value="/resources/datatables/js/custom.js" />"></script>
   	<script src="<c:url value="/resources/datatables/js/tables.js" />"></script> 

    -->
    <script src="<c:url value="/resources/js/jquery-cookie.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/jquery/jquery.min.js" />" type="text/javascript"></script>
    
    <script src="<c:url value="/resources/js/bootstrap.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/datatables/js/jquery.dataTables.min.js" />"></script>
    
    <script src="<c:url value="/resources/datatables/dataTables.bootstrap.js" />"></script>
    	
     <script>
		
		$(document).ready(function(){ 
			

			$("#catalogue-products-create-link").click(function() {
				window.location='<c:url value="/admin/products/createProduct.html" />';
			});
			$("#catalogue-categories-list-link").click(function() {
				window.location='<c:url value="/admin/categories/categories.html" />';
			});
			$("#catalogue-products-categories-link").click(function() {
				window.location='<c:url value="/admin/products/product-categories.html" />';
			});
			$("#catalogue-link").click(function() {
				window.location='<c:url value="/admin/products/products.html" />';
			});
			$("#catalogue-categories-hierarchy-link").click(function() {
				window.location='<c:url value="/admin/categories/hierarchy.html" />';
			});
			$("#catalogue-categories-create-link").click(function() {
  				window.location='<c:url value="/admin/categories/createCategory.html" />';
			});
			$("#catalogue-options-list-link").click(function() {
  				window.location='<c:url value="/admin/options/options.html" />';
			});
			$("#catalogue-options-create-link").click(function() {
  				window.location='<c:url value="/admin/options/createOption.html" />';
			});
			$("#catalogue-optionsvalues-list-link").click(function() {
  				window.location='<c:url value="/admin/options/optionvalues.html" />';
			});
			$("#catalogue-optionsvalues-create-link").click(function() {
  				window.location='<c:url value="/admin/options/createOptionValue.html" />';
			});
			$("#catalogue-featured-link").click(function() {
  				window.location='<c:url value="/admin/catalogue/featured/list.html" />';
			});
			$("#catalogue-products-custom-group-link").click(function() {
  				window.location='<c:url value="/admin/products/groups/list.html" />';
			});
			$("#manufacturer-list-link").click(function() {
  				window.location='<c:url value="/admin/catalogue/manufacturer/list.html" />';
			});
			$("#manufacturer-create-link").click(function() {
  				window.location='<c:url value="/admin/catalogue/manufacturer/create.html" />';
			});
			$("#myprofile-link").click(function() {
  				window.location='<c:url value="/admin/users/displayUser.html" />';
			});
			$("#user-link").click(function() {
  				window.location='<c:url value="/admin/users/displayUser.html" />';
			});
			$("#profile").click(function() {
  				window.location='<c:url value="/admin/users/displayUser.html" />';
			});
			$("#change-password-link").click(function() {
  				window.location='<c:url value="/admin/users/password.html" />';
			});
			$("#users-link").click(function() {
  				window.location='<c:url value="/admin/users/list.html" />';
			});
			$("#create-user-link").click(function() {
  				window.location='<c:url value="/admin/users/createUser.html" />';
			});
			$("#security-permissions-link").click(function() {
  				window.location='<c:url value="/admin/user/permissions.html" />';
			});
			$("#security-groups-link").click(function() {
  				window.location='<c:url value="/admin/user/groups.html" />';
			});
			$("#customer-list-link").click(function() {
  				window.location='<c:url value="/admin/customers/list.html" />';
			});
			$("#customer-create-link").click(function() {
  				window.location='<c:url value="/admin/customers/customer.html" />';
			});
			$("#customer-options-list-link").click(function() {
  				window.location='<c:url value="/admin/customers/options/list.html" />';
			});
			$("#customer-options-create-link").click(function() {
  				window.location='<c:url value="/admin/customers/options/create.html" />';
			});
			$("#customer-options-values-list-link").click(function() {
  				window.location='<c:url value="/admin/customers/options/values/list.html" />';
			});
			$("#customer-options-values-create-link").click(function() {
  				window.location='<c:url value="/admin/customers/options/values/create.html" />';
			});
			$("#customer-options-set-link").click(function() {
  				window.location='<c:url value="/admin/customers/optionsset/list.html" />';
			});
			$("#order-list-link").click(function() {
  				window.location='<c:url value="/admin/orders/list.html" />';
			});
			$("#storeDetails-link").click(function() {
  				window.location='<c:url value="/admin/store/store.html" />';
			});
			$("#create-store-link").click(function() {
  				window.location='<c:url value="/admin/store/storeCreate.html" />';
			});
			$("#store-list-link").click(function() {
  				window.location='<c:url value="/admin/store/list.html" />';
			});
			$("#storeBranding-link").click(function() {
  				window.location='<c:url value="/admin/store/storeBranding.html" />';
			});
			$("#storeLanding-link").click(function() {
  				window.location='<c:url value="/admin/store/storeLanding.html" />';
			});
			$("#content-link").click(function() {
  				window.location='<c:url value="/admin/content/contentImages.html" />';
			});
			$("#content-images-create-link").click(function() {
  				window.location='<c:url value="/admin/content/createContentImages.html" />';
			});
			$("#content-pages-link").click(function() {
  				window.location='<c:url value="/admin/content/pages/list.html" />';
			});
			$("#content-pages-create-link").click(function() {
  				window.location='<c:url value="/admin/content/pages/create.html" />';
			});
			$("#content-boxes-link").click(function() {
  				window.location='<c:url value="/admin/content/boxes/list.html" />';
			});
			$("#content-boxes-create-link").click(function() {
  				window.location='<c:url value="/admin/content/boxes/create.html" />';
			});
			$("#content-files-link").click(function() {
  				window.location='<c:url value="/admin/content/static/contentFiles.html" />';
			});
			$("#content-images-link").click(function() {
  				window.location='<c:url value="/admin/content/contentImages.html" />';
			});
			$("#shipping-configs-link").click(function() {
  				window.location='<c:url value="/admin/shipping/shippingConfigs.html" />';
			});
			$("#shipping-methods-link").click(function() {
  				window.location='<c:url value="/admin/shipping/shippingMethods.html" />';
			});
			$("#shipping-options-link").click(function() {
  				window.location='<c:url value="/admin/shipping/shippingOptions.html" />';
			});
			$("#shipping-origin-link").click(function() {
  				window.location='<c:url value="/admin/shipping/origin/get.html" />';
			});
			$("#shipping-packages-link").click(function() {
  				window.location='<c:url value="/admin/shipping/shippingPackaging.html" />';
			});
			$("#accounts-conf-link").click(function() {
  				window.location='<c:url value="/admin/configuration/accounts.html" />';
			});
			$("#email-conf-link").click(function() {
  				window.location='<c:url value="/admin/configuration/email.html" />';
			});
			$("#system-configurations-link").click(function() {
  				window.location='<c:url value="/admin/configuration/system.html" />';
			});
			$("#taxclass-link").click(function() {
  				window.location='<c:url value="/admin/tax/taxclass/list.html" />';
			});
			$("#taxconfiguration-link").click(function() {
  				window.location='<c:url value="/admin/tax/taxconfiguration/edit.html" />';
			});
			$("#taxrates-link").click(function() {
  				window.location='<c:url value="/admin/tax/taxrates/list.html" />';
			});	
			/*
			$(".submenu > a").click(function(e) {
			    e.preventDefault();
			    var $li = $(this).parent("li");
			    var $ul = $(this).next("ul");
			
			    if($li.hasClass("open")) {
			      $ul.slideUp(350);
			      $li.removeClass("open");
			    } else {
			      $(".nav > li > ul").slideUp(350);
			      $(".nav > li").removeClass("open");
			      $ul.slideDown(350);
			      $li.addClass("open");
			    }
			  });
			  
			  $('#example').dataTable();
			*/
		}); 
		
		
		function checkCode(code, id, url) {
			
			$.ajax({
					type: 'POST',
					dataType: "json",
					url: url,
					data: "code="+ code + "&id=" + id,
					success: function(response) { 
						var msg = isc.XMLTools.selectObjects(response, "/response/statusMessage");
						var status = isc.XMLTools.selectObjects(response, "/response/status");
						
						callBackCheckCode(msg,status);

						
					},
					error: function(jqXHR,textStatus,errorThrown) { 
						alert(jqXHR + "-" + textStatus + "-" + errorThrown);
					}
					
			});
			
		}
	
	</script>
     	
 </body>
 
 </html>
 
