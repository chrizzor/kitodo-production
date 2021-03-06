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

<htm:tr>
    <htm:td colspan="2">
        <h:form id="foot1">
            <htm:table width="100%" cellpadding="0" cellspacing="0px"
                       align="center" style="margin-top:0px">
                <htm:tr>
                    <htm:td align="center" styleClass="layoutFuss">

                        <h:outputLink value="#{HelperForm.applicationWebsiteMsg}">
                            <h:outputText value="#{HelperForm.applicationWebsiteMsg}"/>
                        </h:outputLink>

                        <h:outputText value=" | #{msgs.toolentwicklung} | "/>

                        <h:commandLink action="Impressum" value="#{msgs.impressum}" id="impr"/>
                        <script language="javascript">
                            function submitEnter(commandId, e) {
                                var keycode;
                                if (window.event) keycode = window.event.keyCode;
                                else if (e) keycode = e.which;
                                else return true;

                                if (keycode == 13) {
                                    document.getElementById(commandId).click();
                                    return false;
                                }
                                else
                                    return true;
                            }


                            /**
                             * Handler for onkeypress that clicks {@code targetElement} if the
                             * enter key is pressed.
                             */
                            function ifEnterClick(event, targetElement) {
                                event = event || window.event;
                                if (event.keyCode == 13) {
                                    // normalize event target, so it looks the same for all browsers
                                    if (!event.target) {
                                        event.target = event.srcElement;
                                    }

                                    // don't do anything if the element handles the enter key on its own
                                    if (event.target.nodeName == 'A') {
                                        return;
                                    }
                                    if (event.target.nodeName == 'INPUT') {
                                        if (event.target.type == 'button' || event.target.type == 'submit') {
                                            if (strEndsWith(event.target.id, 'focusKeeper')) {
                                                // inside some Richfaces component such as rich:listShuttle
                                            } else {
                                                return;
                                            }
                                        }
                                    }
                                    if (event.target.nodeName == 'TEXTAREA') {
                                        return;
                                    }

                                    // swallow event
                                    if (event.preventDefault) {
                                        // Firefox
                                        event.stopPropagation();
                                        event.preventDefault();
                                    } else {
                                        // IE
                                        event.cancelBubble = true;
                                        event.returnValue = false;
                                    }

                                    document.getElementById(targetElement).click();
                                }
                            }

                        </script>

                    </htm:td>
                </htm:tr>
            </htm:table>
        </h:form>
    </htm:td>
</htm:tr>
