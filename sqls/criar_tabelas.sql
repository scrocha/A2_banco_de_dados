CREATE TABLE Usuario
(
  IdUsuario INT NOT NULL,
  NomeUsuario VARCHAR(50) NOT NULL,
  SenhaUsuario VARCHAR(40) NOT NULL,
  EmailUsuario VARCHAR(100) NOT NULL,
  PRIMARY KEY (IdUsuario)
);

CREATE TABLE Canal
(
  PlanejamentoLive VARCHAR(150) NOT NULL,
  BioCanal VARCHAR(200) NOT NULL,
  NSeguidoresCanal INT NOT NULL,
  IdUsuario INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Espectador
(
  IdUsuario INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Doacao
(
  QuantiaDoacao INT NOT NULL,
  MensagemDoacao VARCHAR(200),
  IdDoacao INT NOT NULL,
  DataDoacao DATE NOT NULL,
  IdUsuarioCanal INT NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  PRIMARY KEY (IdDoacao),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario)
);

CREATE TABLE TagTransmi
(
  IdTagTransmi INT NOT NULL,
  NomeTag VARCHAR(50) NOT NULL,
  PRIMARY KEY (IdTagTransmi)
);

CREATE TABLE ChatSussurro
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

CREATE TABLE AssinaA
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

CREATE TABLE Transmissao
(
  CategoriaTransmi VARCHAR(50) NOT NULL,
  TituloTransmi VARCHAR(50) NOT NULL,
  IdTransmi INT NOT NULL,
  InicioTransmi DATE NOT NULL,
  NEspecTransmi INT NOT NULL,
  FimTransmi DATE NOT NULL,
  IdUsuarioCanal INT NOT NULL,
  PRIMARY KEY (IdTransmi),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario)
);

CREATE TABLE Clipe
(
  TituloClipe VARCHAR(200) NOT NULL,
  LinkClipe VARCHAR(200) NOT NULL,
  IdClipe INT NOT NULL,
  NVisualizacoesClipe INT NOT NULL,
  NCurtidasClipe INT NOT NULL,
  DataClipe DATE NOT NULL,
  IdTransmi INT NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  PRIMARY KEY (IdClipe),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario)
);

CREATE TABLE Comentario
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

CREATE TABLE AssisteA
(
  CargoEspectador VARCHAR(50),
  IdUsuarioEspectador INT NOT NULL,
  IdTransmi INT NOT NULL,
  PRIMARY KEY (IdUsuarioEspectador, IdTransmi),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi)
);

CREATE TABLE TransmiPossui
(
  IdTransmi INT NOT NULL,
  IdTagTransmi INT NOT NULL,
  PRIMARY KEY (IdTransmi, IdTagTransmi),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi),
  FOREIGN KEY (IdTagTransmi) REFERENCES TagTransmi(IdTagTransmi)
);