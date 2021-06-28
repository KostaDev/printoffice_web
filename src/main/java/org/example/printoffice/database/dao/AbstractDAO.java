package org.example.printoffice.database.dao;

import org.example.printoffice.database.HibernateSessionHolder;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.criteria.CriteriaQuery;
import java.util.ArrayList;
import java.util.List;

abstract public class AbstractDAO<T> {
	private final Class<T> entityClass;

	public AbstractDAO(final Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	public Integer create(final T entity) {
		Transaction transaction = null;
		Integer generatedId = null;
		try (Session session = getSession()) {
			transaction = session.beginTransaction();
			generatedId = (Integer) session.save(entity);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback(transaction);
		}
		return generatedId;
	}

	@SafeVarargs
	public final void createAll(T... entities) {
		Transaction transaction = null;
		try (Session session = getSession()) {
			transaction = session.beginTransaction();
			for (T entity : entities) session.save(entity);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback(transaction);
		}
	}

	public T update(final T entity) {
		Object updated = null;
		Transaction transaction = null;
		try (Session session = getSession()) {
			transaction = session.beginTransaction();
			updated = session.merge(entity);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback(transaction);
		}

		return this.entityClass.cast(updated);
	}


	public void remove(T entity) {
		Transaction transaction = null;
		try (Session session = getSession()) {
			transaction = session.beginTransaction();
			session.delete(entity);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			rollback(transaction);
		}
	}

	public void removeById(Object id) {
		remove(find(id));
	}

	public T find(Object id) {
		T entity = null;
		try (Session session = getSession()) {
			entity = session.find(entityClass, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}

	public List<T> findAll() {
		List<T> entityList = new ArrayList<>();
		try (Session session = getSession()) {
			CriteriaQuery<T> criteriaQuery = session.getCriteriaBuilder().createQuery(entityClass);
			criteriaQuery.select(criteriaQuery.from(entityClass));
			entityList.addAll(session.createQuery(criteriaQuery).getResultList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entityList;
	}

	protected Session getSession() {
		return HibernateSessionHolder.getSession();
	}

	protected void rollback(Transaction transaction) {
		if (transaction != null) transaction.rollback();
	}
}
