<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="login"><i class="fa fa-home"></i></a></li>
			<li><a>Gestion de eventos</a></li>
			<li class="active titulo">Ejeccucion de eventos</li>
		</ol>
		<div class="clearfix"></div>
		<s:if test="hasActionErrors()">
			<div class="alert alert-danger" role="alert">
				<strong><s:actionerror /></strong>
			</div>
		</s:if>

		<s:if test="hasActionMessages()">
			<div class="alert alert-info" role="alert">
				<strong><s:actionmessage /></strong>
			</div>
		</s:if>
		<br />



		<div class="center-block width-80">
			
		</div>



	</div>

	<script>
	</script>

</body>
</html>