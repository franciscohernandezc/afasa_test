package mx.com.afasa.dao;

import java.util.List;

import mx.com.afasa.entities.CT_EVENTOS;

public interface CT_EVENTOSDao {

	boolean guardar(CT_EVENTOS evento);
	List<CT_EVENTOS> buscarTodos();
	
	 CT_EVENTOS obiteneEvento(int PK_EVENTO);

}
