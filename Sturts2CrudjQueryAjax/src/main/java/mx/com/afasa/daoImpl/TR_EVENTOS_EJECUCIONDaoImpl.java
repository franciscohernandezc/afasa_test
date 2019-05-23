package mx.com.afasa.daoImpl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import mx.com.afasa.dao.TR_EVENTOS_EJECUCIONDao;
import mx.com.afasa.entities.TR_EVENTOS_EJECUCION;
import mx.com.afasa.utilities.HibernateUtil;

@Repository("tR_EVENTOS_EJECUCIONDao")
public class TR_EVENTOS_EJECUCIONDaoImpl implements TR_EVENTOS_EJECUCIONDao {

	//private final Logger log = Logger.getLogger(this.getClass());

	@Override
	public boolean guardar(TR_EVENTOS_EJECUCION ejecucion) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.saveOrUpdate(ejecucion);
			transaction.commit();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			transaction.rollback();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		} finally {
			if (session != null)
				session.close();
		}
		return false;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<TR_EVENTOS_EJECUCION> buscar(TR_EVENTOS_EJECUCION ejecucion) {
		//log.info("Entro en buscar");
		List<TR_EVENTOS_EJECUCION> eventos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Criteria criteria = session.createCriteria(TR_EVENTOS_EJECUCION.class);
			if (ejecucion.getUBICACION() != null) {
				//log.info("getUBICACION");
				criteria.add(Restrictions.like("UBICACION", ejecucion.getUBICACION(), MatchMode.ANYWHERE));
			}
			if (ejecucion.getDIRECCION() != null) {
				//log.info("getDIRECCION");
				criteria.add(Restrictions.like("DIRECCION", ejecucion.getDIRECCION(), MatchMode.ANYWHERE));
			}
			if (ejecucion.getFECHA_INICIO() != null) {
				//log.info("getFECHA_INICIO");
				criteria.add(Restrictions.ge("FECHA_INICIO", ejecucion.getFECHA_INICIO()));
			}
			if (ejecucion.getFECHA_FIN() != null) {
				//log.info("getFECHA_FIN");
				criteria.add(Restrictions.le("FECHA_FIN", ejecucion.getFECHA_FIN()));
			}
			eventos = criteria.addOrder(Order.desc("FECHA_INICIO")).list();
			for (TR_EVENTOS_EJECUCION tmp : eventos) {
				tmp.getFK_EVENTO().setStrMarca(CT_EVENTOSDaoImpl.defineMarca(tmp.getFK_EVENTO()));
			}
			//log.info("lista de TR_EVENTOS_EJECUCION" + eventos.size());
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return eventos;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public TR_EVENTOS_EJECUCION obiteneEvento(int idEventoEjecuta) {
		//log.info("Entro en buscar");
		TR_EVENTOS_EJECUCION eventoEjecucion = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Criteria criteria = session.createCriteria(TR_EVENTOS_EJECUCION.class);
			criteria.add(Restrictions.eq("PK_EVENTO_EJECUCION", idEventoEjecuta));
			eventoEjecucion = (TR_EVENTOS_EJECUCION) criteria.setMaxResults(1)
					.uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return eventoEjecucion;
	}
	
	
	
}
