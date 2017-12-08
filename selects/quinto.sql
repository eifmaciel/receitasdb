 --apresentar o ingrediente mais utilizado por cada cozinheiro (no conjunto de
-- receitas que cada um produziu);
select GOOD.food, REC.nome, count(REC.idgood) from receitas REC
  INNER JOIN goods GOOD on (GOOD.id = REC.idgood_id)

