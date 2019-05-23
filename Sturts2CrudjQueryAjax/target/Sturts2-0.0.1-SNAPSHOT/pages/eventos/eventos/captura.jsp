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
			<li class="active titulo">Captura de eventos</li>
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
			<div class="alert alert-info" alert-dismissible fade
				show" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong><s:actionmessage /></strong>
			</div>
		</s:if>
		<br />


		<form id="capturaForm" name="capturaForm" method="POST"
			enctype="multipart/form-data" 		
			action="eventosGestion!guardarRegistro"
			class="form-horizontal">

			<div class="panel panel-default center-block panelMaestra"></div>
			<div class="text-center">
				<div class="well" id="datos">
					<fieldset>
						<legend class="text-center">Llene el formulario</legend>

						<div class="form-group">
							<div>
							<s:if
											test="selectedEvento.PK_EVENTO != null && selectedEvento.PK_EVENTO != 0 ">
								<div class="row">
									<div class="col-sm-3 text-center"></div>
								
									<div class="col-sm-5 text-center">

										<label for="nombre" class="control-label">Imagen
											seleccionada:</label> <br />
										
											<img class="img-responsive text-center " 
												src="eventosGestion!imagenEvento2?idEvento=<s:property value="idEvento"/>" />
									

									</div>
									<div class="col-sm-3 text-center"></div>
								</div>
								
									</s:if>
									
									<div class="row">
									<br/>
									</div>
									

								<div class="row">
									<div class="col-sm-6">
										<label for="nombre" class="control-label">Nombre:</label>
									</div>
									<div class="col-sm-5">
										<s:textfield name="selectedEvento.NOMBRE" maxlength="40"
											cssClass="form-control" cssErrorClass="error"
											placeholder="Ingrese el nombre del evento" id="nombre" />
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<label class="control-label">Imagen:</label>
									</div>
									<div class="col-sm-5">
										<%-- 	imagen  --%>
										<input type="file" id="fileUpload" name="fileUpload" 
											class="inputfile inputfile-1" /> <label for="fileUpload"><svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="17"
												viewBox="0 0 20 17">
											<path
													d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
											<span>Escoja su archivo&hellip;</span></label>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<label for="marca" class="control-label">Marca:</label>
									</div>
									<div class="col-sm-5">
										<select id="marca" name="selectedEvento.MARCA"
											class="form-control">

											<option value="1"
												<s:if test="#selectedEvento.MARCA == 1">selected</s:if>>VW</option>
											<option value="2"
												<s:if test="#selectedEvento.MARCA == 2">selected</s:if>>SEAT</option>
											<option value="0"
												<s:if test="#selectedEvento.MARCA == null">selected</s:if>>Seleccione
												una opcion</option>
										</select>
									</div>
								</div>
							</div>
							<s:if
								test="selectedEvento.PK_EVENTO != null && selectedEvento.PK_EVENTO != 0 ">
								<s:hidden id="idEvento" name="selectedEvento.PK_EVENTO" />
							</s:if>
						</div>
					</fieldset>
					<div class="text-center">

						<div class="text-center">
							<s:submit value="Guardar" cssClass="btn btn-success"
								id="btn_guardar" />
						</div>



					</div>
				</div>

			</div>
		</form>

	</div>



	<script>
		$(function() {
			$("#btn_guardar").click(
					function(e) {
						if ($("#nombre").val().trim() == "") {
							$.alertable.alert("Escriba el nombre del evento");
							$("#nombre").focus();
							e.preventDefault();
						} else if ($("#marca").val().trim() == ""
								|| $("#marca").val().trim() == "0") {
							$.alertable.alert("Seleccione una marca");
							$("#marca").focus();
							e.preventDefault();
						} 
												
						
						if ($("#idEvento").val().trim() == "") {																
							 if ($("#fileUpload").val().trim() == "") {
								$.alertable.alert("Agrege una imagen");
								$("#fileUpload").focus();
								e.preventDefault();
							}
						}
					
		})});
						
		
	</script>
</body>
</html>