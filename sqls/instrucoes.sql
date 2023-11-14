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

