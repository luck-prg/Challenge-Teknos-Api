package technos.challenge.back_end.abm.Repositories;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import technos.challenge.back_end.domain.Persona;
import technos.challenge.back_end.domain.TekMail;

import java.util.Optional;

@Qualifier("jpa")
public interface PersonaRepositorie extends JpaRepository<Persona, Long> {
    public Optional<Persona> findPersonaByEmailAndAndName(String email,String name);
}
