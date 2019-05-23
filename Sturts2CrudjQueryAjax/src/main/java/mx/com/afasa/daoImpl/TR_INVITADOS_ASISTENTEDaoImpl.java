package mx.com.afasa.daoImpl;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import mx.com.afasa.dao.TR_INVITADOS_ASISTENTEDao;
import mx.com.afasa.entities.TR_EVENTOS_EJECUCION;
import mx.com.afasa.entities.TR_INVITADOS_ASISTENTE;
import mx.com.afasa.utilities.HibernateUtil;


@Repository("tR_INVITADOS_ASISTENTEDao")
public class TR_INVITADOS_ASISTENTEDaoImpl implements TR_INVITADOS_ASISTENTEDao {
	//private final Logger log = Logger.getLogger(this.getClass());

	@Override
	public boolean guardar(TR_INVITADOS_ASISTENTE invitadoAsistente) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(invitadoAsistente);
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

	@Override
	public boolean actualizar(TR_INVITADOS_ASISTENTE invitadoAsistente) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(invitadoAsistente);
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
	public List<TR_INVITADOS_ASISTENTE> buscar(TR_INVITADOS_ASISTENTE inv, int tipoBusqueda) {

		//log.info("Entro en buscar");
		List<TR_INVITADOS_ASISTENTE> asistente = new ArrayList<>();
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			//log.info("get evento");

			Criteria criteria = session.createCriteria(TR_INVITADOS_ASISTENTE.class);

			if (inv.getFK_EVENTO_EJECUCION() != null && inv.getFK_EVENTO_EJECUCION().getPK_EVENTO_EJECUCION() != null
					&& inv.getFK_EVENTO_EJECUCION().getPK_EVENTO_EJECUCION() != null) {
				criteria.add(Restrictions.eq("FK_EVENTO_EJECUCION.PK_EVENTO_EJECUCION",
						inv.getFK_EVENTO_EJECUCION().getPK_EVENTO_EJECUCION()));
			}

			if (tipoBusqueda == 1) {
				criteria.add(Restrictions.eq("BAN_ASISTENTE", Boolean.FALSE));
			} else if (tipoBusqueda == 2) {

				criteria.add(Restrictions.or(Restrictions.eq("BAN_ASISTENTE", Boolean.TRUE),
						Restrictions.eq("BAN_ASISTENTE", Boolean.FALSE)));
			}

			if (tipoBusqueda == 3) {
				criteria.add(Restrictions.eq("BAN_ASISTENTE", Boolean.TRUE));
			}

			asistente = criteria.addOrder(Order.asc("NOMBRE")).list();

			//log.info("lista de TR_INVITADOS_ASISTENTE" + asistente.size());

		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return asistente;
	}

	@SuppressWarnings("unchecked")
	@Override
	public TR_INVITADOS_ASISTENTE botenerAsistente(int PK_INVITADOS_ASISTENTE) {
		//log.info("Entro en buscar");
		TR_INVITADOS_ASISTENTE asistente = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Criteria criteria = session.createCriteria(TR_EVENTOS_EJECUCION.class);
			criteria.add(Restrictions.eq("PK_INVITADOS_ASISTENTE", PK_INVITADOS_ASISTENTE));
			asistente = (TR_INVITADOS_ASISTENTE) criteria.setMaxResults(1).uniqueResult();

		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return asistente;
	}

}
