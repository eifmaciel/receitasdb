CREATE TABLE "categoria" (
    "codcat" serial NOT NULL PRIMARY KEY,
    "nome" varchar(100) NOT NULL);

CREATE TABLE "cozinheiro" (
    "cpf" bigint NOT NULL PRIMARY KEY,
    "nomefantasia" varchar(50) NOT NULL,
    "especialidade" varchar(100) NOT NULL);

CREATE TABLE "degustador" (
    "cpf" bigint NOT NULL PRIMARY KEY,
    "curso" varchar(50) NOT NULL);

CREATE TABLE "livro" (
    "isbn" bigint NOT NULL,
	"nome" varchar(100) NOT NULL,
    "cpf" bigint NOT NULL PRIMARY KEY);

CREATE TABLE "location" 	(
    "city" varchar(50) NOT NULL,
	"state" varchar(3) NOT NULL,
	"zip" bigint NOT NULL,
	"street" varchar(50) NOT NULL,
	"storenum" serial NOT NULL PRIMARY KEY);

CREATE TABLE "funcionario" (
    "cpf" bigint NOT NULL PRIMARY KEY,
    "nome" varchar(50) NOT NULL,
    "dataingresso" date NOT NULL,
    "salario" double precision NOT NULL);

CREATE TABLE "employee" (
    "first" varchar(100) NOT NULL,
    "last" varchar(100) NOT NULL,
    "firedate" date NOT NULL,
    "hiredate" date NOT NULL,
    "position" varchar(50) NOT NULL,
    "fulltime" boolean NOT NULL,
    "empid" serial NOT NULL PRIMARY KEY,
    "location_id_id" integer NOT NULL,
    CONSTRAINT "employee_location_id_id_304cfaad_fk_location_storenum" FOREIGN KEY (
    	"location_id_id") REFERENCES "location" (
    	"storenum") DEFERRABLE INITIALLY DEFERRED);

CREATE TABLE "ingredientes" (
	"codingr" serial NOT NULL PRIMARY KEY,
	"nome" varchar(50) NOT NULL,
	"descricao" varchar(100) NOT NULL);

CREATE TABLE "goods" (
	"id" serial NOT NULL PRIMARY KEY,
	"food" varchar(50) NOT NULL,
	"type_food" varchar(50) NOT NULL,
	"price" double precision NOT NULL,
	"flavor" varchar(50) NOT NULL
    );

CREATE TABLE "receipts" (
	"receiptnumber" serial NOT NULL PRIMARY KEY,
	"weekend" date NOT NULL,
	"iscash" boolean NOT NULL,
	"saledate" boolean NOT NULL,
	"employee_id_id" integer NOT NULL,
	"location_id_id" integer NOT NULL,
    CONSTRAINT "receipts_employee_id_id_763acb05_fk_employee_empid" FOREIGN KEY (
    	"employee_id_id") REFERENCES "employee" (
    	"empid") DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "receipts_location_id_id_246a8a5c_fk_location_storenum" FOREIGN KEY (
    	"location_id_id") REFERENCES "location" (
    	"storenum") DEFERRABLE INITIALLY DEFERRED);

CREATE TABLE "items" (
	"id" serial NOT NULL PRIMARY KEY,
	"quantidade" integer NOT NULL,
	"goods_id_id" integer NOT NULL,
    "receipts_id_id" integer NOT NULL,
    CONSTRAINT "items_goods_id_id_26684b5b_fk_goods_id" FOREIGN KEY (
    	"goods_id_id") REFERENCES "goods" (
    	"id") DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "items_receipts_id_id_d30c3f35_fk_receipts_receiptnumber" FOREIGN KEY (
    	"receipts_id_id") REFERENCES "receipts" (
    	"receiptnumber") DEFERRABLE INITIALLY DEFERRED);


CREATE TABLE "receitas" (
	"codrec" serial NOT NULL PRIMARY KEY,
	"nome" varchar(50) NOT NULL,
	"nroporcoes" integer NOT NULL,
	"tempopreparo" varchar(50) NOT NULL,
	"grau" integer NULL,
	"data" varchar(50) NOT NULL,
	"descricao" varchar(150) NOT NULL,
	"codcat_id" integer NOT NULL,
	"cpfcoz_id" bigint NOT NULL,
	"idgood_id" integer NOT NULL,
    CONSTRAINT "receitas_codcat_id_055415ea_fk_categoria_codcat" FOREIGN KEY (
    	"codcat_id") REFERENCES "categoria" (
    	"codcat") DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "receitas_cpfcoz_id_167568cc_fk_cozinheiro_cpf" FOREIGN KEY (
    	"cpfcoz_id") REFERENCES "cozinheiro" (
    	"cpf") DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "receitas_idgood_id_f256babd_fk_goods_id" FOREIGN KEY (
    	"idgood_id") REFERENCES "goods" (
    	"id") DEFERRABLE INITIALLY DEFERRED);



CREATE TABLE "teste_receita" (
	"id" serial NOT NULL PRIMARY KEY,
	"data" varchar(50) NOT NULL,
	"nota" integer NOT NULL,
	"codrec_id" integer NOT NULL,
	"cpfdeg_id" bigint NOT NULL,
    CONSTRAINT "teste_receita_codrec_id_b93e284b_fk_receitas_codrec" FOREIGN KEY (
    	"codrec_id") REFERENCES "receitas" (
    	"codrec") DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "teste_receita_cpfdeg_id_79f58745_fk_degustador_cpf" FOREIGN KEY (
    	"cpfdeg_id") REFERENCES "degustador" (
    	"cpf") DEFERRABLE INITIALLY DEFERRED);

CREATE TABLE "conteudo" (
    "id" serial NOT NULL PRIMARY KEY,
    "codrec_id" integer NOT NULL,
    "isbn_id" bigint NOT NULL,
    CONSTRAINT "conteudo_codrec_id_ecca0f57_fk_receitas_codrec" FOREIGN KEY (
    	"codrec_id") REFERENCES "receitas" (
    	"codrec") DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "conteudo_isbn_id_2f427a20_fk_livro_cpf" FOREIGN KEY (
    	"isbn_id") REFERENCES "livro" (
    	"cpf") DEFERRABLE INITIALLY DEFERRED);
