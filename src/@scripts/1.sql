SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`EstadoCivil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EstadoCivil` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`EstadoCivil` (
  `id_estado_civil` INT NOT NULL,
  `descricao_estado_civil` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estado_civil`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Sexo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sexo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Sexo` (
  `sexo` TINYINT(1) NOT NULL,
  `descricao_sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`sexo`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`DonoEstudio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DonoEstudio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`DonoEstudio` (
  `id_dono_estudo` INT NOT NULL,
  `nome_dono` VARCHAR(45) NULL,
  `EstadoCivil_id_estado_civil` INT NOT NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_dono_estudo`, `EstadoCivil_id_estado_civil`, `Sexo_sexo`),
  INDEX `fk_DonoEstudio_EstadoCivil1_idx` (`EstadoCivil_id_estado_civil` ASC),
  INDEX `fk_DonoEstudio_Sexo1_idx` (`Sexo_sexo` ASC),
  CONSTRAINT `fk_DonoEstudio_EstadoCivil1`
    FOREIGN KEY (`EstadoCivil_id_estado_civil`)
    REFERENCES `mydb`.`EstadoCivil` (`id_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DonoEstudio_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Estudio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Estudio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Estudio` (
  `id_estudio` INT NOT NULL,
  `nome_estudio` VARCHAR(45) NOT NULL,
  `data_fundacao_estudio` DATE NULL,
  `faturamento_ano_anterior` FLOAT NULL,
  `DonoEstudio_id_dono_estudo` INT NOT NULL,
  PRIMARY KEY (`id_estudio`, `nome_estudio`, `DonoEstudio_id_dono_estudo`),
  INDEX `fk_Estudio_DonoEstudio1_idx` (`DonoEstudio_id_dono_estudo` ASC),
  CONSTRAINT `fk_Estudio_DonoEstudio1`
    FOREIGN KEY (`DonoEstudio_id_dono_estudo`)
    REFERENCES `mydb`.`DonoEstudio` (`id_dono_estudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Filme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Filme` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Filme` (
  `id_filme` INT NOT NULL,
  `nome_filme` VARCHAR(45) NOT NULL,
  `copyright_filme` MEDIUMTEXT NOT NULL,
  `qtd_meses_producao` INT NULL,
  `ano_lancamento` YEAR NULL,
  `custo_total_producao` FLOAT NULL,
  `Estudio_id_estudio` INT NOT NULL,
  `Estudio_nome_estudio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_filme`, `nome_filme`, `copyright_filme`, `Estudio_id_estudio`, `Estudio_nome_estudio`),
  INDEX `fk_Filme_Estudio1_idx` (`Estudio_id_estudio` ASC, `Estudio_nome_estudio` ASC),
  CONSTRAINT `fk_Filme_Estudio1`
    FOREIGN KEY (`Estudio_id_estudio` , `Estudio_nome_estudio`)
    REFERENCES `mydb`.`Estudio` (`id_estudio` , `nome_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pais` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Pais` (
  `id_pais` INT NOT NULL,
  `nome_pais` VARCHAR(45) NULL,
  `DDI` INT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`UF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UF` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`UF` (
  `id_uf` INT NOT NULL,
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
DROP TABLE IF EXISTS `mydb`.`Cidade` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Cidade` (
  `id_cidade` INT NOT NULL,
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
DROP TABLE IF EXISTS `mydb`.`Ator` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Ator` (
  `id_ator` INT NOT NULL,
  `nome_artistico_ator` VARCHAR(45) NOT NULL,
  `seguro_social_ator` MEDIUMTEXT NOT NULL,
  `Cidade_id_cidade` INT NOT NULL,
  `Cidade_id_cidade1` INT NOT NULL,
  `Cidade_UF_id_uf` INT NOT NULL,
  `Cidade_UF_Pais_id_pais` INT NOT NULL,
  `EstadoCivil_id_estado_civil` INT NOT NULL,
  `data_nascimento_ator` DATE NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_ator`, `nome_artistico_ator`, `seguro_social_ator`, `Cidade_id_cidade`, `Cidade_id_cidade1`, `Cidade_UF_id_uf`, `Cidade_UF_Pais_id_pais`, `EstadoCivil_id_estado_civil`, `Sexo_sexo`),
  INDEX `fk_Ator_Cidade1_idx` (`Cidade_id_cidade1` ASC, `Cidade_UF_id_uf` ASC, `Cidade_UF_Pais_id_pais` ASC),
  INDEX `fk_Ator_EstadoCivil1_idx` (`EstadoCivil_id_estado_civil` ASC),
  INDEX `fk_Ator_Sexo1_idx` (`Sexo_sexo` ASC),
  CONSTRAINT `fk_Ator_Cidade1`
    FOREIGN KEY (`Cidade_id_cidade1` , `Cidade_UF_id_uf` , `Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Cidade` (`id_cidade` , `UF_id_uf` , `UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ator_EstadoCivil1`
    FOREIGN KEY (`EstadoCivil_id_estado_civil`)
    REFERENCES `mydb`.`EstadoCivil` (`id_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ator_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ContratoAtorFilme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ContratoAtorFilme` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`ContratoAtorFilme` (
  `Filme_id_filme` INT NOT NULL,
  `Filme_nome_filme` VARCHAR(45) NOT NULL,
  `Filme_copyright_filme` MEDIUMTEXT NOT NULL,
  `Ator_id_ator` INT NOT NULL,
  `Ator_nome_artistico_ator` VARCHAR(45) NOT NULL,
  `Ator_seguro_social_ator` MEDIUMTEXT NOT NULL,
  `cache_ator` VARCHAR(45) NULL,
  PRIMARY KEY (`Filme_id_filme`, `Filme_nome_filme`, `Filme_copyright_filme`, `Ator_id_ator`, `Ator_nome_artistico_ator`, `Ator_seguro_social_ator`),
  INDEX `fk_Filme_has_Ator_Ator1_idx` (`Ator_id_ator` ASC, `Ator_nome_artistico_ator` ASC, `Ator_seguro_social_ator` ASC),
  INDEX `fk_Filme_has_Ator_Filme1_idx` (`Filme_id_filme` ASC, `Filme_nome_filme` ASC, `Filme_copyright_filme` ASC),
  CONSTRAINT `fk_Filme_has_Ator_Filme1`
    FOREIGN KEY (`Filme_id_filme` , `Filme_nome_filme` , `Filme_copyright_filme`)
    REFERENCES `mydb`.`Filme` (`id_filme` , `nome_filme` , `copyright_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Ator_Ator1`
    FOREIGN KEY (`Ator_id_ator` , `Ator_nome_artistico_ator` , `Ator_seguro_social_ator`)
    REFERENCES `mydb`.`Ator` (`id_ator` , `nome_artistico_ator` , `seguro_social_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Diretor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL,
  `nome_diretor` VARCHAR(45) NULL,
  `Filme_id_filme` INT NOT NULL,
  `Filme_nome_filme` VARCHAR(45) NOT NULL,
  `Filme_copyright_filme` MEDIUMTEXT NOT NULL,
  `Filme_Estudio_id_estudio` INT NOT NULL,
  `Filme_Estudio_nome_estudio` VARCHAR(45) NOT NULL,
  `EstadoCivil_id_estado_civil` INT NOT NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idDiretor`, `Filme_id_filme`, `Filme_nome_filme`, `Filme_copyright_filme`, `Filme_Estudio_id_estudio`, `Filme_Estudio_nome_estudio`, `EstadoCivil_id_estado_civil`, `Sexo_sexo`),
  INDEX `fk_Diretor_Filme1_idx` (`Filme_id_filme` ASC, `Filme_nome_filme` ASC, `Filme_copyright_filme` ASC, `Filme_Estudio_id_estudio` ASC, `Filme_Estudio_nome_estudio` ASC),
  INDEX `fk_Diretor_EstadoCivil1_idx` (`EstadoCivil_id_estado_civil` ASC),
  INDEX `fk_Diretor_Sexo1_idx` (`Sexo_sexo` ASC),
  CONSTRAINT `fk_Diretor_Filme1`
    FOREIGN KEY (`Filme_id_filme` , `Filme_nome_filme` , `Filme_copyright_filme` , `Filme_Estudio_id_estudio` , `Filme_Estudio_nome_estudio`)
    REFERENCES `mydb`.`Filme` (`id_filme` , `nome_filme` , `copyright_filme` , `Estudio_id_estudio` , `Estudio_nome_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diretor_EstadoCivil1`
    FOREIGN KEY (`EstadoCivil_id_estado_civil`)
    REFERENCES `mydb`.`EstadoCivil` (`id_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diretor_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Personagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Personagem` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Personagem` (
  `id_personagem` INT NOT NULL,
  `nome_personagem` VARCHAR(45) NULL,
  `ContratoAtorFilme_Filme_id_filme` INT NOT NULL,
  `ContratoAtorFilme_Filme_nome_filme` VARCHAR(45) NOT NULL,
  `ContratoAtorFilme_Filme_copyright_filme` MEDIUMTEXT NOT NULL,
  `ContratoAtorFilme_Ator_id_ator` INT NOT NULL,
  `ContratoAtorFilme_Ator_nome_artistico_ator` VARCHAR(45) NOT NULL,
  `ContratoAtorFilme_Ator_seguro_social_ator` MEDIUMTEXT NOT NULL,
  `Sexo_sexo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_personagem`, `ContratoAtorFilme_Filme_id_filme`, `ContratoAtorFilme_Filme_nome_filme`, `ContratoAtorFilme_Filme_copyright_filme`, `ContratoAtorFilme_Ator_id_ator`, `ContratoAtorFilme_Ator_nome_artistico_ator`, `ContratoAtorFilme_Ator_seguro_social_ator`, `Sexo_sexo`),
  INDEX `fk_Personagem_ContratoAtorFilme1_idx` (`ContratoAtorFilme_Filme_id_filme` ASC, `ContratoAtorFilme_Filme_nome_filme` ASC, `ContratoAtorFilme_Filme_copyright_filme` ASC, `ContratoAtorFilme_Ator_id_ator` ASC, `ContratoAtorFilme_Ator_nome_artistico_ator` ASC, `ContratoAtorFilme_Ator_seguro_social_ator` ASC),
  INDEX `fk_Personagem_Sexo1_idx` (`Sexo_sexo` ASC),
  CONSTRAINT `fk_Personagem_ContratoAtorFilme1`
    FOREIGN KEY (`ContratoAtorFilme_Filme_id_filme` , `ContratoAtorFilme_Filme_nome_filme` , `ContratoAtorFilme_Filme_copyright_filme` , `ContratoAtorFilme_Ator_id_ator` , `ContratoAtorFilme_Ator_nome_artistico_ator` , `ContratoAtorFilme_Ator_seguro_social_ator`)
    REFERENCES `mydb`.`ContratoAtorFilme` (`Filme_id_filme` , `Filme_nome_filme` , `Filme_copyright_filme` , `Ator_id_ator` , `Ator_nome_artistico_ator` , `Ator_seguro_social_ator`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personagem_Sexo1`
    FOREIGN KEY (`Sexo_sexo`)
    REFERENCES `mydb`.`Sexo` (`sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Bairro` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Bairro` (
  `id_bairro` INT NOT NULL,
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
DROP TABLE IF EXISTS `mydb`.`Rua` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Rua` (
  `id_rua` INT NOT NULL,
  `cep_rua` INT NOT NULL,
  `nome_rua` VARCHAR(45) NULL,
  `Bairro_id_bairro` INT NOT NULL,
  `Bairro_Cidade_id_cidade` INT NOT NULL,
  `Bairro_Cidade_UF_id_uf` INT NOT NULL,
  `Bairro_Cidade_UF_Pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_rua`, `cep_rua`, `Bairro_id_bairro`, `Bairro_Cidade_id_cidade`, `Bairro_Cidade_UF_id_uf`, `Bairro_Cidade_UF_Pais_id_pais`),
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
DROP TABLE IF EXISTS `mydb`.`TipoEndereco` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`TipoEndereco` (
  `id_tipo_endereco` INT NOT NULL,
  `descricao_tipo_endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_endereco`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Endereco` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `id_endereco` INT NOT NULL,
  `Rua_id_rua` INT NOT NULL,
  `Rua_cep_rua` INT NOT NULL,
  `Rua_Bairro_id_bairro` INT NOT NULL,
  `Rua_Bairro_Cidade_id_cidade` INT NOT NULL,
  `Rua_Bairro_Cidade_UF_id_uf` INT NOT NULL,
  `Rua_Bairro_Cidade_UF_Pais_id_pais` INT NOT NULL,
  `TipoEndereco_id_tipo_endereco` INT NOT NULL,
  `DonoEstudio_id_dono_estudo` INT NOT NULL,
  `Estudio_id_estudio` INT NOT NULL,
  `Estudio_nome_estudio` VARCHAR(45) NOT NULL,
  `Estudio_DonoEstudio_id_dono_estudo` INT NOT NULL,
  PRIMARY KEY (`id_endereco`, `Rua_id_rua`, `Rua_cep_rua`, `Rua_Bairro_id_bairro`, `Rua_Bairro_Cidade_id_cidade`, `Rua_Bairro_Cidade_UF_id_uf`, `Rua_Bairro_Cidade_UF_Pais_id_pais`, `TipoEndereco_id_tipo_endereco`, `DonoEstudio_id_dono_estudo`, `Estudio_id_estudio`, `Estudio_nome_estudio`, `Estudio_DonoEstudio_id_dono_estudo`),
  INDEX `fk_Endereco_Rua1_idx` (`Rua_id_rua` ASC, `Rua_cep_rua` ASC, `Rua_Bairro_id_bairro` ASC, `Rua_Bairro_Cidade_id_cidade` ASC, `Rua_Bairro_Cidade_UF_id_uf` ASC, `Rua_Bairro_Cidade_UF_Pais_id_pais` ASC),
  INDEX `fk_Endereco_TipoEndereco1_idx` (`TipoEndereco_id_tipo_endereco` ASC),
  INDEX `fk_Endereco_DonoEstudio1_idx` (`DonoEstudio_id_dono_estudo` ASC),
  INDEX `fk_Endereco_Estudio1_idx` (`Estudio_id_estudio` ASC, `Estudio_nome_estudio` ASC, `Estudio_DonoEstudio_id_dono_estudo` ASC),
  CONSTRAINT `fk_Endereco_Rua1`
    FOREIGN KEY (`Rua_id_rua` , `Rua_cep_rua` , `Rua_Bairro_id_bairro` , `Rua_Bairro_Cidade_id_cidade` , `Rua_Bairro_Cidade_UF_id_uf` , `Rua_Bairro_Cidade_UF_Pais_id_pais`)
    REFERENCES `mydb`.`Rua` (`id_rua` , `cep_rua` , `Bairro_id_bairro` , `Bairro_Cidade_id_cidade` , `Bairro_Cidade_UF_id_uf` , `Bairro_Cidade_UF_Pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_TipoEndereco1`
    FOREIGN KEY (`TipoEndereco_id_tipo_endereco`)
    REFERENCES `mydb`.`TipoEndereco` (`id_tipo_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_DonoEstudio1`
    FOREIGN KEY (`DonoEstudio_id_dono_estudo`)
    REFERENCES `mydb`.`DonoEstudio` (`id_dono_estudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Estudio1`
    FOREIGN KEY (`Estudio_id_estudio` , `Estudio_nome_estudio` , `Estudio_DonoEstudio_id_dono_estudo`)
    REFERENCES `mydb`.`Estudio` (`id_estudio` , `nome_estudio` , `DonoEstudio_id_dono_estudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TipoTelefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoTelefone` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`TipoTelefone` (
  `id_tipo_telefone` INT NOT NULL,
  `descricao_tipo_telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_telefone`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Telefone` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `id_telefone` INT NOT NULL,
  `numero_telefone` VARCHAR(45) NULL,
  `TipoTelefone_id_tipo_telefone` INT NOT NULL,
  `Estudio_id_estudio` INT NOT NULL,
  `Estudio_nome_estudio` VARCHAR(45) NOT NULL,
  `Estudio_DonoEstudio_id_dono_estudo` INT NOT NULL,
  `DonoEstudio_id_dono_estudo` INT NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  `Diretor_Filme_id_filme` INT NOT NULL,
  `Diretor_Filme_nome_filme` VARCHAR(45) NOT NULL,
  `Diretor_Filme_copyright_filme` MEDIUMTEXT NOT NULL,
  `Diretor_Filme_Estudio_id_estudio` INT NOT NULL,
  `Diretor_Filme_Estudio_nome_estudio` VARCHAR(45) NOT NULL,
  `Ator_id_ator` INT NOT NULL,
  `Ator_nome_artistico_ator` VARCHAR(45) NOT NULL,
  `Ator_seguro_social_ator` MEDIUMTEXT NOT NULL,
  `Ator_Cidade_id_cidade` INT NOT NULL,
  PRIMARY KEY (`id_telefone`, `TipoTelefone_id_tipo_telefone`, `Estudio_id_estudio`, `Estudio_nome_estudio`, `Estudio_DonoEstudio_id_dono_estudo`, `DonoEstudio_id_dono_estudo`, `Diretor_idDiretor`, `Diretor_Filme_id_filme`, `Diretor_Filme_nome_filme`, `Diretor_Filme_copyright_filme`, `Diretor_Filme_Estudio_id_estudio`, `Diretor_Filme_Estudio_nome_estudio`, `Ator_id_ator`, `Ator_nome_artistico_ator`, `Ator_seguro_social_ator`, `Ator_Cidade_id_cidade`),
  INDEX `fk_Telefone_TipoTelefone1_idx` (`TipoTelefone_id_tipo_telefone` ASC),
  INDEX `fk_Telefone_Estudio1_idx` (`Estudio_id_estudio` ASC, `Estudio_nome_estudio` ASC, `Estudio_DonoEstudio_id_dono_estudo` ASC),
  INDEX `fk_Telefone_DonoEstudio1_idx` (`DonoEstudio_id_dono_estudo` ASC),
  INDEX `fk_Telefone_Diretor1_idx` (`Diretor_idDiretor` ASC, `Diretor_Filme_id_filme` ASC, `Diretor_Filme_nome_filme` ASC, `Diretor_Filme_copyright_filme` ASC, `Diretor_Filme_Estudio_id_estudio` ASC, `Diretor_Filme_Estudio_nome_estudio` ASC),
  INDEX `fk_Telefone_Ator1_idx` (`Ator_id_ator` ASC, `Ator_nome_artistico_ator` ASC, `Ator_seguro_social_ator` ASC, `Ator_Cidade_id_cidade` ASC),
  CONSTRAINT `fk_Telefone_TipoTelefone1`
    FOREIGN KEY (`TipoTelefone_id_tipo_telefone`)
    REFERENCES `mydb`.`TipoTelefone` (`id_tipo_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Estudio1`
    FOREIGN KEY (`Estudio_id_estudio` , `Estudio_nome_estudio` , `Estudio_DonoEstudio_id_dono_estudo`)
    REFERENCES `mydb`.`Estudio` (`id_estudio` , `nome_estudio` , `DonoEstudio_id_dono_estudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_DonoEstudio1`
    FOREIGN KEY (`DonoEstudio_id_dono_estudo`)
    REFERENCES `mydb`.`DonoEstudio` (`id_dono_estudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor` , `Diretor_Filme_id_filme` , `Diretor_Filme_nome_filme` , `Diretor_Filme_copyright_filme` , `Diretor_Filme_Estudio_id_estudio` , `Diretor_Filme_Estudio_nome_estudio`)
    REFERENCES `mydb`.`Diretor` (`idDiretor` , `Filme_id_filme` , `Filme_nome_filme` , `Filme_copyright_filme` , `Filme_Estudio_id_estudio` , `Filme_Estudio_nome_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Ator1`
    FOREIGN KEY (`Ator_id_ator` , `Ator_nome_artistico_ator` , `Ator_seguro_social_ator` , `Ator_Cidade_id_cidade`)
    REFERENCES `mydb`.`Ator` (`id_ator` , `nome_artistico_ator` , `seguro_social_ator` , `Cidade_id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Papel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Papel` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Papel` (
  `id_papel` INT NOT NULL,
  `descricao_papel` VARCHAR(45) NULL,
  PRIMARY KEY (`id_papel`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`AtorPapel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AtorPapel` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`AtorPapel` (
  `Ator_id_ator` INT NOT NULL,
  `Ator_nome_artistico_ator` VARCHAR(45) NOT NULL,
  `Ator_seguro_social_ator` MEDIUMTEXT NOT NULL,
  `Ator_Cidade_id_cidade` INT NOT NULL,
  `Ator_Cidade_id_cidade1` INT NOT NULL,
  `Ator_Cidade_UF_id_uf` INT NOT NULL,
  `Ator_Cidade_UF_Pais_id_pais` INT NOT NULL,
  `Ator_EstadoCivil_id_estado_civil` INT NOT NULL,
  `Ator_Sexo_sexo` TINYINT(1) NOT NULL,
  `Papel_id_papel` INT NOT NULL,
  PRIMARY KEY (`Ator_id_ator`, `Ator_nome_artistico_ator`, `Ator_seguro_social_ator`, `Ator_Cidade_id_cidade`, `Ator_Cidade_id_cidade1`, `Ator_Cidade_UF_id_uf`, `Ator_Cidade_UF_Pais_id_pais`, `Ator_EstadoCivil_id_estado_civil`, `Ator_Sexo_sexo`, `Papel_id_papel`),
  INDEX `fk_Ator_has_Papel_Papel1_idx` (`Papel_id_papel` ASC),
  INDEX `fk_Ator_has_Papel_Ator1_idx` (`Ator_id_ator` ASC, `Ator_nome_artistico_ator` ASC, `Ator_seguro_social_ator` ASC, `Ator_Cidade_id_cidade` ASC, `Ator_Cidade_id_cidade1` ASC, `Ator_Cidade_UF_id_uf` ASC, `Ator_Cidade_UF_Pais_id_pais` ASC, `Ator_EstadoCivil_id_estado_civil` ASC, `Ator_Sexo_sexo` ASC),
  CONSTRAINT `fk_Ator_has_Papel_Ator1`
    FOREIGN KEY (`Ator_id_ator` , `Ator_nome_artistico_ator` , `Ator_seguro_social_ator` , `Ator_Cidade_id_cidade` , `Ator_Cidade_id_cidade1` , `Ator_Cidade_UF_id_uf` , `Ator_Cidade_UF_Pais_id_pais` , `Ator_EstadoCivil_id_estado_civil` , `Ator_Sexo_sexo`)
    REFERENCES `mydb`.`Ator` (`id_ator` , `nome_artistico_ator` , `seguro_social_ator` , `Cidade_id_cidade` , `Cidade_id_cidade1` , `Cidade_UF_id_uf` , `Cidade_UF_Pais_id_pais` , `EstadoCivil_id_estado_civil` , `Sexo_sexo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ator_has_Papel_Papel1`
    FOREIGN KEY (`Papel_id_papel`)
    REFERENCES `mydb`.`Papel` (`id_papel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
