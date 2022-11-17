-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_g06
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_g06
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_g06` DEFAULT CHARACTER SET utf8 ;
USE `bd_g06` ;

-- -----------------------------------------------------
-- Table `bd_g06`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`personas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(45) NULL,
  `documento` VARCHAR(12) NULL,
  `nombre_comppleto` VARCHAR(80) NULL,
  `correo` VARCHAR(50) NULL,
  `celular` VARCHAR(20) NULL,
  `direccion` VARCHAR(50) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NULL,
  `contrasenia` VARCHAR(100) NULL,
  `estado` BIT(1) NULL,
  `rol_id` INT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_usuarios_roles`
    FOREIGN KEY (`rol_id`)
    REFERENCES `bd_g06`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_personas1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `bd_g06`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`vistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`vistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `ruta` VARCHAR(100) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`istas_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`istas_roles` (
  `id` INT NOT NULL,
  `vista_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_istas_roles_vistas1`
    FOREIGN KEY (`vista_id`)
    REFERENCES `bd_g06`.`vistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_istas_roles_roles1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `bd_g06`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`tipos_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`tipos_servicios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `descripcion` VARCHAR(45) NULL,
  `imgen` VARCHAR(45) NULL,
  `estado` BIT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`servicios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `valor_unitario` DOUBLE NULL,
  `tiempo_entrega` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `imagen` VARCHAR(45) NULL,
  `estado` BIT(1) NULL,
  `tipo_servicio_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_servicios_tipos_servicios1`
    FOREIGN KEY (`tipo_servicio_id`)
    REFERENCES `bd_g06`.`tipos_servicios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NULL,
  `estado` BIT(1) NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_clientes_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `bd_g06`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`facturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_factura` VARCHAR(20) NULL,
  `fecha` TIMESTAMP NULL,
  `descuento` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `valor_bruto` DOUBLE NULL,
  `valor_neto` DOUBLE NULL,
  `medio_pago` VARCHAR(50) NULL,
  `estado` BIT(1) NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `bd_g06`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_g06`.`facturas_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_g06`.`facturas_servicios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` SMALLINT NULL,
  `descuento` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `valor_bruto` DOUBLE NULL,
  `valor_neto` DOUBLE NULL,
  `servicio_id` INT NOT NULL,
  `factura_id` INT NOT NULL,
  PRIMARY KEY (`id`), 
  CONSTRAINT `fk_facturas_servicios_servicios1`
    FOREIGN KEY (`servicio_id`)
    REFERENCES `bd_g06`.`servicios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_servicios_facturas1`
    FOREIGN KEY (`factura_id`)
    REFERENCES `bd_g06`.`facturas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
