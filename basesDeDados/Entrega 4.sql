-- A. Junções de 2 ou mais tabelas, com ORDER BY:
SELECT *
FROM pokemon
JOIN categoria ON pokemon.COD_POK = categoria.COD_CATEGORIA
ORDER BY pokemon.COD_POK, categoria.COD_CATEGORIA;

-- B. Junções de 2 ou mais tabelas, com ORDER BY e filtros na cláusula WHERE:
SELECT *
FROM pokemon
JOIN especie ON pokemon.COD_POK = especie.COD_ESPECIE
WHERE especie.NOME_ESPECIE = 'Weed PokÃƒÂ©mon'
ORDER BY pokemon.COD_POK, especie.COD_ESPECIE;

-- C. Junções de 3 ou mais tabelas, com ORDER BY e filtros na cláusula WHERE:
select * from pokemon
join habilidades on pokemon.COD_POK = habilidades.COD_HAB
join tipo on habilidades.COD_HAB = tipo.COD_TIPO
where tipo.NOME_TIPO = 'Grass'
order by pokemon.COD_POK, habilidades.COD_HAB, tipo.COD_TIPO;

-- D. Junção de 3 ou mais tabelas, usando os operadores LIKE e BETWEEN:

SELECT *
FROM pokemon
JOIN categoria ON pokemon.COD_POK = categoria.COD_CATEGORIA
JOIN habilidades ON categoria.COD_CATEGORIA = habilidades.COD_HAB
WHERE pokemon.NOME LIKE '%Bulbasaur%' AND pokemon.VALOR_ATAQUE BETWEEN 20 AND 50
ORDER BY pokemon.nome, categoria.TIPO_CATEGORIA, habilidades.HABILIDADES;
select * FROM categoria;
-- E. Junção de 2 ou mais tabelas, usando os operadores IN e IS NULL/IS NOT NULL:
SELECT *
FROM pokemon
JOIN categoria ON pokemon.COD_POK = categoria.COD_CATEGORIA IN ('Grass', 'fire') AND categoria.TIPO_CATEGORIA IS NOT NULL
ORDER BY pokemon.COD_POK, categoria.COD_CATEGORIA;

-- F. Junção de 2 ou mais tabelas com GROUP BY, sem HAVING, usando uma função agregada qualquer (MIN, MAX, AVG, SUM, COUNT). Use ORDER BY:
SELECT *
FROM pokemon
JOIN categoria ON pokemon.COD_POK = categoria.COD_CATEGORIA
GROUP BY pokemon.COD_POK
ORDER BY pokemon.COD_POK

-- G. Junção de 2 ou mais tabelas com GROUP BY e HAVING, usando uma função agregada qualquer (MIN, MAX, AVG, SUM, COUNT):

SELECT categoria.TIPO_CATEGORIA, COUNT(*) AS nome
FROM pokemon
JOIN categoria ON pokemon.COD_POK = categoria.COD_CATEGORIA
JOIN tipo ON pokemon.COD_POK = COD_TIPO
GROUP BY categoria.TIPO_CATEGORIA
HAVING COUNT(*) > 5;

-- H. Subselect sem correlação:
SELECT nome
FROM pokemon
WHERE categoria.COD_CATEGORIA IN (SELECT COD_CATEGORIA FROM categoria WHERE TIPO_CATEGORIA = 'Fire');

-- I. Subselect com correlação:
SELECT nome
FROM pokemon p
WHERE EXISTS (SELECT 1 FROM habilidades h WHERE h.COD_HAB = p.COD_POK AND h.NUMEROHABILIDADES = '2');

-- J. Subselect com EXISTS:
SELECT nome
FROM pokemon
WHERE EXISTS (SELECT 1 FROM categoria WHERE categoria.COD_CATEGORIA = pokemon.COD_POK);





