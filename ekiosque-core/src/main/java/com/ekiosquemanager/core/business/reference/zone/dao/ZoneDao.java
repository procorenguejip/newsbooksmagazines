package com.ekiosquemanager.core.business.reference.zone.dao;

import java.util.List;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.reference.country.model.Country;
import com.ekiosquemanager.core.business.reference.language.model.Language;
import com.ekiosquemanager.core.business.reference.zone.model.Zone;


public interface ZoneDao extends EkiosqueManagerEntityDao<Long,Zone> {

	List<Zone> listByLanguageAndCountry(Country country, Language language);

	List<Zone> listByLanguage(Language language);

}
