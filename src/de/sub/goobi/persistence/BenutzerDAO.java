/*
 * This file is part of the Goobi Application - a Workflow tool for the support of
 * mass digitization.
 *
 * Visit the websites for more information.
 *     - http://gdz.sub.uni-goettingen.de
 *     - http://www.goobi.org
 *     - http://launchpad.net/goobi-production
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details. You
 * should have received a copy of the GNU General Public License along with this
 * program; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
 * Suite 330, Boston, MA 02111-1307 USA
 */

package de.sub.goobi.persistence;

import java.util.List;

import de.sub.goobi.beans.Benutzer;
import de.sub.goobi.helper.exceptions.DAOException;

public class BenutzerDAO extends BaseDAO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 834210840673022251L;

	public Benutzer save(Benutzer t) throws DAOException {
		storeObj(t);
		return (Benutzer) retrieveObj(Benutzer.class, t.getId());
	}

	public Benutzer get(Integer id) throws DAOException {
		Benutzer rueckgabe = (Benutzer) retrieveObj(Benutzer.class, id);
		if (rueckgabe == null)
			throw new DAOException("Object can not be found in database");
		return rueckgabe;
	}

	public void remove(Benutzer t) throws DAOException {
		if (t.getId() != null)
			removeObj(t);
	}

	public void remove(Integer id) throws DAOException {
		removeObj(Benutzer.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Benutzer> search(String query) throws DAOException {
		return retrieveObjs(query);
	}

	public Long count(String query) throws DAOException {
		return retrieveAnzahl(query);
	}
}