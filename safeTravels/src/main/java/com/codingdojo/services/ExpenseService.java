package com.codingdojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.models.Expense;
import com.codingdojo.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
    // returns all the expense
    public List<Expense> allExpenses() {
        return expenseRepository.findAll();
    }
    // creates a expense
    public  Expense createExpense(Expense expense) {
        return expenseRepository.save(expense);
    }
    // retrieves a expense
    public Expense findExpense(Long id) {
        Optional<Expense> optionaExpense = expenseRepository.findById(id);
        if(optionaExpense.isPresent()) {
            return optionaExpense.get();
        } else {
            return null;
        }
    }
    
    // update
    public Expense updateExpense(Expense expense) {	
		return expenseRepository.save(expense);
	}
    
    
    // delete
    public void deleteExpense(Long id) {
    	expenseRepository.deleteById(id); 	
    }
	

}
