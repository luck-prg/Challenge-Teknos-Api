# Challenge-Teknos-Api

## Pasos para un correcto funcionamiento de la API


### Contexto


Para que la API pueda funcionar tal como se desarrollo se recomienda utilizar MySql y Java. Cabe aclarar que el archivo que se va ejecutar en un IDE deberá poder
descargar las dependencias que se encuentran dentro del POM.xml, allí se encontrarán aquellas dependencias que fueron utilizadas para realizar la API mediante Spring e Hibernate.


Una vez realizado esto, procedemos a completar los siguientes pasos.

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

