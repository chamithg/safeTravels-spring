package com.codingdojo.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.models.Expense;

import com.codingdojo.services.ExpenseService;



@Controller
public class ExpenseController {
	
		@Autowired
		ExpenseService expenseService;
		
		
		// testing route
	
		@RequestMapping("/")
		public String index() {
			return "index.jsp";
			
		}
	
		// display all expenses
	
	
		@GetMapping("/expenses")
	    public String newExpense(@ModelAttribute("expense") Expense expense,Model model) {
			List<Expense> expenses = expenseService.allExpenses();
	        model.addAttribute("expenses", expenses);
	        return "show.jsp";
	    }
	
		// add an expense
	
		@PostMapping("/expenses/add")
	    public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result,Model model) {
	        if (result.hasErrors()) {
	        	List<Expense> expenses = expenseService.allExpenses();
				model.addAttribute("expenses", expenses);
	            return "show.jsp";
	        } else {
	           
				expenseService.createExpense(expense);
	            return "redirect:/expenses";
	        }
	    }
	
	
		// edit an expense(render edit form)
	
	 	@RequestMapping("/expenses/edit/{id}")
	    public String edit(@PathVariable("id") Long id, Model model) {
	        Expense expense = expenseService.findExpense(id);
	        model.addAttribute("expense", expense);
	        return "edit.jsp";
	    }
	    
	 	// edit an expense (Update sql)
	 	
	    @RequestMapping(value="/expenses/update/{id}", method=RequestMethod.PUT)
	    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
	        if (result.hasErrors()) {
	            return "edit.jsp";
	        } else {
	        	expenseService.updateExpense(expense);
	            return "redirect:/expenses";
	        }
	    }
	    
	    // delete Expense
	    
	    @RequestMapping(value="/expenses/delete/{id}", method=RequestMethod.DELETE)
	    public String destroy(@PathVariable("id") Long id) {
	    	expenseService.deleteExpense(id);
	        return "redirect:/expenses";
	    }
	    
	    // display an expense
	    
	    @RequestMapping("/expenses/display/{id}")
	    public String display(@PathVariable("id") Long id, Model model) {
	        Expense expense = expenseService.findExpense(id);
	        model.addAttribute("expense", expense);
	        return "display.jsp";
	    }
	
	
}
