package edu.mum.evalplus.repository;


import edu.mum.evalplus.model.Survey;
import edu.mum.evalplus.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SurveyRepository extends JpaRepository<Survey, Integer> {

}
