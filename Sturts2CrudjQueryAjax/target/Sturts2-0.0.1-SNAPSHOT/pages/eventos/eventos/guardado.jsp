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
			<li class="active titulo">Guardado</li>
		</ol>
		<div class="clearfix"></div><br/>
		<div class="text-center">
			<s:if test="valid == true">
				<strong class="text-success">Se ha guardado correctamente...</strong>
				<div class="clearfix"></div><br/>
				<a class="btn btn-primary" href="eventosGestion"> <span aria-hidden="true" class="fa fa-long-arrow-left"></span> Regresar</a>
			</s:if>
			<s:else>
				<strong class="text-danger">Ha ocurrido un error al guardar, vuelva a intentarlo por favor. Si el problema persiste contacte a Sistemas...</strong>
				<div class="clearfix"></div><br/>
				<a class="btn btn-primary" onclick="history.back()"> <span aria-hidden="true" class="fa fa-long-arrow-left"></span> Regresar</a>
			</s:else>
			
		</div>
	</div>
</body>
</html>