package com.ekiosquemanager.core.business.reference.country.service;

import java.util.List;
import java.util.Map;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.reference.country.model.Country;
import com.ekiosquemanager.core.business.reference.country.model.CountryDescription;
import com.ekiosquemanager.core.business.reference.language.model.Language;

public interface CountryService extends EkiosqueManagerEntityService<Integer, Country> {

	public Country getByCode(String code) throws ServiceException;
	
	public void addCountryDescription(Country country, CountryDescription description) throws ServiceException;

	public List<Country> getCountries(Language language) throws ServiceException;

	Map<String, Country> getCountriesMap(Language language)
			throws ServiceException;

	List<Country> getCountries(List<String> isoCodes, Language language)
			throws ServiceException;
}
