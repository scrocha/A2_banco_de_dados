/*
Instrução SQL que mostra as informações das transmissões referentes aos clipes. Exibe a quantidade, o número total de visualizações e de curtidas dos clipes, agrupando pelo título da transmissão. 
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
Instrução SQL que mostra as informações dos comentários de espectadores. Exibe a quantidade de bits doados e o número total de comentários, agrupando pelo nome do usuário que fez o comentário. 
*/
SELECT t.categoriatransmi AS Categorias, SUM(t.nespectransmi) AS Espectadores_Por_Categoria, SUM(), COUNT(c.idtransmi) AS NumClipes
FROM transmissao t, clipe c,




