package com.ekiosquemanager.core.business.merchant.service;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;

public interface MerchantStoreService extends EkiosqueManagerEntityService<Integer, MerchantStore>{
	

	//Collection<Product> getProducts(MerchantStore merchantStore) throws ServiceException;
	
	//MerchantStore getMerchantStore(Integer merchantStoreId) throws ServiceException;

	MerchantStore getMerchantStore(String merchantStoreCode)
			throws ServiceException;
	
	MerchantStore getByCode(String code) throws ServiceException ;

	void saveOrUpdate(MerchantStore store) throws ServiceException;
}
