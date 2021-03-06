package mx.com.afasa.entities;
// Generated 31-mar-2019 21:37:53 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TrEventosEjecucion generated by hbm2java
 */
public class TR_EVENTOS_EJECUCION  implements java.io.Serializable {


     private Integer PK_EVENTO_EJECUCION;
     private CT_EVENTOS FK_EVENTO;
     private String UBICACION;
     private String DIRECCION;
     private Date FECHA_INICIO;
     private Date FECHA_FIN;
     private String FECHAS_HORAS;
     private Set trInvitadosAsistentes = new HashSet(0);

    public TR_EVENTOS_EJECUCION() {
    }

    public TR_EVENTOS_EJECUCION(Integer PK_EVENTO_EJECUCION) {
        this.PK_EVENTO_EJECUCION = PK_EVENTO_EJECUCION;
    }
    

    public TR_EVENTOS_EJECUCION(Integer PK_EVENTO_EJECUCION, CT_EVENTOS FK_EVENTO) {
        this.PK_EVENTO_EJECUCION = PK_EVENTO_EJECUCION;
        this.FK_EVENTO = FK_EVENTO;
    }
     
     

    public Integer getPK_EVENTO_EJECUCION() {
        return PK_EVENTO_EJECUCION;
    }

    public void setPK_EVENTO_EJECUCION(Integer PK_EVENTO_EJECUCION) {
        this.PK_EVENTO_EJECUCION = PK_EVENTO_EJECUCION;
    }

    public CT_EVENTOS getFK_EVENTO() {
        return FK_EVENTO;
    }

    public void setFK_EVENTO(CT_EVENTOS FK_EVENTO) {
        this.FK_EVENTO = FK_EVENTO;
    }

    public String getUBICACION() {
        return UBICACION;
    }

    public void setUBICACION(String UBICACION) {
        this.UBICACION = UBICACION;
    }

    public String getDIRECCION() {
        return DIRECCION;
    }

    public void setDIRECCION(String DIRECCION) {
        this.DIRECCION = DIRECCION;
    }

    public Date getFECHA_INICIO() {
        return FECHA_INICIO;
    }

    public void setFECHA_INICIO(Date FECHA_INICIO) {
        this.FECHA_INICIO = FECHA_INICIO;
    }

    public Date getFECHA_FIN() {
        return FECHA_FIN;
    }

    public void setFECHA_FIN(Date FECHA_FIN) {
        this.FECHA_FIN = FECHA_FIN;
    }

    public String getFECHAS_HORAS() {
        return FECHAS_HORAS;
    }

    public void setFECHAS_HORAS(String FECHAS_HORAS) {
        this.FECHAS_HORAS = FECHAS_HORAS;
    }

    public Set getTrInvitadosAsistentes() {
        return trInvitadosAsistentes;
    }

    public void setTrInvitadosAsistentes(Set trInvitadosAsistentes) {
        this.trInvitadosAsistentes = trInvitadosAsistentes;
    }

   
}


