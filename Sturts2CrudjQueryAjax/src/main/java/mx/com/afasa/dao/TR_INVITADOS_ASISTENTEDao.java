package mx.com.afasa.dao;

import java.util.List;

import mx.com.afasa.entities.TR_INVITADOS_ASISTENTE;

public interface TR_INVITADOS_ASISTENTEDao {
	
	boolean guardar(TR_INVITADOS_ASISTENTE  invitadoAsistente);

	boolean actualizar(TR_INVITADOS_ASISTENTE invitadoAsistente);

	
	
	List<TR_INVITADOS_ASISTENTE> buscar(TR_INVITADOS_ASISTENTE invitadoAsistente ,int tipoBusqueda );
	
	
	TR_INVITADOS_ASISTENTE botenerAsistente(int PK_INVITADOS_ASISTENTE);

}
