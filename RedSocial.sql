/*
Workshop6 back4
Grupo 4:
Harold Bermudes
Julian Landinez
Jennifer Maigual
Ingrid Piñerez
*/

/******************* Seccion 1: Creacion de base de datos y tablas *********************/
CREATE DATABASE redSocial;
USE redSocial;

CREATE TABLE Usuarios (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Fecha_creación TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Publicaciones (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_usuario INT UNSIGNED NOT NULL,
    Contenido_publicación TEXT NOT NULL,
    Fecha_publicación DATE NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID)
);

CREATE TABLE Comentarios (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_usuario INT UNSIGNED NOT NULL,
    ID_publicación INT UNSIGNED NOT NULL,
    Contenido_comentario TEXT NOT NULL,
    Fecha_comentario DATE NOT NULL,
    FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (ID_publicación) REFERENCES Publicaciones(ID)
);

CREATE TABLE Mensajes (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_remitente INT UNSIGNED NOT NULL,
    ID_receptor INT UNSIGNED NOT NULL,
    Contenido_mensaje TEXT NOT NULL,
    Fecha_mensaje TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_remitente) REFERENCES Usuarios(ID),
    FOREIGN KEY (ID_receptor) REFERENCES Usuarios(ID)
);

CREATE TABLE Solicitud_Amistad (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Estado VARCHAR(20) NOT NULL
);

CREATE TABLE Amigos (
	ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ID_Usuario INT UNSIGNED NOT NULL,
    ID_Amigo INT UNSIGNED NOT NULL,
    ID_Estado INT UNSIGNED NOT NULL,
    Fecha_solicitud DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (ID_Amigo) REFERENCES Usuarios(ID),
    FOREIGN KEY (ID_Estado) REFERENCES Solicitud_Amistad(ID)
);


/*************************** Seccion 2: Creacion de datos ***************************/

INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Levon','Alvar','lalvar0','lalvar0@squarespace.com','2019-05-10');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Jessie','Drohun','jdrohun1','jdrohun1@bandcamp.com','2018-03-21');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Maxwell','O''Hagan','mohagan2','mohagan2@ucoz.com','2020-01-01');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Marjie','Escalera','mescalera3','mescalera3@cmu.edu','2020-03-05');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Dolf','Gauche','dgauche4','dgauche4@chron.com','2019-08-19');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Fidelia','Uvedale','fuvedale5','fuvedale5@stanford.edu','2018-09-12');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Bird','Jahnisch','bjahnisch6','bjahnisch6@parallels.com','2020-02-11');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Felix','Sanchez','felixsan','sanchezfelix@gmail.com','2019-12-31');
INSERT INTO Usuarios (Nombre,Apellido,Nombre_usuario,Email,Fecha_creación) VALUES ('Fix','Sahez','fixsan','sanczfelix@gmail.com','2018-12-31');
SELECT * FROM Usuarios;

INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (1,'Empezo el invierno','2023-05-13'), (1,'Programming','2022-10-25'), (1,'De paseo...','2023-01-18');
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (2,'Hoy es un bonito día','2022-05-23');
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (3,'Trabajando','2023-06-11');
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (4,'Vamos de paseo','2021-09-27'), (4,'En familia','2023-04-10'); 
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (5,'Vamos a comer esta noche','2021-11-02');
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (6,'Hoy ha sido un dia increible','2023-07-14');
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (7,'Promociones solo por hoy','2022-06-29');
INSERT INTO Publicaciones (ID_usuario,Contenido_publicación,Fecha_publicación) VALUES (8,'De vacaciones','2023-02-11');
SELECT * FROM Publicaciones;

INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (2,1,'Gran talento!!','2023-10-28'), (5,1,'Hola, ¿como estas?','2023-05-14'), (5,1,'El mejor clima','2023-06-10');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (1,2,'Dandola toda','2022-10-27'), (2,2,'Exitos!','2023-10-30');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (2,3,'Toma muchas fotos!','2023-11-01'), (2,3,'Buen viaje','2023-11-01');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (1,4,'¿A donde iran?','2023-10-29'), (2,4,':3','2022-06-24');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (7,5,'Animo!','2023-06-12'), (4,5,'¿Donde estan ubicados?','2023-06-13');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (3,6,'Que la pases rico','2021-09-28'), (7,6,'Preciooo!!!','2021-09-30');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (6,7,'El presente es un regalo','2023-04-12'), (3,7,'Con toda la actitud','2023-04-20');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (2,8,'¿A donde vamos?','2021-11-03'), (6,8,'Uff seria genial','2023-08-07');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (5,9,'No lo dudo ;)','2023-08-11'), (4,9,'Me alegra mucho :)','2023-07-15'), (5,9,'Totalmente de acuerdo','2023-08-15');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (3,10,'Los recomiendo totalmente','2022-06-30'), (4,10,'¿Cuales productos tienen en promocion?','2022-07-01');
INSERT INTO Comentarios (ID_usuario,ID_publicación,Contenido_comentario,Fecha_comentario) VALUES (7,11,'Se ve genial','2023-03-17'), (5,11,'Que paisaje tan lindo','2023-02-13');
SELECT * FROM Comentarios;

INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (1,2,'Hola,como estas?'), (1,5,'Muchas gracias'); 
INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (2,1,'Bien y tú?'), (2,5,'Me ayudas con un like?');
INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (3,7,'Nuestros precios son accequibles'), (3,4,'Tenemos varios medios de pago');
INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (4,3,'¿Cuales medios de pago manejan?'), (4,7,'Claro que si!!');
INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (5,1,'Me encanto tu presentación'), (5,2,'Por supuesto'), (5,6,'Igualmente, un abrazo!!');
INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (6,5,'Un gusto conocerte'), (6,4,'Gracias por compartir');
INSERT INTO Mensajes (ID_remitente,ID_receptor,Contenido_mensaje) VALUES (7,3,'Quiero un celular'), (7,4,'Nos vemos pronto');
SELECT * FROM Mensajes;

INSERT INTO Solicitud_Amistad (Estado) VALUES ("Aceptada"), ("Pendiente"), ("Rechazada");
SELECT * FROM Solicitud_Amistad;

INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (1,2,1,'2023-10-27'), (1,5,1,'2023-01-27'), (1,4,2,'2023-09-17');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (2,5,1,'2020-12-17'), (2,1,1,'2023-10-27'), (2,6,2,'2023-08-27');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (3,7,1,'2022-06-20'), (3,4,1,'2021-04-25'), (3,5,3,'2022-10-06');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (4,3,1,'2021-04-25'), (4,6,1,'2023-03-04'), (4,7,1,'2021-02-05'), (4,2,2,'2023-08-07');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (5,6,1,'2023-08-07'), (5,1,1,'2023-01-27'), (5,2,1,'2020-12-17'), (5,7,3,'2021-10-26');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (6,4,1,'2023-03-04'), (6,5,1,'2023-08-07'), (6,1,3,'2022-01-16');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (7,4,1,'2021-02-05'), (7,3,1,'2022-06-20'), (7,6,2,'2023-11-02');
INSERT INTO Amigos (ID_Usuario,ID_Amigo,ID_Estado,Fecha_solicitud) VALUES (8,4,3,'2021-02-05');
SELECT * FROM Amigos;


/*************************** Seccion 3: Consultas ***************************/

# 1.Obtener todas las publicaciones de un usuario
SELECT * FROM Publicaciones WHERE ID_usuario = 1;

# 2.Buscar publicaciones con cierta palabra clave
SELECT * FROM Publicaciones WHERE Contenido_publicación LIKE '%Hoy%';

# 3.Mostrar los comentarios de una publicación
SELECT * FROM Comentarios WHERE ID_publicación = 2;

# 4.Encontrar los amigos de un usuario
SELECT CONCAT(U.Nombre,' ',U.Apellido) AS Amigo FROM Usuarios U INNER JOIN Amigos A 
	ON U.ID = A.ID_Amigo WHERE A.ID_Estado = 1 AND A.ID_Usuario = 7;

# 5.Contar la cantidad de amigos de un usuario
SELECT COUNT(*) AS 'Cantidad de amigos' FROM Usuarios U INNER JOIN Amigos A 
	ON U.ID = A.ID_Amigo WHERE A.ID_Estado = 1 AND A.ID_Usuario = 4;

# 6.Mostrar las publicaciones de los amigos de un usuario   
SELECT CONCAT(U.Nombre,' ',U.Apellido) AS Amigos, P.Contenido_publicación, P.Fecha_publicación 
	FROM Publicaciones P INNER JOIN Amigos A ON P.ID_usuario = A.ID_Amigo INNER JOIN Usuarios U 
    ON U.ID = A.ID_Amigo WHERE A.ID_Estado = 1 AND A.ID_Usuario = 1;

# 7.Listar los usuarios que han comentado una publicación
SELECT  DISTINCT CONCAT(U.Nombre,' ',U.Apellido) AS 'Usuarios que han comentado:' 
	FROM Usuarios U INNER JOIN Comentarios C ON U.ID = C.ID_usuario;

# 8.Buscar amigos que aún no han aceptado la solicitud de amistad
SELECT DISTINCT CONCAT(U.Nombre,' ',U.Apellido) AS 'Pendiente aceptar solicitud de amistad' 
	FROM Usuarios U INNER JOIN Amigos A ON U.ID = A.ID_Amigo WHERE A.ID_Estado = 2;
    
# 9.Mostrar las publicaciones más recientes ordenadas por fecha
SELECT * FROM Publicaciones ORDER BY Fecha_publicación DESC;

# 10.Mostrar la actividad reciente (publicaciones y comentarios) de un usuario
SELECT 'Publicación' AS Tipo, Fecha_publicación AS Fecha, Contenido_publicación AS Contenido FROM Publicaciones 
	WHERE ID_usuario = 1 UNION ALL SELECT 'Comentario' AS Tipo, Fecha_comentario AS Fecha, 
    Contenido_comentario AS Contenido FROM Comentarios WHERE ID_usuario = 1 ORDER BY Fecha DESC;
    
# 11.Encontrar las publicaciones de amigos en un rango de fechas
SELECT CONCAT(U.Nombre,' ',U.Apellido) AS Amigo, P.Contenido_publicación, P.Fecha_publicación AS 'Rango de fecha' 
	FROM Publicaciones P INNER JOIN Amigos A ON P.ID_usuario = A.ID_Amigo INNER JOIN Usuarios U 
    ON U.ID = A.ID_Amigo WHERE A.ID_Estado = 1 AND A.ID_Usuario = 4 AND P.Fecha_publicación BETWEEN '2023-01-01' AND '2023-11-04';
    
# 12.Obtener los usuarios que han enviado mensajes a otro usuario
SELECT DISTINCT CONCAT(U.Nombre,' ',U.Apellido) AS 'Usuarios que han enviado mensajes:' 
	FROM Usuarios U INNER JOIN Mensajes M ON U.ID = M.ID_remitente;

# 13.Mostrar los mensajes entre dos usuarios  
SELECT * FROM Mensajes WHERE (ID_remitente = 1 AND ID_receptor = 2 ) 
	OR (ID_remitente = 2 AND ID_receptor = 1 ) ORDER BY Fecha_mensaje;

# 14.Encontrar usuarios que no tienen amigos
SELECT U.ID, CONCAT(U.Nombre,' ',U.Apellido) AS Usuario FROM Usuarios U LEFT JOIN Amigos A ON U.ID = A.ID_Usuario WHERE A.ID IS NULL 
UNION
SELECT U.ID, CONCAT(U.Nombre,' ',U.Apellido) AS Usuario FROM Usuarios U WHERE (U.ID IN (SELECT A.ID_Usuario FROM Amigos A WHERE A.ID_Estado IN (2,3)) OR U.ID IN
	(SELECT A.ID_Amigo FROM Amigos A WHERE A.ID_Estado IN (2,3))) AND U.ID NOT IN (SELECT A.ID_Usuario 
    FROM Amigos A WHERE A.ID_Estado IN (1)) AND U.ID NOT IN (SELECT A.ID_Amigo FROM Amigos A WHERE A.ID_Estado IN (1));

# 15.Mostrar los usuarios que han comentado sus propias publicaciones
SELECT DISTINCT CONCAT(U.Nombre,' ',U.Apellido) AS 'Usuarios que han comentado sus publicaciones:', 
	C.ID_publicación FROM Usuarios U INNER JOIN Comentarios C ON U.ID = C.ID_usuario 
    INNER JOIN Publicaciones P ON C.ID_publicación = P.ID WHERE P.ID_usuario = U.ID;

# 16.Listar las 3 publicaciones más comentadas        
SELECT P.Contenido_publicación AS 'Publicaciones más comentadas' FROM Publicaciones P 
	INNER JOIN Comentarios C ON P.ID = C.ID_publicación GROUP BY C.ID_publicación 
    ORDER BY COUNT(*) DESC LIMIT 3;
