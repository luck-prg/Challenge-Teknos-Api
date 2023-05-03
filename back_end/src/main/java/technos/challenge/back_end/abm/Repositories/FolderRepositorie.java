package technos.challenge.back_end.abm.Repositories;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import technos.challenge.back_end.domain.Folder;
@Qualifier("jpa")
public interface FolderRepositorie extends JpaRepository<Folder, Long> {
}
