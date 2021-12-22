package com.greatlearning.Crm.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.Crm.Controller.Services.CustomerService;
import com.greatlearning.Crm.Entity.Customer;

@Controller
//add mapping for "/students"
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerservice;

	// add mapping for "/list"
	@RequestMapping("/list")
	public String listcustomers(Model model) {
		// get Students from db
		List<Customer> customers = customerservice.findAll();
		// add to the spring model
		model.addAttribute("Customer", customers);
		return "list-customer";
	}

	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		// create model attribute to bind form data
		Customer customer = new Customer();
		model.addAttribute("Customer", customer);
		return "customer-form";

	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int id, Model model) {
		// get the student from the service
		Customer customer = new Customer();
		// set student as a model attribute to pre-populate the form
		customer = customerservice.findById(id);
		model.addAttribute("Customer", customer);

		return "customer-form";

	}

	@PostMapping("/save")
	public String savecustomer(@RequestParam("id") int id, @RequestParam("firstName") String Firstname,
			@RequestParam("lastName") String Lastname, @RequestParam("email") String Email) {
		System.out.print(id);
		Customer customer;
		if (id != 0) {
			customer = customerservice.findById(id);
			customer.setFirstName(Firstname);
			customer.setLastName(Lastname);
			customer.setEmail(Email);
		} else
			customer = new Customer(Firstname, Lastname, Email);
		// save the Student
		customerservice.save(customer);
		// use a redirect to prevent duplicate submissions

		return "redirect:/customer/list";

	}

	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int id) {
		// delete the Book
		customerservice.deleteById(id);
		// redirect to /Books/list
		return "redirect:/customer/list";

	}

}
