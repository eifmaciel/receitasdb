Select COZ.nomefantasia, count(REC.codrec) from cozinheiro COZ
    INNER JOIN receitas REC on (REC.cpfcoz_id = COZ.cpf) Group by COZ.cpf;
