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
			<li class="active titulo">Invitaciones</li>
		</ol>
		<div class="clearfix"></div>
		<s:if test="hasActionErrors()">
			<div class="alert alert-danger alert-dismissible fade
				show" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong><s:actionerror /></strong>
			</div>
		</s:if>

		<s:if test="hasActionMessages()">
			<div class="alert alert-info alert-dismissible fade
				show" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong><s:actionmessage /></strong>
			</div>
		</s:if>
		<br />





		<div class="center-block width-80">

			<s:form action='' id="formCaptura" method="post">
				<div class="form-group ">
				<input type="hidden" id="id_Evento" name="idEventoEjecuta" value="<s:property value="idEventoEjecuta" />">

					<div class="row">
						<div class="text-center">
							<a id="btnInvitado" onclick="ejecutarMetodo('capInvitado');"
								class="btn btn-success">Agregar Invitados</a>
						</div>

					</div>

				</div>
			</s:form>
		</div>


		<s:if test="listaAsisten != null && listaAsisten.size() > 0">
			<table class="table table-striped table-bordered tableData">
				<thead class="bg-primary">
					<tr>
						<th>NOMBRE</th>
						<th>APP_PATERNO</th>
						<th>APP_MATERNO</th>
						<th>APP_MATERNO</th>
				</thead>
				<tbody>
					<s:iterator value="listaEjeccucion">
						<tr>
							<td><s:property value='NOMBRE' /></td>
							<td><s:property value='APP_PATERNO' /></td>
							<td><s:property value='APP_MATERNO' /></td>

						</tr>
					</s:iterator>
				</tbody>
			</table>
		</s:if>
		<s:else>
			<div class="text-center text-danger">
				<strong> Sin Registros ...</strong>
			</div>
		</s:else>



	</div>



	<script>
		function ejecutarMetodo(metodo_ejecuta) {
			$("#formCaptura").attr('action','invitacionEventos!' + metodo_ejecuta );
			$("#formCaptura").submit();
		}

	</script>

</body>
</html>