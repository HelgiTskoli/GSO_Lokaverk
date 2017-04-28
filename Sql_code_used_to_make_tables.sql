CREATE TABLE `Flytjandi` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nafn` varchar(32) NOT NULL,
	`Fæðingardagur/Stofnadagur` DATE NOT NULL,
	`Lýsing` TEXT(1000),
	`Dánardagur/Hættidagur` DATE,
	`Flokkur_Flytjanda` INT(10) NOT NULL,
	`Góður/slæmur` BOOLEAN NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Diskur` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nafn` varchar(32) NOT NULL,
	`Útgáfudagur` DATE NOT NULL,
	`Tegund_disks` INT NOT NULL,
	`Útgefandi` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Lag` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nafn` varchar(32) NOT NULL,
	`Lengd` varchar(10) NOT NULL,
	`Flytjandi` INT NOT NULL,
	`Diskur` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Flokkur` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nafn` varchar(32) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Tegund` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nafn` varchar(32) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Útgefandi` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nafn` varchar(32) NOT NULL,
	PRIMARY KEY (`ID`)
);

ALTER TABLE `Flytjandi` ADD CONSTRAINT `Flytjandi_fk0` FOREIGN KEY (`Flokkur_Flytjanda`) REFERENCES `Flokkur`(`ID`);

ALTER TABLE `Diskur` ADD CONSTRAINT `Diskur_fk0` FOREIGN KEY (`Tegund_disks`) REFERENCES `Tegund`(`ID`);

ALTER TABLE `Diskur` ADD CONSTRAINT `Diskur_fk1` FOREIGN KEY (`Útgefandi`) REFERENCES `Útgefandi`(`ID`);

ALTER TABLE `Lag` ADD CONSTRAINT `Lag_fk0` FOREIGN KEY (`Flytjandi`) REFERENCES `Flytjandi`(`ID`);

ALTER TABLE `Lag` ADD CONSTRAINT `Lag_fk1` FOREIGN KEY (`Diskur`) REFERENCES `Diskur`(`ID`);
