<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<h2><bean:message key="label.occupations.management" bundle="SPACE_RESOURCES"/></h2>

<logic:present name="selectedSpaceInformation">	
	
	<br/>
		
	<bean:define id="space" name="selectedSpaceInformation" property="space" toScope="request"/>
	<bean:define id="selectedSpaceInformationId" name="selectedSpaceInformation" property="idInternal" />
	<jsp:include page="../spaceCrumbs.jsp"/>
	
	<br/><br/>	
			
	<logic:messagesPresent>
		<span class="error">
			<html:messages id="message" message="true" bundle="SPACE_RESOURCES">
				<bean:write name="message"/>
			</html:messages>
		</span>
	</logic:messagesPresent>
	
	<h3><bean:message key="label.active.occupations" bundle="SPACE_RESOURCES"/></h3>
	<fr:view schema="PersonOccupations" name="selectedSpaceInformation" property="space.activePersonSpaceOccupations">
		<fr:layout name="tabular">      			
   			<fr:property name="rowClasses" value="listClasses"/>	
   			<fr:property name="columnClasses" value="listClasses"/>
   			   			
   			<fr:property name="link(edit)" value="<%="/manageSpaceOccupations.do?method=prepareEditSpacePersonOccupation&spaceInformationID=" + selectedSpaceInformationId %>"/>
            <fr:property name="param(edit)" value="idInternal/spaceOccupationID"/>
	        <fr:property name="key(edit)" value="link.edit"/>
            <fr:property name="bundle(edit)" value="SPACE_RESOURCES"/>
            <fr:property name="order(edit)" value="0"/>
            
            <fr:property name="link(delete)" value="<%="/manageSpaceOccupations.do?method=deleteSpacePersonOccupation&spaceInformationID=" + selectedSpaceInformationId %>"/>
            <fr:property name="param(delete)" value="idInternal/spaceOccupationID"/>
	        <fr:property name="key(delete)" value="link.delete"/>
            <fr:property name="bundle(delete)" value="SPACE_RESOURCES"/>
            <fr:property name="order(delete)" value="0"/>                                           
    	</fr:layout>
	</fr:view>			

	<br/><br/>	
	<bean:define id="exceptionParams" value="<%="/manageSpaceOccupations.do?method=showSpaceOccupations&spaceInformationID="+ selectedSpaceInformationId %>" />		
	<logic:empty name="personSpaceOccupation">
		<h3><bean:message key="label.add.person" bundle="SPACE_RESOURCES"/>:</h3>		
		<fr:create id="create" type="net.sourceforge.fenixedu.domain.space.PersonSpaceOccupation" schema="AddPersonOccupation">	   	
			<fr:hidden slot="space" name="selectedSpaceInformation" property="space" />
			<fr:destination name="exception" path="<%= exceptionParams %>" />
		</fr:create>
	</logic:empty>
	<logic:notEmpty name="personSpaceOccupation">	
		<h3><bean:message key="label.edit.occupation" bundle="SPACE_RESOURCES"/>:</h3>					
		<bean:define id="exceptionParams" value="<%="/manageSpaceOccupations.do?method=editSpacePersonOccupation&spaceInformationID="+ selectedSpaceInformationId %>" />		
		<bean:write name="personSpaceOccupation" property="person.name"/> ->
		<bean:write name="personSpaceOccupation" property="person.username"/>
		<fr:edit name="personSpaceOccupation" action="<%= exceptionParams %>" schema="EditPersonOccupation">	   				
			<fr:destination name="exception" path="<%= exceptionParams %>" />
		</fr:edit>	
	</logic:notEmpty>
	<br/><br/>
		
	<h3><bean:message key="label.inactive.occupations" bundle="SPACE_RESOURCES"/></h3>
	<fr:view schema="PersonOccupations" name="selectedSpaceInformation" property="space.inactivePersonSpaceOccupations">
		<fr:layout name="tabular">      			
   			<fr:property name="rowClasses" value="listClasses"/>	
   			<fr:property name="columnClasses" value="listClasses"/>
   			   			
   			<fr:property name="link(edit)" value="<%="/manageSpaceOccupations.do?method=prepareEditSpacePersonOccupation&spaceInformationID=" + selectedSpaceInformationId %>"/>
            <fr:property name="param(edit)" value="idInternal/spaceOccupationID"/>
	        <fr:property name="key(edit)" value="link.edit"/>
            <fr:property name="bundle(edit)" value="SPACE_RESOURCES"/>
            <fr:property name="order(edit)" value="0"/>
            
			<fr:property name="link(delete)" value="<%="/manageSpaceOccupations.do?method=deleteSpacePersonOccupation&spaceInformationID=" + selectedSpaceInformationId %>"/>
            <fr:property name="param(delete)" value="idInternal/spaceOccupationID"/>
	        <fr:property name="key(delete)" value="link.delete"/>
            <fr:property name="bundle(delete)" value="SPACE_RESOURCES"/>
            <fr:property name="order(delete)" value="0"/>               
    	</fr:layout>
	</fr:view>	
		
</logic:present>