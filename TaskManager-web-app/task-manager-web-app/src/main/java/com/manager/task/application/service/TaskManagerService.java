package com.manager.task.application.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manager.task.application.model.TaskManagerModel;
import com.manager.task.application.repo.TaskRepository;

@Service
public class TaskManagerService {
	
	@Autowired
	TaskRepository repo;

	public List<TaskManagerModel> getAllToDoItems() {
		ArrayList<TaskManagerModel> todoList = new ArrayList<>();
		repo.findAll().forEach(todo -> todoList.add(todo));
		
		return todoList;
	}
	
	public TaskManagerModel getToDoItemById(Long id) {
		return repo.findById(id).get();
	}
	
	public boolean updateStatus(Long id) {
		TaskManagerModel todo = getToDoItemById(id);
		todo.setStatus("Completed");
		
		return saveOrUpdateToDoItem(todo);
	}
	
	public boolean saveOrUpdateToDoItem(TaskManagerModel todo) {
		TaskManagerModel updatedObj = repo.save(todo);
		
		if (getToDoItemById(updatedObj.getId()) != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean deleteToDoItem(Long id) {
		repo.deleteById(id);
		
		if (repo.findById(id).isEmpty()) {
			return true;
		}
		
		return false;
	}
	
}
