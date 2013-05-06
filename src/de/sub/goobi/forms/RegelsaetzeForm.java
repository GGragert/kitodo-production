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

package de.sub.goobi.forms;

import de.sub.goobi.beans.Regelsatz;
import de.sub.goobi.config.ConfigMain;
import de.sub.goobi.helper.Helper;
import de.sub.goobi.helper.exceptions.DAOException;
import de.sub.goobi.persistence.RegelsatzDAO;

import dubious.sub.goobi.helper.Page;

import java.io.File;
import java.io.FileNotFoundException;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

public class RegelsaetzeForm extends BasisForm {
	private static final long serialVersionUID = -445707928042517243L;
	private Regelsatz myRegelsatz = new Regelsatz();
	private RegelsatzDAO dao = new RegelsatzDAO();
	private static final Logger logger = Logger.getLogger(RegelsaetzeForm.class);

	public String Neu() {
		myRegelsatz = new Regelsatz();
		return "RegelsaetzeBearbeiten";
	}

	public String Speichern() {
		try {
			if (hasValidRulesetFilePath(myRegelsatz, ConfigMain.getParameter("RegelsaetzeVerzeichnis"))) {
				dao.save(myRegelsatz);
				return "RegelsaetzeAlle";
			} else {
				Helper.setFehlerMeldung("regelsatzDateiNichtGefunden");
			}
		} catch (Exception e) {
			Helper.setFehlerMeldung("fehlerNichtSpeicherbar", e.getMessage());
			logger.error(e);
		}
		return "";
	}

	private boolean hasValidRulesetFilePath(Regelsatz r, String pathToRulesets) {
		File rulesetFile = new File(pathToRulesets + r.getDatei());
		return rulesetFile.exists(); 
	}

	public String Loeschen() {
		try {
			if (dao.hasAssignedProcesses(myRegelsatz)) {
				Helper.setFehlerMeldung("regelsatzNichtLoeschbar");
				return "";
			} else {
				dao.remove(myRegelsatz);
			}

		} catch (DAOException e) {
			Helper.setFehlerMeldung("fehlerNichtLoeschbar", e.getMessage());
			return "";
		}
		return "RegelsaetzeAlle";
	}

	public String FilterKein() {
		try {
			Session session = Helper.getHibernateSession();
			session.clear();
			Criteria crit = session.createCriteria(Regelsatz.class);
			crit.addOrder(Order.asc("titel"));
			page = new Page(crit, 0);
		} catch (HibernateException he) {
			Helper.setFehlerMeldung("fehlerBeimEinlesen", he.getMessage());
			return "";
		}
		return "RegelsaetzeAlle";
	}

	public String FilterKeinMitZurueck() {
		FilterKein();
		return zurueck;
	}

	/*#####################################################
	 #####################################################
	 ##                                                                                              
	 ##                                                Getter und Setter                         
	 ##                                                                                                    
	 #####################################################
	 ####################################################*/

	public Regelsatz getMyRegelsatz() {
		return myRegelsatz;
	}

	public void setMyRegelsatz(Regelsatz inPreference) {
		Helper.getHibernateSession().clear();
		this.myRegelsatz = inPreference;
	}
}