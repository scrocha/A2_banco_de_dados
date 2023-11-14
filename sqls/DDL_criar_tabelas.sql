--- Feito em 13/11/2023

/*
Arquivo para criar o banco de dados da Twitch a partir de Engenharia Reversa para a disciplina de
Banco de Dados, Alunos: Sillas, Luís Felipe e Manuela.
*/


/*
Cria um Schema da Twitch caso ele não exista e o seleciona como path para criar as tabelas.
*/

CREATE SCHEMA IF NOT EXISTS Twitch;

SET SEARCH_PATH = Twitch;

/*
Cria a tabela de usuários do banco de dados
*/

CREATE TABLE IF NOT EXISTS Usuario
(
  IdUsuario INT NOT NULL,
  NomeUsuario VARCHAR(30) NOT NULL,
  SenhaUsuario VARCHAR(15) NOT NULL,
  EmailUsuario VARCHAR(100) NOT NULL,
  PRIMARY KEY (IdUsuario)
);

/*
Cria a tabela de canal do banco de dados que são usuários especializados.
*/

CREATE TABLE IF NOT EXISTS Canal
(
  IdUsuario INT NOT NULL,
  PlanejamentoLive VARCHAR(50) NOT NULL,
  BioCanal VARCHAR(250) NOT NULL,
  NSeguidoresCanal INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

/*
Cria a tabela de espectador do banco de dados que são usuários especializados.
*/

CREATE TABLE IF NOT EXISTS Espectador
(
  IdUsuario INT NOT NULL,
  PRIMARY KEY (IdUsuario),
  FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

/*
Cria a tabela de doação para que canais possam receber doações de espectadores.
*/

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

/*
Cria a tabela de tag de transmissão onde cada transmissão pode possuir tags.
*/

CREATE TABLE IF NOT EXISTS TagTransmi
(
  IdTagTransmi INT NOT NULL,
  NomeTag VARCHAR(50) NOT NULL,
  PRIMARY KEY (IdTagTransmi)
);

/*
Cria a tabela de ChatSussurro que é por onde usuários podem enviar mensagens para outros usuários
*/

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

/*
Cria a tabela de assinar canais que relaciona um espectador com um canal, onde um espectador assina à um canal,
com uma duração e um usuário não pode assinar o mesmo canal enquanto ele já estiver em uma assinatura com este canal.
*/

CREATE TABLE IF NOT EXISTS AssinaCanal
(
  IdUsuarioCanal INT NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  InicioAssina DATE NOT NULL,
  DuracaoAssina INT NOT NULL,
  FimAssina DATE NOT NULL,
  PRIMARY KEY (IdUsuarioEspectador, IdUsuarioCanal),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario)
);

/*
Cria a tabela de transmissão onde cada transmissão é feita por um canal.
*/

CREATE TABLE IF NOT EXISTS Transmissao
(
  IdTransmi INT NOT NULL,
  CategoriaTransmi VARCHAR(50) NOT NULL,
  TituloTransmi VARCHAR(50) NOT NULL,
  InicioTransmi DATE NOT NULL,
  FimTransmi DATE NOT NULL,
  NEspecTransmi INT NOT NULL,
  IdUsuarioCanal INT NOT NULL,
  PRIMARY KEY (IdTransmi),
  FOREIGN KEY (IdUsuarioCanal) REFERENCES Canal(IdUsuario)
);

/*
Cria a tabela de clipe onde o clipe é feito por um espectador em uma transmissão.
*/

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

/*
Cria a tabela comentário onde cada comentário é feito por um espectador em uma transmissão.
*/

CREATE TABLE IF NOT EXISTS Comentario
(
  IdComentario INT NOT NULL,
  IdTransmi INT NOT NULL,
  ConteudoComentario VARCHAR(200) NOT NULL,
  QuantidadeBits INT,
  DataComentario DATE NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  PRIMARY KEY (IdComentario),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi)
);

/*
Cria a tabela assiste transmissão que relaciona um espectador com uma transmissão caso o espectador
assista a transmissão.
*/

CREATE TABLE IF NOT EXISTS AssisteTransmi
(
  IdTransmi INT NOT NULL,
  IdUsuarioEspectador INT NOT NULL,
  CargoEspectador VARCHAR(50),
  PRIMARY KEY (IdUsuarioEspectador, IdTransmi),
  FOREIGN KEY (IdUsuarioEspectador) REFERENCES Espectador(IdUsuario),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi)
);

/*
Cria a tabela transmissão possui que relaciona a transmissão com as tags q ela possui.
*/

CREATE TABLE IF NOT EXISTS TransmiPossui
(
  IdTransmi INT NOT NULL,
  IdTagTransmi INT NOT NULL,
  PRIMARY KEY (IdTransmi, IdTagTransmi),
  FOREIGN KEY (IdTransmi) REFERENCES Transmissao(IdTransmi),
  FOREIGN KEY (IdTagTransmi) REFERENCES TagTransmi(IdTagTransmi)
);