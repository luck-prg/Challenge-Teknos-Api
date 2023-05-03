package technos.challenge.back_end.abm.Repositories;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import technos.challenge.back_end.domain.Attachment;
import technos.challenge.back_end.domain.TekMail;
@Qualifier("jpa")
public interface AttachmentRepositorie extends JpaRepository<Attachment, Long> {
}
