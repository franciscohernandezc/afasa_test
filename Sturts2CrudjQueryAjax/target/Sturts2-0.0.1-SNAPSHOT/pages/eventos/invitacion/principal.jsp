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
			<div class="well" id="datos">
				<s:form action='' id="formEvento" method="post">
					<fieldset>
						<legend class="text-center">Seleccione un evento</legend>
						<div class="form-group">

							<div class="row">
								<div class="col-sm-6">
									<label for="tipoConsulta" class="control-label">Eventos</label>
								</div>
								<div class="col-sm-5">
									<s:select list="listaEventos" id="eventos" name="idEventoEjecuta"
										listKey="PK_EVENTO_EJECUCION"
										listValue="PK_EVENTO_EJECUCION+'.- '+FK_EVENTO.NOMBRE+' ('+UBICACION+')'"
										cssClass=" form-control">
									</s:select>
								</div>
							</div>


						</div>
					</fieldset>

					<div class="clearfix text-center"></div>
					<div class="text-center">
						<a id="btnInvitado" onclick="ejecutarMetodo('buscaInvitados');"
							class="btn btn-success">Invitados</a>
						 <a id="btnAsistentes"
							onclick="ejecutarMetodo('buscaAsistentes');"
							class="btn btn-success">Asistentes</a>
						 <a id="btnContratos"
							onclick="ejecutarMetodo('buscaContratos');"
							class="btn btn-success">Contratos</a>
					</div>
				</s:form>
			</div>
		</div>
	</div>



	<script>
		function ejecutarMetodo(metodo_ejecuta) {
				$("#formEvento").attr('action','invitacionEventos!' + metodo_ejecuta);
				$("#formEvento").submit();
		}
	</script>

    </body>
</html>