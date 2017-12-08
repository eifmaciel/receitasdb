-- enumerar todos os nomes de receitas, sua categoria e data de invenção,
-- agrupadas por cada cozinheiro;
select REC.nome, CAT.nome, REC.data
    from receitas REC
    INNER JOIN categoria CAT on (CAT.codcat = REC.codcat_id) group by cpfcoz_id, REC.nome, CAT.nome, REC.data;

-- apresentar o nome de todos os cozinheiros da empresa (em ordem alfabética) e
-- seus nomes-fantasia, e o número de receitas produzidas por cada cozinheiro;

Select COZ.nomefantasia, count(REC.codrec) from cozinheiro COZ
    INNER JOIN receitas REC on (REC.cpfcoz_id = COZ.cpf) Group by COZ.cpf;

-- apresentar as receitas (nome, número de porções, tempo de preparação,
-- ingredientes e descrição) correspondentes ao produto (goods) mais vendido na
-- padaria;

SELECT REC.nome, REC.nroporcoes, REC.tempopreparo, REC.descricao, GOOD.food from receitas REC
	INNER JOIN goods GOOD on (REC.idgood_id = GOOD.id),
	INNER JOIN items GOOD.id in (select ITEM.goods_id_id, count(ITEM.id) as cont from items ITEM group by ITEM.goods_id_id order by cont desc limit 1 );

-- apresentar o número de receitas que fazem parte de cada livro, junto com o seu
-- título e nome de seu editor;
select count(CONT.codrec_id), LIV.nome, LIV.cpf from livro LIV
  INNER JOIN conteudo CONT on (LIV.isbn = CONT.isbn_id) group by LIV.isbn, LIV.nome, LIV.cpf;

-- apresentar o ingrediente mais utilizado por cada cozinheiro (no conjunto de
-- receitas que cada um produziu);
select GOOD.food, REC.nome, count(REC.idgood_id) from receitas REC
  INNER JOIN goods GOOD on (GOOD.id = REC.idgood_id) group by REC.cpfcoz_ID, GOOD.food, REC.nome;

-- apresentar o nome das receitas testadas por cada degustador, com as datas dos
-- testes e respectivas notas em ordem decrescente;

select REC.nome, TES.data, TES.nota from teste_receita TES
	INNER JOIN receitas REC on (REC.codrec = TES.codrec_id)
	Group by TES.cpfdeg_id, REC.nome, TES.data, TES.nota order by TES.nota desc;

-- apresentar o nome das receitas não testadas por degustadores;

select EMP.first, EMP.last, count(RECI.receiptnumber) as quant from employee EMP
	INNER JOIN receipts RECI on (RECI.employee_id_id = EMP.empid)
	group by EMP.empid order by quant desc;

-- apresentar o ranking dos funcionários (employees) com maior número de vendas
-- na padaria.

select EMP.first, EMP.last, count(RECI.receiptnumber) as quant from employee EMP
	INNER JOIN receipts RECI on (RECI.employee_id_id = EMP.empid)
	group by EMP.empid order by quant desc;
