<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<h2><bean:message key="label.masterDegree.administrativeOffice.marksConfirmation" /></h2>
<br />
<bean:message key="label.masterDegree.administrativeOffice.executionYear"/>:<bean:write name="executionYear" />
&nbsp;-&nbsp;
<bean:message key="label.masterDegree.administrativeOffice.degree"/>:<bean:write name="degree" />
&nbsp;-&nbsp;
<bean:message key="label.masterDegree.administrativeOffice.curricularCourse"/>:<bean:write name="curricularCourse" />
<br /><br />
<span class="error"><html:errors /></span>
<logic:present name="infoSiteEnrolmentEvaluation">
	<bean:define id="teacher" name="infoSiteEnrolmentEvaluation" property="infoTeacher"/>
	<bean:define id="availableEvaluationDate" name="infoSiteEnrolmentEvaluation" property="lastEvaluationDate"/>
    <table>        
		<tr>
			<td class="listClasses-header">
				<bean:message key="label.number" /> 
		   	</td>
			<td class="listClasses-header">
				<bean:message key="label.name" />
		   	</td>
			<td class="listClasses-header">
				<bean:message key="label.mark" />
			</td>
		</tr>    				
		<bean:size id="size" name="infoSiteEnrolmentEvaluation" property="enrolmentEvaluations" />	
				    			    		
    	<logic:iterate id="enrolmentEvaluation" name="infoSiteEnrolmentEvaluation" property="enrolmentEvaluations" type="DataBeans.InfoEnrolmentEvaluation">
    		
    		<tr>
				<td class="listClasses">
					<bean:write name="enrolmentEvaluation" property="infoEnrolment.infoStudentCurricularPlan.infoStudent.number"/>&nbsp;
				</td>
				<td class="listClasses">
					<bean:write name="enrolmentEvaluation" property="infoEnrolment.infoStudentCurricularPlan.infoStudent.infoPerson.nome"/>
				</td>											
				<td class="listClasses">
					<bean:write name="enrolmentEvaluation" property="grade" />
				</td>
			</tr>
    	</logic:iterate>
    </table>
    <br />
    <table>
<%--		<tr>
			<td>
				<bean:message key="label.data.avaliacao"/>:
			</td>
			<td> 
				<bean:write name="availableEvaluationDate"/>
			</td>
		</tr> --%>
		<tr>
			<td colspan="2">
				<b><bean:message key="label.masterDegree.administrativeOffice.responsibleTeacher" /></b>
			</td>
		</tr>
		<tr>
			<td>
				<bean:message key="label.masterDegree.administrativeOffice.number" />:
				<bean:write name="teacher" property="teacherNumber"/>
				
			</td>
			<td> 
				&nbsp;-&nbsp;<bean:message key="label.masterDegree.administrativeOffice.name" />:
				<bean:write name="teacher" property="infoPerson.nome"/>
			</td>
		</tr>
    </table>
	<br />
	<html:link page="<%="/marksConfirmation.do?method=preparePrint&amp;executionYear=" + pageContext.findAttribute("executionYear") + "&amp;degree=" + pageContext.findAttribute("degree") + "&amp;curricularCourse=" + pageContext.findAttribute("curricularCourse") + "&amp;scopeCode=" + pageContext.findAttribute("scopeCode") %>">
		<bean:message key="link.masterDegree.administrativeOffice.print" />
	</html:link>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<html:link page="<%="/marksConfirmation.do?method=prepareMarksConfirmation&amp;executionYear=" + pageContext.findAttribute("executionYear") + "&amp;degree=" + pageContext.findAttribute("degree") + "&amp;curricularCourse=" + pageContext.findAttribute("curricularCourse") + "&amp;scopeCode=" + pageContext.findAttribute("scopeCode") + "&amp;useCase=confirm" %>">
		<bean:message key="link.masterDegree.administrativeOffice.marksConfirmation" />
	</html:link>
		
</logic:present>   
