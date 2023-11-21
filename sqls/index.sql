/*
Cria um Índice na coluna NomeUsuario da tabela Usuario, uma coluna que pode ser usada para quase todas as pesquisas, já que tanto canais quanto espectadores possuem nome de usuário.
*/

CREATE INDEX Nome_de_Usuario ON Twitch.Usuario (NomeUsuario DESC);
