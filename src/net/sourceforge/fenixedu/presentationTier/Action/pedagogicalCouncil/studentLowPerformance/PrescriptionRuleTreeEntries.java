package net.sourceforge.fenixedu.presentationTier.Action.pedagogicalCouncil.studentLowPerformance;

import java.math.BigDecimal;

import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.domain.PrescriptionEnum;

class PrescriptionRuleTreeEntries extends PrescriptionRuleGeneric {

    public PrescriptionRuleTreeEntries() {
	super();
    }

    @Override
    public BigDecimal getMinimumEcts() {
	return new BigDecimal(59.5);
    }

    @Override
    public int getNumberOfEntriesStudentInSecretary() {
	return 3;
    }

    @Override
    public PrescriptionEnum getPrescriptionEnum() {
	return PrescriptionEnum.ALLPRESCRIPTION;
    }

    @Override
    public ExecutionYear getRegistrationStart() {
	return ExecutionYear.readCurrentExecutionYear().getPreviousExecutionYear().getPreviousExecutionYear();
    }

}
