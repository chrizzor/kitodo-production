<%--
 *
 * (c) Kitodo. Key to digital objects e. V. <contact@kitodo.org>
 *
 * This file is part of the Kitodo project.
 *
 * It is licensed under GNU General Public License version 3 or later.
 *
 * For the full copyright and license information, please read the
 * GPL3-License.txt file that was distributed with this source code.
 *
--%>

<%@ page session="false" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="x" %>

<htm:table cellpadding="3" cellspacing="0" style="width:100%">
    <htm:tr style="vertical-align:top">
        <htm:td>
            <%-- Box für die Darstellung der Details --%>
            <h:form id="processdetails">
                <htm:table cellpadding="3" cellspacing="0" width="100%" styleClass="main_statistikboxen"
                           rendered="#{ProzessverwaltungForm.modusBearbeiten!='prozess'}">
                    <htm:tr>
                        <htm:td styleClass="main_statistikboxen_row1">
                            <h:outputText value="#{msgs.prozess}"/>
                        </htm:td>
                        <htm:td styleClass="main_statistikboxen_row1" align="right">
                            <h:commandLink action="#{ProzessverwaltungForm.Reload}">
                                <h:graphicImage value="/newpages/images/reload.gif"/>
                            </h:commandLink>
                        </htm:td>
                    </htm:tr>


                    <htm:tr>
                        <htm:td styleClass="main_statistikboxen_row2" colspan="2">
                            <htm:table border="0" width="100%" cellpadding="2">
                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText value="#{msgs.prozessTitel}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:outputText value="#{ProzessverwaltungForm.myProzess.title}"/>
                                    </htm:td>
                                    <htm:td rowspan="2" align="right"
                                            rendered="#{(LoginForm.maximaleBerechtigung == 1) || (LoginForm.maximaleBerechtigung == 2)}">
                                        <h:commandLink title="#{msgs.prozessdetailsBearbeiten}"
                                                       action="#{NavigationForm.Reload}" style=";margin-right:20px">
                                            <h:graphicImage value="/newpages/images/buttons/edit_20.gif"/>
                                            <x:updateActionListener property="#{ProzessverwaltungForm.modusBearbeiten}"
                                                                    value="prozess"/>
                                        </h:commandLink>
                                    </htm:td>
                                </htm:tr>

                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText value="#{msgs.projekt}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:outputText value="#{ProzessverwaltungForm.myProzess.project.title}"/>
                                    </htm:td>
                                </htm:tr>

                                <%-- 			<htm:tr>
                    <htm:td width="150">
                        <h:outputText value="#{msgs.ausgabename}:" />
                    </htm:td>
                    <htm:td>
                        <h:outputText
                            value="#{ProzessverwaltungForm.myProzess.ausgabename}" />
                    </htm:td>
                </htm:tr>
--%>
                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText value="#{msgs.erstellungsdatum}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:outputText value="#{ProzessverwaltungForm.myProzess.creationDate}"/>
                                    </htm:td>
                                </htm:tr>

                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText value="#{msgs.regelsatz}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:outputText value="#{ProzessverwaltungForm.myProzess.ruleset.title}"/>
                                    </htm:td>
                                </htm:tr>

                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText value="#{msgs.inAuswahllisteAnzeigen}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:graphicImage value="/newpages/images/check_false.gif"
                                                        rendered="#{not ProzessverwaltungForm.myProzess.inChoiceListShown}"/>
                                        <h:graphicImage value="/newpages/images/check_true.gif"
                                                        rendered="#{ProzessverwaltungForm.myProzess.inChoiceListShown}"/>
                                    </htm:td>
                                </htm:tr>

                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText value="#{msgs.istTemplate}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:graphicImage value="/newpages/images/check_false.gif"
                                                        rendered="#{not ProzessverwaltungForm.myProzess.template}"/>
                                        <h:graphicImage value="/newpages/images/check_true.gif"
                                                        rendered="#{ProzessverwaltungForm.myProzess.template}"/>
                                    </htm:td>
                                </htm:tr>

                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText styleClass="text_light" value="#{msgs.id}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:outputText styleClass="text_light"
                                                      value="#{ProzessverwaltungForm.myProzess.id}"/>
                                    </htm:td>
                                </htm:tr>

                                <htm:tr>
                                    <htm:td width="150">
                                        <h:outputText styleClass="text_light" value="#{msgs.batch}:"/>
                                    </htm:td>
                                    <htm:td>
                                        <h:outputText styleClass="text_light"
                                                      value="#{ProzessverwaltungForm.myProzess.batchID}"/>
                                    </htm:td>
                                </htm:tr>
                            </htm:table>

                        </htm:td>
                    </htm:tr>
                </htm:table>
            </h:form>
        </htm:td>
        <htm:td rendered="#{ProzessverwaltungForm.modusBearbeiten!='prozess'}">

            <h:form id="htmleditorform">
                <h:inputText id="myTextArea" value="#{ProzessverwaltungForm.wikiField}" style="width: 50%"/>
            </h:form>

            <h:form id="addToWikiForm">
                <h:inputText id="addToTextArea" value="#{ProzessverwaltungForm.addToWikiField}" style="width: 60%"/>
                <h:commandButton value="#{msgs.nachrichtHinzufuegen}" action="#{ProzessverwaltungForm.addToWikiField}"/>
            </h:form>

        </htm:td>
    </htm:tr>
</htm:table>


<h:form>
    <%-- Box für die Bearbeitung der Details --%>
    <htm:table cellpadding="3" cellspacing="0" width="100%" styleClass="eingabeBoxen"
               rendered="#{ProzessverwaltungForm.modusBearbeiten=='prozess'}">

        <htm:tr>
            <htm:td styleClass="eingabeBoxen_row1" colspan="2">
                <h:outputText value="#{msgs.prozess}"/>
            </htm:td>
        </htm:tr>
        <%-- Formular für die Bearbeitung des Prozesses --%>
        <htm:tr>
            <htm:td styleClass="eingabeBoxen_row2" colspan="2">
                <h:panelGrid columns="2">

                    <%-- Felder --%>
                    <h:outputLabel for="titel" value="#{msgs.prozessTitel}"/>
                    <h:panelGroup>
                        <h:inputText id="titel" style="width: 300px;margin-right:15px"
                                     value="#{ProzessverwaltungForm.myNewProcessTitle}" required="true"/>
                        <x:message for="titel" style="color: red" detailFormat="#{msgs.keinTitelAngegeben}"/>
                    </h:panelGroup>

                    <h:outputLabel for="prozess" value="#{msgs.projekt}"/>
                    <h:panelGroup>
                        <h:selectOneMenu id="prozess" style="width: 300px;margin-right:15px"
                                         value="#{ProzessverwaltungForm.projektAuswahl}" required="true">
                            <f:selectItem itemValue="" itemLabel="#{msgs.bitteAuswaehlen}"/>
                            <f:selectItems value="#{ProzessverwaltungForm.projektAuswahlListe}"/>
                        </h:selectOneMenu>
                        <x:message for="prozess" style="color: red" detailFormat="#{msgs.keinProjektAngegeben}"/>
                    </h:panelGroup>

                    <%-- Ausgabename
                <h:outputLabel for="ausgabename" value="#{msgs.ausgabename}" />
                <h:panelGroup>
                    <h:inputText id="ausgabename"
                        style="width: 300px;margin-right:15px"
                        value="#{ProzessverwaltungForm.myProzess.ausgabename}" />
                    <x:message for="ausgabename" style="color: red" />
                </h:panelGroup>
 --%>
                    <%-- Preferences --%>
                    <h:outputLabel for="Regelsatz" value="#{msgs.regelsatz}"/>
                    <h:panelGroup>
                        <h:selectOneMenu id="Regelsatz" value="#{ProzessverwaltungForm.myProzess.ruleset}"
                                         converter="RegelsatzConverter"
                                         style="width: 300px;margin-right:15px" required="true">
                            <f:selectItems value="#{HelperForm.regelsaetze}"/>
                        </h:selectOneMenu>
                        <x:message for="Regelsatz" style="color: red" replaceIdWithLabel="true"/>
                    </h:panelGroup>

                    <h:outputLabel for="docket" value="#{msgs.docket}"/>
                    <h:panelGroup>
                        <h:selectOneMenu id="docket" style="width: 300px;margin-right:15px"
                                         value="#{ProzessverwaltungForm.myProzess.docket}"
                                         converter="DocketConverter">
                            <%-- 							<f:selectItem itemValue="" itemLabel="#{msgs.defaultDocket}" /> --%>
                            <f:selectItems value="#{HelperForm.dockets}"/>
                        </h:selectOneMenu>
                    </h:panelGroup>

                    <h:outputText value="#{msgs.inAuswahllisteAnzeigen}"/>
                    <h:selectBooleanCheckbox value="#{ProzessverwaltungForm.myProzess.inChoiceListShown}"/>

                    <h:outputText value="#{msgs.istTemplate}"/>
                    <h:selectBooleanCheckbox id="check" value="#{ProzessverwaltungForm.myProzess.template}"/>
                </h:panelGrid>

            </htm:td>
        </htm:tr>

        <htm:tr>
            <htm:td styleClass="eingabeBoxen_row3" align="left">
                <h:commandButton value="#{msgs.abbrechen}" immediate="true" action="#{NavigationForm.Reload}">
                    <x:updateActionListener property="#{ProzessverwaltungForm.modusBearbeiten}" value=""/>
                </h:commandButton>
            </htm:td>
            <htm:td styleClass="eingabeBoxen_row3" align="right">
                <h:commandButton value="#{msgs.contentLoeschen}" action="#{ProzessverwaltungForm.ContentLoeschen}"
                                 onclick="return confirm('#{msgs.sollDerContentWirklichGeloeschtWerden}?')"
                                 rendered="#{ProzessverwaltungForm.myProzess.id != null}"/>
                <h:commandButton value="#{msgs.loeschen}" action="#{ProzessverwaltungForm.Loeschen}"
                                 onclick="return confirm('#{msgs.sollDieserEintragWirklichGeloeschtWerden}?')"
                                 rendered="#{ProzessverwaltungForm.myProzess.id != null}"/>
                <h:commandButton value="#{msgs.speichern}" action="#{ProzessverwaltungForm.Speichern}" id="absenden">
                    <x:updateActionListener property="#{ProzessverwaltungForm.modusBearbeiten}" value=""/>
                </h:commandButton>
            </htm:td>
        </htm:tr>

    </htm:table>
</h:form>
<%-- // Box für die Bearbeitung der Details --%>

<h:outputText value="<script src=\"" escape="false"/>
<h:outputText value="#{HelperForm.servletPathWithHostAsUrl}/js/tiny_mce/tiny_mce.js"/>
<h:outputText value="\" type=\"text/javascript\">" escape="false"/>
<h:outputText value="</script>" escape="false"/>

<script type="text/javascript">
    tinyMCE
            .init({
                mode: "exact",
                elements: "htmleditorform:myTextArea",
                theme: "advanced",
                width: "100%",
                height: "200px",
                plugins: "safari,pagebreak,style,table,save,advhr,emotions,iespell,inlinepopups,insertdatetime,preview,print,contextmenu,paste,fullscreen,noneditable,visualchars,nonbreaking",
                readonly: 1,

                // Theme options
                theme_advanced_buttons1: "save,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontsizeselect",
                theme_advanced_buttons2: "",
                theme_advanced_buttons3: "",
                theme_advanced_toolbar_location: "top",
                theme_advanced_toolbar_align: "left",
                theme_advanced_statusbar_location: "bottom",
                theme_advanced_resizing: true
            });
</script>
