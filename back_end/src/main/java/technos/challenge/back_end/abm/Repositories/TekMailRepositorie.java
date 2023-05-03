package technos.challenge.back_end.abm.Repositories;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.*;
import technos.challenge.back_end.domain.Persona;
import technos.challenge.back_end.domain.TekMail;

@Qualifier("jpa")
public interface TekMailRepositorie extends JpaRepository<TekMail, Long> {
    public Page<TekMail>findByReceptoresContainsAndImportant(Persona receptor,boolean important,Pageable page);
    public Page<TekMail>findByEmisor(Persona emisor,Pageable page);
    public Page<TekMail>findByReceptoresContains(Persona receptor,Pageable page);
    public Page<TekMail>findByReceptoresContainsAndSpam(Persona receptor,boolean spam,Pageable page);
    public Page<TekMail>findByReceptoresContainsAndDraft(Persona receptor,boolean spam,Pageable page);
    public Page<TekMail>findByReceptoresContainsAndStarred(Persona receptor,boolean starred,Pageable page);
}
