<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<h2><bean:message key="title.chooseRooms"/></h2>
<html:errors/>
        <html:form action="/pesquisarSala">
            <table>
<!--            	<tr>
                    <td class="formTD">
                        <bean:message key="property.room.name"/>
                    </td>
                    <td>
                    	<html:select property="executionPeriodId">
                    		<logic:iterate id="executionPeriod" name="publico.executionPeriods">
                    			<bean:define id="idInternal" name="executionPeriod" property="idInternal"/>
                    			<html:option  value="<%= idInternal.toString() %>">
                    			<bean:write name="executionPeriod" property="name"/>-<bean:write name="executionPeriod" property="infoExecutionYear.year"/>
								</html:option>
                    		</logic:iterate>
                    		
                    			                    		
                    	</html:select>
                       
                    </td>
                </tr>
-->                <tr>
                    <td class="formTD">
                        <bean:message key="property.room.name"/>
                    </td>
                    <td>
                        <html:text property="name" size="11" maxlength="20"/>
                    </td>
                </tr>
                <tr>
                    <td class="formTD">
                        <bean:message key="property.room.building"/>
                    </td>
                    <td>
                        <html:select property="building" size="1">
                            <html:options collection="publico.buildings" property="value" labelProperty="label"/>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td class="formTD">
                        <bean:message key="property.room.floor"/>
                    </td>
                    <td>
                        <html:text property="floor" size="2" maxlength="2"/>
                    </td>
                </tr>
                <tr>
                    <td class="formTD">
                        <bean:message key="property.room.type"/>
                    </td>
                    <td>
                        <html:select property="type" size="1">
                            <html:options collection="publico.types" property="value" labelProperty="label"/>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td class="formTD">
                        <bean:message key="property.room.capacity.normal"/>
                    </td>
                    <td>
                        <html:text property="capacityNormal" size="3" maxlength="4"/>
                    </td>
                </tr>
                <tr>
                    <td class="formTD">
                        <bean:message key="property.room.capacity.exame"/>
                    </td>
                    <td>
                        <html:text property="capacityExame" size="3" maxlength="4"/>
                    </td>
                </tr>
            </table>
            <br/>
<html:submit styleClass="inputbutton"><bean:message key="label.choose"/>
</html:submit>
<html:reset styleClass="inputbutton"><bean:message key="label.clear"/>
</html:reset>
</html:form>
