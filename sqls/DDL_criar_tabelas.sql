--- Feito em 13/11/2023

CREATE SCHEMA IF NOT EXISTS Twitch;

SET SEARCH_PATH = Twitch;

CREATE TABLE IF NOT EXISTS Usuario
(
  IdUsuario INT NOT NULL,
  NomeUsuario VARCHAR(30) NOT NULL,
  SenhaUsuario VARCHAR(15) NOT NULL,
  EmailUsuario VARCHAR(100) NOT NULL,
  PRIMARY KEY (IdUsuario)
);

CREATE TABLE IF NOT EXISTS Canal
(
  IdUsuario INT NOT NULL,
  PlanejamentoLive VARCHAR(50) NOT NULL,
  BioCanal VARCHAR(250) NOT NULL,
  NSeguidoresCanal INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE IF NOT EXISTS Espectador
(
  IdUsuario INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE IF NOT EXISTS Doacao
(
  IdDoacao INT NOT NULL,
  QuantiaDoacao Money NOT NULL,
  MensagemDoacao VARCHAR(200),
  DataDoacao DATE NOT NULL,
  IdUsuarioCanal INT NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  PRIMARY KEY (IdDoacao),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario)
);

CREATE TABLE IF NOT EXISTS TagTransmi
(
  IdTagTransmi INT NOT NULL,
  NomeTag VARCHAR(50) NOT NULL,
  PRIMARY KEY (IdTagTransmi)
);

CREATE TABLE IF NOT EXISTS ChatSussurro
(
  IdSussurro INT NOT NULL,
  DataSussurro DATE NOT NULL,
  MensagemSussurro VARCHAR(200) NOT NULL,
  IdUsuarioRemetente INT NOT NULL,
  IdUsuarioDestinatario INT NOT NULL,
  PRIMARY KEY (IdSussurro),
  FOREIGN KEY (IdUsuarioRemetente) REFERENCES Usuario(IdUsuario),
  FOREIGN KEY (IdUsuarioDestinatario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE IF NOT EXISTS AssinaA
(
  InicioAssina DATE NOT NULL,
  DuracaoAssina INT NOT NULL,
  FimAssina DATE NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  IdUsuarioCanal INT NOT NULL,
  PRIMARY KEY (IdUsuarioEspectador, IdUsuarioCanal),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario)
);

CREATE TABLE IF NOT EXISTS Transmissao
(
  IdTransmi INT NOT NULL,
  TituloTransmi VARCHAR(50) NOT NULL,
  CategoriaTransmi VARCHAR(50) NOT NULL,
  InicioTransmi DATE NOT NULL,
  NEspecTransmi INT NOT NULL,
  FimTransmi DATE NOT NULL,
  IdUsuarioCanal INT NOT NULL,
  PRIMARY KEY (IdTransmi),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario)
);

CREATE TABLE IF NOT EXISTS Clipe
(
  IdClipe INT NOT NULL,
  TituloClipe VARCHAR(200) NOT NULL,
  LinkClipe VARCHAR(200) NOT NULL,
  NVisualizacoesClipe INT NOT NULL,
  NCurtidasClipe INT NOT NULL,
  DataClipe DATE NOT NULL,
  IdTransmi INT NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  PRIMARY KEY (IdClipe),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario)
);

CREATE TABLE IF NOT EXISTS Comentario
(
  IdComentario INT NOT NULL,
  DataComentario DATE NOT NULL,
  ConteudoComentario VARCHAR(200) NOT NULL,
  QuantidadeBits INT,
  IdUsuarioEspectador INT NOT NULL,
  IdTransmi INT NOT NULL,
  PRIMARY KEY (IdComentario),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi)
);

CREATE TABLE IF NOT EXISTS AssisteA
(
  CargoEspectador VARCHAR(50),
  IdUsuarioEspectador INT NOT NULL,
  IdTransmi INT NOT NULL,
  PRIMARY KEY (IdUsuarioEspectador, IdTransmi),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi)
);

CREATE TABLE IF NOT EXISTS TransmiPossui
(
  IdTransmi INT NOT NULL,
  IdTagTransmi INT NOT NULL,
  PRIMARY KEY (IdTransmi, IdTagTransmi),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi),
  FOREIGN KEY (IdTagTransmi) REFERENCES TagTransmi(IdTagTransmi)
);