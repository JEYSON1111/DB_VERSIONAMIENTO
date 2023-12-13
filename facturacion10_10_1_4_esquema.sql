-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_anticipo
DROP TABLE IF EXISTS `1_4_anticipo`;
CREATE TABLE IF NOT EXISTS `1_4_anticipo` (
  `ant_codigo` float(19,0) NOT NULL AUTO_INCREMENT,
  `ant_valor` float(19,2) DEFAULT NULL,
  `ant_fecha` datetime DEFAULT NULL,
  `cli_ins_codigo` float(10,0) DEFAULT NULL,
  `ant_estado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ant_codigo`),
  KEY `fk_1_4_anticipo1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_anticipo1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2158 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_asignacion
DROP TABLE IF EXISTS `1_4_asignacion`;
CREATE TABLE IF NOT EXISTS `1_4_asignacion` (
  `asi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ins_codigo` int(11) DEFAULT NULL,
  `asi_cupo` float(18,2) DEFAULT NULL,
  `asi_participa` float(18,2) DEFAULT NULL,
  `temporada` varchar(50) DEFAULT NULL,
  `libreria` int(11) DEFAULT NULL,
  PRIMARY KEY (`asi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_bancos
DROP TABLE IF EXISTS `1_4_bancos`;
CREATE TABLE IF NOT EXISTS `1_4_bancos` (
  `BAN_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_NOMBRE` varchar(200) DEFAULT NULL,
  `BAN_DIRECCION` varchar(500) DEFAULT NULL,
  `BAN_TELEFONO` varchar(100) DEFAULT NULL,
  `BAN_EMPRESA` bit(1) DEFAULT NULL,
  PRIMARY KEY (`BAN_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_beneficiario
DROP TABLE IF EXISTS `1_4_beneficiario`;
CREATE TABLE IF NOT EXISTS `1_4_beneficiario` (
  `ben_id` int(11) NOT NULL AUTO_INCREMENT,
  `ben_nombre` varchar(250) NOT NULL,
  `ben_apellido` varchar(250) NOT NULL,
  `ben_telefono` varchar(250) NOT NULL,
  `ben_cuenta` varchar(250) NOT NULL,
  `ben_tipo_cuenta` varchar(50) NOT NULL,
  `ben_banco` varchar(250) NOT NULL,
  `ben_contrato` varchar(250) DEFAULT NULL,
  `ben_comision` float(18,2) DEFAULT NULL,
  `ben_valor` float(18,2) DEFAULT NULL,
  `ben_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ben_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cartera_temp
DROP TABLE IF EXISTS `1_4_cartera_temp`;
CREATE TABLE IF NOT EXISTS `1_4_cartera_temp` (
  `libreria` varchar(100) DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `brutas` float(18,2) DEFAULT NULL,
  `netas` float(18,2) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT NULL,
  `recuperado` float DEFAULT NULL,
  `saldo` float(18,2) DEFAULT NULL,
  `devuelto` float(18,2) DEFAULT NULL,
  `facturador` varchar(50) DEFAULT NULL,
  `consignado` float(18,2) DEFAULT NULL,
  `fecha_inicial` datetime DEFAULT NULL,
  `posf` float(18,2) DEFAULT NULL,
  `salposf` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cheque
DROP TABLE IF EXISTS `1_4_cheque`;
CREATE TABLE IF NOT EXISTS `1_4_cheque` (
  `che_codigo` float(10,0) NOT NULL AUTO_INCREMENT,
  `cli_ins_codigo` float(10,0) NOT NULL,
  `tip_che_codigo` int(11) NOT NULL,
  `est_che_codigo` int(11) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `che_valor` float(10,2) DEFAULT NULL,
  `che_numero` float(10,0) DEFAULT NULL,
  `che_referencia` varchar(200) DEFAULT NULL,
  `che_fecha_cobro` datetime DEFAULT NULL,
  `che_plazo` int(11) DEFAULT NULL,
  `che_num_cuenta` varchar(15) DEFAULT NULL,
  `che_secuencia` bigint(20) DEFAULT NULL,
  `che_observacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`che_codigo`),
  KEY `fk_1_4_cheque1_4_cliente_institucion` (`cli_ins_codigo`),
  KEY `fk_1_4_cheque1_4_tipo_cheque` (`tip_che_codigo`),
  KEY `fk_1_4_cheque1_4_estado_cheque` (`est_che_codigo`),
  KEY `fk_1_4_cheque1_4_bancos` (`ban_codigo`),
  CONSTRAINT `fk_1_4_cheque1_4_bancos` FOREIGN KEY (`ban_codigo`) REFERENCES `1_4_bancos` (`BAN_CODIGO`),
  CONSTRAINT `fk_1_4_cheque1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_cheque1_4_estado_cheque` FOREIGN KEY (`est_che_codigo`) REFERENCES `1_4_estado_cheque` (`est_che_codigo`),
  CONSTRAINT `fk_1_4_cheque1_4_tipo_cheque` FOREIGN KEY (`tip_che_codigo`) REFERENCES `1_4_tipo_cheque` (`tip_che_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10427 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cheque_venta
DROP TABLE IF EXISTS `1_4_cheque_venta`;
CREATE TABLE IF NOT EXISTS `1_4_cheque_venta` (
  `che_ven_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ven_codigo` varchar(20) NOT NULL,
  `liq_ch_codigo` int(11) DEFAULT NULL,
  `che_ven_valor` float(10,2) DEFAULT NULL,
  `che_ven_nombre` varchar(200) DEFAULT NULL,
  `che__numero` float(10,0) DEFAULT NULL,
  PRIMARY KEY (`che_ven_codigo`),
  KEY `fk_1_4_cheque_venta1_4_venta` (`ven_codigo`),
  KEY `fk_1_4_cheque_venta1_4_liquidacion` (`liq_ch_codigo`),
  CONSTRAINT `fk_1_4_cheque_venta1_4_liquidacion` FOREIGN KEY (`liq_ch_codigo`) REFERENCES `1_4_liquidacion` (`liq_ch_codigo`),
  CONSTRAINT `fk_1_4_cheque_venta1_4_venta` FOREIGN KEY (`ven_codigo`) REFERENCES `1_4_venta` (`ven_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=24487 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_ciclo
DROP TABLE IF EXISTS `1_4_ciclo`;
CREATE TABLE IF NOT EXISTS `1_4_ciclo` (
  `CIC_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `CIC_NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CIC_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_ciudad
DROP TABLE IF EXISTS `1_4_ciudad`;
CREATE TABLE IF NOT EXISTS `1_4_ciudad` (
  `CIU_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PROVI_CODIGO` int(11) NOT NULL,
  `CIU_NOMBRE` varchar(100) DEFAULT NULL,
  `CIU_COD_TELEFONO` varchar(5) DEFAULT NULL,
  `CIU_ZONA_C` varchar(100) DEFAULT NULL,
  `CIU_ZONA_S` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CIU_CODIGO`),
  KEY `fk_1_4_ciudad1_4_provincia` (`PROVI_CODIGO`),
  CONSTRAINT `fk_1_4_ciudad1_4_provincia` FOREIGN KEY (`PROVI_CODIGO`) REFERENCES `1_4_provincia` (`provi_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cliente
DROP TABLE IF EXISTS `1_4_cliente`;
CREATE TABLE IF NOT EXISTS `1_4_cliente` (
  `cli_ci` varchar(50) NOT NULL,
  `cli_apellidos` varchar(500) DEFAULT NULL,
  `cli_nombres` varchar(500) DEFAULT NULL,
  `cli_direccion` varchar(300) DEFAULT NULL,
  `cli_telefono` varchar(200) DEFAULT NULL,
  `cli_email` varchar(50) DEFAULT NULL,
  `cli_credito` float(20,2) DEFAULT NULL,
  `cli_plazo` int(11) DEFAULT NULL,
  `cli_alias` varchar(50) DEFAULT NULL,
  `cli_celular` varchar(200) DEFAULT NULL,
  `cli_fecha_nacimiento` datetime DEFAULT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  `cli_titulo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cli_ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cliente_institucion
DROP TABLE IF EXISTS `1_4_cliente_institucion`;
CREATE TABLE IF NOT EXISTS `1_4_cliente_institucion` (
  `cli_ins_codigo` float(10,0) NOT NULL AUTO_INCREMENT,
  `cli_ci` varchar(50) DEFAULT NULL,
  `ins_codigo` int(11) NOT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cli_ins_codigo`),
  KEY `fk_1_4_cliente_institucion1_4_cliente` (`cli_ci`),
  KEY `fk_1_4_cliente_institucion1_4_institucion` (`ins_codigo`),
  CONSTRAINT `fk_1_4_cliente_institucion1_4_cliente` FOREIGN KEY (`cli_ci`) REFERENCES `1_4_cliente` (`cli_ci`),
  CONSTRAINT `fk_1_4_cliente_institucion1_4_institucion` FOREIGN KEY (`ins_codigo`) REFERENCES `1_4_institucion` (`ins_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=39151 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cli_facturas
DROP TABLE IF EXISTS `1_4_cli_facturas`;
CREATE TABLE IF NOT EXISTS `1_4_cli_facturas` (
  `cli_ci` varchar(50) DEFAULT NULL,
  `cli_nombres` varchar(200) DEFAULT NULL,
  `ins_nombre` varchar(200) DEFAULT NULL,
  `codigo` float(18,0) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cobrador
DROP TABLE IF EXISTS `1_4_cobrador`;
CREATE TABLE IF NOT EXISTS `1_4_cobrador` (
  `cobra_codigo` varchar(50) NOT NULL,
  `cobra_apellidos` varchar(100) DEFAULT NULL,
  `cobra_nombres` varchar(100) DEFAULT NULL,
  `cobra_direccion` varchar(200) DEFAULT NULL,
  `cobra_telefono` varchar(100) DEFAULT NULL,
  `cobra_email` varchar(100) DEFAULT NULL,
  `cobra_ci` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cobra_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_compra
DROP TABLE IF EXISTS `1_4_compra`;
CREATE TABLE IF NOT EXISTS `1_4_compra` (
  `com_codigo` bigint(20) NOT NULL,
  `prov_codigo` int(11) NOT NULL,
  `com_factura` varchar(50) DEFAULT NULL,
  `com_fecha` datetime DEFAULT NULL,
  `com_valor` float(18,0) DEFAULT NULL,
  `com_responsable` varchar(50) DEFAULT NULL,
  `com_observacion` varchar(50) DEFAULT NULL,
  `com_iva` float(18,0) DEFAULT NULL,
  `com_descuento` float(18,0) DEFAULT NULL,
  `orden_trabajo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`com_codigo`),
  KEY `fk_1_4_compra1_4_proveedor` (`prov_codigo`),
  CONSTRAINT `fk_1_4_compra1_4_proveedor` FOREIGN KEY (`prov_codigo`) REFERENCES `1_4_proveedor` (`prov_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_configuracion
DROP TABLE IF EXISTS `1_4_configuracion`;
CREATE TABLE IF NOT EXISTS `1_4_configuracion` (
  `con_cod` int(11) NOT NULL AUTO_INCREMENT,
  `con_nombre` varchar(200) DEFAULT NULL,
  `con_valor_num` float(20,2) DEFAULT NULL,
  `con_valor_str` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`con_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cuenta
DROP TABLE IF EXISTS `1_4_cuenta`;
CREATE TABLE IF NOT EXISTS `1_4_cuenta` (
  `cuen_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ban_codigo` int(11) DEFAULT NULL,
  `cuen_numero` varchar(20) DEFAULT NULL,
  `cuen_descripcion` varchar(200) DEFAULT NULL,
  `cuen_nombre` varchar(20) DEFAULT NULL,
  `cuen_secuencial` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cuen_codigo`),
  KEY `fk_1_4_cuenta1_4_bancos` (`ban_codigo`),
  CONSTRAINT `fk_1_4_cuenta1_4_bancos` FOREIGN KEY (`ban_codigo`) REFERENCES `1_4_bancos` (`BAN_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_cuenta_pago
DROP TABLE IF EXISTS `1_4_cuenta_pago`;
CREATE TABLE IF NOT EXISTS `1_4_cuenta_pago` (
  `cue_pag_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ban_codigo` int(11) NOT NULL,
  `cue_pag_numero` varchar(20) DEFAULT NULL,
  `cue_pag_descripcion` varchar(200) DEFAULT NULL,
  `cue_pag_nombre` varchar(50) DEFAULT NULL,
  `cue_pag_secuencial` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cue_pag_codigo`),
  KEY `fk_1_4_cuenta_pago1_4_bancos` (`ban_codigo`),
  CONSTRAINT `fk_1_4_cuenta_pago1_4_bancos` FOREIGN KEY (`ban_codigo`) REFERENCES `1_4_bancos` (`BAN_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_departamento
DROP TABLE IF EXISTS `1_4_departamento`;
CREATE TABLE IF NOT EXISTS `1_4_departamento` (
  `dep_codigo` char(3) NOT NULL,
  `dep_nombre` varchar(60) DEFAULT NULL,
  `dep_descripcion` varchar(200) DEFAULT NULL,
  `dep_permiso` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dep_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_compra
DROP TABLE IF EXISTS `1_4_detalle_compra`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_compra` (
  `det_com_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `com_codigo` bigint(20) NOT NULL,
  `pro_codigo` varchar(20) NOT NULL,
  `det_com_cantidad` int(11) DEFAULT NULL,
  `det_com_valor_u` float(18,2) DEFAULT NULL,
  PRIMARY KEY (`det_com_codigo`),
  KEY `fk_1_4_detalle_compra1_4_producto` (`pro_codigo`),
  CONSTRAINT `fk_1_4_detalle_compra1_4_producto` FOREIGN KEY (`pro_codigo`) REFERENCES `1_4_producto` (`pro_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10525 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_conta
DROP TABLE IF EXISTS `1_4_detalle_conta`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_conta` (
  `det_cont_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `det_cont_pro` varchar(50) DEFAULT NULL,
  `det_cont_cantidad` bigint(20) DEFAULT NULL,
  `det_cont_valor` float(18,4) DEFAULT NULL,
  PRIMARY KEY (`det_cont_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_empaque
DROP TABLE IF EXISTS `1_4_detalle_empaque`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_empaque` (
  `empa_codigo` varchar(50) NOT NULL,
  `det_empa_codigo` varchar(50) NOT NULL,
  `det_peso_neto` float(18,4) DEFAULT NULL,
  `det_peso_bruto` float(18,4) DEFAULT NULL,
  `tip_empa_codigo` varchar(50) NOT NULL,
  PRIMARY KEY (`det_empa_codigo`),
  KEY `fk_1_4_detalle_empaque1_4_empacado` (`empa_codigo`),
  KEY `fk_1_4_detalle_empaque1_4_tipo_empaque` (`tip_empa_codigo`),
  CONSTRAINT `fk_1_4_detalle_empaque1_4_empacado` FOREIGN KEY (`empa_codigo`) REFERENCES `1_4_empacado` (`empa_codigo`),
  CONSTRAINT `fk_1_4_detalle_empaque1_4_tipo_empaque` FOREIGN KEY (`tip_empa_codigo`) REFERENCES `1_4_tipo_empaque` (`tip_empa_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_er
DROP TABLE IF EXISTS `1_4_detalle_er`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_er` (
  `der_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `er_codigo` bigint(20) DEFAULT NULL,
  `cli_ins_codigo` float(10,0) DEFAULT NULL,
  `der_documentos` varchar(500) DEFAULT NULL,
  `der_observacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`der_codigo`),
  KEY `fk_1_4_detalle_er1_4_entrega_recepcion` (`er_codigo`),
  KEY `fk_1_4_detalle_er1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_detalle_er1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_detalle_er1_4_entrega_recepcion` FOREIGN KEY (`er_codigo`) REFERENCES `1_4_entrega_recepcion` (`er_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=23961 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_er_e
DROP TABLE IF EXISTS `1_4_detalle_er_e`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_er_e` (
  `der_est_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `er_est_codigo` bigint(20) DEFAULT NULL,
  `cli_ins_codigo` float(10,0) DEFAULT NULL,
  `der_est_documentos` varchar(500) DEFAULT NULL,
  `der_est_observacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`der_est_codigo`),
  KEY `fk_1_4_detalle_er_e1_4_cliente_institucion` (`cli_ins_codigo`),
  KEY `fk_1_4_detalle_er_e1_4_entrega_recepcion_est` (`er_est_codigo`),
  CONSTRAINT `fk_1_4_detalle_er_e1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_detalle_er_e1_4_entrega_recepcion_est` FOREIGN KEY (`er_est_codigo`) REFERENCES `1_4_entrega_recepcion_est` (`er_est_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=33972 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_liquidacion
DROP TABLE IF EXISTS `1_4_detalle_liquidacion`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_liquidacion` (
  `det_liq_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_codigo` varchar(20) DEFAULT NULL,
  `pro_cantidad` int(11) DEFAULT NULL,
  `liq_ch_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`det_liq_codigo`),
  KEY `fk_1_4_detalle_liquidacion1_4_liquidacion` (`liq_ch_codigo`),
  CONSTRAINT `fk_1_4_detalle_liquidacion1_4_liquidacion` FOREIGN KEY (`liq_ch_codigo`) REFERENCES `1_4_liquidacion` (`liq_ch_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3101 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_nota_devolucion
DROP TABLE IF EXISTS `1_4_detalle_nota_devolucion`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_nota_devolucion` (
  `d_nd_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nd_codigo` varchar(50) NOT NULL,
  `pro_codigo` varchar(20) DEFAULT NULL,
  `d_nd_cantidad` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`d_nd_codigo`),
  KEY `fk_1_4_detalle_nota_devolucion1_4_nota_devolucion` (`nd_codigo`),
  CONSTRAINT `fk_1_4_detalle_nota_devolucion1_4_nota_devolucion` FOREIGN KEY (`nd_codigo`) REFERENCES `1_4_nota_devolucion` (`nd_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=136108 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_orden_trabajo
DROP TABLE IF EXISTS `1_4_detalle_orden_trabajo`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_orden_trabajo` (
  `det_or_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `or_codigo` varchar(250) NOT NULL,
  `pro_codigo` varchar(250) NOT NULL,
  `det_or_cantidad` bigint(20) DEFAULT NULL,
  `det_or_guias` bigint(20) DEFAULT NULL,
  `det_or_tamaño` varchar(50) DEFAULT NULL,
  `det_or_int_paginas` bigint(20) DEFAULT NULL,
  `det_or_in_codigo` varchar(50) DEFAULT NULL,
  `det_or_in_tintas` varchar(50) DEFAULT NULL,
  `mat_cub_codigo` varchar(50) DEFAULT NULL,
  `det_or_cub_tintas` varchar(50) DEFAULT NULL,
  `det_or_acabados` varchar(250) DEFAULT NULL,
  `det_or_posible_entrega` datetime DEFAULT NULL,
  `det_or_planificacion` bigint(20) DEFAULT NULL,
  `det_or_observaciones` varchar(250) DEFAULT NULL,
  `det_or_recubrimiento` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`det_or_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1725 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_rps
DROP TABLE IF EXISTS `1_4_detalle_rps`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_rps` (
  `drps_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_codigo` varchar(20) DEFAULT NULL,
  `rps_codigo` varchar(50) DEFAULT NULL,
  `drps_cantidad` bigint(20) DEFAULT NULL,
  `drps_valor_u` float(18,2) DEFAULT NULL,
  PRIMARY KEY (`drps_codigo`),
  KEY `fk_1_4_detalle_rps1_4_producto` (`pro_codigo`),
  CONSTRAINT `fk_1_4_detalle_rps1_4_producto` FOREIGN KEY (`pro_codigo`) REFERENCES `1_4_producto` (`pro_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_venta
DROP TABLE IF EXISTS `1_4_detalle_venta`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_venta` (
  `det_ven_codigo` float(10,0) NOT NULL AUTO_INCREMENT,
  `ven_codigo` varchar(20) NOT NULL,
  `pro_codigo` varchar(20) NOT NULL,
  `det_ven_cantidad` int(11) DEFAULT NULL,
  `det_ven_valor_u` float(10,2) DEFAULT NULL,
  `det_ven_iva` float(10,2) DEFAULT NULL,
  `det_ven_descontar` bit(1) DEFAULT NULL,
  `det_ven_inicio` bit(1) DEFAULT NULL,
  `det_ven_cantidad_real` int(11) DEFAULT NULL,
  PRIMARY KEY (`det_ven_codigo`),
  KEY `fk_1_4_detalle_venta1_4_producto` (`pro_codigo`),
  KEY `fk_1_4_detalle_venta1_4_venta` (`ven_codigo`),
  CONSTRAINT `fk_1_4_detalle_venta1_4_producto` FOREIGN KEY (`pro_codigo`) REFERENCES `1_4_producto` (`pro_codigo`),
  CONSTRAINT `fk_1_4_detalle_venta1_4_venta` FOREIGN KEY (`ven_codigo`) REFERENCES `1_4_venta` (`ven_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2689047 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_detalle_verificacion
DROP TABLE IF EXISTS `1_4_detalle_verificacion`;
CREATE TABLE IF NOT EXISTS `1_4_detalle_verificacion` (
  `det_ver_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_codigo` varchar(20) NOT NULL,
  `ven_codigo` varchar(20) NOT NULL,
  `det_ver_cantidad` int(11) NOT NULL,
  `det_ver_verificacion` int(11) NOT NULL,
  `det_ver_fecha` datetime NOT NULL,
  PRIMARY KEY (`det_ver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22171 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_documento_liq
DROP TABLE IF EXISTS `1_4_documento_liq`;
CREATE TABLE IF NOT EXISTS `1_4_documento_liq` (
  `doc_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_valor` float(18,2) DEFAULT NULL,
  `doc_numero` varchar(500) DEFAULT NULL,
  `doc_nombre` varchar(500) DEFAULT NULL,
  `doc_ci` varchar(500) DEFAULT NULL,
  `doc_cuenta` varchar(500) DEFAULT NULL,
  `doc_institucion` varchar(50) DEFAULT NULL,
  `doc_tipo` varchar(50) DEFAULT NULL,
  `doc_observacion` varchar(500) DEFAULT NULL,
  `ven_codigo` varchar(20) DEFAULT NULL,
  `doc_fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`doc_codigo`),
  KEY `fk_1_4_documento_liq1_4_venta` (`ven_codigo`),
  CONSTRAINT `fk_1_4_documento_liq1_4_venta` FOREIGN KEY (`ven_codigo`) REFERENCES `1_4_venta` (`ven_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=20464 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_empacado
DROP TABLE IF EXISTS `1_4_empacado`;
CREATE TABLE IF NOT EXISTS `1_4_empacado` (
  `empa_codigo` varchar(50) NOT NULL,
  `empa_fecha` datetime DEFAULT NULL,
  `empa_facturas` varchar(500) DEFAULT NULL,
  `empa_cartones` int(11) DEFAULT NULL,
  `usu_codigo` char(10) DEFAULT NULL,
  `empa_peso_neto` float(18,4) DEFAULT NULL,
  `empa_peso_bruto` float(18,4) DEFAULT NULL,
  `empa_calculado` float(18,4) DEFAULT NULL,
  `remi_codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`empa_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_entregas_complementarias
DROP TABLE IF EXISTS `1_4_entregas_complementarias`;
CREATE TABLE IF NOT EXISTS `1_4_entregas_complementarias` (
  `ent_com_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `remi_codigo` varchar(50) DEFAULT NULL,
  `ven_codigo` varchar(50) DEFAULT NULL,
  `pro_codigo` varchar(50) DEFAULT NULL,
  `ent_com_cantidad` bigint(20) DEFAULT NULL,
  `ent_com_peso` float(18,4) DEFAULT NULL,
  PRIMARY KEY (`ent_com_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_entrega_recepcion
DROP TABLE IF EXISTS `1_4_entrega_recepcion`;
CREATE TABLE IF NOT EXISTS `1_4_entrega_recepcion` (
  `er_codigo` bigint(20) NOT NULL,
  `er_fecha_entrega` datetime DEFAULT NULL,
  `er_usu_entrega` varchar(50) DEFAULT NULL,
  `er_usu_recibe` varchar(50) DEFAULT NULL,
  `er_fecha_recibe` datetime DEFAULT NULL,
  `er_tipo` int(11) DEFAULT NULL,
  `er_desde` varchar(50) DEFAULT NULL,
  `er_hasta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`er_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_entrega_recepcion_est
DROP TABLE IF EXISTS `1_4_entrega_recepcion_est`;
CREATE TABLE IF NOT EXISTS `1_4_entrega_recepcion_est` (
  `er_est_codigo` bigint(20) NOT NULL,
  `er_est_fecha_entrega` datetime DEFAULT NULL,
  `er_est_usu_entrega` varchar(50) DEFAULT NULL,
  `er_est_usu_recibe` varchar(50) DEFAULT NULL,
  `er_est_fecha_recibe` datetime DEFAULT NULL,
  `er_est_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`er_est_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_estado_cheque
DROP TABLE IF EXISTS `1_4_estado_cheque`;
CREATE TABLE IF NOT EXISTS `1_4_estado_cheque` (
  `est_che_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `est_che_nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`est_che_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_estado_venta
DROP TABLE IF EXISTS `1_4_estado_venta`;
CREATE TABLE IF NOT EXISTS `1_4_estado_venta` (
  `est_ven_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `est_ven_nombre` varchar(100) DEFAULT NULL,
  `est_ven_descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`est_ven_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_factcon
DROP TABLE IF EXISTS `1_4_factcon`;
CREATE TABLE IF NOT EXISTS `1_4_factcon` (
  `factura` varchar(200) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT NULL,
  `descvalor` float(18,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `cliente` float DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `transporte` float(18,2) DEFAULT NULL,
  `iva` float(18,0) DEFAULT NULL,
  `bruta` float DEFAULT NULL,
  `neta` float(18,2) DEFAULT NULL,
  `vence` datetime DEFAULT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `ruc` varchar(50) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_geo_canton
DROP TABLE IF EXISTS `1_4_geo_canton`;
CREATE TABLE IF NOT EXISTS `1_4_geo_canton` (
  `can_id` varchar(10) NOT NULL,
  `can_nombre` varchar(250) DEFAULT NULL,
  `prov_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`can_id`),
  KEY `fk_1_4_geo_canton1_4_geo_provincia` (`prov_id`),
  CONSTRAINT `fk_1_4_geo_canton1_4_geo_provincia` FOREIGN KEY (`prov_id`) REFERENCES `1_4_geo_provincia` (`prov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_geo_parroquia
DROP TABLE IF EXISTS `1_4_geo_parroquia`;
CREATE TABLE IF NOT EXISTS `1_4_geo_parroquia` (
  `par_id` varchar(10) NOT NULL,
  `par_nombre` varchar(250) NOT NULL,
  `can_id` varchar(10) NOT NULL,
  PRIMARY KEY (`par_id`),
  KEY `fk_1_4_geo_parroquia1_4_geo_canton` (`can_id`),
  CONSTRAINT `fk_1_4_geo_parroquia1_4_geo_canton` FOREIGN KEY (`can_id`) REFERENCES `1_4_geo_canton` (`can_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_geo_provincia
DROP TABLE IF EXISTS `1_4_geo_provincia`;
CREATE TABLE IF NOT EXISTS `1_4_geo_provincia` (
  `prov_id` varchar(10) NOT NULL,
  `prov_nombre` varchar(250) DEFAULT NULL,
  `pai_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_grupo_productos
DROP TABLE IF EXISTS `1_4_grupo_productos`;
CREATE TABLE IF NOT EXISTS `1_4_grupo_productos` (
  `gru_pro_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `gru_pro_nombre` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`gru_pro_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_institucion
DROP TABLE IF EXISTS `1_4_institucion`;
CREATE TABLE IF NOT EXISTS `1_4_institucion` (
  `ins_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ciu_codigo` int(11) NOT NULL,
  `tip_ins_codigo` int(11) NOT NULL,
  `cic_codigo` int(11) NOT NULL,
  `ins_nombre` varchar(200) DEFAULT NULL,
  `ins_direccion` varchar(300) DEFAULT NULL,
  `ins_telefono` varchar(200) DEFAULT NULL,
  `ins_alias` varchar(50) DEFAULT NULL,
  `ins_mail` varchar(200) DEFAULT NULL,
  `ins_sitio_web` varchar(200) DEFAULT NULL,
  `ins_nombre_juridico` varchar(200) DEFAULT NULL,
  `ins_nombre_comercial` varchar(200) DEFAULT NULL,
  `ins_representante_legal` varchar(200) DEFAULT NULL,
  `ins_ruc` varchar(50) DEFAULT NULL,
  `ins_sector` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ins_codigo`),
  KEY `fk_1_4_institucion1_4_ciudad` (`ciu_codigo`),
  KEY `fk_1_4_institucion1_4_tipo_institucion` (`tip_ins_codigo`),
  KEY `fk_1_4_institucion1_4_ciclo` (`cic_codigo`),
  CONSTRAINT `fk_1_4_institucion1_4_ciclo` FOREIGN KEY (`cic_codigo`) REFERENCES `1_4_ciclo` (`CIC_CODIGO`),
  CONSTRAINT `fk_1_4_institucion1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`),
  CONSTRAINT `fk_1_4_institucion1_4_tipo_institucion` FOREIGN KEY (`tip_ins_codigo`) REFERENCES `1_4_tipo_institucion` (`tip_ins_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22936 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_iva
DROP TABLE IF EXISTS `1_4_iva`;
CREATE TABLE IF NOT EXISTS `1_4_iva` (
  `iva_cod` int(11) NOT NULL AUTO_INCREMENT,
  `iva_valor` float(10,2) DEFAULT NULL,
  `iva_fecha_inicio` datetime DEFAULT NULL,
  `iva_fecha_fin` datetime DEFAULT NULL,
  `iva_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`iva_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_liquidacion
DROP TABLE IF EXISTS `1_4_liquidacion`;
CREATE TABLE IF NOT EXISTS `1_4_liquidacion` (
  `liq_ch_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usu_codigo` varchar(20) NOT NULL,
  `liq_che_nombres` varchar(200) DEFAULT NULL,
  `liq_che_valor` float(10,2) DEFAULT NULL,
  `liq_che_fecha` datetime DEFAULT NULL,
  `liq_che_numero` float(10,0) DEFAULT NULL,
  `liq_cobrado` bit(1) DEFAULT NULL,
  `ver_codigo` varchar(50) DEFAULT NULL,
  `ven_codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`liq_ch_codigo`),
  KEY `fk_1_4_liquidacion1_4_usuario` (`usu_codigo`),
  KEY `fk_1_4_liquidacion1_4_verificador` (`ver_codigo`),
  CONSTRAINT `fk_1_4_liquidacion1_4_usuario` FOREIGN KEY (`usu_codigo`) REFERENCES `1_4_usuario` (`usu_codigo`),
  CONSTRAINT `fk_1_4_liquidacion1_4_verificador` FOREIGN KEY (`ver_codigo`) REFERENCES `1_4_verificador` (`ver_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=28576 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_matchcodigos
DROP TABLE IF EXISTS `1_4_matchcodigos`;
CREATE TABLE IF NOT EXISTS `1_4_matchcodigos` (
  `pro_codigo` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_material_cubierta
DROP TABLE IF EXISTS `1_4_material_cubierta`;
CREATE TABLE IF NOT EXISTS `1_4_material_cubierta` (
  `mat_cub_codigo` varchar(50) NOT NULL,
  `mat_cub_nombre` varchar(200) DEFAULT NULL,
  `mat_cub_gramaje` float(18,2) DEFAULT NULL,
  PRIMARY KEY (`mat_cub_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_material_interior
DROP TABLE IF EXISTS `1_4_material_interior`;
CREATE TABLE IF NOT EXISTS `1_4_material_interior` (
  `mat_in_codigo` varchar(50) NOT NULL,
  `mat_in_nombre` varchar(200) DEFAULT NULL,
  `mat_in_gramaje` float(18,2) DEFAULT NULL,
  PRIMARY KEY (`mat_in_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_nota_devolucion
DROP TABLE IF EXISTS `1_4_nota_devolucion`;
CREATE TABLE IF NOT EXISTS `1_4_nota_devolucion` (
  `nd_codigo` varchar(50) NOT NULL,
  `nd_fecha` datetime NOT NULL,
  `nd_facturacion` bit(1) NOT NULL,
  `cli_ins_codigo` float(18,0) NOT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  `usu_codigo` varchar(50) DEFAULT NULL,
  `refrencia` varchar(250) DEFAULT NULL,
  `nrd` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`nd_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_orden_trabajo
DROP TABLE IF EXISTS `1_4_orden_trabajo`;
CREATE TABLE IF NOT EXISTS `1_4_orden_trabajo` (
  `or_codigo` varchar(250) NOT NULL,
  `usu_codigo` varchar(50) NOT NULL,
  `or_fecha` datetime DEFAULT NULL,
  `prov_codigo` int(11) NOT NULL,
  `or_estado` int(11) DEFAULT NULL,
  `or_observacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`or_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_pago
DROP TABLE IF EXISTS `1_4_pago`;
CREATE TABLE IF NOT EXISTS `1_4_pago` (
  `pag_codigo` float(18,0) NOT NULL AUTO_INCREMENT,
  `tip_pag_codigo` int(11) NOT NULL,
  `cli_ins_codigo` float(10,0) NOT NULL,
  `cue_pag_codigo` int(11) NOT NULL,
  `pag_valor` float(10,2) DEFAULT NULL,
  `pag_num_documento` varchar(50) DEFAULT NULL,
  `pag_num_cuenta` varchar(15) DEFAULT NULL,
  `pag_fecha` datetime DEFAULT NULL,
  `pag_observacion` varchar(500) DEFAULT NULL,
  `pag_deposito` varchar(20) DEFAULT NULL,
  `pag_ven_afectadas` varchar(500) DEFAULT NULL,
  `pag_saldo` float(10,2) DEFAULT NULL,
  `pag_numero_recibo` varchar(50) DEFAULT NULL,
  `cobra_codigo` varchar(50) DEFAULT NULL,
  `pag_estado` int(11) DEFAULT NULL,
  `pag_secuencia` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pag_codigo`),
  KEY `fk_1_4_pago1_4_tipo_pago` (`tip_pag_codigo`),
  KEY `fk_1_4_pago1_4_cliente_institucion` (`cli_ins_codigo`),
  KEY `fk_1_4_pago1_4_cuenta_pago` (`cue_pag_codigo`),
  KEY `fk_1_4_pago1_4_cobrador` (`cobra_codigo`),
  CONSTRAINT `fk_1_4_pago1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_pago1_4_cobrador` FOREIGN KEY (`cobra_codigo`) REFERENCES `1_4_cobrador` (`cobra_codigo`),
  CONSTRAINT `fk_1_4_pago1_4_cuenta_pago` FOREIGN KEY (`cue_pag_codigo`) REFERENCES `1_4_cuenta_pago` (`cue_pag_codigo`),
  CONSTRAINT `fk_1_4_pago1_4_tipo_pago` FOREIGN KEY (`tip_pag_codigo`) REFERENCES `1_4_tipo_pago` (`tip_pag_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=79385 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_pais
DROP TABLE IF EXISTS `1_4_pais`;
CREATE TABLE IF NOT EXISTS `1_4_pais` (
  `PAI_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PAI_NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PAI_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_pantalla
DROP TABLE IF EXISTS `1_4_pantalla`;
CREATE TABLE IF NOT EXISTS `1_4_pantalla` (
  `pa_codigo` bigint(20) NOT NULL,
  `pa_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `pa_lugar` bigint(20) DEFAULT NULL,
  `pa_padre` bigint(20) DEFAULT NULL,
  `pa_texto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`pa_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_pedido
DROP TABLE IF EXISTS `1_4_pedido`;
CREATE TABLE IF NOT EXISTS `1_4_pedido` (
  `cli_ins_codigo` float(10,0) NOT NULL,
  `ven_d_codigo` varchar(50) NOT NULL,
  `ped_fecha_elaboracion` datetime DEFAULT NULL,
  `ped_fecha_entrega` datetime DEFAULT NULL,
  `ped_contratos` varchar(250) DEFAULT NULL,
  `pedido` varchar(50) NOT NULL,
  `ped_temporada` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pedido`),
  KEY `fk_1_4_pedido1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_pedido1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_pendientes
DROP TABLE IF EXISTS `1_4_pendientes`;
CREATE TABLE IF NOT EXISTS `1_4_pendientes` (
  `pen_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `empa_codigo` varchar(50) NOT NULL,
  `ven_codigo` varchar(50) NOT NULL,
  `pro_codigo` char(10) NOT NULL,
  `pen_cantidad` bigint(20) NOT NULL,
  `pen_peso` float(18,4) NOT NULL,
  `pen_entregado` bigint(20) NOT NULL,
  PRIMARY KEY (`pen_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1852 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_permiso
DROP TABLE IF EXISTS `1_4_permiso`;
CREATE TABLE IF NOT EXISTS `1_4_permiso` (
  `pe_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `pe_dep` char(3) DEFAULT NULL,
  `pe_pa` bigint(20) DEFAULT NULL,
  `pe_estado` char(10) DEFAULT NULL,
  PRIMARY KEY (`pe_codigo`),
  KEY `fk_1_4_permiso1_4_departamento` (`pe_dep`),
  KEY `fk_1_4_permiso1_4_pantalla` (`pe_pa`),
  CONSTRAINT `fk_1_4_permiso1_4_departamento` FOREIGN KEY (`pe_dep`) REFERENCES `1_4_departamento` (`dep_codigo`),
  CONSTRAINT `fk_1_4_permiso1_4_pantalla` FOREIGN KEY (`pe_pa`) REFERENCES `1_4_pantalla` (`pa_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_producto
DROP TABLE IF EXISTS `1_4_producto`;
CREATE TABLE IF NOT EXISTS `1_4_producto` (
  `pro_codigo` varchar(20) NOT NULL,
  `gru_pro_codigo` int(11) NOT NULL,
  `pro_nombre` varchar(250) DEFAULT NULL,
  `pro_descripcion` varchar(500) DEFAULT NULL,
  `pro_iva` bit(1) DEFAULT NULL,
  `pro_valor` float(20,2) DEFAULT NULL,
  `pro_descuento` float(3,2) DEFAULT NULL,
  `pro_stock` int(11) DEFAULT NULL,
  `pro_costo` float(20,2) DEFAULT NULL,
  `pro_peso` float(18,3) DEFAULT NULL,
  `pro_estado` int(10) NOT NULL,
  PRIMARY KEY (`pro_codigo`),
  KEY `fk_1_4_producto1_4_grupo_productos` (`gru_pro_codigo`),
  CONSTRAINT `fk_1_4_producto1_4_grupo_productos` FOREIGN KEY (`gru_pro_codigo`) REFERENCES `1_4_grupo_productos` (`gru_pro_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_productos_vendidos
DROP TABLE IF EXISTS `1_4_productos_vendidos`;
CREATE TABLE IF NOT EXISTS `1_4_productos_vendidos` (
  `codigo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_producto_caracteristica
DROP TABLE IF EXISTS `1_4_producto_caracteristica`;
CREATE TABLE IF NOT EXISTS `1_4_producto_caracteristica` (
  `pro_car_codigo` varchar(50) NOT NULL,
  `pro_tamaño` varchar(50) DEFAULT NULL,
  `pro_int_pagina` bigint(20) DEFAULT NULL,
  `mat_in_codigo` varchar(100) DEFAULT NULL,
  `pro_int_tinta` varchar(100) DEFAULT NULL,
  `mat_cub_codigo` varchar(100) DEFAULT NULL,
  `pro_cub_recubrimiento` varchar(100) DEFAULT NULL,
  `pro_cub_tintas` varchar(100) DEFAULT NULL,
  `pro_acabados` varchar(250) DEFAULT NULL,
  `pro_guia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_car_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_proveedor
DROP TABLE IF EXISTS `1_4_proveedor`;
CREATE TABLE IF NOT EXISTS `1_4_proveedor` (
  `prov_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ciu_codigo` int(11) NOT NULL,
  `prov_nombre` varchar(200) DEFAULT NULL,
  `prov_descripcion` varchar(500) DEFAULT NULL,
  `prov_direccion` varchar(500) DEFAULT NULL,
  `prov_ruc` varchar(50) DEFAULT NULL,
  `prov_telefono` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prov_codigo`),
  KEY `fk_1_4_proveedor1_4_ciudad` (`ciu_codigo`),
  CONSTRAINT `fk_1_4_proveedor1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_provincia
DROP TABLE IF EXISTS `1_4_provincia`;
CREATE TABLE IF NOT EXISTS `1_4_provincia` (
  `provi_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `pai_codigo` int(11) NOT NULL,
  `provi_nombre` varchar(100) DEFAULT NULL,
  `provi_cod_telefono` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`provi_codigo`),
  KEY `fk_1_4_provincia1_4_pais` (`pai_codigo`),
  CONSTRAINT `fk_1_4_provincia1_4_pais` FOREIGN KEY (`pai_codigo`) REFERENCES `1_4_pais` (`PAI_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_remision
DROP TABLE IF EXISTS `1_4_remision`;
CREATE TABLE IF NOT EXISTS `1_4_remision` (
  `remi_codigo` varchar(50) NOT NULL,
  `remi_motivo` int(11) DEFAULT NULL,
  `remi_dir_partida` varchar(50) DEFAULT NULL,
  `remi_destinatario` varchar(500) DEFAULT NULL,
  `remi_ruc_destinatario` varchar(50) DEFAULT NULL,
  `remi_direccion` varchar(250) DEFAULT NULL,
  `remi_nombre_transportista` varchar(50) DEFAULT NULL,
  `remi_ci_transportista` varchar(50) DEFAULT NULL,
  `remi_detalle` varchar(50) DEFAULT NULL,
  `remi_cantidad` int(11) DEFAULT NULL,
  `remi_unidad_medida` varchar(50) DEFAULT NULL,
  `remi_num_factura` varchar(500) DEFAULT NULL,
  `remi_fecha_inicio` datetime DEFAULT NULL,
  `remi_fecha_final` datetime DEFAULT NULL,
  `trans_codigo` int(11) DEFAULT NULL,
  `remi_guia_remision` varchar(50) DEFAULT NULL,
  `remi_obs` varchar(500) DEFAULT NULL,
  `remi_responsable` varchar(500) DEFAULT NULL,
  `remi_paquete` int(11) DEFAULT NULL,
  `remi_funda` int(11) DEFAULT NULL,
  `remi_rollo` int(11) DEFAULT NULL,
  `remi_flete` bit(1) DEFAULT NULL,
  `remi_pagado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`remi_codigo`),
  KEY `fk_1_4_remision1_4_transporte` (`trans_codigo`),
  CONSTRAINT `fk_1_4_remision1_4_transporte` FOREIGN KEY (`trans_codigo`) REFERENCES `1_4_transporte` (`trans_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_resultados
DROP TABLE IF EXISTS `1_4_resultados`;
CREATE TABLE IF NOT EXISTS `1_4_resultados` (
  `gru_pro_codigo` float DEFAULT NULL,
  `pro_codigo` varchar(255) DEFAULT NULL,
  `pro_costo` varchar(255) DEFAULT NULL,
  `pro_descripcion` varchar(255) DEFAULT NULL,
  `pro_descuento` varchar(255) DEFAULT NULL,
  `pro_iva` float DEFAULT NULL,
  `pro_nombre` varchar(255) DEFAULT NULL,
  `pro_stock` varchar(255) DEFAULT NULL,
  `pro_valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_resumen_ventas
DROP TABLE IF EXISTS `1_4_resumen_ventas`;
CREATE TABLE IF NOT EXISTS `1_4_resumen_ventas` (
  `vendedor` varchar(100) DEFAULT NULL,
  `brutas` float(18,2) DEFAULT NULL,
  `netas` float(18,2) DEFAULT NULL,
  `obsequios` float(18,2) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_rsumencarteraescuelas
DROP TABLE IF EXISTS `1_4_rsumencarteraescuelas`;
CREATE TABLE IF NOT EXISTS `1_4_rsumencarteraescuelas` (
  `zona` varchar(500) DEFAULT NULL,
  `vendedor` varchar(500) DEFAULT NULL,
  `facturado` float(18,2) DEFAULT NULL,
  `deposito` float(18,2) DEFAULT NULL,
  `retencion` float(18,2) DEFAULT NULL,
  `cruce` float(18,2) DEFAULT NULL,
  `devolucion` float(18,2) DEFAULT NULL,
  `cheque` float(18,2) DEFAULT NULL,
  `efectivo` float(18,2) DEFAULT NULL,
  `cruce_cuentas` float(18,2) DEFAULT NULL,
  `cli_ins_codigo` float(18,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_secuencial_vendedor
DROP TABLE IF EXISTS `1_4_secuencial_vendedor`;
CREATE TABLE IF NOT EXISTS `1_4_secuencial_vendedor` (
  `sec_ven_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `sec_ven_nombre` varchar(50) DEFAULT NULL,
  `sec_ven_valor` int(11) DEFAULT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sec_ven_codigo`),
  KEY `fk_1_4_secuencial_vendedor1_4_vendedor` (`ven_d_codigo`),
  CONSTRAINT `fk_1_4_secuencial_vendedor1_4_vendedor` FOREIGN KEY (`ven_d_codigo`) REFERENCES `1_4_vendedor` (`ven_d_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_secuencias
DROP TABLE IF EXISTS `1_4_secuencias`;
CREATE TABLE IF NOT EXISTS `1_4_secuencias` (
  `secuencia` bigint(20) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_sec_rps
DROP TABLE IF EXISTS `1_4_sec_rps`;
CREATE TABLE IF NOT EXISTS `1_4_sec_rps` (
  `sec_rps_id` bigint(20) NOT NULL,
  `sec_valor` float(18,0) NOT NULL,
  `sec_codigo` varchar(50) NOT NULL,
  PRIMARY KEY (`sec_rps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_spliquidaciones
DROP TABLE IF EXISTS `1_4_spliquidaciones`;
CREATE TABLE IF NOT EXISTS `1_4_spliquidaciones` (
  `vendedor` varchar(500) DEFAULT NULL,
  `bruta` float(18,2) DEFAULT NULL,
  `neta` float(18,2) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT NULL,
  `anticipo` float(18,2) DEFAULT NULL,
  `deuda` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_sucursal
DROP TABLE IF EXISTS `1_4_sucursal`;
CREATE TABLE IF NOT EXISTS `1_4_sucursal` (
  `suc_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `ciu_codigo` int(11) NOT NULL,
  `suc_descripcion` varchar(500) DEFAULT NULL,
  `suc_direccion` varchar(500) DEFAULT NULL,
  `suc_zona` varchar(50) DEFAULT NULL,
  `suc_punto` varchar(50) DEFAULT NULL,
  `suc_telefono` varchar(50) DEFAULT NULL,
  `suc_correo` varchar(50) DEFAULT NULL,
  `ins_codigo` int(11) NOT NULL,
  PRIMARY KEY (`suc_codigo`),
  KEY `fk_1_4_sucursal1_4_ciudad` (`ciu_codigo`),
  KEY `fk_1_4_sucursal1_4_institucion` (`ins_codigo`),
  CONSTRAINT `fk_1_4_sucursal1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`),
  CONSTRAINT `fk_1_4_sucursal1_4_institucion` FOREIGN KEY (`ins_codigo`) REFERENCES `1_4_institucion` (`ins_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_tablatemporal2
DROP TABLE IF EXISTS `1_4_tablatemporal2`;
CREATE TABLE IF NOT EXISTS `1_4_tablatemporal2` (
  `venta` varchar(50) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `libreria` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_textos_clientes
DROP TABLE IF EXISTS `1_4_textos_clientes`;
CREATE TABLE IF NOT EXISTS `1_4_textos_clientes` (
  `codigo` varchar(50) NOT NULL,
  `cantidad` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_tipo_cheque
DROP TABLE IF EXISTS `1_4_tipo_cheque`;
CREATE TABLE IF NOT EXISTS `1_4_tipo_cheque` (
  `tip_che_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tip_che_nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tip_che_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_tipo_empaque
DROP TABLE IF EXISTS `1_4_tipo_empaque`;
CREATE TABLE IF NOT EXISTS `1_4_tipo_empaque` (
  `tip_empa_codigo` varchar(50) NOT NULL,
  `tip_empa_peso` float(18,4) DEFAULT NULL,
  `tip_empa_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`tip_empa_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_tipo_institucion
DROP TABLE IF EXISTS `1_4_tipo_institucion`;
CREATE TABLE IF NOT EXISTS `1_4_tipo_institucion` (
  `tip_ins_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tip_ins_nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tip_ins_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_tipo_pago
DROP TABLE IF EXISTS `1_4_tipo_pago`;
CREATE TABLE IF NOT EXISTS `1_4_tipo_pago` (
  `tip_pag_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tip_pag_nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tip_pag_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_tipo_venta
DROP TABLE IF EXISTS `1_4_tipo_venta`;
CREATE TABLE IF NOT EXISTS `1_4_tipo_venta` (
  `tip_ven_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tip_ven_nombre` varchar(100) DEFAULT NULL,
  `tip_ven_descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tip_ven_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_transporte
DROP TABLE IF EXISTS `1_4_transporte`;
CREATE TABLE IF NOT EXISTS `1_4_transporte` (
  `trans_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `trans_nombre` varchar(50) DEFAULT NULL,
  `trans_ruc` varchar(50) DEFAULT NULL,
  `trans_direccion` varchar(50) DEFAULT NULL,
  `trans_guia_remision` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trans_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_usuario
DROP TABLE IF EXISTS `1_4_usuario`;
CREATE TABLE IF NOT EXISTS `1_4_usuario` (
  `usu_ci` char(15) DEFAULT NULL,
  `usu_apellidos` varchar(100) DEFAULT NULL,
  `usu_nombres` varchar(100) DEFAULT NULL,
  `usu_direccion` varchar(500) DEFAULT NULL,
  `usu_telefono` varchar(100) DEFAULT NULL,
  `usu_email` varchar(100) DEFAULT NULL,
  `usu_codigo` varchar(20) NOT NULL,
  `dep_codigo` char(3) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `usu_login` varchar(20) DEFAULT NULL,
  `usu_clave` varchar(100) DEFAULT NULL,
  `usu_fac_ini` int(11) DEFAULT NULL,
  `usu_fac_fin` int(11) DEFAULT NULL,
  `usu_che_ini` int(11) DEFAULT NULL,
  `usu_che_fin` int(11) DEFAULT NULL,
  `usu_firma` bit(1) DEFAULT NULL,
  `usu_titulo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usu_codigo`),
  KEY `fk_1_4_usuario1_4_departamento` (`dep_codigo`),
  KEY `fk_1_4_usuario1_4_ciudad` (`ciu_codigo`),
  CONSTRAINT `fk_1_4_usuario1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`),
  CONSTRAINT `fk_1_4_usuario1_4_departamento` FOREIGN KEY (`dep_codigo`) REFERENCES `1_4_departamento` (`dep_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_vendedor
DROP TABLE IF EXISTS `1_4_vendedor`;
CREATE TABLE IF NOT EXISTS `1_4_vendedor` (
  `ven_d_codigo` varchar(50) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `ven_d_apellidos` varchar(100) DEFAULT NULL,
  `ven_d_nombres` varchar(100) DEFAULT NULL,
  `ven_d_direccion` varchar(200) DEFAULT NULL,
  `ven_d_telefono` varchar(100) DEFAULT NULL,
  `ven_d_email` varchar(100) DEFAULT NULL,
  `ven_d_ci` varchar(15) DEFAULT NULL,
  `ven_d_secuencial` bigint(20) NOT NULL,
  PRIMARY KEY (`ven_d_codigo`),
  KEY `fk_1_4_vendedor1_4_ciudad` (`ciu_codigo`),
  CONSTRAINT `fk_1_4_vendedor1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_venta
DROP TABLE IF EXISTS `1_4_venta`;
CREATE TABLE IF NOT EXISTS `1_4_venta` (
  `ven_codigo` varchar(20) NOT NULL,
  `usu_codigo` varchar(20) NOT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  `cli_ins_codigo` float(10,0) NOT NULL,
  `tip_ven_codigo` int(11) NOT NULL,
  `est_ven_codigo` int(11) NOT NULL,
  `ven_observacion` varchar(500) DEFAULT NULL,
  `ven_cheq` bigint(20) DEFAULT NULL,
  `ven_comision` decimal(10,0) DEFAULT NULL,
  `ven_valor` float(19,2) DEFAULT NULL,
  `ven_pagado` float(10,2) DEFAULT NULL,
  `ven_anticipo` float(10,2) DEFAULT NULL,
  `ven_con_obsequios` varchar(20) DEFAULT NULL,
  `ven_con_obs_final` varchar(1000) DEFAULT NULL,
  `ven_com_porcentaje` float(4,2) DEFAULT NULL,
  `ven_iva` float(2,2) DEFAULT NULL,
  `ven_descuento` float(4,2) DEFAULT NULL,
  `ven_fecha` datetime DEFAULT NULL,
  `ven_convertido` varchar(200) DEFAULT NULL,
  `ven_transporte` decimal(10,0) DEFAULT NULL,
  `ven_estado_transporte` bit(1) DEFAULT NULL,
  `ven_firmado` char(15) DEFAULT NULL,
  `ven_temporada` int(11) DEFAULT NULL,
  `cuen_numero` varchar(20) DEFAULT NULL,
  `ven_devolucion` float(18,2) DEFAULT NULL,
  `ven_remision` varchar(50) DEFAULT NULL,
  `ven_fech_remision` datetime DEFAULT NULL,
  `sucursal` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ven_codigo`),
  KEY `fk_1_4_venta1_4_usuario` (`usu_codigo`),
  KEY `fk_1_4_venta1_4_cliente_institucion` (`cli_ins_codigo`),
  KEY `fk_1_4_venta1_4_tipo_venta` (`tip_ven_codigo`),
  KEY `fk_1_4_venta1_4_estado_venta` (`est_ven_codigo`),
  CONSTRAINT `fk_1_4_venta1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  CONSTRAINT `fk_1_4_venta1_4_estado_venta` FOREIGN KEY (`est_ven_codigo`) REFERENCES `1_4_estado_venta` (`est_ven_codigo`),
  CONSTRAINT `fk_1_4_venta1_4_tipo_venta` FOREIGN KEY (`tip_ven_codigo`) REFERENCES `1_4_tipo_venta` (`tip_ven_codigo`),
  CONSTRAINT `fk_1_4_venta1_4_usuario` FOREIGN KEY (`usu_codigo`) REFERENCES `1_4_usuario` (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_venta_aux
DROP TABLE IF EXISTS `1_4_venta_aux`;
CREATE TABLE IF NOT EXISTS `1_4_venta_aux` (
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  `valor` float(19,2) DEFAULT NULL,
  `descuento` float(19,2) DEFAULT NULL,
  `ven_codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_verificador
DROP TABLE IF EXISTS `1_4_verificador`;
CREATE TABLE IF NOT EXISTS `1_4_verificador` (
  `ver_codigo` varchar(50) NOT NULL,
  `ciu_codigo` int(11) DEFAULT NULL,
  `ver_nombres` varchar(100) DEFAULT NULL,
  `ver_direccion` varchar(200) DEFAULT NULL,
  `ver_telefono` varchar(50) DEFAULT NULL,
  `ver_ci` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ver_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla facturacion10_10_1_4.1_4_verificados
DROP TABLE IF EXISTS `1_4_verificados`;
CREATE TABLE IF NOT EXISTS `1_4_verificados` (
  `identificador` varchar(50) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `contrato` varchar(50) DEFAULT NULL,
  `pro_codigo` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
