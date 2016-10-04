
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
    <link rel="stylesheet" href="<c:url value="/resources/assets/bootstrap/css/bootstrap.min.css" />" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/resources/assets/font-awesome/css/font-awesome.min.css" />">
    
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/form-elements.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css" />">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript" language="JavaScript">
    function goLogin(){
    	window.location = '';
    }
    function getUserInformation() {
    	var result = "";
					 // get the form values 
					//$('#alertUser').hide();
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
									result = msg;
    								 var data = isc.XMLTools.selectObjects(response, "/response/data");
    								 alert(data);
    						  	     if(data && data.length>0) {

    						  	     	$('#question1').text(data[0].question1);
		    						  	$('#question2').text(data[0].question2);
		    						  	$('#question3').text(data[0].question3);

    								 } 
								} else {
									if(msg!=null && msg !='') {
										result = msg;
										alert(msg);
										$('#alertUser').show();
							        	$("#alertUser").val (msg);
										var div = document.getElementById('alertUser');
										div.innerHTML =  msg;	
									}
								}
								
							},
							error: function(jqXHR,textStatus,errorThrown) { 
								alert('Error ' + jqXHR + "-" + textStatus + "-" + errorThrown);
								var str = 'Error ' + jqXHR + "-" + textStatus + "-" + errorThrown;
								$('#alertUser').show();
					        	$("#alertUser").val (str);
								var div = document.getElementById('alertUser');
								div.innerHTML =  str;
								result = msg;
							}

							}); 
				}
				return result;
            }
				
				
				function doSecurityQtnSubmit() {
					
					var answer1 = $('#answer1').val();
					var answer2 = $('#answer2').val();
					var answer3 = $('#answer3').val();
					
				   	$('#alertWarnSecQues2').hide();
					$('#alertWarnSecQues3').hide();
					$('#alertWarnSecQues1').hide();
					$('#alertError').val('');
					$('#alertSuccess').val('');
					$('#alertError').hide();
					$('#alertSuccess').hide();
				   	
					 if(!answer1){
					    var msg = '<s:message code="security.answer.question1.message" text="Please answer to security question 1"/>';
					    //alert(msg);
					    $('#alertWarnSecQues2').hide();
					    $('#alertWarnSecQues3').hide();
					    $('#alertWarnSecQues1').show();
		        	    $("#alertWarnSecQues1").val (msg);
					    var divElt = document.getElementById('alertWarnSecQues1');
					    divElt.innerHTML =  msg;
					 }else if(!answer2){
					 	 var msg = '<s:message code="security.answer.question2.message" text="Please answer to security question 2"/>';
						 //alert(msg);
						 $('#alertWarnSecQues1').hide();
					     $('#alertWarnSecQues3').hide();
						 $('#alertWarnSecQues2').show();
		        	     $("#alertWarnSecQues2").val (msg);
					     var divElt = document.getElementById('alertWarnSecQues2');
					     divElt.innerHTML =  msg;
					 }else if(!answer3){
						 var msg = '<s:message code="security.answer.question3.message" text="Please answer to security question 3"/>';
						 //alert(msg);
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
										 /* console.log("responcesajid "+response); */
										 /* console.log(response); */
										 var msg = isc.XMLTools.selectObjects(response, "/response/statusMessage");
										 var status = isc.XMLTools.selectObjects(response, "/response/status");
										 if(status==0 || status ==9999) {
											 
											 $('#alertSuccess').show();
								        	 $("#alertSuccess").val(msg);
											 var divElt = document.getElementById('alertSuccess');
											 divElt.innerHTML =  msg;
											 
		    								 var data = isc.XMLTools.selectObjects(response, "/response/data");
										  } else {
										  	
											if(msg!=null && msg !='') {
												
						 						 alert(msg);
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
<body>
	
	<!-- Top menu -->
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/admin/login.html"/>">Sign in!</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="top-navbar-1">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<span class="li-text">
							or login with: 
						</span> 
						<span class="li-social">
							<a href="https://www.facebook.com/pages/Azmindcom/196582707093191" target="_blank"><i class="fa fa-facebook"></i></a> 
							<a href="https://twitter.com/anli_zaimi" target="_blank"><i class="fa fa-twitter"></i></a> 
							<a href="https://plus.google.com/+AnliZaimi_azmind" target="_blank"><i class="fa fa-google-plus"></i></a>
						</span>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	
	<!-- Top content -->
     <div class="top-content">
         <div class="container">
         	
             <div class="row">
                 <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 form-box">
                 	<form role="form" action="" method="post" class="f1">
                 		<h3><s:message code="button.label.resetpassword" text="Reset Password"/></h3>
                 		
                 		<div class="f1-steps">
                 			<div class="f1-progress">
                 			    <div class="f1-progress-line" data-now-value="16.66" data-number-of-steps="3" style="width: 16.66%;"></div>
                 			</div>
                 			<div class="f1-step active">
                 				<div class="f1-step-icon"><i class="fa fa-user"></i></div>
                 				<p><s:message code="label.username" text="Username"/></p>
                 			</div>
                 			<div class="f1-step">
                 				<div class="f1-step-icon"><i class="fa fa-question-circle-o"></i></div>
                 				<p><s:message code="security.questions" text="Security questions"/></p>
                 			</div>
                 		    <div class="f1-step">
                 				<div class="f1-step-icon"><i class="fa fa-unlock"></i></div>
                 				<p><s:message code="button.label.reset" text="Reset"/> &nbsp; <s:message code="label.entity.status" text="Status"/></p>
                 			</div>
                 		</div>
                 		
                 		<fieldset>
                 		    <div id="alertUser" class="alert alert-warning" role="alert" style="display: none;">...</div>
                 		    <input type="hidden" id="alertUser" name="alertUser" value="${alertUser }"/>
                 			<div class="form-group">
                 			    <label class="sr-only" for="username"><s:message code="label.username" text="Username"/></label>
                                 <input type="text" id="username" name="username" placeholder="<s:message code="label.username" text="Username"/>" class="username form-control" >
                             </div>
                             <div class="f1-buttons">
                                 <button type="button" class="btn btn-next" name="getUserInformation"><s:message code="label.generic.next" text="Next"/></button>
                             </div>
                         </fieldset>

                         <fieldset>
                             <h4><s:message code="security.questions.answer" text="Security questions"/>:</h4>
                             <div id="alertError" class="alert alert-danger" role="alert" style="display: none;">...</div>
                             <input type="hidden" id="alertError" name="alertError" value="${alertError }"/>
                             <div class="form-group">
                                 <div id="alertWarnSecQues1" class="alert alert-danger" role="alert" style="display: none;">...</div>
                                 <label class="sr-only" for="answer1"><s:message code="security.answer.question1.message" text="answer1"/></label>
                        		 <input type="text" id="answer1" name="answer1" placeholder="<s:message code="security.answer.question1.message" text="answer1"/>" class="f1-email form-control" id="answer1">
                             </div>
                             <div class="form-group">
                             	 <div id="alertWarnSecQues2" class="alert alert-danger" role="alert" style="display: none;">...</div>
								 <label class="sr-only" for="answer2"><s:message code="security.answer.question2.message" text="answer2"/></label>
                        		 <input type="text" id="answer2" name="answer2" placeholder="<s:message code="security.answer.question2.message" text="answer2"/>" class="f1-email form-control" id="answer2">
                        	 </div>
                             <div class="form-group">
                             	 <div id="alertWarnSecQues3" class="alert alert-danger" role="alert" style="display: none;">...</div>
                                 <label class="sr-only" for="answer3"><s:message code="security.answer.question3.message" text="answer3"/></label>
                        		 <input type="text" id="answer3" name="answer3" placeholder="<s:message code="security.answer.question3.message" text="answer3"/>" class="f1-email form-control" id="answer3">
                             </div>
                             <div class="f1-buttons">
                                 <button type="button" class="btn btn-previous"><s:message code="label.generic.previous" text="Previous"/></button>
                                 <button type="button" class="btn btn-next" name="getSecurityQuestions"><s:message code="label.generic.next" text="Next"/></button>
                             </div>
                         </fieldset>

                         <fieldset>
                             <div id="alertSuccess" class="alert alert-success" role="alert" style="display: none;">...</div>
                             <input type="hidden" id="alertError" name="alertError" value="${alertError }"/>
                             <div class="f1-buttons">
                                 <button type="button" class="btn btn-next" onclick="goLogin()"><s:message code="button.label.signin" text="Sign In!"/>!</button>
                             </div>
                         </fieldset>
                 	
                 	</form>
                 </div>
             </div>
                 
         </div>
     </div>
	<script src="<c:url value="/resources/assets/js/jquery-1.11.1.min.js" />"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="<c:url value="/resources/assets/bootstrap/js/bootstrap.min.js" />"></script>
    
    <script src="<c:url value="/resources/assets/js/jquery.backstretch.min.js" />"></script>
    <script src="<c:url value="/resources/assets/js/retina-1.1.0.min.js" />"></script>
    <script src="<c:url value="/resources/assets/js/scripts.js" />"></script>
    
    <!--[if lt IE 10]>
        <script src="/resources/assets/js/placeholder.js"></script>
    <![endif]-->
        
</body>
</html>