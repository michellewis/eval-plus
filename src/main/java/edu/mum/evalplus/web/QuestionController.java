package edu.mum.evalplus.web;

import edu.mum.evalplus.model.Question;
import edu.mum.evalplus.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;


@Controller
public class QuestionController {

    @Autowired
    private IQuestionService questionService;


    @RequestMapping(value = "/newQuestion", method = RequestMethod.GET)
    public String questionForm(Model model) {
        model.addAttribute("question", new Question());
        return "questionForm";
    }

    @RequestMapping(value = "/questionList", method = RequestMethod.GET)
    public String questionList(Model model) {
        model.addAttribute("questions", questionService.findAll());
        return "questionList";
    }

    @RequestMapping(value = "/newQuestion", method = RequestMethod.POST)
    public String createQuestion(@ModelAttribute("question") @Valid Question question) {
        questionService.save(question);
        return "redirect:/questionList";
    }

    @RequestMapping(value = "/removeQuestion/{id}", method = RequestMethod.GET)
    public String removeQuestion(@PathVariable("id") Integer id) {
        Question question = questionService.find(id);
        question.setEnabled(false);
        questionService.save(question);
        return "redirect:/questionList";
    }

    @RequestMapping(value = "/updateQuestion/{id}", method = RequestMethod.GET)
    public String updateQuestion(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("question", questionService.find(id));
        return "updateQuestion";
    }

    @RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
    public String updated(@ModelAttribute("question") @Valid Question question) {
        questionService.save(question);
        return "redirect:/questionList";
    }
}