package com.assignment.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.assignment.languages.models.Language;
import com.assignment.languages.repositories.LanguageRepository;

@Service
public class LanguageService {

	private final LanguageRepository langRepo;
	
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	public List<Language> allLanguages(){
		return langRepo.findAll();
	}
	
	public Language saveLanguage(Language lang) {
		return langRepo.save(lang);
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> optLang = langRepo.findById(id);
		if(optLang.isPresent()) {
			return optLang.get();
		} else {
			return null;
		}
	}
	
	public void deleteLanguage(Long id) {
		langRepo.deleteById(id);
	}
}
