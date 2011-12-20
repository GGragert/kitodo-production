<%@ page session="false" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="x"%>

<%--
  ~ This file is part of the Goobi Application - a Workflow tool for the support of
  ~ mass digitization.
  ~
  ~ Visit the websites for more information.
  ~     - http://gdz.sub.uni-goettingen.de
  ~     - http://www.goobi.org
  ~     - http://launchpad.net/goobi-production
  ~
  ~ This program is free software; you can redistribute it and/or modify it under
  ~ the terms of the GNU General Public License as published by the Free Software
  ~ Foundation; either version 2 of the License, or (at your option) any later
  ~ version.
  ~
  ~ This program is distributed in the hope that it will be useful, but WITHOUT ANY
  ~ WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
  ~ PARTICULAR PURPOSE. See the GNU General Public License for more details. You
  ~ should have received a copy of the GNU General Public License along with this
  ~ program; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
  ~ Suite 330, Boston, MA 02111-1307 USA
  --%>

<htm:table width="100%" align="center" border="1"
	cellpadding="3" border="0" cellspacing="0" styleClass="layoutNavigation">
	<htm:tr>
		<htm:td valign="top">
			<h:form id="navform">
				<%-- ######################################## 
					
					Benutzerberechtigungen sind wie folgt:
					
					1: Administration - darf alles
					
					2: Prozessverwaltung - darf sehr viel (aber keine Benutzerverwaltung, kein Benutzerwechsel und auch kein Administrationsform)
					
					3: Benutzer und Prozesse - anscheinend nix anderes als 4
					
					4: nur Benutzer: aktuelle Schritte sehen
									
				#########################################--%>

				<%-- Startseite --%>
				<h:commandLink styleClass="mlink" action="newMain"
					style="#{NavigationForm.aktuell == '0' ? 'font-weight: bold;':'font-weight:normal ;'}">
					<h:panelGroup rendered="#{NavigationForm.aktuell == '0'}">
						<f:verbatim>&#8250; </f:verbatim>
					</h:panelGroup>
					<h:outputText value="#{msgs.startseite}" />
					<x:updateActionListener property="#{NavigationForm.aktuell}"
						value="0" />
				</h:commandLink>

				<%-- ################            allgemeines             ######################--%>

				<h:outputText styleClass="th_menu" value="- #{msgs.allgemeines} -" />
				<%-- Bedienungshinweise --%>
				<h:commandLink styleClass="mlink" action="Bedienung"
					style="#{NavigationForm.aktuell == '10' ? 'font-weight: bold;':'font-weight:normal ;'}">
					<h:panelGroup rendered="#{NavigationForm.aktuell == '10'}">
						<f:verbatim>&#8250; </f:verbatim>
					</h:panelGroup>
					<h:outputText value="#{msgs.bedienungshinweise}" />
					<x:updateActionListener property="#{NavigationForm.aktuell}"
						value="10" />
				</h:commandLink>

				<%-- technischer Hintergrund --%>
				<h:commandLink styleClass="mlink" action="TechnischerHintergrund"
					style="#{NavigationForm.aktuell == '11' ? 'font-weight: bold;':'font-weight:normal ;'}">
					<h:panelGroup rendered="#{NavigationForm.aktuell == '11'}">
						<f:verbatim>&#8250; </f:verbatim>
					</h:panelGroup>
					<h:outputText value="#{msgs.technischerHintergrund}" />
					<x:updateActionListener property="#{NavigationForm.aktuell}"
						value="11" />
				</h:commandLink>

				<%-- aktive Benutzer --%>
				<h:commandLink styleClass="mlink" action="aktiveBenutzerNeu"
					style="#{NavigationForm.aktuell == '12' ? 'font-weight: bold;':'font-weight:normal ;'}">
					<h:panelGroup rendered="#{NavigationForm.aktuell == '12'}">
						<f:verbatim>&#8250; </f:verbatim>
					</h:panelGroup>
					<h:outputText value="#{msgs.aktiveBenutzer}" />
					<x:updateActionListener property="#{NavigationForm.aktuell}"
						value="12" />
				</h:commandLink>

				<%-- ################            Workflow              ######################--%>

				<h:panelGroup rendered="#{LoginForm.maximaleBerechtigung > 0}">
					<h:outputText styleClass="th_menu" value="- #{msgs.workflow} -" />

					<%-- aktuelle Schritte --%>
					<h:commandLink styleClass="mlink"
						action="#{AktuelleSchritteForm.FilterAlleStart}"
						style="#{NavigationForm.aktuell == '20' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '20'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.aktuelleSchritte}" />
						<x:updateActionListener property="#{AktuelleSchritteForm.filter}"
							value="" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="20" />
					</h:commandLink>

					<%-- Prozess suchen --%>
					<h:commandLink styleClass="mlink" action="ProzessverwaltungSuche"
						style="#{NavigationForm.aktuell == '21' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '21'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.nachEinemBandSuchen}" />
						<x:updateActionListener property="#{ProzessverwaltungForm.filter}"
							value="" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="21" />
					</h:commandLink>

					<%-- Prozessübersicht --%>
					<h:commandLink styleClass="mlink"
						rendered="#{(LoginForm.maximaleBerechtigung == 1) || (LoginForm.maximaleBerechtigung == 2)}"
						action="#{ProzessverwaltungForm.FilterAktuelleProzesse}"
						style="#{NavigationForm.aktuell == '22' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '22'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.aktuelleProzesse}" />
						<x:updateActionListener property="#{ProzessverwaltungForm.filter}"
							value="" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="22" />
					</h:commandLink>

					<%-- Prozessvorlagen --%>
					<h:commandLink styleClass="mlink"
						rendered="#{(LoginForm.maximaleBerechtigung == 1) || (LoginForm.maximaleBerechtigung == 2)}"
						action="#{ProzessverwaltungForm.FilterVorlagen}"
						style="#{NavigationForm.aktuell == '23' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '23'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.prozessvorlagen}" />
						<x:updateActionListener property="#{ProzessverwaltungForm.filter}"
							value="" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="23" />
					</h:commandLink>

				</h:panelGroup>

				<%-- ################            Administration              ######################--%>

				<h:panelGroup rendered="#{LoginForm.maximaleBerechtigung == 1}">
					<h:outputText styleClass="th_menu"
						value="- #{msgs.administration} -" />

					<%-- Benutzerverwaltung --%>
					<h:commandLink styleClass="mlink"
						action="#{BenutzerverwaltungForm.FilterKein}"
						style="#{NavigationForm.aktuell == '30' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '30'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.benutzer}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="30" />
					</h:commandLink>

					<%-- Benutzergruppen --%>
					<h:commandLink styleClass="mlink"
						action="#{BenutzergruppenForm.FilterKein}"
						style="#{NavigationForm.aktuell == '31' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '31'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.benutzergruppen}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="31" />
					</h:commandLink>

					<%-- Projekte --%>
					<h:commandLink styleClass="mlink"
						action="#{ProjekteForm.FilterKein}"
						style="#{NavigationForm.aktuell == '32' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '32'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.projekte}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="32" />
					</h:commandLink>

					<%-- Regelsaetze --%>
					<h:commandLink styleClass="mlink"
						action="#{RegelsaetzeForm.FilterKein}"
						style="#{NavigationForm.aktuell == '33' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '33'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.metadaten}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="33" />
					</h:commandLink>

					<%-- Ldapgruppen --%>
					<h:commandLink styleClass="mlink"
						action="#{LdapGruppenForm.FilterKein}"
						style="#{NavigationForm.aktuell == '34' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '34'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.ldapgruppen}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="34" />
					</h:commandLink>

					<%-- Administrationsaufgaben --%>
					<h:commandLink styleClass="mlink" action="Administrationsaufgaben"
						style="#{NavigationForm.aktuell == '35' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '35'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.scripte}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="35" />
					</h:commandLink>

				</h:panelGroup>

				<%-- ################            Benutzereinstellungen              ######################--%>

				<h:panelGroup rendered="#{LoginForm.maximaleBerechtigung > 0}">
					<h:outputText styleClass="th_menu"
						value="- #{msgs.benutzerdaten} -" />

					<%-- Benutzerkonfiguration --%>
					<h:commandLink styleClass="mlink" action="Benutzerkonfiguration"
						style="#{NavigationForm.aktuell == '40' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '40'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.benutzerkonfiguration}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="40" />
					</h:commandLink>

					<%-- Passwort ändern --%>
					<h:commandLink styleClass="mlink" action="newPasswortAendern"
						style="#{NavigationForm.aktuell == '41' ? 'font-weight: bold;':'font-weight:normal ;'}">
						<h:panelGroup rendered="#{NavigationForm.aktuell == '41'}">
							<f:verbatim>&#8250; </f:verbatim>
						</h:panelGroup>
						<h:outputText value="#{msgs.passwortAendern}" />
						<x:updateActionListener property="#{NavigationForm.aktuell}"
							value="41" />
					</h:commandLink>
				</h:panelGroup>

			</h:form>
		</htm:td>
	</htm:tr>
	<htm:tr valign="bottom">
		<htm:td height="50px" valign="bottom">
			<h:form id="loginform2">
				<%@include file="Login.jsp"%>
			</h:form>
		</htm:td>
	</htm:tr>
</htm:table>

