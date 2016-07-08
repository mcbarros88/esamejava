DROP DATABASE IF EXISTS `tommaso`;
CREATE DATABASE `tommaso` DEFAULT CHARSET=utf8;
USE `tommaso`;

CREATE TABLE `articoli` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `codice` VARCHAR(255) NOT NULL,
    `descrizione` VARCHAR(255) NOT NULL,
    `peso` DOUBLE NOT NULL
) ENGINE=InnoDB;

INSERT INTO `articoli` (`codice`, `descrizione`,`peso`)
    VALUES ('PNDRV8', 'Pen drive USB 8G no brand ', 0.18);
INSERT INTO `articoli` (`codice`, `descrizione`,`peso`)
    VALUES ('DCP-J715E', 'Stampante Brother DCP J715 W', 5.1);
INSERT INTO `articoli` (`codice`, `descrizione`,`peso`)
    VALUES ('LNVCX1', 'Notebook Lenovo Carbon X1 ', 2.1);
INSERT INTO `articoli` (`codice`, `descrizione`,`peso`)
    VALUES ('ALCPPC3', 'Smartphone Alcatel POP C3', 0.63);
INSERT INTO `articoli` (`codice`, `descrizione`,`peso`)
    VALUES ('BSHT1R', 'Ampli Combo valvolare BlackStar HT 1-R', 5);



CREATE TABLE `ordini` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `numero` INTEGER NOT NULL,
    `data` DATE NOT NULL
   
) ENGINE=InnoDB;

INSERT INTO `ordini` (`numero`, `data`)
    VALUES (17, '1990-02-24');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (15, '2016-03-17');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (114, '2015-06-21');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (173, '2016-01-04');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (5, '2016-08-14');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (7, '2016-09-10');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (3, '2016-10-08');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (245, '2016-02-06');
INSERT INTO `ordini` (`numero`, `data`)
    VALUES (142, '2015-11-12');


CREATE TABLE `tariffe_corriere` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `nome_corriere` VARCHAR(255),
    `nome_tariffa`  VARCHAR(255),
    `peso_massimo` DOUBLE NOT NULL,
    `costo` DOUBLE NOT NULL

     
) ENGINE=InnoDB;

INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('SDA','Economy',1,6.10 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('SDA','Veloce',5,7.80 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('SDA','BigBox',30,13.00 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('DHL','Veloce',1.5,6.40 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('DHL','Assicurata',7.5,9.80 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('DHL','XXL',40,13.80 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('UPS','Economy',0.7,5.15 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('UPS','Standard',3,6.50 );
INSERT INTO `tariffe_corriere` (`nome_corriere`, `nome_tariffa`, `peso_massimo`, `costo`)
    VALUES ('UPS','Jumbo',25,11.40 );


CREATE TABLE `voci` (
    `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `quantita`INTEGER,
    `id_ordine` INTEGER,
Foreign Key (`id_ordine`) references ordini(id),
    `id_articoli` INTEGER,
Foreign Key (`id_articoli`) references articoli(id)



)ENGINE=InnoDB;

INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (1,3,2 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (2,3,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (2,4,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (3,2,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (3,3,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (4,4,2 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (4,4,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (5,1,2 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (5,4,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (6,2,7 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (7,1,3 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (8,5,6 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (9,5,1 );
INSERT INTO `voci` (`id_ordine`, `id_articoli`, `quantita`)
    VALUES (9,3,1 );
 