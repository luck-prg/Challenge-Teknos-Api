package technos.challenge.back_end.abm.DTO;

import lombok.Getter;
import lombok.Setter;
import technos.challenge.back_end.domain.Attachment;
import technos.challenge.back_end.domain.Persona;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Getter @Setter
public class NewTekMailDTO {
    private Persona from;
    private List<Persona> to;
    private String subject;
    private String message;
    private String time;
    private boolean read;
    private boolean starred;
    private boolean hasAttachments;
    private boolean important;
    private List<Attachment> attachments = new ArrayList<Attachment>();
    private Set<String> labels;
}
