package com.ekiosquemanager.core.business.reference.language.service;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.reference.language.model.Language;

public interface LanguageService extends EkiosqueManagerEntityService<Integer, Language> {

	Language getByCode(String code) throws ServiceException;

	Map<String, Language> getLanguagesMap() throws ServiceException;

	List<Language> getLanguages() throws ServiceException;

	Locale toLocale(Language language);

	Language toLanguage(Locale locale);
}
