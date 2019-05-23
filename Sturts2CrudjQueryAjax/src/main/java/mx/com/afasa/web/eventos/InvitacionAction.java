package mx.com.afasa.web.eventos;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import mx.com.afasa.dao.TR_EVENTOS_EJECUCIONDao;
import mx.com.afasa.dao.TR_INVITADOS_ASISTENTEDao;
import mx.com.afasa.entities.TR_EVENTOS_EJECUCION;
import mx.com.afasa.entities.TR_INVITADOS_ASISTENTE;

public class InvitacionAction extends ActionSupport {
	/**********************************************************************************************************/
	/***************************************************
	 * ATTRIBUTES
	 *********************************************/
	/**********************************************************************************************************/

	private static final long serialVersionUID = 1L;
	//private final Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private TR_EVENTOS_EJECUCIONDao daoEventosEjecucion;
	@Autowired
	private TR_INVITADOS_ASISTENTEDao daoInvitados;

	private boolean valid = false;
	private List<TR_EVENTOS_EJECUCION> listaEventos;
	private List<TR_INVITADOS_ASISTENTE> listaAsisten;
	private TR_INVITADOS_ASISTENTE selectedAsistente;
	private TR_EVENTOS_EJECUCION eventoEjecucionSelected;
	private Integer idEventoEjecuta;
	private Integer tipoVista;
	

	/**********************************************************************************************************/
	/***************************************************
	 * EVENTOS
	 *********************************************/
	/**********************************************************************************************************/

	public String execute() {

//		Usuario tmp = UsuarioService.getUsuarioSession();
//		TR_EVENTOS_EJECUCION selectedEvent = new TR_EVENTOS_EJECUCION();
//		//
//		if (tmp.getPerfilSession().getIdPerfil() == 2 || tmp.getPerfilSession().getIdPerfil() == 3) {
//
//			listaEventos = daoEventosEjecucion.buscar(selectedEvent);
//
//		} else if (tmp.getPerfilSession().getIdPerfil() == 1) {
//			listaEventos = daoEventosEjecucion.buscar(selectedEvent);
//		}

		limpiar();
		return SUCCESS;
	}

	public String buscaInvitados() {
		try {
			tipoVista = 1;
			eventoEjecucionSelected = daoEventosEjecucion.obiteneEvento(idEventoEjecuta);
			//log.info("buscaInvitados " + idEventoEjecuta);
			listaAsisten = daoInvitados
					.buscar(new TR_INVITADOS_ASISTENTE(null, new TR_EVENTOS_EJECUCION(idEventoEjecuta)), tipoVista);

		} catch (Exception e) {
			//log.error(e.getLocalizedMessage());
		}
		return "listaAsistentes";
	}

	public String buscaAsistentes() {
		tipoVista = 2;
		eventoEjecucionSelected = daoEventosEjecucion.obiteneEvento(idEventoEjecuta);
		//log.info("buscaAsistentes" + idEventoEjecuta);
		listaAsisten = daoInvitados.buscar(new TR_INVITADOS_ASISTENTE(null, new TR_EVENTOS_EJECUCION(idEventoEjecuta)),
				tipoVista);
		return "listaAsistentes";
	}

	public String buscaContratos() {
		tipoVista = 3;
		//log.info("buscaContratos" + idEventoEjecuta);
		listaAsisten = daoInvitados.buscar(new TR_INVITADOS_ASISTENTE(null, new TR_EVENTOS_EJECUCION(idEventoEjecuta)),
				tipoVista);
		return "listaAsistentes";
	}

	
	
	
	public String capInvitado() {
		tipoVista = 1;
		//log.info("capInvitado>" + idEventoEjecuta);
		eventoEjecucionSelected = daoEventosEjecucion.obiteneEvento(idEventoEjecuta);
		//log.info("capInvitado" + eventoEjecucionSelected.getUBICACION());
		selectedAsistente = new TR_INVITADOS_ASISTENTE();
		return "capturar";
	}

	public String capAsistente() {
		tipoVista = 2;
		eventoEjecucionSelected = daoEventosEjecucion.obiteneEvento(idEventoEjecuta);
		//log.info("capAsistente" + eventoEjecucionSelected.getUBICACION());
		selectedAsistente = new TR_INVITADOS_ASISTENTE();
		return "capturar";
	}

	public String capContrato() {
		tipoVista = 3;
		eventoEjecucionSelected = daoEventosEjecucion.obiteneEvento(idEventoEjecuta);
		//log.info("capContrato" + eventoEjecucionSelected.getUBICACION());
		selectedAsistente = new TR_INVITADOS_ASISTENTE();
		return "capturar";
	}
	
	
	

	public String guardarInvitado() {
		//log.info("guardarInvitado");
		try {
			selectedAsistente.setFK_EVENTO_EJECUCION(new TR_EVENTOS_EJECUCION(idEventoEjecuta));
			selectedAsistente.setBAN_ASISTENTE(Boolean.FALSE);
			selectedAsistente.setFECHA_INVITACION(new Date());
			//log.info(selectedAsistente.getNOMBRE());
			if (daoInvitados.guardar(selectedAsistente)) {
				valid = Boolean.TRUE;
			} else {
				throw new IOException("Problema al guardar el evento");
			}
		} catch (Exception e) {
			valid = Boolean.FALSE;
			addActionError(e.getLocalizedMessage().toString());
			return "messageGuardar";
		}
		return "messageGuardar";
	}

	public void validateGuardarInvitado() {
	
	}
	
	
	
	
	public String guardarAsitente() {
		//log.info("guardarAsitente");
		try {			
			selectedAsistente.setFECHA_ASISTENCIA(new Date());
			selectedAsistente.setBAN_ASISTENTE(Boolean.TRUE);
			if (daoInvitados.actualizar(selectedAsistente)) {
				valid = Boolean.TRUE;
			} else {
				throw new IOException("Problema al actualizar arcvhio el evento");
			}
		} catch (Exception e) {
			valid = Boolean.FALSE;
			addActionError(e.getLocalizedMessage().toString());
			return "messageGuardar";
		}
		return "messageGuardar";
	}
	
	
	public String guardarContrato() {
		//log.info("guardarContrato");
		try {		
			
			if (daoInvitados.actualizar(selectedAsistente)) {
				valid = Boolean.TRUE;
			} else {
				throw new IOException("Problema al actualizar arcvhio el evento");
			}
		} catch (Exception e) {
			valid = Boolean.FALSE;
			addActionError(e.getLocalizedMessage().toString());
			return "messageGuardar";
		}
		return "messageGuardar";
	}
	
	
	private void limpiar() {
		selectedAsistente = new TR_INVITADOS_ASISTENTE();
		listaAsisten = new ArrayList<>();
		tipoVista = null;
	}

	/**********************************************************************************************************/
	/***************************************************
	 * SET & GET
	 *********************************************/
	/**********************************************************************************************************/

	public TR_INVITADOS_ASISTENTE getSelectedAsistente() {
		return selectedAsistente;
	}

	public void setSelectedAsistente(TR_INVITADOS_ASISTENTE selectedAsistente) {
		this.selectedAsistente = selectedAsistente;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public List<TR_EVENTOS_EJECUCION> getListaEventos() {
		return listaEventos;
	}

	public void setListaEventos(List<TR_EVENTOS_EJECUCION> listaEventos) {
		this.listaEventos = listaEventos;
	}

	public List<TR_INVITADOS_ASISTENTE> getListaAsisten() {
		return listaAsisten;
	}

	public void setListaAsisten(List<TR_INVITADOS_ASISTENTE> listaAsisten) {
		this.listaAsisten = listaAsisten;
	}

	public TR_EVENTOS_EJECUCION getEventoEjecucionSelected() {
		return eventoEjecucionSelected;
	}

	public void setEventoEjecucionSelected(TR_EVENTOS_EJECUCION eventoEjecucionSelected) {
		this.eventoEjecucionSelected = eventoEjecucionSelected;
	}

	public Integer getIdEventoEjecuta() {
		return idEventoEjecuta;
	}

	public void setIdEventoEjecuta(Integer idEventoEjecuta) {
		this.idEventoEjecuta = idEventoEjecuta;
	}

	public Integer getTipoVista() {
		return tipoVista;
	}

	public void setTipoVista(Integer tipoVista) {
		this.tipoVista = tipoVista;
	}
	
	

}
