package mx.com.afasa.daoImpl;

import java.util.List;
import mx.com.afasa.dao.CT_EVENTOSDao;
import mx.com.afasa.entities.CT_EVENTOS;
import mx.com.afasa.utilities.HibernateUtil;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;



@Repository("cT_EVENTOSDao")
public class CT_EVENTOSDaoImpl implements CT_EVENTOSDao {

	//private final Logger log = Logger.getLogger(this.getClass());

	@Override
	public boolean guardar(CT_EVENTOS evento) {
		Session session = HibernateUtil.getSessionFactory() .openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.saveOrUpdate(evento);
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
	public List<CT_EVENTOS> buscarTodos() {
		//log.debug("Entro en buscar");
		List<CT_EVENTOS> eventos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Criteria criteria = session.createCriteria(CT_EVENTOS.class)
					.setProjection(Projections.projectionList().add(Projections.property("PK_EVENTO"), "PK_EVENTO")
							.add(Projections.property("NOMBRE"), "NOMBRE").add(Projections.property("MARCA"), "MARCA"))
					.setResultTransformer(Transformers.aliasToBean(CT_EVENTOS.class));

			eventos = (List<CT_EVENTOS>) criteria.list();

			for (CT_EVENTOS tmp : eventos) {

				tmp.setStrMarca(defineMarca(tmp));

			}
			//log.debug("lista de eventos" + eventos.size());

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

	public static String defineMarca(CT_EVENTOS e) {

		if (e != null & e.getMARCA() != null) {
			if (e.getMARCA() == 1) {
				return "VW";
			} else if (e.getMARCA() == 2) {
				return "SEAT";
			} else if (e.getMARCA() == 3) {
				return "AUDI";
			}
		}
		return "";
	}

	@SuppressWarnings("unchecked")
	@Override
	public CT_EVENTOS obiteneEvento(int PK_EVENTO) {
		//////////////log.info("Entro en buscar");
		CT_EVENTOS evento = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Criteria criteria = session.createCriteria(CT_EVENTOS.class);
			criteria.add(Restrictions.eq("PK_EVENTO", PK_EVENTO));
			evento = (CT_EVENTOS) criteria.setMaxResults(1)
					.uniqueResult();

			if(evento != null) {
			evento.setStrMarca(defineMarca(evento));
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			
		} catch (Exception e) {
			e.printStackTrace();
		
		} finally {
			if (session != null)
				session.close();
		}
		return evento;
	}

}
