USE `Events`;
BEGIN;
CALL insert_Empresa('891190346-1','Universidad de la Amazonia','http://www.udla.edu.co/v10/images/banners/Logo-2017.png','https://chaira.udla.edu.co/Chaira/Resources/Images/LogoUA.png','https://secure.aadcdn.microsoftonline-p.com/dbd5a2dd-bok3-8bvqguu0y1vqghy3semnwok8y0fkkf8gvmw5xs/logintenantbranding/0/illustration?ts=636234871951707997');
COMMIT;
#Generos
BEGIN;
CALL insert_Genero("Masculino");
CALL insert_Genero("Femenino");
CALL insert_Genero("Transexual");
COMMIT;

#Rol
BEGIN;
CALL insert_Rol('Administrador');
CALL insert_Rol('Usuario');
COMMIT;

#Peoples
BEGIN;
CALL insert_Persona('1996-02-22',1117542316,'Julio','Alfredo','Vasquez','Lievano',3506411011,1);
CALL insert_Persona('1980-10-11',102582581,'Angela',NULL,'Pena','Solis',3102804043,1);
COMMIT;

#Users 
BEGIN;
CALL insert_User_admin('Angelapena2018@Gmail.com','admin',2); 
CALL insert_Usuario('jualvali@live.com','phurion123',1);
COMMIT;

BEGIN;
CALL insert_Vistas('#','DashBoard','now-ui-icons business_badge');
CALL insert_Vistas('#','Gestionar Usuarios','now-ui-icons users_single-02');
CALL insert_Vistas('#','Gestionar Recursos','now-ui-icons ui-2_settings-90');
CALL insert_Vistas('#','Gestionar Eventos','now-ui-icons ui-1_calendar-60');
CALL insert_Vistas('#','Gestionar Asistencia','now-ui-icons files_paper');
CALL insert_Vistas('#','Gestionar Roles','now-ui-icons media-2_sound-wave');
CALL insert_Vistas('#','Gestionar Pagos','now-ui-icons shopping_tag-content');
CALL insert_Vistas('#','Generar Certificados','now-ui-icons files_single-copy-04');
COMMIT;

BEGIN;
CALL insert_SubVistas('../DashBoard/Profile','Mi perfil',1);
CALL insert_SubVistas('../DashBoard/AlterProfile','Modificar Datos Personales',1);

CALL insert_SubVistas('../Manage_Users/Index','Ver Usuarios',2);
CALL insert_SubVistas('../Manage_Users/Add','Agregar Usuario',2);
CALL insert_SubVistas('../Manage_Users/Alter','Modificar Usuarios',2);
CALL insert_SubVistas('../Manage_Users/Delete','Eliminar Usuarios',2);

CALL insert_SubVistas('../Manage_Resources/Index','Ver Recursos',3);
CALL insert_SubVistas('../Manage_Resources/Add','Agregar Recurso',3);
CALL insert_SubVistas('../Manage_Resources/Alter','Modificar Recursos',3);
CALL insert_SubVistas('../Manage_Resources/Delete','Eliminar Recurso',3);

CALL insert_SubVistas('../Manage_Resources/Index','Ver Eventos',4);
CALL insert_SubVistas('../Manage_Resources/Add','Crear Evento',4);
CALL insert_SubVistas('../Manage_Resources/Alter','Modificar Eventos',4);
CALL insert_SubVistas('../Manage_Resources/Delete','Eliminar Eventos',4);
CALL insert_SubVistas('../Manage_Resources/Register','Registrarce a Evento',4);#15

CALL insert_SubVistas('../Manage_Assistance/Index','Ver Asistencia',5);
CALL insert_SubVistas('../Manage_Assistance/Add','Crear Asistencia',5);
CALL insert_SubVistas('../Manage_Assistance/Alter','Modificar Asistencia',5);
CALL insert_SubVistas('../Manage_Assistance/Delete','Eliminar Asistencia',5);

CALL insert_SubVistas('../Manage_Roles/Index','Ver Roles',6);#20
CALL insert_SubVistas('../Manage_Roles/Add','Agregar Roles',6);
CALL insert_SubVistas('../Manage_Roles/Alter','Modificar Rol',6);
CALL insert_SubVistas('../Manage_Roles/Delete','Eliminar Roles',6);

CALL insert_SubVistas('../Manage_Payments/Index','Ver Pagos',7);#24
CALL insert_SubVistas('../Manage_Payments/Generate','Generar Colilla de Pago',7);
CALL insert_SubVistas('../Manage_Payments/Recep','Recepcion Colilla de Pago',7);
CALL insert_SubVistas('../Manage_Payments/Consul','Consultar Pago',7);

CALL insert_SubVistas('../Manage_Certificates/Index','Ver Certificados',8);
CALL insert_SubVistas('../Manage_Roles/Generate','Generar Certificado Pago',8);
COMMIT;

BEGIN;
#User
CALL insert_VistasYRoles(1,2);
CALL insert_VistasYRoles(2,2);
CALL insert_VistasYRoles(11,2);
CALL insert_VistasYRoles(15,2);
CALL insert_VistasYRoles(16,2);
CALL insert_VistasYRoles(24,2);
CALL insert_VistasYRoles(25,2);
CALL insert_VistasYRoles(26,2);
CALL insert_VistasYRoles(27,2);
CALL insert_VistasYRoles(28,2);
CALL insert_VistasYRoles(29,2);
CALL insert_VistasYRoles(1,1);
CALL insert_VistasYRoles(2,1);
CALL insert_VistasYRoles(3,1);
CALL insert_VistasYRoles(4,1);
CALL insert_VistasYRoles(5,1);
CALL insert_VistasYRoles(6,1);
CALL insert_VistasYRoles(7,1);
CALL insert_VistasYRoles(8,1);
CALL insert_VistasYRoles(9,1);
CALL insert_VistasYRoles(10,1);
CALL insert_VistasYRoles(11,1);
CALL insert_VistasYRoles(12,1);
CALL insert_VistasYRoles(13,1);
CALL insert_VistasYRoles(14,1);
CALL insert_VistasYRoles(15,1);
CALL insert_VistasYRoles(16,1);
CALL insert_VistasYRoles(17,1);
CALL insert_VistasYRoles(18,1);
CALL insert_VistasYRoles(19,1);
CALL insert_VistasYRoles(20,1);
CALL insert_VistasYRoles(21,1);
CALL insert_VistasYRoles(22,1);
CALL insert_VistasYRoles(23,1);
CALL insert_VistasYRoles(24,1);
CALL insert_VistasYRoles(25,1);
CALL insert_VistasYRoles(26,1);
CALL insert_VistasYRoles(27,1);
CALL insert_VistasYRoles(28,1);
CALL insert_VistasYRoles(29,1);
COMMIT;