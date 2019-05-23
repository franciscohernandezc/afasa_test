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
			<li class="active titulo">Catalogo de eventos</li>
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
		<div class="text-center">
			<a href="eventosGestion!caputuraEvento" class="btn btn-success">Capturar</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="clearfix"></div>
		<div class="clearfix"></div>
		<br />
		<s:if test="listaEventos != null && listaEventos.size() > 0">
			<table class="table table-striped table-bordered tableData">
				<thead class="bg-primary">
					<tr>

						<th>NOMBRE</th>
						<th>MARCA</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<s:iterator value="listaEventos">
						<tr>
							<td><s:property value='NOMBRE' /></td>
							<td><s:property value='strMarca' /></td>




							<td>
								<div class="btn-group">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a target="_self"
											onclick="abrirModal('<s:property value='PK_EVENTO'/>')"><span
												aria-hidden="true" class="fa fa-list-alt"> </span>Imagen</a></li>
										<li><a
											onclick="window.location='eventosGestion!preparaActualizar?idEvento=<s:property value="PK_EVENTO"/>'">
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
				<strong>No hay eventos disponibles...</strong>
			</div>
		</s:else>
	</div>





	<div class="modal fade" id="modalImagen" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabelContra" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title" id="myModalLabelContra">Imagen de evento</h4>
		</div>
		<div class="modal-body">
			<div class="row">
				<div id="detalleImagen" class="center-block text-center"></div>
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
			 
				function abrirModal(id_evento){ 					     
		    	 console.info(id_evento);
		    		$("#detalleImagen").load("eventosGestion!imagenEvento", {idEvento: id_evento} , function(){
					 $('#modalImagen').modal('toggle');
				});
				}
				
				
		 
	</script>

</body>
</html>