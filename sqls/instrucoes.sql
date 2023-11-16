/*
Instrução SQL que mostra as informações das transmissões referentes aos clipes. Exibe a quantidade, o número total de visualizações e de curtidas dos clipes, agrupando pelo título da transmissão. 
*/
SELECT t.titulotransmi, COUNT(c.idtransmi) AS numclipes, SUM(c.nvisualizacoesclipe) AS visualizacoesclipes, SUM(c.ncurtidasclipe) AS curtidasclipes
FROM clipe c, transmissao t
WHERE c.idtransmi = t.idtransmi
GROUP BY t.titulotransmi
ORDER BY visualizacoesclipes DESC;

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
Instrução SQL que mostra as informações dos Canais. Exibe o número de seguidores do canal, o total recebido com doações de espectadores o número total de comentários feitos em lives do canal
e a quantidade de bits doados, agrupa pelo usuário dono no canal. 
*/
SELECT u.nomeusuario AS Canal, SUM(ca.nseguidorescanal) AS NumSeguidores, SUM(d.quantiadoacao) AS DoacoesRecebidas, COUNT(c.idcomentario) AS NumComentarios, SUM(c.quantidadebits) AS BitsRecebidos
FROM usuario u, canal ca, comentario c, doacao d, transmissao t
WHERE ca.idusuario = u.idusuario AND ca.idusuario = d.idusuariocanal AND ca.idusuario = t.idusuariocanal AND t.idtransmi = c.idtransmi
GROUP BY u.nomeusuario
ORDER BY NumSeguidores desc;

/* Resultado: 
   canal    | numseguidores | doacoesrecebidas | numcomentarios | bitsrecebidos
------------+---------------+------------------+----------------+---------------
 YoDa       |       4811336 |          $200.00 |              2 |          1100
 Gaules     |       4000076 |            $5.00 |              1 |             0
 Casimito   |       3747040 |        $1,000.00 |              1 |             0
 paulanobre |        649756 |           $10.00 |              1 |            50
 nahzinhaa  |        584160 |          $100.00 |              2 |           150
 yulla      |        282231 |       $30,000.00 |              1 |             0
(6 rows)
*/


/*
Instrução SQL que mostra as informações das categorias de Transmissões. Exibe a quantidade de espectadores da categoria, o número de clipes da categoria, número de visualizações e likes dos
clipes da categoria, agrupando pelo nome da categoria. 
*/
SELECT t.categoriatransmi AS Categorias, SUM(t.nespectransmi) AS Num_Espectadores_Categoria, SUM(cl.Num_Clipes) AS Num_Clipes_Por_Categoria, SUM(cl.Vis_Live) AS Vis_Clipe_Por_Categoria, SUM(cl.Likes_Live) AS Likes_Clipes_Por_Categoria
FROM transmissao t
LEFT JOIN (SELECT cl.idtransmi, COUNT(DISTINCT cl.idclipe) AS Num_Clipes, SUM(cl.nvisualizacoesclipe) AS Vis_Live, SUM(cl.ncurtidasclipe) AS Likes_Live FROM clipe cl GROUP BY cl.idtransmi) cl
ON t.idtransmi = cl.idtransmi
GROUP BY t.categoriatransmi
ORDER BY Num_Espectadores_Categoria DESC;

/* Resultado: 
            categorias            | num_espectadores_categoria | num_clipes_por_categoria | vis_clipe_por_categoria | likes_clipes_por_categoria
----------------------------------+----------------------------+--------------------------+-------------------------+----------------------------
 Esporte                          |                    1000000 |                          |                         |
 Counter-Strike: Global Offensive |                     700000 |                        2 |                   35641 |                       1027
 VALORANT                         |                       2058 |                        2 |                     251 |                        100
 Minecraft                        |                       1345 |                        1 |                    1000 |                        321
 Just Chatting                    |                        120 |                        1 |                       9 |                          1
 League of Legends                |                         95 |                          |                         |
(6 rows)
*/

