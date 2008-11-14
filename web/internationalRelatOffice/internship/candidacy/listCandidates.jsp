<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>

<%@page import="org.apache.struts.action.ActionMessages"%><html:xhtml />

<h2><bean:message key="label.internationalrelations.internship.candidacy.title"
	bundle="INTERNATIONAL_RELATIONS_OFFICE" /></h2>

<html:messages id="message" property="<%= ActionMessages.GLOBAL_MESSAGE %>" message="true" bundle="INTERNATIONAL_RELATIONS_OFFICE">
    <p>
        <span class="error0"><!-- Error messages go here --><bean:write name="message" /></span>
    </p>
</html:messages>

<logic:present name="search">
	<fr:form action="/internship/internshipCandidacy.do">
		<fr:edit id="search" name="search" schema="internship.candidates.search">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle5 thright thlight mbottom05" />
				<fr:property name="columnClasses" value=",,tdclear tderror1 nowrap aright" />
			</fr:layout>
		</fr:edit>
		<input type="hidden" name="method" />
		<p class="mtop05 mbottom15"><html:submit onclick="this.form.method.value='searchCandidates';">
			<bean:message bundle="COMMON_RESOURCES" key="button.search" />
		</html:submit>
        <html:submit onclick="this.form.method.value='exportToCandidatesToXls';">
            <bean:message bundle="COMMON_RESOURCES" key="link.export" />
        </html:submit></p>
	</fr:form>
</logic:present>

<logic:notEmpty name="candidates">
    <bean:size id="count" name="candidates"/>
    <bean:define id="countStr"><bean:write name="count"/></bean:define>
	<bean:message key="label.internationalrelations.internship.candidacy.count"
		bundle="INTERNATIONAL_RELATIONS_OFFICE" arg0="<%=countStr%>" />

	<fr:view name="candidates" schema="internship.candidates.list">
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle4 thlight" />
			<fr:property name="rowClasses" value="" />
            <fr:property name="link(view)"
                value="/internship/internshipCandidacy.do?method=candidateView" />
            <fr:property name="key(view)"
                value="link.view" />
            <fr:property name="bundle(view)" value="COMMON_RESOURCES" />
            <fr:property name="param(view)" value="candidacy.OID" />
            <fr:property name="order(view)" value="1" />
            <fr:property name="link(edit)"
                value="/internship/internshipCandidacy.do?method=prepareCandidacyEdit" />
            <fr:property name="key(edit)"
                value="link.edit" />
            <fr:property name="bundle(edit)" value="COMMON_RESOURCES" />
            <fr:property name="param(edit)" value="candidacy.OID" />
            <fr:property name="order(edit)" value="2" />
		</fr:layout>
	</fr:view>
</logic:notEmpty>
