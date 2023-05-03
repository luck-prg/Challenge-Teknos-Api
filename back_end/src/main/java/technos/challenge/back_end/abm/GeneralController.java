package technos.challenge.back_end.abm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import technos.challenge.back_end.abm.DTO.NewTekMailDTO;
import technos.challenge.back_end.abm.Repositories.FolderRepositorie;
import technos.challenge.back_end.abm.Repositories.PersonaRepositorie;
import technos.challenge.back_end.abm.Repositories.TekMailRepositorie;
import technos.challenge.back_end.domain.Folder;
import technos.challenge.back_end.domain.Persona;
import technos.challenge.back_end.domain.TekMail;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/teknos/lrodriguez-sm83/api")
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600) // Para que se conecte con el server Front
public class GeneralController {
    @Autowired
    @Qualifier("jpa")
    TekMailRepositorie tmrepo;
    @Autowired
    @Qualifier("jpa")
    PersonaRepositorie prepo;
    @Autowired
    @Qualifier("jpa")
    FolderRepositorie frepo;

    @GetMapping("/usuarios")
    public List<Persona> getPersonas(){
        return prepo.findAll();
    }
    @PostMapping("/usuario/nuevo")
    public Persona postPersona(@RequestBody Persona persona){
        return prepo.save(persona);
    }


    // ----------------------------------------------- GET TEKMAILS

    // ALL
    @GetMapping("/messages")
    public List<TekMail> getTekMails(){
        return tmrepo.findAll();
    }

    // INBOX

    @GetMapping("/messages/{persona_id}/inbox")
    public Page<TekMail> getTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                     Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByReceptoresContains(me,page);
    }

    // IMPORTANT

    @GetMapping("/messages/{persona_id}/important")
    public Page<TekMail> getImportantTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                              Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByReceptoresContainsAndImportant(me,true,page);
    }

    // SENT

    @GetMapping("/messages/{persona_id}/sent")
    public Page<TekMail> getSentTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                         Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByEmisor(me,page);
    }

    // DRAFT

    @GetMapping("/messages/{persona_id}/drafts")
    public Page<TekMail> getDraftsTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                            Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByReceptoresContainsAndDraft(me,true,page);
    }

    // SPAM

    @GetMapping("/messages/{persona_id}/spam")
    public Page<TekMail> getSpamTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                         Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByReceptoresContainsAndSpam(me,true,page);
    }

    // TRASH
    @GetMapping("/messages/{persona_id}/trash")
    public Page<TekMail> getTrashTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                          Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByEmisor(me,page);
    }

    // STARRED
    @GetMapping("/messages/{persona_id}/starred")
    public Page<TekMail> getstarredTekMails(@PathVariable(name = "persona_id") Long persona_id,
                                            Pageable page){
        Persona me = prepo.findById(persona_id).get();
        return tmrepo.findByReceptoresContainsAndStarred(me,true,page);
    }

    // ------------------------------- GET FOLDERS

    @GetMapping("/folders")
    public List<Folder> getFolders(){return frepo.findAll();}

    // --------------------------- POST TEKMAIL

    @PostMapping("/messages")
    public TekMail postTekMail(@RequestBody NewTekMailDTO mail){
        TekMail newmail = new TekMail();

        Persona from = this.validarUsuario(mail.getFrom());
        List<Persona> to = new ArrayList<Persona>();

        for(Persona persona : mail.getTo()){
            to.add(this.validarUsuario(persona));
        }

        newmail.setSubject(mail.getSubject());
        newmail.setMessage(mail.getMessage());
        newmail.setTime(mail.getTime());
        newmail.setRead(mail.isRead());
        newmail.setImportant(mail.isImportant());
        newmail.setStarred(mail.isStarred());

        determinarSiTieneArchivosAdjuntos(newmail,mail);
        determinarPosibleSpam(newmail);

        newmail.setLabels(mail.getLabels());
        newmail.setEmisor(from);
        newmail.setReceptores(to);

        return tmrepo.save(newmail);
    }

    // ---------------------------------------------- DELETE TEKMAIL

    @DeleteMapping("/messages/{tekmail_id}")
    public List<TekMail> deleteTekMail(@PathVariable(name = "tekmail_id") Long tekmaill_id){
        tmrepo.deleteById(tekmaill_id);
        return tmrepo.findAll();
    }

/*
    ALTER TABLE folders MODIFY id INT AUTO_INCREMENT;

    INSERT INTO folders (name,title,icon) VALUES ('inbox','Inbox','move_to_inbox'),
    ('sent','Sent','send'),('drafts','Drafts','drafts'),('spam','Spam','info'),('trash','Trash','delete'),
    ('starred','Starred','star'),('important','Important','label');

    */

    // ------------------------------------------ Metodos extra
    public Persona validarUsuario(Persona persona){
        Optional<Persona> from = prepo.findPersonaByEmailAndAndName(persona.getEmail(),persona.getName());
        if(!from.isPresent()){
            return prepo.save(persona);
        }
        return from.get();
    }
    public TekMail determinarPosibleSpam(TekMail mail){
        String[] palabrasClaveSpam = {"100% gratuito", "Acción ahora", "Acelera tu metabolismo", "Aumenta tus ventas", "Bajar de peso",
                "Compra ahora", "Compra segura", "Compre hoy", "Confidencial", "Dinero fácil", "Dinero rápido",
                "Dinero urgente", "Descarga gratis", "Descuento", "Descuento especial", "Dinero garantizado",
                "Elimina la grasa", "Elimina las arrugas", "En casa", "Envío gratis", "Exclusivo", "Extra",
                "Extra dinero", "Gana dinero", "Gane dinero rápido", "Garantía", "Gratis", "Haz clic aquí",
                "Hora limitada", "Hasta un 50% de descuento"};
        for(String palabra : palabrasClaveSpam){
            if(mail.getMessage().contains(palabra) || mail.getSubject().contains(palabra)){
                mail.setSpam(true);
                return mail;
            }
        }
        return mail;
    }
    public TekMail determinarSiTieneArchivosAdjuntos(TekMail tekmail,NewTekMailDTO mail){
        if(!mail.getAttachments().isEmpty()){
            tekmail.setHasAttachments(true);
            tekmail.setAttachments(mail.getAttachments());
        }
        return tekmail;
    }


}
