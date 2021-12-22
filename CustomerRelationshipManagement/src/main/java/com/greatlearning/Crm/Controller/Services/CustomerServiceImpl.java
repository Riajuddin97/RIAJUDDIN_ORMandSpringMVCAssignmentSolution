package com.greatlearning.Crm.Controller.Services;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.greatlearning.Crm.Entity.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService {

	private SessionFactory sessionfactory;
	// create session
	private Session session;

	public CustomerServiceImpl(SessionFactory sessionfactory) {
		super();
		this.sessionfactory = sessionfactory;
		try {
			session = sessionfactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionfactory.openSession();

		}
	}

	@Override
	public List<Customer> findAll() {
		// TODO Auto-generated method stub
		Transaction transaction = session.beginTransaction();
		// find all the records from the database table
		List<Customer> customers = session.createQuery("from Customer").list();
		transaction.commit();

		return customers;

	}

	@Override
	public Customer findById(int theid) {
		// TODO Auto-generated method stub
		Transaction transaction = session.beginTransaction();
		// find record with Id from the database table
		Customer customer = session.get(Customer.class, theid);
		transaction.commit();
		return customer;
	}

	@Override
	public void save(Customer customer) {
		// TODO Auto-generated method stub
		Transaction transaction = session.beginTransaction();
		// save transaction
		session.saveOrUpdate(customer);
		transaction.commit();

	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		Transaction transaction = session.beginTransaction();
		// get transaction
		Customer customer = session.get(Customer.class, id);
		// delete record
		session.delete(customer);
		transaction.commit();

	}

}
