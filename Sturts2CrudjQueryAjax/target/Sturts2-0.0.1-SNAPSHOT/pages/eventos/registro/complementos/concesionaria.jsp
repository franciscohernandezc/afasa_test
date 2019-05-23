<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<s:if test="concesionaria != null">
			<div class="form-group">
				<div class="col-sm-5 text-info">
					<strong>RSOC01</strong>
				</div>
				<div class="col-sm-6">
					<s:property value="concesionaria.RSOC01" />
				</div>
				<div class="col-sm-5 text-info">
					<strong>RFC01</strong>
				</div>
				<div class="col-sm-6">
					<s:property value="concesionaria.RFC01" />
				</div>
				<div class="col-sm-5 text-info">
					<strong>DIR101</strong>
				</div>
				<div class="col-sm-6">
					<s:property value="concesionaria.DIR101" />
				</div>

			</div>

			<div class="clearfix"></div>
		</s:if>
		<s:else>
			<div class="text-center">
				<strong>Realice una busqueda</strong>
			</div>
		</s:else>
	</div>
</body>
</html>