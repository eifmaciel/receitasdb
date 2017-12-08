from __future__ import unicode_literals

from django.db import models


class location(models.Model):
	city =models.CharField(max_length=50)
	state = models.CharField(max_length=3)
	zip  = models.BigIntegerField()
  	street =models.CharField(max_length=50)
  	storenum = models.AutoField(primary_key=True)


	class Meta:
		db_table = 'location'

class employee(models.Model):
	first = models.CharField(max_length=100)
	last = models.CharField(max_length=100)
	firedate= models.DateField()
	hiredate = models.DateField()
  	position = models.CharField(max_length=50)
	fulltime = models.BooleanField()
	location_id = models.ForeignKey(location, on_delete=models.CASCADE)
	empid= models.AutoField(primary_key=True)

	class Meta:
		db_table = 'employee'


class receipts(models.Model):
	receiptnumber= models.AutoField(primary_key=True)
	weekend= models.DateField()
	iscash = models.BooleanField()
	saledate = models.BooleanField()
	location_id = models.ForeignKey(location, on_delete=models.CASCADE)
	employee_id = models.ForeignKey(employee, on_delete=models.CASCADE)


	class Meta:
		db_table = 'receipts'

class goods(models.Model):
	id= models.AutoField(primary_key=True)
	food= models.CharField(max_length=50)
	type_food= models.CharField(max_length=50)
	price = models.FloatField()
	flavor = models.CharField(max_length=50)


	class Meta:
		db_table = 'goods'


class items(models.Model):
	id= models.AutoField(primary_key=True)
	goods_id = models.ForeignKey(goods, on_delete=models.CASCADE)
	quantidade = models.IntegerField()
	receipts_id = models.ForeignKey(receipts, on_delete=models.CASCADE)


	class Meta:
		db_table = 'items'

class Categoria(models.Model):
	codcat=models.AutoField(primary_key=True)
	nome= models.CharField(max_length=100)

	class Meta:
		db_table = 'categoria'

class Livro(models.Model):
	cpf = models.BigIntegerField(primary_key=True)
	nome= models.CharField(max_length=100)
	isbn = models.BigIntegerField()

	class Meta:
		db_table = 'livro'

class Ingredientes(models.Model):
	codingr = models.AutoField(primary_key=True)
	nome= models.CharField(max_length=50)
	descricao= models.CharField(max_length=100)


	class Meta:
		db_table = 'ingredientes'

class Funcionario(models.Model):
	cpf = models.BigIntegerField(primary_key=True)
	nome= models.CharField(max_length=50)
	dataingresso= models.DateField()
	salario= models.FloatField()


	class Meta:
		db_table = 'funcionario'


class Cozinheiro(models.Model):
	cpf = models.BigIntegerField(primary_key=True)
	nomefantasia= models.CharField(max_length=50)
	especialidade= models.CharField(max_length=100)


	class Meta:
		db_table = 'cozinheiro'

class Degustador(models.Model):
	cpf = models.BigIntegerField(primary_key=True)
	curso= models.CharField(max_length=50)


	class Meta:
		db_table = 'degustador'

class Receitas(models.Model):
	codrec = models.AutoField(primary_key=True)
	nome= models.CharField(max_length=50)
	nroporcoes = models.IntegerField()
	tempopreparo = models.CharField(max_length=50)
	grau = models.IntegerField(null=True, blank=True)
	data = models.CharField(max_length=50)
	descricao= models.CharField(max_length=150)
	cpfcoz = models.ForeignKey(Cozinheiro, on_delete=models.CASCADE)
	codcat= models.ForeignKey(Categoria, on_delete=models.CASCADE)
	idgood= models.ForeignKey(goods, on_delete=models.CASCADE)


	class Meta:
		db_table = 'receitas'

class TesteReceita(models.Model):
	codrec = models.ForeignKey(Receitas, on_delete=models.CASCADE)
	cpfdeg = models.ForeignKey(Degustador, on_delete=models.CASCADE)
	data = models.CharField(max_length=50)
	nota= models.IntegerField(max_length=150)


	class Meta:
		db_table = 'teste_receita'


class Conteudo(models.Model):
	isbn = models.ForeignKey(Livro, on_delete=models.CASCADE)
	codrec = models.ForeignKey(Receitas, on_delete=models.CASCADE)

	class Meta:
		db_table = 'conteudo'
