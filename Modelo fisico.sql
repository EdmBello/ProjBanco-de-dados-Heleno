CREATE SCHEMA LojaCheat_DB DEFAULT CHARACTER SET utf8 ;
USE LojaCheat_DB;

-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`trabalhadores`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.trabalhadores (
  `idtrab` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `função` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtrab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`Serviço`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.Serviço (
  `Serviço_id` INT NOT NULL AUTO_INCREMENT,
  `Tiposerviço` VARCHAR(45) NOT NULL,
  `descriserviço` TEXT NULL,
  `dataserviço` DATE NULL,
  `preçoserviço` FLOAT NULL,
  PRIMARY KEY (`Serviço_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`MeioPag`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.MeioPag (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.Pagamento (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor` FLOAT NOT NULL,
  `data` DATE NOT NULL,
  `MeioPag_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Pagamento_MeioPag1`
    FOREIGN KEY (`MeioPag_id`)
    REFERENCES `LojaCheat_DB`.`MeioPag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.Cliente (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`Cliente_Pagamento`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.Cliente_Pagamento (
  `Cliente_id` INT NOT NULL,
  `Pagamento_id` INT NOT NULL,
  PRIMARY KEY (`Cliente_id`, `Pagamento_id`),
  CONSTRAINT `fk_Cliente_has_Pagamento_Cliente1`
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `LojaCheat_DB`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Pagamento_Pagamento1`
    FOREIGN KEY (`Pagamento_id`)
    REFERENCES `LojaCheat_DB`.`Pagamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`tipo_Serviço`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.tipo_Serviço (
  `Serviço_id` INT NOT NULL,
  `tipo_serviço` VARCHAR(45) NOT NULL,
  `trabalhadores_idtrab` INT NOT NULL,
  PRIMARY KEY (`Serviço_id`),
    FOREIGN KEY (`Serviço_id`)
    REFERENCES `LojaCheat_DB`.`Serviço` (`Serviço_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`trabalhadores_idtrab`)
    REFERENCES `LojaCheat_DB`.`trabalhadores` (`idtrab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojaCheat_DB`.`Cliente_Serviço`
-- -----------------------------------------------------
CREATE TABLE LojaCheat_DB.Cliente_Serviço (
  `Cliente_id` INT NOT NULL,
  `Serviço_id` INT NOT NULL,
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `LojaCheat_DB`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Serviço_id`)
    REFERENCES `LojaCheat_DB`.`Serviço` (`Serviço_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;