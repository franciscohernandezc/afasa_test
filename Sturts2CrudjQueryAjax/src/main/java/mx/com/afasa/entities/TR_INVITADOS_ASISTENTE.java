package mx.com.afasa.entities;
// Generated 31-mar-2019 21:37:53 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * TrInvitadosAsistente generated by hbm2java
 */
public class TR_INVITADOS_ASISTENTE  implements java.io.Serializable {


     private Integer PK_INVITADOS_ASISTENTE;
     private TR_EVENTOS_EJECUCION FK_EVENTO_EJECUCION;
     private boolean BAN_ASISTENTE;
     private String NOMBRE;
     private String APP_PATERNO;
     private String APP_MATERNO;
     private String TELEFONO;
     private String CORREO_ELECTRONICO;
     private BigDecimal MEDIO;
     private String OTRO_MEDIO;
     private String AUTO_INTERES;
     private boolean DISPONIBILIDAD;
     private Date FECHA_INVITACION;
     private Date FECHA_ASISTENCIA;
     private String NO_CONTRATOs;

    public TR_INVITADOS_ASISTENTE() {
    }

    public TR_INVITADOS_ASISTENTE(Integer PK_INVITADOS_ASISTENTE) {
        this.PK_INVITADOS_ASISTENTE = PK_INVITADOS_ASISTENTE;
    }
    
    

    public TR_INVITADOS_ASISTENTE(Integer PK_INVITADOS_ASISTENTE, TR_EVENTOS_EJECUCION FK_EVENTO_EJECUCION) {
        this.PK_INVITADOS_ASISTENTE = PK_INVITADOS_ASISTENTE;
        this.FK_EVENTO_EJECUCION = FK_EVENTO_EJECUCION;
    }
     
     
     

    public Integer getPK_INVITADOS_ASISTENTE() {
        return PK_INVITADOS_ASISTENTE;
    }

    public void setPK_INVITADOS_ASISTENTE(Integer PK_INVITADOS_ASISTENTE) {
        this.PK_INVITADOS_ASISTENTE = PK_INVITADOS_ASISTENTE;
    }

    public TR_EVENTOS_EJECUCION getFK_EVENTO_EJECUCION() {
        return FK_EVENTO_EJECUCION;
    }

    public void setFK_EVENTO_EJECUCION(TR_EVENTOS_EJECUCION FK_EVENTO_EJECUCION) {
        this.FK_EVENTO_EJECUCION = FK_EVENTO_EJECUCION;
    }

    public boolean isBAN_ASISTENTE() {
        return BAN_ASISTENTE;
    }

    public void setBAN_ASISTENTE(boolean BAN_ASISTENTE) {
        this.BAN_ASISTENTE = BAN_ASISTENTE;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getAPP_PATERNO() {
        return APP_PATERNO;
    }

    public void setAPP_PATERNO(String APP_PATERNO) {
        this.APP_PATERNO = APP_PATERNO;
    }

    public String getAPP_MATERNO() {
        return APP_MATERNO;
    }

    public void setAPP_MATERNO(String APP_MATERNO) {
        this.APP_MATERNO = APP_MATERNO;
    }

    public String getTELEFONO() {
        return TELEFONO;
    }

    public void setTELEFONO(String TELEFONO) {
        this.TELEFONO = TELEFONO;
    }

    public String getCORREO_ELECTRONICO() {
        return CORREO_ELECTRONICO;
    }

    public void setCORREO_ELECTRONICO(String CORREO_ELECTRONICO) {
        this.CORREO_ELECTRONICO = CORREO_ELECTRONICO;
    }

    public BigDecimal getMEDIO() {
        return MEDIO;
    }

    public void setMEDIO(BigDecimal MEDIO) {
        this.MEDIO = MEDIO;
    }

    public String getOTRO_MEDIO() {
        return OTRO_MEDIO;
    }

    public void setOTRO_MEDIO(String OTRO_MEDIO) {
        this.OTRO_MEDIO = OTRO_MEDIO;
    }

    public String getAUTO_INTERES() {
        return AUTO_INTERES;
    }

    public void setAUTO_INTERES(String AUTO_INTERES) {
        this.AUTO_INTERES = AUTO_INTERES;
    }

    public boolean isDISPONIBILIDAD() {
        return DISPONIBILIDAD;
    }

    public void setDISPONIBILIDAD(boolean DISPONIBILIDAD) {
        this.DISPONIBILIDAD = DISPONIBILIDAD;
    }

    public Date getFECHA_INVITACION() {
        return FECHA_INVITACION;
    }

    public void setFECHA_INVITACION(Date FECHA_INVITACION) {
        this.FECHA_INVITACION = FECHA_INVITACION;
    }

    public Date getFECHA_ASISTENCIA() {
        return FECHA_ASISTENCIA;
    }

    public void setFECHA_ASISTENCIA(Date FECHA_ASISTENCIA) {
        this.FECHA_ASISTENCIA = FECHA_ASISTENCIA;
    }

    public String getNO_CONTRATOs() {
        return NO_CONTRATOs;
    }

    public void setNO_CONTRATOs(String NO_CONTRATOs) {
        this.NO_CONTRATOs = NO_CONTRATOs;
    }

  

}


