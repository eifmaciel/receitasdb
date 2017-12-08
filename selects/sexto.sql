select REC.nome, TES.data, TES.nota from teste_receita TES
	INNER JOIN receitas REC on (REC.codrec = TES.codrec_id)
	Group by TES.cpfdeg_id, REC.nome, TES.data, TES.nota order by TES.nota desc;