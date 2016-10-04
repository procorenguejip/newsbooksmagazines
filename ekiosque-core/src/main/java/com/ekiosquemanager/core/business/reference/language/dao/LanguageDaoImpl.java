package com.ekiosquemanager.core.business.reference.language.dao;

import org.springframework.stereotype.Repository;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDaoImpl;
import com.ekiosquemanager.core.business.reference.language.model.Language;

@Repository("languageDao")
public class LanguageDaoImpl extends EkiosqueManagerEntityDaoImpl<Integer, Language> implements LanguageDao {
}
