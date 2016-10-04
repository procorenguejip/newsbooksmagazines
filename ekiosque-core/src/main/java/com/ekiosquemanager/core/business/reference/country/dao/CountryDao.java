package com.ekiosquemanager.core.business.reference.country.dao;

import java.util.List;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.reference.country.model.Country;
import com.ekiosquemanager.core.business.reference.language.model.Language;

public interface CountryDao extends EkiosqueManagerEntityDao<Integer,Country> {

	public List<Country> listByLanguage(Language language);
}
