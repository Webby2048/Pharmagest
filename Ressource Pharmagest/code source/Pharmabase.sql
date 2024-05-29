------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: Fournisseur
------------------------------------------------------------
CREATE TABLE public.Fournisseur(
	IdFour      SERIAL NOT NULL ,
	Nom         VARCHAR (100) NOT NULL ,
	Telephone   INT  NOT NULL ,
	Adresse     VARCHAR (100) NOT NULL ,
	Email       VARCHAR (100) NOT NULL  ,
	CONSTRAINT Fournisseur_PK PRIMARY KEY (IdFour)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Stock
------------------------------------------------------------
CREATE TABLE public.Stock(
	IdStock     SERIAL NOT NULL ,
	Qte_stock   INT  NOT NULL ,
	QteMax      INT  NOT NULL ,
	QteMin      INT  NOT NULL  ,
	CONSTRAINT Stock_PK PRIMARY KEY (IdStock)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Medicament
------------------------------------------------------------
CREATE TABLE public.Medicament(
	idMed     SERIAL NOT NULL ,
	Nom       VARCHAR (100) NOT NULL ,
	Forme     VARCHAR (100) NOT NULL ,
	Dosage    VARCHAR (100) NOT NULL ,
	Qte       INT  NOT NULL ,
	Prix      FLOAT  NOT NULL ,
	IdFour    INT  NOT NULL ,
	IdStock   INT  NOT NULL  ,
	CONSTRAINT Medicament_PK PRIMARY KEY (idMed)

	,CONSTRAINT Medicament_Fournisseur_FK FOREIGN KEY (IdFour) REFERENCES public.Fournisseur(IdFour)
	,CONSTRAINT Medicament_Stock0_FK FOREIGN KEY (IdStock) REFERENCES public.Stock(IdStock)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Vente
------------------------------------------------------------
CREATE TABLE public.Vente(
	IdVente      SERIAL NOT NULL ,
	Date_vente   DATE  NOT NULL  ,
	CONSTRAINT Vente_PK PRIMARY KEY (IdVente)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Role
------------------------------------------------------------
CREATE TABLE public.Role(
	IdRole   SERIAL NOT NULL ,
	NRole    VARCHAR (2) NOT NULL  ,
	CONSTRAINT Role_PK PRIMARY KEY (IdRole)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Utilisateur
------------------------------------------------------------
CREATE TABLE public.Utilisateur(
	Id        SERIAL NOT NULL ,
	nom       VARCHAR (100) NOT NULL ,
	Mdp       VARCHAR (100) NOT NULL ,
	Role      BOOL  NOT NULL ,
	IdRole    INT  NOT NULL ,
	IdStock   INT  NOT NULL  ,
	CONSTRAINT Utilisateur_PK PRIMARY KEY (Id)

	,CONSTRAINT Utilisateur_Role_FK FOREIGN KEY (IdRole) REFERENCES public.Role(IdRole)
	,CONSTRAINT Utilisateur_Stock0_FK FOREIGN KEY (IdStock) REFERENCES public.Stock(IdStock)
	,CONSTRAINT Utilisateur_Role_AK UNIQUE (IdRole)
	,CONSTRAINT Utilisateur_Stock0_AK UNIQUE (IdStock)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Effectuer
------------------------------------------------------------
CREATE TABLE public.Effectuer(
	IdVente   INT  NOT NULL ,
	idMed     INT  NOT NULL  ,
	CONSTRAINT Effectuer_PK PRIMARY KEY (IdVente,idMed)

	,CONSTRAINT Effectuer_Vente_FK FOREIGN KEY (IdVente) REFERENCES public.Vente(IdVente)
	,CONSTRAINT Effectuer_Medicament0_FK FOREIGN KEY (idMed) REFERENCES public.Medicament(idMed)
)WITHOUT OIDS;



