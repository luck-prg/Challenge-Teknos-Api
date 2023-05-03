package technos.challenge.back_end.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Set;

@Entity
@Table(name = "TekMails")
@Getter @Setter
public class TekMail {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "emisor_id", referencedColumnName = "id")
    private Persona emisor;
    @ManyToMany
    @JoinTable(name = "receptores",
            joinColumns = @JoinColumn(name = "tekmail_id"),
            inverseJoinColumns = @JoinColumn(name = "persona_id"))
    private List<Persona> receptores;

    @Column(name="subject_c", columnDefinition = "TEXT")
    private String subject;
    @Column(name="message_c", columnDefinition = "TEXT")
    private String message;
    @Column(name="time_c")
    private String time;
    @Column(name="read_c",columnDefinition = "boolean default false")
    private boolean read;
    @Column(name = "starred_c",columnDefinition = "boolean default false")
    private boolean starred;
    @Column(name = "spam_c",columnDefinition = "boolean default false")
    private boolean spam; // Agregado
    @Column(name = "draft_c", columnDefinition = "boolean default false")
    private boolean draft; // Agregado
    @Column(name = "trash_c", columnDefinition = "boolean default false")
    private boolean trash; // Agregado
    @Column(name = "important_c", columnDefinition = "boolean default false")
    private boolean important;
    @Column(name = "hasAttachments_c", columnDefinition = "boolean default false")
    private boolean hasAttachments;
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "tekmail_id",referencedColumnName = "id")
    private List<Attachment> attachments;
    @ElementCollection
    @CollectionTable(name = "labels",
            joinColumns = @JoinColumn(name = "label_id"))
    @Column(name = "label")
    private Set<String> labels;

    public TekMail() {}
}
