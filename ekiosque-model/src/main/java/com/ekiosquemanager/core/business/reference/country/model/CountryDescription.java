package com.ekiosquemanager.core.business.reference.country.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.ekiosquemanager.core.business.common.model.Description;
import com.ekiosquemanager.core.business.reference.language.model.Language;
import com.ekiosquemanager.core.constants.SchemaConstant;

@Entity
@Table(name = "COUNTRY_DESCRIPTION", schema=SchemaConstant.EKIOSQUEMANAGER_SCHEMA, uniqueConstraints={
	@UniqueConstraint(columnNames={
			"COUNTRY_ID",
			"LANGUAGE_ID"
		})
	}
)
public class CountryDescription extends Description {
	private static final long serialVersionUID = 9048940117896071174L;
	
	@ManyToOne(targetEntity = Country.class)
	@JoinColumn(name = "COUNTRY_ID", nullable = false)
	private Country country;
	
	public CountryDescription() {
	}
	
	public CountryDescription(Language language, String name) {
		this.setLanguage(language);
		this.setName(name);
	}
	
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}
	
}
