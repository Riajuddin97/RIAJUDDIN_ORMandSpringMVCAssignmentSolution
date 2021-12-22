package com.greatlearning.Crm.Controller.Services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.greatlearning.Crm.Entity.Customer;

@Service
public interface CustomerService {

	public List<Customer> findAll();

	public Customer findById(int Id);

	public void save(Customer customer);

	public void deleteById(int theid);

}
