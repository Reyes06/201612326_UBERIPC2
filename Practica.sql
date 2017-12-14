CREATE DATABASE Practica
USE Practica

create table cliente(
cui int primary key not null,
nombre varchar(50) not null,
localidad varchar(50) not null,
viajesRealizados int not null
);

create table servicioUber(
id_servicioUber int primary key not null,
nombre varchar(50) not null
);

create table empleadoUber(
id_conductorUber int primary key not null,
nombre varchar(50) not null,
trabajoRealizado varchar(50) not null,
id_servicioUber int not null,
foreign key (id_servicioUber) references servicioUber(id_servicioUber)
);

create table servicioAdquirido(
id_servicioAdquirido int primary key not null,
costo double not null,
lugarActual varchar(50) not null,
lugarDestino varchar(50) not null,
numPersonas int not null,
id_servicioUber int not null,
cui int not null,
foreign key (id_servicioUber) references servicioUber(id_servicioUber),
foreign key (cui) references cliente (cui)
);

create table contratacionEmpleado(
id_contratacion int primary key not null,
id_conductorUber int not null,
id_servicioAdquirido int not null,
foreign key (id_conductorUber) references empleadoUber(id_conductorUber),
foreign key (id_servicioAdquirido) references servicioAdquirido(id_servicioAdquirido)
);

create table bicicletaUber(
id_bicicleta int primary key not null,
marca varchar(50) not null,
id_servicioUber int not null,
foreign key (id_servicioUber) references servicioUber(id_servicioUber)
);

create table contratacionBicicleta(
id_contratacion int primary key not null,
id_bicicletaUber int not null,
id_servicioAdquirido int not null,
foreign key (id_servicioAdquirido) references servicioAdquirido(id_servicioAdquirido),
foreign key (id_bicicletaUber) references bicicletaUber(id_bicicleta)
);

create table informacionServicio(
id_informacion int primary key not null,
informacionServicio varchar(250) not null,
id_servicioUber int not null,
foreign key (id_servicioUber) references servicioUber(id_servicioUber)
);

create table conductorUberX(
cui int primary key not null,
nombre varchar(50) not null,
cod_autorizacion int not null,
id_servicioUber int not null,
foreign key (id_servicioUber) references servicioUber(id_servicioUber)
);

create table vehiculoUber(
id_vehiculo int primary key not null,
modelo varchar(50) not null,
marca varchar(50) not null,
color varchar(50) not null,
capacidad int not null
);

create table contratacioVehiculo(
id_contratacion int primary key not null,
id_vehiculo int not null,
id_servicioAdquirido int not null,
foreign key (id_vehiculo) references VehiculoUber(id_vehiculo),
foreign key (id_servicioAdquirido) references servicioAdquirido(id_servicioAdquirido)
);

create table vehiculosPorServicio(
id_VPS int primary key not null,
id_servicioUber int not null,
id_vehiculo int not null,
foreign key (id_servicioUber) references servicioUber(id_servicioUber),
foreign key (id_vehiculo) references vehiculoUber(id_vehiculo)
);

create table asociacion(
id_asociacion int primary key not null,
nombre varchar(50) not null
);

create table servicioAsociacion(
id_servicioAsociacion int primary key not null,
concepto varchar(50) not null,
id_asociacion int not null,
id_servicioAdquirido int not null,
foreign key (id_asociacion) references asociacion(id_asociacion),
foreign key (id_servicioAdquirido) references servicioAdquirido(id_servicioAdquirido)
);

create table asociacionesPorServicio(
id_APS int primary key not null,
id_asociacion int not null,
id_servicioAdquirido int not null,
foreign key (id_asociacion) references asociacion(id_asociacion),
foreign key (id_servicioAdquirido) references servicioAdquirido(id_servicioAdquirido)
);