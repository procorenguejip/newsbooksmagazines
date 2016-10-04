package com.ekiosquemanager.core.business.system.service;

import java.util.List;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.system.model.MerchantConfig;
import com.ekiosquemanager.core.business.system.model.MerchantConfiguration;
import com.ekiosquemanager.core.business.system.model.MerchantConfigurationType;

public interface MerchantConfigurationService extends
		EkiosqueManagerEntityService<Long, MerchantConfiguration> {
	
	MerchantConfiguration getMerchantConfiguration(String key, MerchantStore store) throws ServiceException;
	
	public void saveOrUpdate(MerchantConfiguration entity) throws ServiceException;

	List<MerchantConfiguration> listByStore(MerchantStore store)
			throws ServiceException;

	List<MerchantConfiguration> listByType(MerchantConfigurationType type,
			MerchantStore store) throws ServiceException;

	MerchantConfig getMerchantConfig(MerchantStore store)
			throws ServiceException;

	void saveMerchantConfig(MerchantConfig config, MerchantStore store)
			throws ServiceException;

}
