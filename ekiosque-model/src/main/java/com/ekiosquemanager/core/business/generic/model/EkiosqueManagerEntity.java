/**
 * 
 */
package com.ekiosquemanager.core.business.generic.model;

import java.io.Serializable;
import java.text.Collator;
import java.util.Locale;

import org.hibernate.Hibernate;

/**
 * @author xchit136
 *
 */
public abstract class EkiosqueManagerEntity<K extends Serializable & Comparable<K>, E extends EkiosqueManagerEntity<K, ?>> 
	implements Serializable, Comparable<E> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public static final Collator DEFAULT_STRING_COLLATOR = Collator.getInstance(Locale.FRENCH);
	
	static {
		DEFAULT_STRING_COLLATOR.setStrength(Collator.PRIMARY);
	}
	
	/**
	 * Retourne la valeur de l'identifiant unique.
	 * 
	 * @return id
	 */
	public abstract K getId();

	/**
	 * Definit la valeur de l'identifiant unique.
	 * 
	 * @param id id
	 */
	public abstract void setId(K id);
	
	/**
	 * Indique si l'objet a deja ete persiste ou non
	 * 
	 * @return vrai si l'objet n'a pas encore ete persiste
	 */
	public boolean isNew() {
		return getId() == null;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public boolean equals(Object object) {
		if (object == null) {
			return false;
		}
		if (object == this) {
			return true;
		}
		
		// l'objet peut etre proxyfie donc on utilise Hibernate.getClass() pour sortir la vraie classe
		if (Hibernate.getClass(object) != Hibernate.getClass(this)) {
			return false;
		}

		// NOSONAR : traite au-dessus mais wrapper Hibernate
		EkiosqueManagerEntity<K, E> entity = (EkiosqueManagerEntity<K, E>) object; 
		K id = getId();

		if (id == null) {
			return false;
		}

		return id.equals(entity.getId());
	}

	@Override
	public int hashCode() {
		int hash = 7;
		
		K id = getId();
		hash = 31 * hash + ((id == null) ? 0 : id.hashCode());

		return hash;
	}

	public int compareTo(E o) {
		if (this == o) {
			return 0;
		}
		return this.getId().compareTo(o.getId());
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("entity.");
		builder.append(Hibernate.getClass(this).getSimpleName());
		builder.append("<");
		builder.append(getId());
		builder.append("-");
		builder.append(super.toString());
		builder.append(">");
		
		return builder.toString();
	}

}
