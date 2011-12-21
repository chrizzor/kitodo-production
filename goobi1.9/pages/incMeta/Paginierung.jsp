<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm"%>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="x"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>

<%-- ########################################

                                  Paginierungssequenzen

#########################################--%>
<%-- <h:form> --%>
<a4j:commandLink action="#{Metadaten.createPagination}"
	reRender="mygrid10,myMessages" value="#{msgs.paginierungEinlesen}" />
<%-- </h:form> --%>
<h:panelGrid id="mygrid10" columns="2" style="margin:0px;">

	<%-- ++++++++++++++++     Auswahl der Seiten      ++++++++++++++++ --%>
	<htm:table cellpadding="3" cellspacing="0" width="200px"
		rendered="#{Metadaten.alleSeiten !=null}" styleClass="eingabeBoxen"
		style="margin-top:20px">
		<htm:tr>
			<htm:td styleClass="eingabeBoxen_row1">
				<h:outputText value="#{msgs.auswahlDerSeiten}" />
			</htm:td>
		</htm:tr>
		<htm:tr>
			<htm:td id="PaginierungAlleImages" styleClass="eingabeBoxen_row2">
				<h:selectManyCheckbox layout="pageDirection" id="myCheckboxes"
					value="#{Metadaten.alleSeitenAuswahl}">
					<f:selectItems value="#{Metadaten.alleSeiten}" id="myCheckbox" />
				</h:selectManyCheckbox>
			</htm:td>
		</htm:tr>
	</htm:table>
	<%-- ++++++++++++++++     // Auswahl der Seiten      ++++++++++++++++ --%>

	<%-- ++++++++++++++++     Spacer for valid HTML     ++++++++++++++++ --%>
	<htm:table rendered="#{Metadaten.alleSeiten ==null}"
		style="display:none"/>
	
	<%-- ++++++++++++++++     // Auswahl der Seiten      ++++++++++++++++ --%>

	<h:panelGrid id="mygrid11" columns="1" width="270px" style="margin:0px;">
		<%-- ++++++++++++++++     Paginierung festlegen      ++++++++++++++++ --%>
		<htm:table cellpadding="3" cellspacing="0"  id="PaginierungActionBox"
			rendered="#{Metadaten.alleSeiten !=null}" styleClass="eingabeBoxen"
			style="position: fixed;top: 104px;left: 250px;">
			<htm:tr>
				<htm:td styleClass="eingabeBoxen_row1">
					<h:outputText value="#{msgs.paginierungFestlegen}" />
				</htm:td>
			</htm:tr>
			<htm:tr>
				<htm:td styleClass="eingabeBoxen_row2">
					<h:selectOneMenu value="#{Metadaten.paginierungArt}"
						style="width: 250px" onchange="paginierungWertAnzeigen(this);">
						<f:selectItem itemValue="1" itemLabel="#{msgs.arabisch}" />
						<f:selectItem itemValue="4" itemLabel="#{msgs.arabischBracket}" />
						<f:selectItem itemValue="2" itemLabel="#{msgs.roemisch}" />
						<f:selectItem itemValue="5" itemLabel="#{msgs.roemischBracket}" />
						<f:selectItem itemValue="3" itemLabel="#{msgs.unnummeriert}" />
						<f:selectItem itemValue="6" itemLabel="#{msgs.paginationFreetext}" />
					</h:selectOneMenu>
					<htm:br />
					<x:inputText id="paginierungWert" forceId="true"
						value="#{Metadaten.paginierungWert}"
						style="width: 250px;margin-top:15px;margin-bottom:5px" />
					<htm:br />

					<a4j:commandLink rendered="#{Metadaten.paginierungSeitenProImage!=1}"
						title="#{msgs.seitenzaehlung}" reRender="PaginierungActionBox,myMessages">
						<h:graphicImage
							value="/newpages/images/buttons/paginierung_seite_inactive.png"
							style="margin-left:4px;margin-right:6px;vertical-align:middle" />
						<x:updateActionListener value="1"
							property="#{Metadaten.paginierungSeitenProImage}" />
					</a4j:commandLink>
					<h:graphicImage
						rendered="#{Metadaten.paginierungSeitenProImage==1}"
						value="/newpages/images/buttons/paginierung_seite.png"
						style="margin-left:4px;margin-right:6px;vertical-align:middle"
						title="#{msgs.seitenzaehlung}" />

					<a4j:commandLink rendered="#{Metadaten.paginierungSeitenProImage!=2}"
						title="#{msgs.spaltenzaehlung}" reRender="PaginierungActionBox,myMessages">
						<h:graphicImage
							value="/newpages/images/buttons/paginierung_spalte_inactive.png"
							style="margin-left:4px;margin-right:6px;vertical-align:middle" />
						<x:updateActionListener value="2"
							property="#{Metadaten.paginierungSeitenProImage}" />
					</a4j:commandLink>
					<h:graphicImage
						rendered="#{Metadaten.paginierungSeitenProImage==2}"
						value="/newpages/images/buttons/paginierung_spalte.png"
						style="margin-left:4px;margin-right:6px;vertical-align:middle"
						title="#{msgs.spaltenzaehlung}" />

					<a4j:commandLink rendered="#{Metadaten.paginierungSeitenProImage!=3}"
						title="#{msgs.blattzaehlung}" reRender="PaginierungActionBox,myMessages">
						<h:graphicImage
							value="/newpages/images/buttons/paginierung_blatt_inactive.png"
							style="margin-left:4px;margin-right:6px;vertical-align:middle" />
						<x:updateActionListener value="3"
							property="#{Metadaten.paginierungSeitenProImage}" />
					</a4j:commandLink>
					<h:graphicImage
						rendered="#{Metadaten.paginierungSeitenProImage==3}"
						value="/newpages/images/buttons/paginierung_blatt.png"
						style="margin-left:4px;margin-right:6px;vertical-align:middle"
						title="#{msgs.blattzaehlung}" />
					
					<a4j:commandLink
						rendered="#{Metadaten.paginierungSeitenProImage!=4}"
						title="#{msgs.blattzaehlungrectoverso}"
						reRender="PaginierungActionBox,myMessages">
						<h:graphicImage
							value="/newpages/images/buttons/paginierung_blatt_rectoverso_inactive.png"
							style="margin-left:4px;margin-right:6px;vertical-align:middle" />
						<x:updateActionListener value="4"
							property="#{Metadaten.paginierungSeitenProImage}" />
					</a4j:commandLink>
					<h:graphicImage
						rendered="#{Metadaten.paginierungSeitenProImage==4}"
						value="/newpages/images/buttons/paginierung_blatt_rectoverso.png"
						style="margin-left:4px;margin-right:6px;vertical-align:middle"
						title="#{msgs.blattzaehlungrectoverso}" />
								
					<a4j:commandLink
						rendered="#{Metadaten.paginierungSeitenProImage!=5}"
						title="#{msgs.seitenzaehlungrectoverso}"
						reRender="PaginierungActionBox,myMessages">
						<h:graphicImage
							value="/newpages/images/buttons/paginierung_seite_rectoverso_inactive.png"
							style="margin-left:4px;margin-right:6px;vertical-align:middle" />
						<x:updateActionListener value="5"
							property="#{Metadaten.paginierungSeitenProImage}" />
					</a4j:commandLink>
					<h:graphicImage
						rendered="#{Metadaten.paginierungSeitenProImage==5}"
						value="/newpages/images/buttons/paginierung_seite_rectoverso.png"
						style="margin-left:4px;margin-right:6px;vertical-align:middle"
						title="#{msgs.seitenzaehlungrectoverso}" />
						
					<htm:br />
					<htm:br />

					<a4j:commandLink id="s4" action="#{Metadaten.Paginierung}"
						style="margin-top:15px" reRender="PaginierungAlleImages,myMessages" >
						<h:outputText value="#{msgs.nurDieMarkiertenSeiten}" />
						<x:updateActionListener
							property="#{Metadaten.paginierungAbSeiteOderMarkierung}"
							value="2" />
					</a4j:commandLink>
					<htm:br style="margin-top:15px" />
					<a4j:commandLink id="s5" action="#{Metadaten.Paginierung}"
						style="margin-top:15px" reRender="PaginierungAlleImages,myMessages" >
						<h:outputText value="#{msgs.abDerErstenMarkiertenSeite}" />
						<x:updateActionListener
							property="#{Metadaten.paginierungAbSeiteOderMarkierung}"
							value="1" />
					</a4j:commandLink>
				</htm:td>
			</htm:tr>
		</htm:table>
		<%-- ++++++++++++++++     // Paginierung festlegen      ++++++++++++++++ --%>
	</h:panelGrid>
</h:panelGrid>