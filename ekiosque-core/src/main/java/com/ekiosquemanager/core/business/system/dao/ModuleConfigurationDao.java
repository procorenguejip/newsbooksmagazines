package com.ekiosquemanager.core.business.system.dao;

import java.util.List;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.system.model.IntegrationModule;

public interface ModuleConfigurationDao extends EkiosqueManagerEntityDao<Long, IntegrationModule> {

	List<IntegrationModule> getModulesConfiguration(String module);

	IntegrationModule getByCode(String moduleCode);

}
