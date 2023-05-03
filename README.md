# Challenge-Teknos-Api

## Pasos para un correcto funcionamiento de la API


### Contexto

Para que la API pueda funcionar tal como se desarrollo se recomienda utilizar MySql y Java. Cabe aclarar que el archivo que se va ejecutar en un IDE deberá poder
descargar las dependencias que se encuentran dentro del POM.xml, allí se encontrarán aquellas dependencias que fueron utilizadas para realizar la API mediante Spring e Hibernate.

Una vez realizado esto, tenemos 2 opciones para inicialziar nuestra base de datos:

1- La primera es ir a la carpeta resources (\back_end\src\main\resources) donde ahi dentro encontraran la carpeta database que contendrá la base de datos exportada, con ella podran importarla y trabajar con algunos datos creados. Para poder importar un archivo sql en mysql recomiendo este video: https://www.youtube.com/watch?v=jTs1nSwAcRM 

Una vez importada es importante revisar el paso 1 que se menciona abajo para la segunda opcion y mantener el estado de hibernate en update.

2- Crear la base de datos sin ningun dato cargado. Se explica a continuacion: 

### PASO 1: Configurando la base de datos

El primer paso consta de inicializar la base de datos que utilizaremos, para eso es necesario abrir MySQL y crear un Schema con el siguiente nombre: challengeteknos 


![image](https://user-images.githubusercontent.com/101908731/235837740-a77c281e-24df-42b2-bbe0-e99d1f9bbb3a.png)

Una vez creado, es necesario dirigirnos al IDE en el cual estamos visualizando el desarrollo de la API mediante el lenguaje de Java y buscaremos el archivo 
"application.properties" que se encuentra en la carpeta "resources". Una vez allí dentro tendremos que modificar el username y el password por los que usted utiliza 
en su aplicacion MySql, osea aquellos valores que utiliza como admin para poder modificar dentro de su instancia local.

![image](https://user-images.githubusercontent.com/101908731/235838069-c7b97fee-5604-49bb-93f9-ac9635d86942.png)

 IMPORTANTE: Tenga en cuenta lo siguiente, la primera vez que usted ejecute este programa debera correrlo con "spring.jpa.hibernate.ddl-auto=create", caso contrario no
 creara la base de datoas y fallara. Una vez creada la base de datos es OBLIGATORIO cambiar el valor create por update para que no se borren los valores almacenados (spring.jpa.hibernate.ddl-auto=update)
 
Aclarado esto, ahora sí podemos ejecutar nuestro programa y pasar al siguiente paso.



### PASO 2: Iniciando Servidor

El primer paso consta de iniciar el servidor en el cual se correra nuestra API, para ello es necesario ir al archivo BackEndApplication y ejecutarlo. 

![image](https://user-images.githubusercontent.com/101908731/235838650-65d0e445-418e-4452-b37c-bae1080937e2.png)

Veremos en la terminal como Spring crea las tablas necesarias y desarrolladas para este challenge. Una vez finalizado le aparecerá el siguiente mensaje: 


![image](https://user-images.githubusercontent.com/101908731/235839360-39ab7b49-3bf4-4b5e-8fe7-062e6900e9ed.png)



Cuando este aparezca es necesario volver a MySql y realizar la siguiente Query,esta es necesaria para poder crear los folders:

ALTER TABLE folders MODIFY id INT AUTO_INCREMENT;


INSERT INTO folders (name,title,icon) VALUES ('inbox','Inbox','move_to_inbox'),('sent','Sent','send'),('drafts','Drafts','drafts'),('spam','Spam','info'),('trash','Trash','delete'),('starred','Starred','star'),('important','Important','label');


### PASO 3: Comenzar a realizar peticiones

Una vez finalizado los dos pasos anteriores usted podrá empezar a consumir la API. En el proximo apartado podra ver como realizarlo.

### DOCUMENTACIÓN

Para acceder a la api --> http://localhost:8080/teknos/lrodriguez-sm83/api

RESPECTO A LA ENTIDAD PERSONA ( es aquella que se vincula con el tekmail, puede ser emisor de este o mismo ser parte de una lista de receptores)

Get de usuarios http://localhost:8080/teknos/lrodriguez-sm83/api/usuarios

Post de usuarios http://localhost:8080/teknos/lrodriguez-sm83/api/usuario/nuevp

RESPECTO A LA ENTIDAD TEKMAIL

Get todos los tekmails --> http://localhost:8080/teknos/lrodriguez-sm83/api/messages

Para obtener a partir de un usuario en particular que es parte de los receptores de esos mail y sus carpetas se escribe de la siguiente forma : http://localhost:8080/teknos/lrodriguez-sm83/api/messages/{persona_id}/{folder_name}

reemplazamos los valores {persona_id} por un id del usuario y {folder_name} por el nombre de la carpeta. Ejemplo: http://localhost:8080/teknos/lrodriguez-sm83/api/messages/2/important

En el caso de la carpeta Trash solo es necesario acceder al siguiente link: http://localhost:8080/teknos/lrodriguez-sm83/api/messages/trash

Para ver que carpetas existen: http://localhost:8080/teknos/lrodriguez-sm83/api/folders

ALTA Y BAJA DE TEKMAILS

Para dar de alta un tekmail es necesario realizar un POST en: http://localhost:8080/teknos/lrodriguez-sm83/api/messages y enviar un json de la siguiente forma: 

![image](https://user-images.githubusercontent.com/101908731/235946900-3dd926d3-052e-4479-aa2b-665b0639282b.png)

![image](https://user-images.githubusercontent.com/101908731/235946998-97ebdc09-f641-4eec-bcf8-eac2db832762.png)


Para realizar una baja logica a un tekmail es necesario insertar el id del tekmail a eliminar y realizar un DELETE en: http://localhost:8080/teknos/lrodriguez-sm83/api/messages/delete/{tekmail_id}

Para realizar una baja permanente a un tekmail es necesario insertar el id del tekmail a eliminar y realizar un DELETE en: http://localhost:8080/teknos/lrodriguez-sm83/api/messages/{tekmail_id}


### Proximas mejoras

- Manejo de errores.
- Que cada usuario pueda controlas los tekmails que les enviaron, con esto me refiero a que si dos usuarios son receptores de un mismo mail estos mismos tiene la posibilidad de manejas datos distintos del mail, ya sea porque uno lo destaco y otro no, etc.
- Mejorar funcionalidad de los tekmail borradores.
- Realizar consultas mas especificas, para obtener tekmails muchos mas especificos.
