-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sge_gab
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sge_gab` ;

-- -----------------------------------------------------
-- Schema sge_gab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sge_gab` ;
USE `sge_gab` ;

-- -----------------------------------------------------
-- Table `sge_gab`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`turma` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`turma` (
  `idturma` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `ano` INT NULL,
  PRIMARY KEY (`idturma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_gab`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`aluno` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`aluno` (
  `idaluno` INT NOT NULL,
  `dt_nascimento` DATE NULL,
  ` endereço` VARCHAR(45) NULL,
  `idturma` INT NULL,
  `email` VARCHAR(45) NULL,
  `turma_idturma` INT NOT NULL,
  PRIMARY KEY (`idaluno`, `turma_idturma`),
  INDEX `fk_aluno_turma_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_turma`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `sge_gab`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_gab`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`professor` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`professor` (
  `idprofessor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `especialização` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_gab`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`disciplina` (
  `iddisciplina` INT NOT NULL,
  `carga_horaria` INT NULL,
  ` cod_disciplina` VARCHAR(45) NULL,
  `ano` INT NULL,
  PRIMARY KEY (`iddisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_gab`.`turma_has_professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`turma_has_professor` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`turma_has_professor` (
  `turma_idturma` INT NOT NULL,
  `professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`turma_idturma`, `professor_idprofessor`),
  INDEX `fk_turma_has_professor_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_turma_has_professor_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_professor_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `sge_gab`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_professor_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `sge_gab`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_gab`.`professor_has_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`professor_has_disciplina` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`professor_has_disciplina` (
  `professor_idprofessor` INT NOT NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  PRIMARY KEY (`professor_idprofessor`, `disciplina_iddisciplina`),
  INDEX `fk_professor_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina` ASC) VISIBLE,
  INDEX `fk_professor_has_disciplina_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_disciplina_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `sge_gab`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `sge_gab`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_gab`.`turma_has_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_gab`.`turma_has_disciplina` ;

CREATE TABLE IF NOT EXISTS `sge_gab`.`turma_has_disciplina` (
  `turma_idturma` INT NOT NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  PRIMARY KEY (`turma_idturma`, `disciplina_iddisciplina`),
  INDEX `fk_turma_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina` ASC) VISIBLE,
  INDEX `fk_turma_has_disciplina_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_disciplina_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `sge_gab`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `sge_gab`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
