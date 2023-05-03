package technos.challenge.back_end.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "Personas")
@Getter @Setter
public class Persona {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name="name", columnDefinition = "VARCHAR(200)")
    private String name;
    @Column(name="email", columnDefinition = "VARCHAR(200)")
    private String email;
    @Column(name="avatar", columnDefinition = "VARCHAR(200)")
    private String avatar;

    public Persona(){}
    public Persona(String name, String email, String avatar) {
        this.name = name;
        this.email = email;
        this.avatar = avatar;
    }

}
