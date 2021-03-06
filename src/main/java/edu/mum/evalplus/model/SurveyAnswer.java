package edu.mum.evalplus.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="survey_answers")
public class SurveyAnswer implements Serializable {
    @Id
    @GeneratedValue
    private Integer id;
    private String answer;
    @OneToOne
    @JoinColumn(name = "question_id")
    private Question question;
    @ManyToOne
    @JoinColumn(name = "survey_id")
    private Survey survey;
    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    public SurveyAnswer() {
        this.question = new Question();
        this.survey = new Survey();
        this.student = new Student();
    }

    public SurveyAnswer(String answer, Question question, Survey survey, Student student) {
        this.answer = answer;
        this.question = question;
        this.survey = survey;
        this.student = student;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }


}
