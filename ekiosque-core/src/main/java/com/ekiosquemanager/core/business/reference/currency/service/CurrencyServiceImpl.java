package com.ekiosquemanager.core.business.reference.currency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityServiceImpl;
import com.ekiosquemanager.core.business.reference.currency.dao.CurrencyDao;
import com.ekiosquemanager.core.business.reference.currency.model.Currency;
import com.ekiosquemanager.core.business.reference.currency.model.Currency_;

@Service("currencyService")
public class CurrencyServiceImpl extends EkiosqueManagerEntityServiceImpl<Long, Currency>
	implements CurrencyService {
	
	@Autowired
	public CurrencyServiceImpl(CurrencyDao currencyDao) {
		super(currencyDao);
	}
	
	@Override
	public Currency getByCode(String code) {
		return getByField(Currency_.code, code);
	}

}
