package com.ekiosquemanager.core.business.merchant.dao;

import java.util.Collection;

//import com.ekiosquemanager.core.business.catalog.product.model.Product;
import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;

public interface MerchantStoreDao extends EkiosqueManagerEntityDao<Integer, MerchantStore> {
	
//	public Collection<Product> getProducts(MerchantStore merchantStore) throws ServiceException;
	
	public MerchantStore getMerchantStore(Integer merchantStoreId);

	public MerchantStore getMerchantStore(String code) throws ServiceException;
}
