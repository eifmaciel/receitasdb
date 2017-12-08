select EMP.first, EMP.last, count(RECI.receiptnumber) as quant from employee EMP
	INNER JOIN receipts RECI on (RECI.employee_id_id = EMP.empid)
	group by EMP.empid order by quant desc;