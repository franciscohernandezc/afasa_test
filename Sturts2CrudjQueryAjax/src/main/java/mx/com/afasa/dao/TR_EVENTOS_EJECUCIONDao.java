package mx.com.afasa.dao;


import java.util.List;

import mx.com.afasa.entities.TR_EVENTOS_EJECUCION;


public interface TR_EVENTOS_EJECUCIONDao {
	
	boolean guardar(TR_EVENTOS_EJECUCION ejecucion);

	

	List<TR_EVENTOS_EJECUCION> buscar(TR_EVENTOS_EJECUCION ejecucion);
	
	
	TR_EVENTOS_EJECUCION obiteneEvento(int idEventoEjecuta);
	
	
	

}
