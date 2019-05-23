<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="login"><i class="fa fa-home"></i></a></li>
			<li><a>Gestion de Eventos</a></li>
			<li><a href="registroEventos">Programación de Eventos</a></li>
			<li class="active titulo">Captura</li>
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
			action="registroEventos!guardarRegistro" class="form-horizontal">
			<div class="panel panel-default center-block panelMaestra"></div>
			<div class="text-center">
				<div class="well" id="datos">
					<fieldset>
						<legend class="text-center">Llene el formulario</legend>
						<div class="form-group">




						<div class="row">

								<div class="col-sm-6">
									<label for="tipoConsulta" class="control-label">Concesionaria</label>
								</div>
								<div class="col-sm-5">
									<s:select list="listaConcesionaras" id="concesionarias"
										name="selectedEjecucion.FK_NUMERO_CONCE" listKey="NCON01"
										listValue="NCON01+'-'+RSOC01" cssClass=" form-control"></s:select>
								</div>
							</div>

	

							<div class="row">
								<div class="col-sm-6">
									<label for="tipoConsulta" class="control-label">Tipo de
										Evento</label>
								</div>
								<div class="col-sm-5">
									<s:select list="listaEventos" id="eventos"
										name="selectedEjecucion.FK_EVENTO.PK_EVENTO"
										listKey="PK_EVENTO" listValue="strMarca + ' - '+ NOMBRE"
										cssClass=" form-control"></s:select>
								</div>
							</div>


							<div class="row">
								<div class="col-sm-11">
									<label for="nombre" class="control-label">Unir
										Registros</label> &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
										id="check" value="compactarCheck"> <br />
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<label for="nombre" class="control-label">Ubicación</label><br />
								</div>

								<div class="col-sm-5">
									<s:textfield name="selectedEjecucion.UBICACION" maxlength="100"
										onblur="this.value=this.value.trim()" cssClass="form-control"
										cssErrorClass="error" placeholder="Ingrese la ubicacion"
										id="ubicacion" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label for="nombre" class="control-label">Dirección:</label>
								</div>
								<div class="col-sm-5">
									<s:textarea name="selectedEjecucion.DIRECCION"
										onblur="this.value=this.value.trim()" maxlength="500"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese la direccion" id="direccion" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label for="fechaInicio" class="control-label">Fecha de
										apertura:</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="fechaInicio" maxlength="10"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese la fecha" id="fechaInicio" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label for="fechaFin" class="control-label">Fecha de
										cierre:</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="fechaFin" maxlength="10"
										cssClass="form-control" cssErrorClass="error"
										placeholder="Ingrese la fecha" id="fechaFin" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label for="fechas" class="control-label">Fechas y
										horas mostradas:</label>
								</div>
								<div class="col-sm-5">
									<s:textfield name="selectedEjecucion.FECHAS_HORAS"
										maxlength="50" cssClass="form-control" cssErrorClass="error"
										onblur="this.value=this.value.toLowerCase().trim()"
										placeholder="Ingrese las fechas y horas, ejemplo:10:00hrs - 16:00hrs"
										id="fechas" />
								</div>
							</div>
						</div>


						<s:if test="selectedEjecucion.PK_EVENTO_EJECUCION != null && selectedEjecucion.PK_EVENTO_EJECUCION != 0 ">
							<s:hidden id="idEvento"
								name="selectedEjecucion.PK_EVENTO_EJECUCION" />
						</s:if>


					</fieldset>
					<div class="text-center">
						<s:submit value="Guardar" cssClass="btn btn-success"
							id="btn_guardar" />
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
	
	
		$(document).ready(function() {
	  $('#check').change(function() {
		if ($(this).is(":checked")) {		 
						$("#ubicacion").val("Concesionarias Participantes:");
					 $("#ubicacion").prop('readonly', true);
					 $("#ubicacion").focus();
		}else{			
					 $("#ubicacion").val("");
					 $("#ubicacion").focus();
					 $("#ubicacion").prop('readonly', false);
		}
	  });
	});
	
	
	
	
	
		$(function() {
			$("#fechaInicio").isDate({
				"firstDate" : "fechaInicio",
				"secondDate" : "fechaFin"
			});
			$("#fechaFin").isDate({
				"firstDate" : "fechaInicio",
				"secondDate" : "fechaFin"
			});
			
			


			$("#btn_guardar").click(function(e) {
				if ($("#fechaInicio").val().trim() == "") {
					$.alertable.alert("Escriba la Fecha de Apertura");
					$("#fechaInicio").focus();
					e.preventDefault();
				} else if ($("#fechaFin").val().trim() == "") {
					$.alertable.alert("Escriba la Fecha de Cierre");
					$("#fechaFin").focus();
					e.preventDefault();
				} else if ($("#ubicacion").val().trim() == "") {
					$.alertable.alert("Escriba la Fecha de Apertura");
					$("#ubicacion").focus();
					e.preventDefault();
				} else if ($("#direccion").val().trim() == "") {
					$.alertable.alert("Escriba la Fecha de Apertura");
					$("#direccion").focus();
					e.preventDefault();
				} else if ($("#eventos").val().trim() == "") {
					$.alertable.alert("Seleccione un tipo de evento");
					$("#eventos").focus();
					e.preventDefault();
				} else if ($("#concesionarias").val().trim() == "") {
					$.alertable.alert("Seleccione una concesionaria");
					$("#concesionarias").focus();
					e.preventDefault();
				}else if ($("#fechas").val().trim() == "") {
					$.alertable.alert("Escriba las fechas a mostrar");
					$("#fechas").focus();
					e.preventDefault();
				}
			});
		});
	</script>
</body>
</html>