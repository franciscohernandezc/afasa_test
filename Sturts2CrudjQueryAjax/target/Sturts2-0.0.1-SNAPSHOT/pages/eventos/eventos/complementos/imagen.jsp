<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<s:if test="imagen64 != null && eventoImagen != null">
			<div class="form-group center-block">				
																
					    <img height="100em" 
					    src="data:<s:property value='eventoImagen.IMAGEN_CONTENT' />;base64, <s:property value='imagen64' />"
						alt="<s:property value='eventoImagen.NOMBRE' />" 						
						/>
				
			</div>
			<div class="clearfix"></div>
		</s:if>
		<s:else>
			<div class="text-center">
				<strong>imagen no localizada</strong>
			</div>
		</s:else>
	</div>
</body>
</html>