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
			<li class="active titulo">Programación de Eventos</li>
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
			<form id="formEvento" name="registro" method="POST"
				class="form-horizontal" action="registroEventos!buscar"
				target='_self'>
				<div class="well" id="datos">
					<fieldset>
						<legend class="text-center">Filtro de búsqueda</legend>
						<div class="form-group">

							<div class="col-sm-3 text-center">
								<label for="ubicacion" class="control-label">Ubicación:</label>
							</div>
							<div class="col-sm-3 text-center">
								<label for="direccion" class="control-label">Dirección:</label>
							</div>
							<div class="col-sm-2 text-center">
								<label for="fecha1" class="control-label">Fecha de
									inicio:</label>
							</div>
							<div class="col-sm-2 text-center">
								<label for="fecha1" class="control-label">Fecha de
									cierre:</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3 text-center">
								<s:textfield name="selectedEjecucion.UBICACION" maxlength="10"
									cssClass="form-control" cssErrorClass="error"
									placeholder="Ingrese el nombre del evento" id="ubicacion" />
							</div>
							<div class="col-sm-3 text-center">
								<s:textfield name="selectedEjecucion.DIRECCION" maxlength="10"
									cssClass="form-control" cssErrorClass="error"
									placeholder="Ingrese el nombre del evento" id="direccion" />
							</div>
							<div class="col-sm-2 text-center">
								<s:textfield name="fechaInicio" maxlength="10"
									cssClass="form-control" cssErrorClass="error"
									placeholder="Ingrese la fecha" id="fechaInicio" />
							</div>
							<div class="col-sm-2 text-center">
								<s:textfield name="fechaFin" maxlength="10"
									cssClass="form-control" cssErrorClass="error"
									placeholder="Ingrese la fecha" id="fechaFin" />
							</div>
						</div>
						<div class="clearfix"></div>
					</fieldset>
					<div class="clearfix text-center"></div>
					<div class="text-center">
						<a href="registroEventos!capturar" class="btn btn-success">Captura</a>
						<input type="submit" class="btn btn-success" id="btn_buscar"
							value="Buscar eventos" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</div>
			</form>
		</div>

		<s:if test="listaEjeccucion != null && listaEjeccucion.size() > 0">
			<table class="table table-striped table-bordered tableData">
				<thead class="bg-primary">
					<tr>
						<th>UBICACIÓN</th>
						<th>DIRECCIÓN</th>
						<th>FECHA DE INICIO</th>
						<th>FECHA DE FIN</th>
						<th>FECHAS Y HORAS MOSTRADAS</th>
						<th>NOMBRE DEL EVENTO</th>
						<th>MARCA</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="listaEjeccucion">
						<tr>
							<td><s:property value='UBICACION' /></td>
							<td><s:property value='DIRECCION' escape="false" /></td>
							<td><s:date format="dd/MM/yyyy" name="FECHA_INICIO" /></td>
							<td><s:date format="dd/MM/yyyy" name="FECHA_FIN" /></td>
							<td><s:property value='FECHAS_HORAS' /></td>
							<td><s:property value='FK_EVENTO.NOMBRE' /></td>
							<td><s:property value='FK_EVENTO.strMarca' /></td>



							<td>
								<div class="btn-group">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a target="_self"
											onclick="obtenerConcesionaria('<s:property value='FK_NUMERO_CONCE'/>')"
											><span
												aria-hidden="true" class="fa fa-list-alt"> </span>Datos</a></li>
										<li><a
											onclick="window.location='registroEventos!preparaActualizar?idEventoEjecuta=<s:property value="PK_EVENTO_EJECUCION"/>'">
												<img alt="Editar " src="assets/img/options/edit.png" />
												Editar
										</a></li>

									</ul>
								</div>
							</td>

						</tr>
					</s:iterator>
				</tbody>
			</table>
		</s:if>
		<s:else>
			<div class="text-center text-danger">
				<strong>Realice una búsqueda, para mostrar eventos ...</strong>
			</div>
		</s:else>
	</div>


	<div class="modal fade" id="modalConcesionaria" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabelContra" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title" id="myModalLabelContra">DATOS DE LA CONCESIONARIA</h4>
		</div>
		<div class="modal-body">
			<div class="row">
				<div id="detalleConcesionaria"></div>
			</div>
		</div>
		<div class="modal-footer">
			<span id="carga" class="collapse"><img
				src="./assets/img/indicator.gif" /></span>
			<button type="button" class="btn btn-default collapse"
				id="botonCerrar" data-dismiss="modal">Cerrar</button>
		</div>
	</div>

<script>
	$(function() {
		if ("#fechaInicio" != null && "#fechaInicio" != null
				&& "#fechaInicio" != "" && "#fechaInicio" != "") {
			$("#fechaInicio").isDate({
				"firstDate" : "fechaInicio",
				"secondDate" : "fechaFin"
			});
			$("#fechaFin").isDate({
				"firstDate" : "fechaInicio",
				"secondDate" : "fechaFin"
			});
		}			
	});

	function obtenerConcesionaria(id_concesionaria){
	    if(id_concesionaria != null ){
			$("#detalleConcesionaria").load("registroEventos!getConcesionariaModal", {idConcesionara: id_concesionaria} , function(){
				 $('#modalConcesionaria').modal('toggle');
			});
	    }else{
			$.alertable.alert("Hubo un error al cargar el detalle, por favor contacte a Sistemas.");
		}
	}		
</script>
</body>
</html>