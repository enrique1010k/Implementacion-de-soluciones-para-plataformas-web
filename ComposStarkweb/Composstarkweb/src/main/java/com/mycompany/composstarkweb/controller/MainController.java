package com.mycompany.composstarkweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

   @RequestMapping(value = "/testi18n")
   public String login1(Model model) {
       return "testi18n";
   }
 
}
