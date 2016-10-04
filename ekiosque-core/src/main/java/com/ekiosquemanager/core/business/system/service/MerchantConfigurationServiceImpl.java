package com.ekiosquemanager.core.business.system.service;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityServiceImpl;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.system.dao.MerchantConfigurationDao;
import com.ekiosquemanager.core.business.system.model.MerchantConfig;
import com.ekiosquemanager.core.business.system.model.MerchantConfiguration;
import com.ekiosquemanager.core.business.system.model.MerchantConfigurationType;
import com.ekiosquemanager.core.constants.Constants;


@Service("merchantConfigurationService")
public class MerchantConfigurationServiceImpl extends
		EkiosqueManagerEntityServiceImpl<Long, MerchantConfiguration> implements
		MerchantConfigurationService {

	private MerchantConfigurationDao merchantConfigurationDao;
	
	@Autowired
	public MerchantConfigurationServiceImpl(
			MerchantConfigurationDao merchantConfigurationDao) {
			super(merchantConfigurationDao);
			this.merchantConfigurationDao = merchantConfigurationDao;
	}
	

	@Override
	public MerchantConfiguration getMerchantConfiguration(String key, MerchantStore store) throws ServiceException {
		return merchantConfigurationDao.getMerchantConfiguration(key, store);
	}
	
	@Override
	public List<MerchantConfiguration> listByStore(MerchantStore store) throws ServiceException {
		return merchantConfigurationDao.getMerchantConfigurations(store);
	}
	
	@Override
	public List<MerchantConfiguration> listByType(MerchantConfigurationType type, MerchantStore store) throws ServiceException {
		return merchantConfigurationDao.listByType(type, store);
	}
	
	@Override
	public void saveOrUpdate(MerchantConfiguration entity) throws ServiceException {
		

		
		if(entity.getId()!=null && entity.getId()>0) {
			super.update(entity);
		} else {
			super.create(entity);

		}
	}
	
	
	@Override
	public void delete(MerchantConfiguration merchantConfiguration) throws ServiceException {
		MerchantConfiguration config = merchantConfigurationDao.getById(merchantConfiguration.getId());
		if(config!=null) {
			super.delete(config);
		}
	}
	
	@Override
	public MerchantConfig getMerchantConfig(MerchantStore store) throws ServiceException {

		MerchantConfiguration configuration = merchantConfigurationDao.getMerchantConfiguration(Constants.MERCHANT_CONFIG, store);
		
		MerchantConfig config = null;
		if(configuration!=null) {
			String value = configuration.getValue();
			
			ObjectMapper mapper = new ObjectMapper();
			try {
				config = mapper.readValue(value, MerchantConfig.class);
			} catch(Exception e) {
				throw new ServiceException("Cannot parse json string " + value);
			}
		}
		return config;
		
	}
	
	@Override
	public void saveMerchantConfig(MerchantConfig config, MerchantStore store) throws ServiceException {
		
		MerchantConfiguration configuration = merchantConfigurationDao.getMerchantConfiguration(Constants.MERCHANT_CONFIG, store);

		if(configuration==null) {
			configuration = new MerchantConfiguration();
			configuration.setMerchantStore(store);
			configuration.setKey(Constants.MERCHANT_CONFIG);
		}
		
		String value = config.toJSONString();
		configuration.setValue(value);
		if(configuration.getId()!=null && configuration.getId()>0) {
			super.update(configuration);
		} else {
			super.create(configuration);

		}
		
	}
	


}
