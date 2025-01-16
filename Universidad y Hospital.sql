CREATE DATABASE UniversidadYHospital;

-- Caso 1. Universidad --

-- Tabla - Grupos --
CREATE TABLE Grupos (
    ID_Grupo INT PRIMARY KEY,
    Nombre_Grupo VARCHAR(50) NOT NULL
);

INSERT INTO Grupos (ID_Grupo, Nombre_Grupo) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, 'Grupo 3'),
(4, 'Grupo 4'),
(5, 'Grupo 5'),
(6, 'Grupo 6'),
(7, 'Grupo 7'),
(8, 'Grupo 8'),
(9, 'Grupo 9'),
(10, 'Grupo 10');

-- Tabla - Estudiantes --
CREATE TABLE Estudiantes (
    ID_Estudiante INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido_Paterno VARCHAR(50) NOT NULL,
    Apellido_Materno VARCHAR(50),
    Grupo INT,
    FOREIGN KEY (Grupo) REFERENCES Grupos(ID_Grupo)
);

INSERT INTO Estudiantes (ID_Estudiante, Nombre, Apellido_Paterno, Apellido_Materno, Grupo) VALUES
(1, 'Juan', 'Perez', 'Garcia', 1),
(2, 'Maria', 'Lopez', 'Hernandez', 2),
(3, 'Pedro', 'Martinez', 'Sanchez', 3),
(4, 'Ana', 'Gonzalez', 'Diaz', 4),
(5, 'Luis', 'Hernandez', 'Torres', 5),
(6, 'Sofia', 'Castro', 'Ramirez', 6),
(7, 'Laura', 'Torres', 'Morales', 7),
(8, 'Diego', 'Ruiz', 'Mendoza', 8),
(9, 'Valeria', 'Mora', 'Campos', 9),
(10, 'Carlos', 'Diaz', 'Lara', 10);

-- Tabla - Asignatura --
CREATE TABLE Asignaturas (
    ID_Asignatura INT PRIMARY KEY,
    Nombre_Asignatura VARCHAR(50) NOT NULL,
    ID_Grupo INT,
    FOREIGN KEY (ID_Grupo) REFERENCES Grupos(ID_Grupo)
);

INSERT INTO Asignaturas (ID_Asignatura, Nombre_Asignatura, ID_Grupo) VALUES
(101, 'Matemáticas', 1),
(102, 'Física', 2),
(103, 'Química', 3),
(104, 'Historia', 4),
(105, 'Biología', 5),
(106, 'Geografía', 6),
(107, 'Literatura', 7),
(108, 'Filosofía', 8),
(109, 'Computación', 9),
(110, 'Economía', 10);

-- Tabla - Momentos de Evaluación --
CREATE TABLE Momentos_Evaluacion (
    ID_Momento INT PRIMARY KEY,
    Nombre_Momento VARCHAR(50) NOT NULL
);

INSERT INTO Momentos_Evaluacion (ID_Momento, Nombre_Momento) VALUES
(1, 'Parcial 1'),
(2, 'Parcial 2'),
(3, 'Parcial 3'),
(4, 'Parcial 4'),
(5, 'Parcial 5'),
(6, 'Parcial 6'),
(7, 'Parcial 7'),
(8, 'Parcial 8'),
(9, 'Parcial 9'),
(10, 'Parcial 10');

-- Tabla - Actividades --
CREATE TABLE Actividades (
    ID_Actividad INT PRIMARY KEY,
    Nombre_Actividad VARCHAR(50) NOT NULL,
    Nota DECIMAL(5, 2),
    ID_Asignatura INT,
    ID_Momento INT,
    FOREIGN KEY (ID_Asignatura) REFERENCES Asignaturas(ID_Asignatura),
    FOREIGN KEY (ID_Momento) REFERENCES Momentos_Evaluacion(ID_Momento)
);

INSERT INTO Actividades (ID_Actividad, Nombre_Actividad, Nota, ID_Asignatura, ID_Momento) VALUES
(1, 'Tarea 1', 8.5, 101, 1),
(2, 'Examen 1', 9.0, 101, 2),
(3, 'Tarea 2', 7.5, 102, 3),
(4, 'Proyecto 1', 8.0, 103, 4),
(5, 'Tarea 3', 9.2, 104, 5),
(6, 'Examen 2', 7.8, 105, 6),
(7, 'Ensayo', 8.4, 106, 7),
(8, 'Investigación', 9.1, 107, 8),
(9, 'Práctica', 8.7, 108, 9),
(10, 'Debate', 9.0, 110, 10);






-- Caso 2. Hospital --

-- Tabla - Áreas --
CREATE TABLE Areas (
    ID_Area INT PRIMARY KEY,
    Nombre_Area VARCHAR(50) NOT NULL
);

INSERT INTO Areas (ID_Area, Nombre_Area) VALUES
(1, 'Cardiología'),
(2, 'Pediatría'),
(3, 'Neurología'),
(4, 'Oncología'),
(5, 'Ginecología'),
(6, 'Traumatología'),
(7, 'Endocrinología'),
(8, 'Urología'),
(9, 'Dermatología'),
(10, 'Gastroenterología');

-- Tabla - Doctores --
CREATE TABLE Doctores (
    ID_Doctor INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido_Paterno VARCHAR(50) NOT NULL,
    Apellido_Materno VARCHAR(50),
    Cedula VARCHAR(20),
    Especialidad VARCHAR(50),
    ID_Area INT,
    FOREIGN KEY (ID_Area) REFERENCES Areas(ID_Area)
);

INSERT INTO Doctores (ID_Doctor, Nombre, Apellido_Paterno, Apellido_Materno, Cedula, Especialidad, ID_Area) VALUES
(1, 'Luis', 'Martinez', 'Garcia', '12345', 'Cardiólogo', 1),
(2, 'Ana', 'Gomez', 'Lopez', '67890', 'Pediatra', 2),
(3, 'Carlos', 'Sanchez', 'Hernandez', '54321', 'Neurólogo', 3),
(4, 'Maria', 'Torres', 'Lara', '98765', 'Oncólogo', 4),
(5, 'Jose', 'Diaz', 'Morales', '56789', 'Ginecólogo', 5),
(6, 'Sofia', 'Ruiz', 'Martinez', '23456', 'Traumatólogo', 6),
(7, 'Pedro', 'Hernandez', 'Garcia', '34567', 'Endocrinólogo', 7),
(8, 'Laura', 'Lopez', 'Perez', '45678', 'Urólogo', 8),
(9, 'Clara', 'Mendoza', 'Cruz', '67812', 'Dermatólogo', 9),
(10, 'Fernando', 'Cruz', 'Vega', '98712', 'Gastroenterólogo', 10);

-- Tabla - Pacientes --
CREATE TABLE Pacientes (
    ID_Paciente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido_Paterno VARCHAR(50) NOT NULL,
    Apellido_Materno VARCHAR(50),
    Fecha_Nacimiento DATE
);

INSERT INTO Pacientes (ID_Paciente, Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento) VALUES
(1, 'Pedro', 'Lopez', 'Diaz', '1980-05-10'),
(2, 'Maria', 'Gonzalez', 'Perez', '1990-07-15'),
(3, 'Juan', 'Hernandez', 'Garcia', '2000-03-22'),
(4, 'Ana', 'Ruiz', 'Castro', '1985-11-01'),
(5, 'Luis', 'Diaz', 'Lopez', '1995-03-10'),
(6, 'Laura', 'Torres', 'Hernandez', '1992-07-08'),
(7, 'Carlos', 'Morales', 'Garcia', '1988-01-15'),
(8, 'Sofia', 'Cruz', 'Martinez', '2002-05-22'),
(9, 'Valeria', 'Mendoza', 'Lara', '1999-09-09'),
(10, 'Fernando', 'Garcia', 'Ruiz', '1980-12-17');

-- Tabla - Citas --
CREATE TABLE Citas (
    ID_Cita INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    ID_Paciente INT,
    ID_Doctor INT,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
    FOREIGN KEY (ID_Doctor) REFERENCES Doctores(ID_Doctor)
);

INSERT INTO Citas (ID_Cita, Fecha, Hora, ID_Paciente, ID_Doctor) VALUES
(1, '2025-01-15', '10:00:00', 1, 1),
(2, '2025-01-16', '11:30:00', 2, 2),
(3, '2025-01-17', '09:00:00', 3, 3),
(4, '2025-01-18', '13:00:00', 4, 4),
(5, '2025-01-19', '08:30:00', 5, 5),
(6, '2025-01-20', '15:00:00', 6, 6),
(7, '2025-01-21', '10:45:00', 7, 7),
(8, '2025-01-22', '14:15:00', 8, 8),
(9, '2025-01-23', '12:00:00', 9, 9),
(10, '2025-01-24', '16:30:00', 10, 10);