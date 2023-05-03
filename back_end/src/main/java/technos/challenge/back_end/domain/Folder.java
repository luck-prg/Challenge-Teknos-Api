package technos.challenge.back_end.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Folders")
@Getter @Setter
public class Folder {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name="name",columnDefinition = "VARCHAR(100)")
    private String name;
    @Column(name="title",columnDefinition = "VARCHAR(100)")
    private String title;
    @Column(name="icon",columnDefinition = "VARCHAR(100)")
    private String icon;


}
