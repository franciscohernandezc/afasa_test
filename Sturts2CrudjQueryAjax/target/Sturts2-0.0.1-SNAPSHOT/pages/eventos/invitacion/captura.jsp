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
			<li class="active titulo">Programar un evento</li>
		</ol>
		<div class="clearfix"></div>
		<s:if test="hasActionErrors()">
			<div class="alert alert-danger alert-dismissible fade
				show"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong><s:actionerror /></strong>
			</div>
		</s:if>
		<s:if test="hasActionMessages()">
			<div class="alert alert-info alert-dismissible fade
				show"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong><s:actionmessage /></strong>
			</div>
		</s:if>
		<br />
		<form id="capturaForm" name="capturaForm" method="POST"
			action="invitacionEventos!guardarInvitado" class="form-horizontal">
			<div class="panel panel-default center-block panelMaestra"></div>
			<div class="text-center">
				<div class="well" id="datos">
					<fieldset>
						<legend class="text-center">Llene el formulario</legend>
						<div class="form-group">
							<input type="hidden" id="id_Evento" name="idEventoEjecuta"
								value="<s:property value="idEventoEjecuta" />">

							<div class="row">
								<div class="col-sm-6">
									<label for="nombre" class="control-label">Nombre del
										evento</label>
								</div>
								<div class="col-sm-5">

									<s:property value="eventoEjecucionSelected.FK_EVENTO.NOMBRE" />

								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<label for="nombre" class="control-label">Ubicación</label>
								</div>
								<div class="col-sm-5">
									<s:property value="eventoEjecucionSelected.UBICACION" />
								</div>
							</div>


							<div class="row">
								<div class="col-sm-6">
									<label for="nombre" class="control-label">nombre</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="selectedAsistente.NOMBRE" maxlength="80"
										onblur="this.value=this.value.trim()" cssClass="form-control"
										cssErrorClass="error" placeholder="Ingrese el nombre"
										id="nombre" />
								</div>
							</div>


							<div class="row">
								<div class="col-sm-6">
									<label for="app_paterno" class="control-label">Apellido
										paterno</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="selectedAsistente.APP_PATERNO"
										maxlength="70" onblur="this.value=this.value.trim()"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese el apellido paterno" id="app_paterno" />
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<label for="app_materno" class="control-label">Apellido
										materno</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="selectedAsistente.APP_MATERNO"
										maxlength="70" onblur="this.value=this.value.trim()"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese el apellido materno" id="app_materno" />
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<label for="telefono" class="control-label">Telefono</label>
								</div>
								<div class="col-sm-5">


									<s:textfield name="selectedAsistente.TELEFONO" maxlength="13"
										onblur="this.value=this.value.trim()" cssClass="form-control"
										cssErrorClass="error"
										placeholder="Ingrese el apellido telefono" id="telefono" />
								</div>
							</div>


							<div class="row">
								<div class="col-sm-6">
									<label for="email" class="control-label">Correo
										electronico</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="selectedAsistente.CORREO_ELECTRONICO"
										maxlength="80" onblur="this.value=this.value.trim()"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese un email" id="email" />
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<label for="medio" class="control-label">Medio</label>
								</div>
								<div class="col-sm-5">

									<select id="marca" name="selectedAsistente.MEDIO"
										class="form-control">
										<option value="">Seleccione una opción</option>
										<option value="1">Telefono</option>
										<option value="2">Facebook</option>
										<option value="3">Pagina de internet</option>
										<option value="3">Periodico</option>
										<option value="4">otro medio</option>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<label for="medio" class="control-label">Agrege el
										medio</label>
								</div>
								<div class="col-sm-5">

									<s:textfield name="selectedAsistente.OTRO_MEDIO" maxlength="80"
										onblur="this.value=this.value.trim()" cssClass="form-control"
										cssErrorClass="error" placeholder="Ingrese otro medio"
										id="auto" />

								</div>
							</div>



							<div class="row">
								<div class="col-sm-6">
									<label for="autoINTERES" class="control-label">Auto de interes</label>
								</div>
								<div class="col-sm-5">

									<s:textfield name="selectedAsistente.AUTO_INTERES"
										maxlength="80" onblur="this.value=this.value.trim()"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese un auto de interes" id="autoINTERES" />
								</div>


							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<label for="auto" class="control-label">Disponiblidad</label>
							</div>
							<div class="col-sm-5">
								<select id="medio" name="selectedAsistente.DISPONIBILIDAD"
									class="form-control">
									<option value="0">No Asistira</option>
									<option value="1">Asistira</option>

								</select>


							</div>
						</div>
					</fieldset>
					<div class="clearfix"></div>
					<div class="text-center">
						<s:submit value="Guardar" cssClass="btn btn-success"
							id="btn_guardar" />
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
	
	</script>
</body>
</html>