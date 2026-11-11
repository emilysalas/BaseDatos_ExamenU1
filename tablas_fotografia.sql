USE proyecto_estudio_fotografico;

CREATE TABLE Cliente (
    id_cliente      INT          NOT NULL AUTO_INCREMENT,
    nombre          VARCHAR(50)  NOT NULL,
    apellido        VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) UNIQUE,
    fecha_registro  DATE         NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE Telefono_Cliente (
    id_telefono  INT          NOT NULL AUTO_INCREMENT,
    telefono     VARCHAR(15)  NOT NULL,
    id_cliente   INT          NOT NULL,
    PRIMARY KEY (id_telefono),
    UNIQUE (id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE Fotografo (
    id_fotografo  INT          NOT NULL AUTO_INCREMENT,
    nombre        VARCHAR(50)  NOT NULL,
    apellido      VARCHAR(50)  NOT NULL,
    especialidad  VARCHAR(60)  NOT NULL,
    telefono      VARCHAR(15),
    estado        VARCHAR(20)  NOT NULL DEFAULT 'Activo',
    PRIMARY KEY (id_fotografo)
);

CREATE TABLE Paquete_Servicio (
    id_paquete           INT            NOT NULL AUTO_INCREMENT,
    nombre_paquete       VARCHAR(80)    NOT NULL,
    descripcion          VARCHAR(255),
    precio_base          DECIMAL(10,2)  NOT NULL CHECK (precio_base >= 0),
    duracion_horas       INT            NOT NULL CHECK (duracion_horas > 0),
    tipo_entrega_base    VARCHAR(30)    NOT NULL,
    incluye_impresiones  BOOLEAN        NOT NULL DEFAULT FALSE,
    costo_impresion      DECIMAL(10,2)  DEFAULT 0 CHECK (costo_impresion >= 0),
    PRIMARY KEY (id_paquete)
);

CREATE TABLE Sesion_Fotografica (
    id_sesion          INT            NOT NULL AUTO_INCREMENT,
    fecha              DATE           NOT NULL,
    ubicacion          VARCHAR(150)   NOT NULL,
    tipo_entrega       VARCHAR(30)    NOT NULL,
    recargo_impresion  DECIMAL(10,2)  NOT NULL DEFAULT 0 CHECK (recargo_impresion >= 0),
    monto_total        DECIMAL(10,2)  NOT NULL CHECK (monto_total >= 0),
    estado_sesion      VARCHAR(20)    NOT NULL DEFAULT 'Programada',
    id_cliente         INT            NOT NULL,
    id_fotografo       INT            NOT NULL,
    id_paquete         INT            NOT NULL,
    PRIMARY KEY (id_sesion),
    FOREIGN KEY (id_cliente)   REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_fotografo) REFERENCES Fotografo(id_fotografo),
    FOREIGN KEY (id_paquete)   REFERENCES Paquete_Servicio(id_paquete)
);

CREATE TABLE Pago (
    id_pago      INT            NOT NULL AUTO_INCREMENT,
    monto        DECIMAL(10,2)  NOT NULL CHECK (monto > 0),
    fecha_pago   DATE           NOT NULL,
    metodo_pago  VARCHAR(30)    NOT NULL,
    concepto     VARCHAR(100),
    id_sesion    INT            NOT NULL,
    PRIMARY KEY (id_pago),
    FOREIGN KEY (id_sesion) REFERENCES Sesion_Fotografica(id_sesion)
);

CREATE TABLE Entrega_Material (
    id_entrega                INT           NOT NULL AUTO_INCREMENT,
    formato_entrega           VARCHAR(20)   NOT NULL,
    cantidad_fotos_digitales  INT           DEFAULT 0 CHECK (cantidad_fotos_digitales >= 0),
    cantidad_fotos_impresas   INT           DEFAULT 0 CHECK (cantidad_fotos_impresas >= 0),
    detalles_producto_fisico  VARCHAR(255),
    estado_entrega            VARCHAR(30)   NOT NULL DEFAULT 'En laboratorio',
    fecha_entrega_estimada    DATE,
    fecha_entrega_real        DATE,
    direccion_envio           VARCHAR(200),
    id_sesion                 INT           NOT NULL UNIQUE,
    PRIMARY KEY (id_entrega),
    FOREIGN KEY (id_sesion) REFERENCES Sesion_Fotografica(id_sesion)
);

CREATE TABLE Factura (
    id_factura          INT            NOT NULL AUTO_INCREMENT,
    numero_factura      VARCHAR(20)    NOT NULL UNIQUE,
    fecha_emision       DATE           NOT NULL,
    valor_total         DECIMAL(10,2)  NOT NULL CHECK (valor_total >= 0),
    ruc_cedula_cliente  VARCHAR(13)    NOT NULL,
    id_sesion           INT            NOT NULL UNIQUE,
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_sesion) REFERENCES Sesion_Fotografica(id_sesion)
);