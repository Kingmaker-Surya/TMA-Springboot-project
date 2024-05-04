package com.manager.task.application.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.manager.task.application.model.TaskManagerModel;

@Repository
public interface TaskRepository extends JpaRepository<TaskManagerModel, Long>{

}
