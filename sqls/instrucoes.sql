/*
Instrução SQL que mostra as informações das transmissões referentes aos clipes. Mostra a quantidade, o número total de visualizações e de curtidas dos clipes, agrupando pelo título da transmissão. 
*/
SELECT t.titulotransmi, COUNT(c.idtransmi) AS numclipes, SUM(c.nvisualizacoesclipe) AS visualizacoesclipes, SUM(c.ncurtidasclipe) AS curtidasclipes
FROM clipe c, transmissao t
WHERE c.idtransmi = t.idtransmi
GROUP BY t.titulotransmi
ORDER BY visualizacoesclipes desc;

/* Resultado: 
        titulotransmi        | numclipes | visualizacoesclipes | curtidasclipes
-----------------------------+-----------+---------------------+----------------
 Fluxo vs PaiN - Semi-final  |         2 |               35641 |           1027
 em busca da casa automática |         1 |                1000 |            321
 ODDIK X MIBR GameChangers   |         2 |                 251 |            100
 resenha                     |         1 |                   9 |              1
(4 rows)
*/


/*
Instrução SQL que mostra as informações dos comentários de espectadores. Mostra a quantidade de bits doados e o número total de comentários, agrupando pelo nome do usuário que fez o comentário. 
*/
SELECT u.nomeusuario, SUM(c.quantidadebits) AS BitsDoados, COUNT(c.idusuarioespectador) AS NumComentarios
FROM usuario u, comentario c
WHERE u.idusuario = c.idusuarioespectador
GROUP BY u.nomeusuario
ORDER BY BitsDoados desc;

/* Resultado: 
    nomeusuario    | bitsdoados | numcomentarios
-------------------+------------+----------------
 XipXapXD          |       1000 |              1
 Sillas_fps_2011   |        150 |              2
 Pedro_games       |        150 |              2
 marçadovolei      |          0 |              2
 Luizinha_gameplay |          0 |              1
(5 rows)
*/