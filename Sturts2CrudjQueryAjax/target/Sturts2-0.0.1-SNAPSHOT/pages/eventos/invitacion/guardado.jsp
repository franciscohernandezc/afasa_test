<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>
            	<tiles:insertAttribute name="title" ignore="true" />
            </title>
  
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">

        </script>
    </head>
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
				<strong class="text-success">Se guardo el registro correctamente...</strong>
				<div class="clearfix"></div><br/>
				<a class="btn btn-primary" href="registroEventos"> <span aria-hidden="true" class="fa fa-long-arrow-left"></span> Regresar</a>
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