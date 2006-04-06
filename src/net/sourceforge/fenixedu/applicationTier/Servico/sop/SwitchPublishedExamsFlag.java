/*
 *
 * Created on 2003/08/15
 */

package net.sourceforge.fenixedu.applicationTier.Servico.sop;

/**
 * 
 * @author Luis Cruz
 */
import java.util.List;

import net.sourceforge.fenixedu.applicationTier.Service;
import net.sourceforge.fenixedu.domain.ExecutionDegree;
import net.sourceforge.fenixedu.domain.ExecutionPeriod;
import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;

public class SwitchPublishedExamsFlag extends Service {

    public void run(final Integer executionPeriodOID) throws ExcepcaoPersistencia {
        final ExecutionPeriod executionPeriod = rootDomainObject.readExecutionPeriodByOID(executionPeriodOID);
        final ExecutionYear executionYear = executionPeriod.getExecutionYear();
        final List<ExecutionDegree> executionDegrees = ExecutionDegree.getAllByExecutionYear(executionYear.getYear());

        if (!executionDegrees.isEmpty()) {
            final Boolean examsPublicationState = new Boolean(!executionDegrees.get(0)
                    .getTemporaryExamMap().booleanValue());

            for (final ExecutionDegree executionDegree : executionDegrees) {
                executionDegree.setTemporaryExamMap(examsPublicationState);
            }
        }
    }
}