
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<%
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
	%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

	<%@page contentType="text/html"%>
	<%@page pageEncoding="UTF-8"%>
	

<head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="label.storeadministration" text="Store administration" /></title>
	
	<!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
	<!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />">
    
    <link rel="stylesheet" href="<c:url value="/resources/styles/logon.css" />">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/resources/js/bootstrap/jquery.js" />"></script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/js/jquery/jquery.min.js" />" type="text/javascript"></script>
    
    <script type="text/javascript" src="<c:url value="/resources/js/bootstrap-modal.js" />"></script>
    
    <script src="<c:url value="/resources/smart-client/system/modules/ISC_Core.js" />"></script>
    <script src="<c:url value="/resources/smart-client/system/modules/ISC_Foundation.js" />"></script>
    <script src="<c:url value="/resources/smart-client/system/modules/ISC_Containers.js" />"></script>
    <script src="<c:url value="/resources/smart-client/system/modules/ISC_Grids.js" />"></script>
    <script src="<c:url value="/resources/smart-client/system/modules/ISC_DataBinding.js" />"></script>
    
    <script type="text/javascript" language="JavaScript">
    
    function getUserInformation() {
					 // get the form values 
					$('#alertUser').hide();
					$('#securityQtn1Select').empty();
					$('#securityQtn2Select').empty();
					$('#securityQtn3Select').empty();
					$('#answer1').val('');
					$('#answer2').val('');
					$('#answer3').val('');
					var userName = $('#username').val();
		        if(!userName){
		        	$('#alertUser').show();
		        	var msg = '<s:message code="message.username.required" text="User name is required" />';
		        	$("#alertUser").val (msg);
					var div = document.getElementById('alertUser');
					div.innerHTML =  msg;	
			    }else{
			     
					$.ajax({
							type: 'POST',
							dataType: "json",
							url: "<c:url value="/admin/users/resetPassword.html" />",
							data: "username="+ userName ,
							success: function(response) { 
								 var msg = isc.XMLTools.selectObjects(response, "/response/statusMessage");
								 var status = isc.XMLTools.selectObjects(response, "/response/status");
								 
								 if(status==0 || status ==9999) {
									 
    						   		 $("#modal-reset-password").modal('hide');
    						   		 $('#modal-security-question').modal({
    								 	backdrop: true
    						   		 });
    								 var data = isc.XMLTools.selectObjects(response, "/response/data");
    						  	     if(data && data.length>0) {

    						  	     	$('#question1').text(data[0].question1);
		    						  	$('#question2').text(data[0].question2);
		    						  	$('#question3').text(data[0].question3);

    								 } 
								} else {
								
									if(msg!=null && msg !='') {
										$('#alertUser').show();
							        	$("#alertUser").val (msg);
										var div = document.getElementById('alertUser');
										div.innerHTML =  msg;	
									}
								}
								
							},
							error: function(jqXHR,textStatus,errorThrown) { 
								
								var str = 'Error ' + jqXHR + "-" + textStatus + "-" + errorThrown;
								$('#alertUser').show();
					        	$("#alertUser").val (str);
								var div = document.getElementById('alertUser');
								div.innerHTML =  str;
							}

							}); 
				}
            }
				
				
				function doSecurityQtnSubmit() {
					
					var answer1 = $('#answer1').val();
					var answer2 = $('#answer2').val();
					var answer3 = $('#answer3').val();
					
				   	$('#alertWarnSecQues2').hide();
					$('#alertWarnSecQues3').hide();
					$('#alertWarnSecQues1').hide();
					$('#alertError').hide();
					$('#alertSuccess').hide();
				   	
					 if(!answer1){
					    var msg = '<s:message code="security.answer.question1.message" text="Please answer to security question 1"/>';

					    $('#alertWarnSecQues2').hide();
					    $('#alertWarnSecQues3').hide();
					    $('#alertWarnSecQues1').show();
		        	    $("#alertWarnSecQues1").val (msg);
					    var divElt = document.getElementById('alertWarnSecQues1');
					    divElt.innerHTML =  msg;
					 }else if(!answer2){
					 	 var msg = '<s:message code="security.answer.question2.message" text="Please answer to security question 2"/>';

						 $('#alertWarnSecQues1').hide();
					     $('#alertWarnSecQues3').hide();
						 $('#alertWarnSecQues2').show();
		        	     $("#alertWarnSecQues2").val (msg);
					     var divElt = document.getElementById('alertWarnSecQues2');
					     divElt.innerHTML =  msg;
					 }else if(!answer3){
						 var msg = '<s:message code="security.answer.question3.message" text="Please answer to security question 3"/>';

						 $('#alertWarnSecQues2').hide();
					     $('#alertWarnSecQues1').hide();
					     $('#alertWarnSecQues3').show();
		        	     $("#alertWarnSecQues3").val (msg);
					     var divElt = document.getElementById('alertWarnSecQues3');
					     divElt.innerHTML =  msg;
					 }else{					 

						 $.ajax({
									type: 'POST',
									dataType: "json",
									url: "<c:url value="/admin/users/resetPasswordSecurityQtn.html" />",
									data: "answer1="+ answer1+"&answer2="+ answer2+"&answer3="+ answer3,
									success: function(response) { 

										 var msg = isc.XMLTools.selectObjects(response, "/response/statusMessage");
										 var status = isc.XMLTools.selectObjects(response, "/response/status");
										 if(status==0 || status ==9999) {
											 
		    						   		 $("#modal-security-question").modal('hide');
											 $('#modal-reset-password-exit').modal({
		    									 backdrop: true
		    						   		 }) 
		    						   		 
											 $('#alertSuccess').show();
								        	 $("#alertSuccess").val(msg);
											 var divElt = document.getElementById('alertSuccess');
											 divElt.innerHTML =  msg;
											 
		    								 var data = isc.XMLTools.selectObjects(response, "/response/data");
										  } else {
										  	
											if(msg!=null && msg !='') {
												 
		    						   		 	 $("#modal-security-question").modal('hide');
											     $('#modal-reset-password-exit').modal({
		    									    backdrop: true
		    						   		     })  
						 						 
												 $('#alertError').show();
								        	     $("#alertError").val(msg);
											     var divElt = document.getElementById('alertError');
											     divElt.innerHTML =  msg;
											    
											}
										}
										
									}  
								});
					 
				 }
			}
			
    </script>
    
    
</head>
<body class="login-bg">

	
	
	
	<nav class="navbar navbar-inverse navbar-bg">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/admin/logon.html"/>">NewsBoosMagazines</a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="#" id="changePassword" class="launch-modal" data-modal-id="modal-reset-password">
                  <span class="fa-stack">
                    <i class="fa fa-laptop fa-stack-2x"></i>
                    <i class="fa fa-key fa-1x fa-stack-1x"></i>

                  </span>
                  <s:message code="label.logonform.forgotpassword" text="Forgot Password"/>?
                </a>
              </li>
            </ul>
          </div> <!-- /.navbar-collapse -->
        </div> <!-- /.container-fluid -->
    </nav>

    <div class="container">
      <div class="row">
        
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="login-wrapper">
	          <div class="page-header align-header">
	            <h1><s:message code="label.storeadministration" text="Store administration" /> </h1>
	            <span class="fa-stack fa-lg">
	              <i class="fa fa-laptop fa-stack-2x"></i>
	              <i class="fa fa-user fa-stack-1x"></i>
	            </span>
	          </div>

	          <div class="page-bottom">
	            <form action="<c:url value="/admin/j_spring_security_check"/>" method="post" role="form" id="logonForm">
	              <div class="input-group input-group-lg">
	                <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
	                <input type="text" class="form-control" id="j_username" name="j_username" placeholder="<s:message code="label.username" text="Username"/>" aria-describedby="sizing-addon1">
	              </div>
	              <br>
	              <div class="input-group input-group-lg">
	                <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-key"></i></span>
	                <input type="password" class="form-control" id="j_password" name="j_password" placeholder="<s:message code="label.password" text="Password"/>" aria-describedby="sizing-addon1">
	              </div>
	              <div class="page-header">
	                <label class="font-weight">
	                  <input type="checkbox"> <s:message code="label.logonform.rememberusername" text="Remember my user name" />
	                </label>
	              </div>
	              <div class="form-group">
	
	                <button type="submit" class="btn btn-success pull-right">
	                  <i class="fa fa-unlock-alt"></i> <s:message code="button.label.signin" text="Sign in"/>
	                </button>
	              </div>
	            </form>
	
	          </div>
        </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
              <li data-target="#myCarousel" data-slide-to="3"></li>
              <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <div class="slide1"></div>
                <div class="carousel-caption">
                  <h1>Amazing newspapers, books & magazines</h1>
                  <p>Thousands of magazines, newspappers & books for free</p>
                  <p>
                    <a href="" class="btn btn-primary btn-sm">Get then now</a>
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="slide2"></div>
                <div class="carousel-caption">
                  <h1>Amazing newspapers, books & magazines</h1>
                  <p>Thousands of magazines, newspappers & books for free</p>
                  <p>
                    <a href="" class="btn btn-primary btn-sm">Get then now</a>
                  </p>
                </div>
              </div>

              <div class="item">
                <div class="slide3"></div>
                <div class="carousel-caption">
                  <h1>Amazing newspapers, books & magazines</h1>
                  <p>Thousands of magazines, newspappers & books for free</p>
                  <p>
                    <a href="" class="btn btn-primary btn-sm">Get then now</a>
                  </p>
                </div>
              </div>

              <div class="item">
                <div class="slide4"></div>
                <div class="carousel-caption">
                  <h1>Amazing newspapers, books & magazines</h1>
                  <p>Thousands of magazines, newspappers & books for free</p>
                  <p>
                    <a href="" class="btn btn-primary btn-sm">Get then now</a>
                  </p>
                </div>
              </div>

              <div class="item">
                <div class="slide5"></div>
                <div class="carousel-caption">
                  <h1>Amazing newspapers, books & magazines</h1>
                  <p>Thousands of magazines, newspappers & books for free</p>
                  <p>
                    <a href="" class="btn btn-primary btn-sm">Get then now</a>
                  </p>
                </div>
              </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only"><s:message code="label.generic.previous" text="Previous" /></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only"><s:message code="label.generic.next" text="Next" /></span>
            </a>
          </div>
        </div>
      </div>
    </div>
	
	
	<!-- MODAL -->
    <div class="modal fade" id="modal-reset-password" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
       	<div class="modal-dialog">
       		<div class="modal-content">
       			
       			<div class="modal-header">
       				<button type="button" class="close" data-dismiss="modal">
       					<span aria-hidden="true">&times;</span><span class="sr-only"><s:message code="button.label.close" text="Close"/></span>
       				</button>
       				<h3 class="modal-title" id="modal-login-label">
       					<s:message code="button.label.resetpassword" text="Reset Password"/>
       				</h3>
       				<p><s:message code="label.generic.username" text="User name"/>:</p>
       			</div>
       			
       			<div class="modal-body form-bottom">
       				<div id="alertUser" class="alert alert-warning" role="alert" style="display: none;">...</div>
                    <form role="form" action="#" method="post" class="login-form" id="resetPasswordForm">
                    	
                        <div class="form-group">
                    		<label class="sr-only" for="username"><s:message code="label.username" text="Username"/></label>
                        	<input type="text" id="username" name="username" placeholder="<s:message code="label.username" text="Username"/>" class="form-username form-control" id="form-username">
                        </div>
                        <div class="modal-footer">
							<div class="controls">
								<input type="button" value="<s:message code="label.generic.next" text="Next" />" onclick="getUserInformation()" class="btn" >
							</div>
						</div>
                    </form>
                    
       			</div>
       			
       		</div>
       	</div>
    </div>
    
    <!-- MODAL -->
    <div class="modal fade" id="modal-security-question" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
       	<div class="modal-dialog">
       		<div class="modal-content">
       			
       			<div class="modal-header">
       				<button type="button" class="close" data-dismiss="modal">
       					<span aria-hidden="true">&times;</span><span class="sr-only"><s:message code="button.label.close" text="Close"/></span>
       				</button>
       				<h3 class="modal-title" id="modal-login-label">
       					<s:message code="security.questions.answer" text="Security questions"/>
       				</h3>
       				
       			</div>
       			
       			<div class="modal-body form-bottom">
       				<div id="alertUser" class="alert alert-warning" role="alert" style="display: none;">...</div>
                    <form role="form" action="#" method="post" class="login-form" id="resetPasswordForm">
                    	
                        <div class="form-group">
                        	<div id="alertWarnSecQues1" class="alert alert-danger" role="alert" style="display: none;">...</div>
                    		<label class="sr-only" for="answer1"><s:message code="security.answer.question1.message" text="answer1"/></label>
                        	<input type="text" id="answer1" name="answer1" placeholder="<s:message code="security.answer.question1.message" text="answer3"/>" class="form-username form-control" id="form-answer3">
                        </div>
						
                    	<div class="form-group">
                    		<div id="alertWarnSecQues2" class="alert alert-danger" role="alert" style="display: none;">...</div>
                    		<label class="sr-only" for="answer2"><s:message code="security.answer.question2.message" text="answer2"/></label>
                        	<input type="text" id="answer2" name="answer2" placeholder="<s:message code="security.answer.question2.message" text="answer2"/>" class="form-username form-control" id="form-answer2">
                        </div>
                    	
                    	<div class="form-group">
                    		<div id="alertWarnSecQues3" class="alert alert-danger" role="alert" style="display: none;">...</div>
                    		<label class="sr-only" for="answer3"><s:message code="security.answer.question3.message" text="answer3"/></label>
                        	<input type="text" id="answer3" name="answer3" placeholder="<s:message code="security.answer.question3.message" text="answer3"/>" class="form-username form-control" id="form-answer3">
                        </div>
                        <div class="modal-footer">
							<div class="controls">
								<input type="button" value="Submit" onclick="doSecurityQtnSubmit()" class="btn" >
							</div>
						</div>
                        
                    </form>
                    
       			</div>
       			
       		</div>
       	</div>
    </div>
    
	<!-- MODAL -->
    <div class="modal fade" id="modal-reset-password-exit" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
       	<div class="modal-dialog">
       		<div class="modal-content">
       			
       			<div class="modal-header">
       				<button type="button" class="close" data-dismiss="modal">
       					<span aria-hidden="true">&times;</span><span class="sr-only"><s:message code="button.label.close" text="Close"/></span>
       				</button>
       				<h3 class="modal-title" id="modal-login-label">
       					<s:message code="button.label.resetpassword" text="Reset Password"/>
       				</h3>
       				
       			</div>
       			
       			<div class="modal-body">
       				
       				<form role="form" action="#" method="post" class="login-form" id="resetPasswordForm">
                    	<!-- <h3><center><div id="finaltext1"></div></center></h3> -->
                    	<div id="alertSuccess" class="alert alert-success" role="alert" style="display: none;">...</div>
       				    <div id="alertError" class="alert alert-danger" role="alert" style="display: none;">...</div>
                    	<div class="modal-footer">
							<div class="controls">
								<button data-dismiss="modal" class="btn">Close</button>
							</div>
						</div>
                    </form>
                    
       			</div>
       			
       		</div>
       	</div>
    </div>
    
    <!-- Bootstrap 3.3.5 -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.backstretch.min.js" />"></script>
    <script src="<c:url value="/resources/scripts/scripts.js" />"></script>
    
    <!--[if lt IE 10]>
        <script src="/resources/js/placeholder.js"></script>
    <![endif]-->
        
</body>
</html>