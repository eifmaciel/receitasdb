select REC.nome, CAT.nome, REC.data
    from receitas REC
    INNER JOIN categoria CAT on (CAT.codcat = REC.codcat_id) group by cpfcoz_id, REC.nome, CAT.nome, REC.data;
