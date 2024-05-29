CREATE TABLE Patient(
   Id_Patient VARCHAR(50),
   nom_pat VARCHAR(50),
   prenom_pat VARCHAR(50),
   age_pat INT,
   poids_pat INT,
   taille_pat INT,
   adress_pat VARCHAR(50),
   tel_pat VARCHAR(50),
   PRIMARY KEY(Id_Patient)
);

CREATE TABLE Fournisseur(
   Id_Fournisseur VARCHAR(50),
   num_four INT,
   nom_four VARCHAR(50),
   prenom_four VARCHAR(50),
   adress_four VARCHAR(50),
   tel_four VARCHAR(50),
   mail_four VARCHAR(50),
   PRIMARY KEY(Id_Fournisseur)
);

CREATE TABLE Utilisateur(
   Id_user INT,
   nom_user VARCHAR(50),
   prenom_user VARCHAR(50),
   num_user VARCHAR(50),
   adress_user VARCHAR(50),
   tel_user VARCHAR(50),
   mail_user VARCHAR(50),
   Mdp_user VARCHAR(50),
   Role VARCHAR(50),
   PRIMARY KEY(Id_user)
);

CREATE TABLE famille(
   id_Famille INT,
   nom_fam VARCHAR(50),
   PRIMARY KEY(id_Famille)
);

CREATE TABLE Vente(
   num_vente INT,
   date_vente DATE,
   Id_user INT NOT NULL,
   PRIMARY KEY(num_vente),
   FOREIGN KEY(Id_user) REFERENCES Utilisateur(Id_user)
);

CREATE TABLE CmdFourn(
   num_com INT,
   date_com DATE,
   Id_Fournisseur VARCHAR(50) NOT NULL,
   PRIMARY KEY(num_com),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur)
);

CREATE TABLE ligneCmd(
   Numcmd INT,
   qte_commande INT,
   PU_achat INT,
   num_com INT NOT NULL,
   PRIMARY KEY(Numcmd),
   FOREIGN KEY(num_com) REFERENCES CmdFourn(num_com)
);

CREATE TABLE LigneVente(
   num_vente INT,
   qte_vendu INT,
   prix_unit INT,
   num_vente_1 INT NOT NULL,
   PRIMARY KEY(num_vente),
   FOREIGN KEY(num_vente_1) REFERENCES Vente(num_vente)
);

CREATE TABLE ReceptCmd(
   Numcmd INT,
   DateRecep DATE,
   num_com INT NOT NULL,
   PRIMARY KEY(Numcmd),
   UNIQUE(num_com),
   FOREIGN KEY(num_com) REFERENCES CmdFourn(num_com)
);

CREATE TABLE Ligne_recept(
   Numcmd INT,
   QteRecue INT,
   Pu_achat INT,
   Pu_vente INT,
   Numcmd_1 INT NOT NULL,
   PRIMARY KEY(Numcmd),
   FOREIGN KEY(Numcmd_1) REFERENCES ReceptCmd(Numcmd)
);

CREATE TABLE ordonance(
   num_ord INT,
   DateOrd DATE,
   nom_pat VARCHAR(50),
   nom_med VARCHAR(50),
   num_vente INT,
   PRIMARY KEY(num_ord),
   UNIQUE(num_vente),
   FOREIGN KEY(num_vente) REFERENCES Vente(num_vente)
);

CREATE TABLE Medicament_(
   Id_Medicament_ INT,
   nom_comm VARCHAR(50),
   Form VARCHAR(50),
   dosage VARCHAR(50),
   EstOrdo LOGICAL,
   num_ord INT NOT NULL,
   PRIMARY KEY(Id_Medicament_),
   FOREIGN KEY(num_ord) REFERENCES ordonance(num_ord)
);

CREATE TABLE Stock(
   id_Medicament VARCHAR(50),
   QteStock INT,
   SeuilMin INT,
   Qte_Max INT,
   Id_Medicament_ INT NOT NULL,
   PRIMARY KEY(id_Medicament),
   FOREIGN KEY(Id_Medicament_) REFERENCES Medicament_(Id_Medicament_)
);

CREATE TABLE Fournir(
   Id_Fournisseur VARCHAR(50),
   Id_Medicament_ INT,
   PRIMARY KEY(Id_Fournisseur, Id_Medicament_),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur),
   FOREIGN KEY(Id_Medicament_) REFERENCES Medicament_(Id_Medicament_)
);

CREATE TABLE Appartenir(
   Id_Medicament_ INT,
   id_Famille INT,
   PRIMARY KEY(Id_Medicament_, id_Famille),
   FOREIGN KEY(Id_Medicament_) REFERENCES Medicament_(Id_Medicament_),
   FOREIGN KEY(id_Famille) REFERENCES famille(id_Famille)
);

CREATE TABLE Acheter(
   Id_Patient VARCHAR(50),
   Id_Medicament_ INT,
   PRIMARY KEY(Id_Patient, Id_Medicament_),
   FOREIGN KEY(Id_Patient) REFERENCES Patient(Id_Patient),
   FOREIGN KEY(Id_Medicament_) REFERENCES Medicament_(Id_Medicament_)
);
