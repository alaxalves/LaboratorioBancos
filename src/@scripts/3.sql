-- MySQL Script generated by MySQL Workbench
-- Sun Jun 11 22:10:21 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`EstadoCivil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadoCivil` (
  `id_estado_civil` INT NOT NULL AUTO_INCREMENT,
  `descricao_estado_civil` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estado_civil`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sexo` (
  `id_sexo` INT NOT NULL AUTO_INCREMENT,
  `descricao_sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sexo`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`DonoEstudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DonoEstudio` (
  `id_dono_estudio` INT NOT NULL AUTO_INCREMENT,
  `cpf_dono` INT NULL,
  `nome_dono` VARCHAR(45) NULL,
  `EstadoCivil_id_estado_civil` INT NOT NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_dono_estudio`, `EstadoCivil_id_estado_civil`, `Sexo_sexo`),
  INDEX `fk_DonoEstudio_EstadoCivil1_idx` (`EstadoCivil_id_estado_civil` ASC),
  INDEX `fk_DonoEstudio_Sexo1_idx` (`Sexo_sexo` ASC),
  CONSTRAINT `fk_DonoEstudio_EstadoCivil1`
    FOREIGN KEY (`EstadoCivil_id_estado_civil`)
    REFERENCES `mydb`.`EstadoCivil` (`id_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DonoEstudio_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`id_sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudio` (
  `id_estudio` INT NOT NULL AUTO_INCREMENT,
  `nome_estudio` VARCHAR(45) NULL,
  `data_fundacao_estudio` DATE NULL,
  `faturamento_ano_anterior` FLOAT NULL,
  `DonoEstudio_id_dono_estudio` INT NOT NULL,
  PRIMARY KEY (`id_estudio`, `DonoEstudio_id_dono_estudio`),
  INDEX `fk_Estudio_DonoEstudio1_idx` (`DonoEstudio_id_dono_estudio` ASC),
  CONSTRAINT `fk_Estudio_DonoEstudio1`
    FOREIGN KEY (`DonoEstudio_id_dono_estudio`)
    REFERENCES `mydb`.`DonoEstudio` (`id_dono_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme` (
  `id_filme` INT NOT NULL AUTO_INCREMENT,
  `nome_filme` VARCHAR(45) NULL,
  `copyright_filme` MEDIUMTEXT NULL,
  `qtd_meses_producao` INT NULL,
  `ano_lancamento` YEAR NULL,
  `custo_total_producao` FLOAT NULL,
  `Estudio_id_estudio` INT NOT NULL,
  PRIMARY KEY (`id_filme`, `Estudio_id_estudio`),
  INDEX `fk_Filme_Estudio1_idx` (`Estudio_id_estudio` ASC),
  CONSTRAINT `fk_Filme_Estudio1`
    FOREIGN KEY (`Estudio_id_estudio`)
    REFERENCES `mydb`.`Estudio` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nome_pais` VARCHAR(45) NULL,
  `DDI` INT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`UF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UF` (
  `id_uf` INT NOT NULL AUTO_INCREMENT,
  `nome_uf` VARCHAR(45) NULL,
  `Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_uf`, `Pais_id_pais`),
  INDEX `fk_UF_Pais1_idx` (`Pais_id_pais` ASC),
  CONSTRAINT `fk_UF_Pais1`
    FOREIGN KEY (`Pais_id_pais`)
    REFERENCES `mydb`.`Pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `id_cidade` INT NOT NULL AUTO_INCREMENT,
  `nome_cidade` VARCHAR(45) NULL,
  `DDD` INT NULL,
  `UF_id_uf` INT NOT NULL,
  `UF_Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_cidade`, `UF_id_uf`, `UF_Pais_id_pais`),
  INDEX `fk_Cidade_UF1_idx` (`UF_id_uf` ASC, `UF_Pais_id_pais` ASC),
  CONSTRAINT `fk_Cidade_UF1`
    FOREIGN KEY (`UF_id_uf` , `UF_Pais_id_pais`)
    REFERENCES `mydb`.`UF` (`id_uf` , `Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ator` (
  `id_ator` INT NOT NULL AUTO_INCREMENT,
  `cpf_ator` INT NULL,
  `nome_artistico_ator` VARCHAR(45) NULL,
  `seguro_social_ator` MEDIUMTEXT NULL,
  `data_nascimento_ator` DATE NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  `EstadoCivil_id_estado_civil` INT NOT NULL,
  `Cidade_id_cidade` INT NOT NULL,
  `Cidade_UF_id_uf` INT NOT NULL,
  `Cidade_UF_Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_ator`, `EstadoCivil_id_estado_civil`, `Cidade_id_cidade`, `Cidade_UF_id_uf`, `Cidade_UF_Pais_id_pais`, `Sexo_sexo`),
  INDEX `fk_Ator_EstadoCivil1_idx` (`EstadoCivil_id_estado_civil` ASC),
  INDEX `fk_Ator_Sexo1_idx` (`Sexo_sexo` ASC),
  INDEX `fk_Ator_Cidade1_idx` (`Cidade_id_cidade` ASC, `Cidade_UF_id_uf` ASC, `Cidade_UF_Pais_id_pais` ASC),
  CONSTRAINT `fk_Ator_EstadoCivil1`
    FOREIGN KEY (`EstadoCivil_id_estado_civil`)
    REFERENCES `mydb`.`EstadoCivil` (`id_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ator_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`id_sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ator_Cidade1`
    FOREIGN KEY (`Cidade_id_cidade` , `Cidade_UF_id_uf` , `Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Cidade` (`id_cidade` , `UF_id_uf` , `UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL AUTO_INCREMENT,
  `cpf_diretor` INT NULL,
  `nome_diretor` VARCHAR(45) NULL,
  `EstadoCivil_id_estado_civil` INT NOT NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  `Cidade_id_cidade` INT NOT NULL,
  `Cidade_UF_id_uf` INT NOT NULL,
  `Cidade_UF_Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`idDiretor`, `EstadoCivil_id_estado_civil`, `Sexo_sexo`, `Cidade_id_cidade`, `Cidade_UF_id_uf`, `Cidade_UF_Pais_id_pais`),
  INDEX `fk_Diretor_EstadoCivil1_idx` (`EstadoCivil_id_estado_civil` ASC),
  INDEX `fk_Diretor_Sexo1_idx` (`Sexo_sexo` ASC),
  INDEX `fk_Diretor_Cidade1_idx` (`Cidade_id_cidade` ASC, `Cidade_UF_id_uf` ASC, `Cidade_UF_Pais_id_pais` ASC),
  CONSTRAINT `fk_Diretor_EstadoCivil1`
    FOREIGN KEY (`EstadoCivil_id_estado_civil`)
    REFERENCES `mydb`.`EstadoCivil` (`id_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diretor_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`id_sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diretor_Cidade1`
    FOREIGN KEY (`Cidade_id_cidade` , `Cidade_UF_id_uf` , `Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Cidade` (`id_cidade` , `UF_id_uf` , `UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ContratoAtorFilme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ContratoAtorFilme` (
  `cache_ator` FLOAT NULL,
  `Filme_id_filme` INT NOT NULL,
  `Ator_id_ator` INT NOT NULL,
  PRIMARY KEY (`Filme_id_filme`, `Ator_id_ator`),
  INDEX `fk_Filme_has_Ator_Ator1_idx` (`Ator_id_ator` ASC),
  CONSTRAINT `fk_Filme_has_Ator_Filme1`
    FOREIGN KEY (`Filme_id_filme`)
    REFERENCES `mydb`.`Filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Ator_Ator1`
    FOREIGN KEY (`Ator_id_ator`)
    REFERENCES `mydb`.`Ator` (`id_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Personagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personagem` (
  `id_personagem` INT NOT NULL,
  `nome_personagem` VARCHAR(45) NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  `ContratoAtorFilme_Filme_id_filme` INT NOT NULL,
  `ContratoAtorFilme_Ator_id_ator` INT NOT NULL,
  PRIMARY KEY (`id_personagem`, `Sexo_sexo`, `ContratoAtorFilme_Filme_id_filme`, `ContratoAtorFilme_Ator_id_ator`),
  INDEX `fk_Personagem_Sexo1_idx` (`Sexo_sexo` ASC),
  INDEX `fk_Personagem_ContratoAtorFilme1_idx` (`ContratoAtorFilme_Filme_id_filme` ASC, `ContratoAtorFilme_Ator_id_ator` ASC),
  CONSTRAINT `fk_Personagem_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`id_sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personagem_ContratoAtorFilme1`
    FOREIGN KEY (`ContratoAtorFilme_Filme_id_filme` , `ContratoAtorFilme_Ator_id_ator`)
    REFERENCES `mydb`.`ContratoAtorFilme` (`Filme_id_filme` , `Ator_id_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bairro` (
  `id_bairro` INT NOT NULL AUTO_INCREMENT,
  `nome_bairro` VARCHAR(45) NULL,
  `Cidade_id_cidade` INT NOT NULL,
  `Cidade_UF_id_uf` INT NOT NULL,
  `Cidade_UF_Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_bairro`, `Cidade_id_cidade`, `Cidade_UF_id_uf`, `Cidade_UF_Pais_id_pais`),
  INDEX `fk_Bairro_Cidade1_idx` (`Cidade_id_cidade` ASC, `Cidade_UF_id_uf` ASC, `Cidade_UF_Pais_id_pais` ASC),
  CONSTRAINT `fk_Bairro_Cidade1`
    FOREIGN KEY (`Cidade_id_cidade` , `Cidade_UF_id_uf` , `Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Cidade` (`id_cidade` , `UF_id_uf` , `UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Rua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rua` (
  `id_rua` INT NOT NULL,
  `cep_rua` INT NULL,
  `nome_rua` VARCHAR(45) NULL,
  `Bairro_id_bairro` INT NOT NULL,
  `Bairro_Cidade_id_cidade` INT NOT NULL,
  `Bairro_Cidade_UF_id_uf` INT NOT NULL,
  `Bairro_Cidade_UF_Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_rua`, `Bairro_id_bairro`, `Bairro_Cidade_id_cidade`, `Bairro_Cidade_UF_id_uf`, `Bairro_Cidade_UF_Pais_id_pais`),
  INDEX `fk_Rua_Bairro1_idx` (`Bairro_id_bairro` ASC, `Bairro_Cidade_id_cidade` ASC, `Bairro_Cidade_UF_id_uf` ASC, `Bairro_Cidade_UF_Pais_id_pais` ASC),
  CONSTRAINT `fk_Rua_Bairro1`
    FOREIGN KEY (`Bairro_id_bairro` , `Bairro_Cidade_id_cidade` , `Bairro_Cidade_UF_id_uf` , `Bairro_Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Bairro` (`id_bairro` , `Cidade_id_cidade` , `Cidade_UF_id_uf` , `Cidade_UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TipoEndereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoEndereco` (
  `id_tipo_endereco` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo_endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_endereco`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `Rua_id_rua` INT NOT NULL,
  `Rua_Bairro_id_bairro` INT NOT NULL,
  `Rua_Bairro_Cidade_id_cidade` INT NOT NULL,
  `Rua_Bairro_Cidade_UF_id_uf` INT NOT NULL,
  `Rua_Bairro_Cidade_UF_Pais_id_pais` INT NOT NULL,
  `TipoEndereco_id_tipo_endereco` INT NOT NULL,
  `Estudio_id_estudio` INT NULL,
  `DonoEstudio_id_dono_estudo` INT NULL,
  `Ator_id_ator` INT NULL,
  `Diretor_idDiretor` INT NULL,
  PRIMARY KEY (`id_endereco`, `Rua_id_rua`, `Rua_Bairro_id_bairro`, `Rua_Bairro_Cidade_id_cidade`, `Rua_Bairro_Cidade_UF_id_uf`, `Rua_Bairro_Cidade_UF_Pais_id_pais`, `TipoEndereco_id_tipo_endereco`, `DonoEstudio_id_dono_estudo`, `Estudio_id_estudio`, `Ator_id_ator`, `Diretor_idDiretor`),
  INDEX `fk_Endereco_Rua1_idx` (`Rua_id_rua` ASC, `Rua_Bairro_id_bairro` ASC, `Rua_Bairro_Cidade_id_cidade` ASC, `Rua_Bairro_Cidade_UF_id_uf` ASC, `Rua_Bairro_Cidade_UF_Pais_id_pais` ASC),
  INDEX `fk_Endereco_TipoEndereco1_idx` (`TipoEndereco_id_tipo_endereco` ASC),
  INDEX `fk_Endereco_Estudio1_idx` (`Estudio_id_estudio` ASC),
  INDEX `fk_Endereco_DonoEstudio1_idx` (`DonoEstudio_id_dono_estudo` ASC),
  INDEX `fk_Endereco_Ator1_idx` (`Ator_id_ator` ASC),
  INDEX `fk_Endereco_Diretor1_idx` (`Diretor_idDiretor` ASC),
  CONSTRAINT `fk_Endereco_Rua1`
    FOREIGN KEY (`Rua_id_rua` , `Rua_Bairro_id_bairro` , `Rua_Bairro_Cidade_id_cidade` , `Rua_Bairro_Cidade_UF_id_uf` , `Rua_Bairro_Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Rua` (`id_rua` , `Bairro_id_bairro` , `Bairro_Cidade_id_cidade` , `Bairro_Cidade_UF_id_uf` , `Bairro_Cidade_UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_TipoEndereco1`
    FOREIGN KEY (`TipoEndereco_id_tipo_endereco`)
    REFERENCES `mydb`.`TipoEndereco` (`id_tipo_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Estudio1`
    FOREIGN KEY (`Estudio_id_estudio`)
    REFERENCES `mydb`.`Estudio` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_DonoEstudio1`
    FOREIGN KEY (`DonoEstudio_id_dono_estudo`)
    REFERENCES `mydb`.`DonoEstudio` (`id_dono_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Ator1`
    FOREIGN KEY (`Ator_id_ator`)
    REFERENCES `mydb`.`Ator` (`id_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TipoTelefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoTelefone` (
  `id_tipo_telefone` INT NOT NULL AUTO_INCREMENT,
  `descricao_tipo_telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_telefone`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `id_telefone` INT NOT NULL AUTO_INCREMENT,
  `numero_telefone` VARCHAR(45) NULL,
  `TipoTelefone_id_tipo_telefone` INT NOT NULL,
  `DonoEstudio_id_dono_estudio` INT NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  `Estudio_id_estudio` INT NOT NULL,
  `Ator_id_ator` INT NOT NULL,
  PRIMARY KEY (`id_telefone`, `TipoTelefone_id_tipo_telefone`, `DonoEstudio_id_dono_estudio`, `Diretor_idDiretor`, `Estudio_id_estudio`, `Ator_id_ator`),
  INDEX `fk_Telefone_TipoTelefone1_idx` (`TipoTelefone_id_tipo_telefone` ASC),
  INDEX `fk_Telefone_DonoEstudio1_idx` (`DonoEstudio_id_dono_estudio` ASC),
  INDEX `fk_Telefone_Diretor1_idx` (`Diretor_idDiretor` ASC),
  INDEX `fk_Telefone_Estudio1_idx` (`Estudio_id_estudio` ASC),
  INDEX `fk_Telefone_Ator1_idx` (`Ator_id_ator` ASC),
  CONSTRAINT `fk_Telefone_TipoTelefone1`
    FOREIGN KEY (`TipoTelefone_id_tipo_telefone`)
    REFERENCES `mydb`.`TipoTelefone` (`id_tipo_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_DonoEstudio1`
    FOREIGN KEY (`DonoEstudio_id_dono_estudio`)
    REFERENCES `mydb`.`DonoEstudio` (`id_dono_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Estudio1`
    FOREIGN KEY (`Estudio_id_estudio`)
    REFERENCES `mydb`.`Estudio` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Ator1`
    FOREIGN KEY (`Ator_id_ator`)
    REFERENCES `mydb`.`Ator` (`id_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Papel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Papel` (
  `id_papel` INT NOT NULL,
  `descricao_papel` VARCHAR(45) NULL,
  PRIMARY KEY (`id_papel`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`AtorPapel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AtorPapel` (
  `Papel_id_papel` INT NOT NULL,
  `Ator_id_ator` INT NOT NULL,
  PRIMARY KEY (`Papel_id_papel`, `Ator_id_ator`),
  INDEX `fk_Ator_has_Papel_Papel1_idx` (`Papel_id_papel` ASC),
  INDEX `fk_AtorPapel_Ator1_idx` (`Ator_id_ator` ASC),
  CONSTRAINT `fk_Ator_has_Papel_Papel1`
    FOREIGN KEY (`Papel_id_papel`)
    REFERENCES `mydb`.`Papel` (`id_papel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AtorPapel_Ator1`
    FOREIGN KEY (`Ator_id_ator`)
    REFERENCES `mydb`.`Ator` (`id_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`FilmeDiretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FilmeDiretor` (
  `Filme_id_filme` INT NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`Filme_id_filme`, `Diretor_idDiretor`),
  INDEX `fk_Filme_has_Diretor_Filme1_idx` (`Filme_id_filme` ASC),
  INDEX `fk_FilmeDiretor_Diretor1_idx` (`Diretor_idDiretor` ASC),
  CONSTRAINT `fk_Filme_has_Diretor_Filme1`
    FOREIGN KEY (`Filme_id_filme`)
    REFERENCES `mydb`.`Filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FilmeDiretor_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `mydb`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
