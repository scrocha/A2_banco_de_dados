SET SEARCH_PATH = Twitch;

INSERT INTO Usuario VALUES (1, 'Luizinha_gameplay', '**********', 'lulu@gmail.com');
INSERT INTO Usuario VALUES (2, 'Pedro_games', '**********', 'pedrinho@hotmail.com');
INSERT INTO Usuario VALUES (3, 'Casimito', '**********', 'casimiromiguel@gmail.com');
INSERT INTO Usuario VALUES (4, 'Gaules', '**********', 'tribrogaules@gmail.com');
INSERT INTO Usuario VALUES (5, 'marçadovolei', '**********', 'lfamarciano@gmail.com');
INSERT INTO Usuario VALUES (6, 'Sillas_fps_2011', '**********', 'sillasobrabo@gmail.com');
INSERT INTO Usuario VALUES (7, 'XipXapXD', '**********', 'manuxipxap@gmail.com');
INSERT INTO Usuario VALUES (8, 'paulanobre', '**********', 'paulanobre@gmail.com');
INSERT INTO Usuario VALUES (9, 'YoDa', '**********', 'felipeyoda@gmail.com');
INSERT INTO Usuario VALUES (10, 'JulioHeadshot', '**********', 'brabodobd@gmail.com');
INSERT INTO Usuario VALUES (11, 'nahzinhaa', '**********', 'nahcsgo@gmail.com');
INSERT INTO Usuario VALUES (12, 'yulla', '**********', 'yullalol@gmail.com');

INSERT INTO Canal VALUES (3, 'planejamento_3.png', 'bio_3.txt', 3747040);
INSERT INTO Canal VALUES (4, 'planejamento_4.png', 'bio_4.txt', 4000076);
INSERT INTO Canal VALUES (8, 'planejamento_8.png', 'bio_8.txt', 649756);
INSERT INTO Canal VALUES (9, 'planejamento_9.png', 'bio_9.txt', 2405668);
INSERT INTO Canal VALUES (11, 'planejamento_11.png', 'bio_11.txt', 292080);
INSERT INTO Canal VALUES (12, 'planejamento_12.png', 'bio_12.txt', 282231);

INSERT INTO Espectador VALUES (1);
INSERT INTO Espectador VALUES (2);
INSERT INTO Espectador VALUES (3);
INSERT INTO Espectador VALUES (4);
INSERT INTO Espectador VALUES (5);
INSERT INTO Espectador VALUES (6);
INSERT INTO Espectador VALUES (7);
INSERT INTO Espectador VALUES (10);

INSERT INTO Doacao VALUES (1, 100, ' ', '2023-02-15 10:30:45', 9, 6);
INSERT INTO Doacao VALUES (2, 5, 'G? 3? X?', '2023-06-28 15:15:30', 4, 10);
INSERT INTO Doacao VALUES (3, 30000, 'Ajuda para alcançar a meta!', '2023-09-04 20:00:00', 12, 5);
INSERT INTO Doacao VALUES (4, 1000, 'Manda salve pra Campos dos Goytacazes', '2022-11-19 08:45:20', 3, 1);
INSERT INTO Doacao VALUES (5, 50, 'Dale grêmio', '2012-04-02 14:20:55', 11, 7);
INSERT INTO Doacao VALUES (6, 10, 'bh é o galo doido', '2021-12-10 17:55:10', 8, 2);

INSERT INTO TagTransmi VALUES (1, 'Português');
INSERT INTO TagTransmi VALUES (2, 'fps');
INSERT INTO TagTransmi VALUES (3, 'moba');
INSERT INTO TagTransmi VALUES (4, 'Inglês');
INSERT INTO TagTransmi VALUES (5, 'IRL');
INSERT INTO TagTransmi VALUES (6, 'Gym');
INSERT INTO TagTransmi VALUES (7, 'Futebol');

INSERT INTO ChatSussurro VALUES (1, '2023-09-23 12:00:00', 'oi', 1, 2);
INSERT INTO ChatSussurro VALUES (2, '2012-10-10 03:00:00', 'BOooooOOo', 3, 4);
INSERT INTO ChatSussurro VALUES (3, '2015-11-17 14:06:09', 'Manda o pix ai', 5, 8);
INSERT INTO ChatSussurro VALUES (4, '2018-10-01 15:10:59', 'da sub pls', 6, 9);
INSERT INTO ChatSussurro VALUES (5, '2019-12-25 00:00:00', 'Feliz Natal', 7, 11);
INSERT INTO ChatSussurro VALUES (6, '2020-08-09 17:45:00', 'Feliz aniversário!', 10, 12);

INSERT INTO AssinaCanal VALUES (11, 6, '2023-05-23 09:10:25', 1, '2023-06-23 14:20:10');
INSERT INTO AssinaCanal VALUES (8, 7, '2021-08-07 16:40:15', 3, '2021-09-07 22:45:55');
INSERT INTO AssinaCanal VALUES (4, 5, '2020-12-12 21:25:50', 3, '2021-01-12 11:30:25');
INSERT INTO AssinaCanal VALUES (9, 1, '2020-03-30 12:15:05', 6, '2020-04-30 19:15:40');
INSERT INTO AssinaCanal VALUES (3, 10, '2016-06-14 18:55:30', 1, '2016-07-14 08:05:15');
INSERT INTO AssinaCanal VALUES (12, 2, '2017-09-25 07:30:40', 1, '2017-10-25 17:50:30');

INSERT INTO Transmissao VALUES (1, 'Minecraft', 'em busca da casa automática', '2020-09-07 14:30:20', '2020-09-07 18:30:20', 1345, 9);
INSERT INTO Transmissao VALUES (2, 'Counter-Strike: Global Offensive', 'Fluxo vs PaiN - Semi-final', '2020-12-25 20:15:40', '2020-12-25 21:15:40', 700000, 8);
INSERT INTO Transmissao VALUES (3, 'Just Chatting', 'resenha', '2018-03-08 09:05:15', '2018-03-08 09:59:15', 120, 4);
INSERT INTO Transmissao VALUES (4, 'Esporte', 'Flamengo x São Paulo', '2019-06-16 17:40:30', '2019-06-17 00:40:30', 1000000, 11);
INSERT INTO Transmissao VALUES (5, 'League of Legends', 'dando aula na ranked', '2019-09-29 08:25:55', '2019-09-30 00:00:55', 95, 12);
INSERT INTO Transmissao VALUES (6, 'VALORANT', 'ODDIK X MIBR GameChangers', '2021-12-05 12:10:10', '2021-12-05 13:40:10', 2058, 3);

INSERT INTO Clipe VALUES (1, 'Ta de CHEAT?', 'https://www.twitch.tv/Gaules/clip/TadeCHEAT', 250, 100, '2022-05-15 10:30:45', 6);
INSERT INTO Clipe VALUES (2, 'que balinha', 'https://www.twitch.tv/Gaules/clip/quebalinha', 1000, 321, '2022-08-28 15:15:30', 1);
INSERT INTO Clipe VALUES (3, 'tropeçou e caiu kkkkkk', 'https://www.twitch.tv/paulanobre/clip/tropecouecaiu', 9, 1, '2022-12-04 20:00:00', 3);
INSERT INTO Clipe VALUES (4, 'MIBR PERDEU', 'https://www.twitch.tv/YoDa/clip/MIBRPERDEU', 741, 4, '2023-02-19 08:45:20', 2);
INSERT INTO Clipe VALUES (5, 'clutch do KSCERATO', 'https://www.twitch.tv/nahzinhaa/clip/clutchdoKSCERATO', 1, 0, '2023-06-02 14:20:55', 6);
INSERT INTO Clipe VALUES (6, 'Fim do primeiro mapa mibr', 'https://www.twitch.tv/Gaules/clip/Fimdoprimeiromapamibr', 34900, 1023, '2023-10-10 17:55:10', 2);

INSERT INTO Comentario VALUES (1, 4, 'ele é mt ruim', 0, '2023-06-14 10:25', 6);
INSERT INTO Comentario VALUES (2, 6, 'ban', 0, '2023-09-22 16:40', 5);
INSERT INTO Comentario VALUES (3, 4, 'hj tem clutch', 150, '2014-12-05 19:15', 6);
INSERT INTO Comentario VALUES (4, 3, 'como da sub?', 0, '2013-03-30 08:05', 5);
INSERT INTO Comentario VALUES (5, 5, 'peguei ad :(', 0, '2020-07-18 14:30', 1);
INSERT INTO Comentario VALUES (6, 1, 'casimiro eu te amo', 1000, '2014-10-29 22:10', 4);
INSERT INTO Comentario VALUES (7, 1, 'vasco da gama', 100, '2019-02-02 07:55', 3);
INSERT INTO Comentario VALUES (8, 2, 'algm pra jogar cs?', 50, '2018-05-11 11:20', 2);

INSERT INTO AssisteTransmi VALUES (1, 2, 'Espectador');
INSERT INTO AssisteTransmi VALUES (2, 7, 'Moderador');
INSERT INTO AssisteTransmi VALUES (3, 5, 'Moderador');
INSERT INTO AssisteTransmi VALUES (4, 1, 'Espectador');
INSERT INTO AssisteTransmi VALUES (5, 10, 'Espectador');
INSERT INTO AssisteTransmi VALUES (6, 6, 'Moderador');

INSERT INTO TransmiPossui VALUES (1, 1);
INSERT INTO TransmiPossui VALUES (2, 2);
INSERT INTO TransmiPossui VALUES (2, 4);
INSERT INTO TransmiPossui VALUES (3, 6);
INSERT INTO TransmiPossui VALUES (5, 1);
INSERT INTO TransmiPossui VALUES (5, 3);
INSERT INTO TransmiPossui VALUES (6, 4);
INSERT INTO TransmiPossui VALUES (6, 2);
