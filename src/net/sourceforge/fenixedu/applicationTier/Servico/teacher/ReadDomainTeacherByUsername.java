/**
* Dec 13, 2005
*/
package net.sourceforge.fenixedu.applicationTier.Servico.teacher;

import java.util.List;

import net.sourceforge.fenixedu.domain.IPerson;
import net.sourceforge.fenixedu.domain.IRole;
import net.sourceforge.fenixedu.domain.ITeacher;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.persistenceTier.ExcepcaoPersistencia;
import net.sourceforge.fenixedu.persistenceTier.ISuportePersistente;
import net.sourceforge.fenixedu.persistenceTier.PersistenceSupportFactory;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;

import pt.utl.ist.berserk.logic.serviceManager.IService;

/**
 * @author Ricardo Rodrigues
 *
 */

public class ReadDomainTeacherByUsername implements IService {

    public ITeacher run(final String username) throws ExcepcaoPersistencia{
        
        ISuportePersistente persistentSupport = PersistenceSupportFactory.getDefaultPersistenceSupport();
        List<IRole> roles = persistentSupport.getIPersistentRole().readAll();
        IRole teacherRole = (IRole) CollectionUtils.find(roles,new Predicate(){
            public boolean evaluate(Object object) {
                IRole role = (IRole) object;
                return role.getRoleType().equals(RoleType.TEACHER);
            }});
        
        IPerson person = (IPerson) CollectionUtils.find(teacherRole.getAssociatedPersons(), new Predicate(){
            public boolean evaluate(Object object) {
                IPerson tempPerson = (IPerson) object;
                return username.equals(tempPerson.getUsername());
            }});
        return person.getTeacher();
    }
}


