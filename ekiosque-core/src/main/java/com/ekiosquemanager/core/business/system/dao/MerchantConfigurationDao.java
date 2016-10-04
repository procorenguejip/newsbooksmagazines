package com.ekiosquemanager.core.business.system.dao;

import java.util.List;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.system.model.MerchantConfiguration;
import com.ekiosquemanager.core.business.system.model.MerchantConfigurationType;

public interface MerchantConfigurationDao extends EkiosqueManagerEntityDao<Long, MerchantConfiguration> {

	
	
	MerchantConfiguration getMerchantConfiguration(String key, MerchantStore store);

	List<MerchantConfiguration> getMerchantConfigurations(MerchantStore store);

	List<MerchantConfiguration> listByType(MerchantConfigurationType type,
			MerchantStore store);
	
}
