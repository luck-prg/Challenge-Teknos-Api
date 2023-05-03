package technos.challenge.back_end.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "Attachments")
@Getter @Setter
public class Attachment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name="type", columnDefinition = "VARCHAR(200)")
    private String type;
    @Column(name="fileName", columnDefinition = "VARCHAR(200)")
    private String fileName;
    @Column(name="preview", columnDefinition = "VARCHAR(200)")
    private String preview;
    @Column(name="url", columnDefinition = "VARCHAR(200)")
    private String url;
    @Column(name="size", columnDefinition = "VARCHAR(200)")
    private String size;


    public Attachment() {}
    public Attachment(String type, String fileName, String preview, String url, String size) {
        this.type = type;
        this.fileName = fileName;
        this.preview = preview;
        this.url = url;
        this.size = size;
    }
}
