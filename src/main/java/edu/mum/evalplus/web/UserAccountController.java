package edu.mum.evalplus.web;


import edu.mum.evalplus.model.User;
import edu.mum.evalplus.service.IStudentService;
import edu.mum.evalplus.service.SecurityService;
import edu.mum.evalplus.service.UserService;
import edu.mum.evalplus.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class UserAccountController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private IStudentService studentService;

    @RequestMapping(value = "/generateAccount", method = RequestMethod.GET)
    public String addAccount(Model model, Principal principal) {
        model.addAttribute("students", studentService.findStudentWithNoAccount());
        return "generateStudentAccount";
    }

    @RequestMapping(value = "/generateStudentAccount/{id}", method = RequestMethod.GET)
    public String addAccount(@PathVariable("id") Integer studentId, Principal principal) {
        studentService.generateStudentAccount(studentId);
        return "redirect:/generateAccount";
    }

    @RequestMapping(value = "/manageAccount", method = RequestMethod.GET)
    public String manageAccount(Model model, Principal principal) {
        model.addAttribute("userForm", new User());

        return "manageAccount";
    }

    @RequestMapping(value = "/manageAccount", method = RequestMethod.POST)
    public String manageAccount(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model, Principal principal) {
        return "redirect:/welcome";
    }


}
