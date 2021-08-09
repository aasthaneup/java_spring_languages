package com.assignment.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.assignment.languages.models.Language;
import com.assignment.languages.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService langServ;
	public LanguageController(LanguageService langServ) {
		this.langServ = langServ;
	}
//	to home page
	@RequestMapping("/languages")
	public String main(Model model) {
		List<Language> languages = langServ.allLanguages();
		model.addAttribute("getLanguages", languages);
		model.addAttribute("language", new Language());
		return "index.jsp";
	}
//	add a language
	@RequestMapping(value="/languages", method=RequestMethod.POST)
	public String createLanguage(@Valid @ModelAttribute("language") Language lang, BindingResult result, Model model) {
		List<Language> languages = langServ.allLanguages();
		model.addAttribute("getLanguages", languages);
		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			langServ.saveLanguage(lang);
			return "redirect:/languages";
		}
	}
//	edit page
	@RequestMapping("languages/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("language", langServ.findLanguage(id));
		return "edit.jsp";
	}
//	update a language
	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	public String updateLanguage(@Valid @ModelAttribute("language") Language lang, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		} else {
			langServ.saveLanguage(lang);
			return "redirect:/languages";
		}
	}
//	view details of a language
	@RequestMapping("/languages/{id}")
	public String viewLanguages(@PathVariable("id") Long id, Model model) {
		model.addAttribute("language", langServ.findLanguage(id));
		return "view.jsp";
	}
//	delete a language
	@RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	public String deleteLanguage(@PathVariable("id") Long id) {
		langServ.deleteLanguage(id);
		return "redirect:/languages";
	}
}
