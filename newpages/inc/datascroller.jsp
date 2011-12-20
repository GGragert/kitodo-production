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

<h:panelGroup rendered="#{mypage.totalResults > LoginForm.myBenutzer.tabellengroesse}">
	<%-- erste und vorherige Seite --%>
	<h:commandLink action="#{mypage.cmdMoveFirst}" id="gofirst">
		<h:graphicImage url="/newpages/images/datascroller/arrow-first.gif"
			style="margin-right:4px;vertical-align: middle;" />
	</h:commandLink>
	<h:commandLink action="#{mypage.cmdMovePrevious}" id="goprevious">
		<h:graphicImage url="/newpages/images/datascroller/arrow-previous.gif"
			style="margin-right:4px;vertical-align: middle;" />
	</h:commandLink>

	<%-- aktuelle Seite anzeigen --%>
	<x:outputText id="txtMoveTo1" forceId="true"
		value="#{msgs.seite} #{mypage.pageNumberCurrent} #{msgs.von} #{mypage.pageNumberLast}"
		onclick="document.getElementById('txtMoveTo2').style.display='inline';
			       document.getElementById('txtMoveTo1').style.display='none'; 
			       document.getElementById('txtMoveTo2').focus();
			       document.getElementById('txtMoveTo2').select();" />

	<%-- Seite direkt anspringen --%>
	<x:inputText id="txtMoveTo2" forceId="true"
		value="#{mypage.txtMoveTo}"
		style="display:none;font-size:9px;width:30px" required="true"
		onblur="document.getElementById('txtMoveTo2').style.display='none';
      				 document.getElementById('txtMoveTo1').style.display='inline';" 
      				 onkeypress="return submitEnter('cmdMoveTo',event)"/>
	<x:commandButton action="#{NavigationForm.Reload}" id="cmdMoveTo" forceId="true" value="go" style="display:none"/>
	
	<%-- nächste und letzte Seite --%>
	<h:commandLink action="#{mypage.cmdMoveNext}" id="gonext">
		<h:graphicImage url="/newpages/images/datascroller/arrow-next.gif"
			style="margin-left:4px;margin-right:4px;vertical-align: middle;" />
	</h:commandLink>
	<h:commandLink action="#{mypage.cmdMoveLast}" id="golast">
		<h:graphicImage url="/newpages/images/datascroller/arrow-last.gif"
			style="margin-right:4px;vertical-align: middle;" />
	</h:commandLink>
</h:panelGroup>