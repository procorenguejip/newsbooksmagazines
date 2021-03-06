package com.ekiosquemanager.core.business.reference.zone.service;

import java.util.List;
import java.util.Map;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.reference.country.model.Country;
import com.ekiosquemanager.core.business.reference.language.model.Language;
import com.ekiosquemanager.core.business.reference.zone.model.Zone;
import com.ekiosquemanager.core.business.reference.zone.model.ZoneDescription;

public interface ZoneService extends EkiosqueManagerEntityService<Long, Zone> {
	
	Zone getByCode(String code);

	void addDescription(Zone zone, ZoneDescription description) throws ServiceException;

	List<Zone> getZones(Country country, Language language)
			throws ServiceException;

	Map<String, Zone> getZones(Language language) throws ServiceException;


}
