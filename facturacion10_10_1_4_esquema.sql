-- phpMyAdmin SQL Dump HOLA
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2023 a las 21:14:50
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion10_10_1_4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_anticipo`
--

CREATE TABLE `1_4_anticipo` (
  `ant_codigo` float(19,0) NOT NULL,
  `ant_valor` float(19,2) DEFAULT NULL,
  `ant_fecha` datetime DEFAULT NULL,
  `cli_ins_codigo` float(10,0) DEFAULT NULL,
  `ant_estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_asignacion`
--

CREATE TABLE `1_4_asignacion` (
  `asi_id` bigint(20) NOT NULL,
  `ins_codigo` int(11) DEFAULT NULL,
  `asi_cupo` float(18,2) DEFAULT NULL,
  `asi_participa` float(18,2) DEFAULT NULL,
  `temporada` varchar(50) DEFAULT NULL,
  `libreria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_bancos`
--

CREATE TABLE `1_4_bancos` (
  `BAN_CODIGO` int(11) NOT NULL,
  `BAN_NOMBRE` varchar(200) DEFAULT NULL,
  `BAN_DIRECCION` varchar(500) DEFAULT NULL,
  `BAN_TELEFONO` varchar(100) DEFAULT NULL,
  `BAN_EMPRESA` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_beneficiario`
--

CREATE TABLE `1_4_beneficiario` (
  `ben_id` int(11) NOT NULL,
  `ben_nombre` varchar(250) NOT NULL,
  `ben_apellido` varchar(250) NOT NULL,
  `ben_telefono` varchar(250) NOT NULL,
  `ben_cuenta` varchar(250) NOT NULL,
  `ben_tipo_cuenta` varchar(50) NOT NULL,
  `ben_banco` varchar(250) NOT NULL,
  `ben_contrato` varchar(250) DEFAULT NULL,
  `ben_comision` float(18,2) DEFAULT NULL,
  `ben_valor` float(18,2) DEFAULT NULL,
  `ben_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cartera_temp`
--

CREATE TABLE `1_4_cartera_temp` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cheque`
--

CREATE TABLE `1_4_cheque` (
  `che_codigo` float(10,0) NOT NULL,
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
  `che_observacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cheque_venta`
--

CREATE TABLE `1_4_cheque_venta` (
  `che_ven_codigo` int(11) NOT NULL,
  `ven_codigo` varchar(20) NOT NULL,
  `liq_ch_codigo` int(11) DEFAULT NULL,
  `che_ven_valor` float(10,2) DEFAULT NULL,
  `che_ven_nombre` varchar(200) DEFAULT NULL,
  `che__numero` float(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_ciclo`
--

CREATE TABLE `1_4_ciclo` (
  `CIC_CODIGO` int(11) NOT NULL,
  `CIC_NOMBRE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_ciudad`
--

CREATE TABLE `1_4_ciudad` (
  `CIU_CODIGO` int(11) NOT NULL,
  `PROVI_CODIGO` int(11) NOT NULL,
  `CIU_NOMBRE` varchar(100) DEFAULT NULL,
  `CIU_COD_TELEFONO` varchar(5) DEFAULT NULL,
  `CIU_ZONA_C` varchar(100) DEFAULT NULL,
  `CIU_ZONA_S` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cliente`
--

CREATE TABLE `1_4_cliente` (
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
  `cli_titulo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cliente_institucion`
--

CREATE TABLE `1_4_cliente_institucion` (
  `cli_ins_codigo` float(10,0) NOT NULL,
  `cli_ci` varchar(50) DEFAULT NULL,
  `ins_codigo` int(11) NOT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cli_facturas`
--

CREATE TABLE `1_4_cli_facturas` (
  `cli_ci` varchar(50) DEFAULT NULL,
  `cli_nombres` varchar(200) DEFAULT NULL,
  `ins_nombre` varchar(200) DEFAULT NULL,
  `codigo` float(18,0) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cobrador`
--

CREATE TABLE `1_4_cobrador` (
  `cobra_codigo` varchar(50) NOT NULL,
  `cobra_apellidos` varchar(100) DEFAULT NULL,
  `cobra_nombres` varchar(100) DEFAULT NULL,
  `cobra_direccion` varchar(200) DEFAULT NULL,
  `cobra_telefono` varchar(100) DEFAULT NULL,
  `cobra_email` varchar(100) DEFAULT NULL,
  `cobra_ci` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_compra`
--

CREATE TABLE `1_4_compra` (
  `com_codigo` bigint(20) NOT NULL,
  `prov_codigo` int(11) NOT NULL,
  `com_factura` varchar(50) DEFAULT NULL,
  `com_fecha` datetime DEFAULT NULL,
  `com_valor` float(18,0) DEFAULT NULL,
  `com_responsable` varchar(50) DEFAULT NULL,
  `com_observacion` varchar(50) DEFAULT NULL,
  `com_iva` float(18,0) DEFAULT NULL,
  `com_descuento` float(18,0) DEFAULT NULL,
  `orden_trabajo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_configuracion`
--

CREATE TABLE `1_4_configuracion` (
  `con_cod` int(11) NOT NULL,
  `con_nombre` varchar(200) DEFAULT NULL,
  `con_valor_num` float(20,2) DEFAULT NULL,
  `con_valor_str` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cuenta`
--

CREATE TABLE `1_4_cuenta` (
  `cuen_codigo` int(11) NOT NULL,
  `ban_codigo` int(11) DEFAULT NULL,
  `cuen_numero` varchar(20) DEFAULT NULL,
  `cuen_descripcion` varchar(200) DEFAULT NULL,
  `cuen_nombre` varchar(20) DEFAULT NULL,
  `cuen_secuencial` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_cuenta_pago`
--

CREATE TABLE `1_4_cuenta_pago` (
  `cue_pag_codigo` int(11) NOT NULL,
  `ban_codigo` int(11) NOT NULL,
  `cue_pag_numero` varchar(20) DEFAULT NULL,
  `cue_pag_descripcion` varchar(200) DEFAULT NULL,
  `cue_pag_nombre` varchar(50) DEFAULT NULL,
  `cue_pag_secuencial` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_departamento`
--

CREATE TABLE `1_4_departamento` (
  `dep_codigo` char(3) NOT NULL,
  `dep_nombre` varchar(60) DEFAULT NULL,
  `dep_descripcion` varchar(200) DEFAULT NULL,
  `dep_permiso` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_compra`
--

CREATE TABLE `1_4_detalle_compra` (
  `det_com_codigo` bigint(20) NOT NULL,
  `com_codigo` bigint(20) NOT NULL,
  `pro_codigo` varchar(20) NOT NULL,
  `det_com_cantidad` int(11) DEFAULT NULL,
  `det_com_valor_u` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_conta`
--

CREATE TABLE `1_4_detalle_conta` (
  `det_cont_id` bigint(20) NOT NULL,
  `det_cont_pro` varchar(50) DEFAULT NULL,
  `det_cont_cantidad` bigint(20) DEFAULT NULL,
  `det_cont_valor` float(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_empaque`
--

CREATE TABLE `1_4_detalle_empaque` (
  `empa_codigo` varchar(50) NOT NULL,
  `det_empa_codigo` varchar(50) NOT NULL,
  `det_peso_neto` float(18,4) DEFAULT NULL,
  `det_peso_bruto` float(18,4) DEFAULT NULL,
  `tip_empa_codigo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_er`
--

CREATE TABLE `1_4_detalle_er` (
  `der_codigo` bigint(20) NOT NULL,
  `er_codigo` bigint(20) DEFAULT NULL,
  `cli_ins_codigo` float(10,0) DEFAULT NULL,
  `der_documentos` varchar(500) DEFAULT NULL,
  `der_observacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_er_e`
--

CREATE TABLE `1_4_detalle_er_e` (
  `der_est_codigo` bigint(20) NOT NULL,
  `er_est_codigo` bigint(20) DEFAULT NULL,
  `cli_ins_codigo` float(10,0) DEFAULT NULL,
  `der_est_documentos` varchar(500) DEFAULT NULL,
  `der_est_observacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_liquidacion`
--

CREATE TABLE `1_4_detalle_liquidacion` (
  `det_liq_codigo` bigint(20) NOT NULL,
  `pro_codigo` varchar(20) DEFAULT NULL,
  `pro_cantidad` int(11) DEFAULT NULL,
  `liq_ch_codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_nota_devolucion`
--

CREATE TABLE `1_4_detalle_nota_devolucion` (
  `d_nd_codigo` bigint(20) NOT NULL,
  `nd_codigo` varchar(50) NOT NULL,
  `pro_codigo` varchar(20) DEFAULT NULL,
  `d_nd_cantidad` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_orden_trabajo`
--

CREATE TABLE `1_4_detalle_orden_trabajo` (
  `det_or_codigo` int(11) NOT NULL,
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
  `det_or_recubrimiento` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_rps`
--

CREATE TABLE `1_4_detalle_rps` (
  `drps_codigo` bigint(20) NOT NULL,
  `pro_codigo` varchar(20) DEFAULT NULL,
  `rps_codigo` varchar(50) DEFAULT NULL,
  `drps_cantidad` bigint(20) DEFAULT NULL,
  `drps_valor_u` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_venta`
--

CREATE TABLE `1_4_detalle_venta` (
  `det_ven_codigo` float(10,0) NOT NULL,
  `ven_codigo` varchar(20) NOT NULL,
  `pro_codigo` varchar(20) NOT NULL,
  `det_ven_cantidad` int(11) DEFAULT NULL,
  `det_ven_valor_u` float(10,2) DEFAULT NULL,
  `det_ven_iva` float(10,2) DEFAULT NULL,
  `det_ven_descontar` bit(1) DEFAULT NULL,
  `det_ven_inicio` bit(1) DEFAULT NULL,
  `det_ven_cantidad_real` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_detalle_verificacion`
--

CREATE TABLE `1_4_detalle_verificacion` (
  `det_ver_id` bigint(20) NOT NULL,
  `pro_codigo` varchar(20) NOT NULL,
  `ven_codigo` varchar(20) NOT NULL,
  `det_ver_cantidad` int(11) NOT NULL,
  `det_ver_verificacion` int(11) NOT NULL,
  `det_ver_fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_documento_liq`
--

CREATE TABLE `1_4_documento_liq` (
  `doc_codigo` bigint(20) NOT NULL,
  `doc_valor` float(18,2) DEFAULT NULL,
  `doc_numero` varchar(500) DEFAULT NULL,
  `doc_nombre` varchar(500) DEFAULT NULL,
  `doc_ci` varchar(500) DEFAULT NULL,
  `doc_cuenta` varchar(500) DEFAULT NULL,
  `doc_institucion` varchar(50) DEFAULT NULL,
  `doc_tipo` varchar(50) DEFAULT NULL,
  `doc_observacion` varchar(500) DEFAULT NULL,
  `ven_codigo` varchar(20) DEFAULT NULL,
  `doc_fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_empacado`
--

CREATE TABLE `1_4_empacado` (
  `empa_codigo` varchar(50) NOT NULL,
  `empa_fecha` datetime DEFAULT NULL,
  `empa_facturas` varchar(500) DEFAULT NULL,
  `empa_cartones` int(11) DEFAULT NULL,
  `usu_codigo` char(10) DEFAULT NULL,
  `empa_peso_neto` float(18,4) DEFAULT NULL,
  `empa_peso_bruto` float(18,4) DEFAULT NULL,
  `empa_calculado` float(18,4) DEFAULT NULL,
  `remi_codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_entregas_complementarias`
--

CREATE TABLE `1_4_entregas_complementarias` (
  `ent_com_codigo` bigint(20) NOT NULL,
  `remi_codigo` varchar(50) DEFAULT NULL,
  `ven_codigo` varchar(50) DEFAULT NULL,
  `pro_codigo` varchar(50) DEFAULT NULL,
  `ent_com_cantidad` bigint(20) DEFAULT NULL,
  `ent_com_peso` float(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_entrega_recepcion`
--

CREATE TABLE `1_4_entrega_recepcion` (
  `er_codigo` bigint(20) NOT NULL,
  `er_fecha_entrega` datetime DEFAULT NULL,
  `er_usu_entrega` varchar(50) DEFAULT NULL,
  `er_usu_recibe` varchar(50) DEFAULT NULL,
  `er_fecha_recibe` datetime DEFAULT NULL,
  `er_tipo` int(11) DEFAULT NULL,
  `er_desde` varchar(50) DEFAULT NULL,
  `er_hasta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_entrega_recepcion_est`
--

CREATE TABLE `1_4_entrega_recepcion_est` (
  `er_est_codigo` bigint(20) NOT NULL,
  `er_est_fecha_entrega` datetime DEFAULT NULL,
  `er_est_usu_entrega` varchar(50) DEFAULT NULL,
  `er_est_usu_recibe` varchar(50) DEFAULT NULL,
  `er_est_fecha_recibe` datetime DEFAULT NULL,
  `er_est_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_estado_cheque`
--

CREATE TABLE `1_4_estado_cheque` (
  `est_che_codigo` int(11) NOT NULL,
  `est_che_nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_estado_venta`
--

CREATE TABLE `1_4_estado_venta` (
  `est_ven_codigo` int(11) NOT NULL,
  `est_ven_nombre` varchar(100) DEFAULT NULL,
  `est_ven_descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_factcon`
--

CREATE TABLE `1_4_factcon` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_geo_canton`
--

CREATE TABLE `1_4_geo_canton` (
  `can_id` varchar(10) NOT NULL,
  `can_nombre` varchar(250) DEFAULT NULL,
  `prov_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_geo_parroquia`
--

CREATE TABLE `1_4_geo_parroquia` (
  `par_id` varchar(10) NOT NULL,
  `par_nombre` varchar(250) NOT NULL,
  `can_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_geo_provincia`
--

CREATE TABLE `1_4_geo_provincia` (
  `prov_id` varchar(10) NOT NULL,
  `prov_nombre` varchar(250) DEFAULT NULL,
  `pai_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_grupo_productos`
--

CREATE TABLE `1_4_grupo_productos` (
  `gru_pro_codigo` int(11) NOT NULL,
  `gru_pro_nombre` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_institucion`
--

CREATE TABLE `1_4_institucion` (
  `ins_codigo` int(11) NOT NULL,
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
  `ins_sector` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_iva`
--

CREATE TABLE `1_4_iva` (
  `iva_cod` int(11) NOT NULL,
  `iva_valor` float(10,2) DEFAULT NULL,
  `iva_fecha_inicio` datetime DEFAULT NULL,
  `iva_fecha_fin` datetime DEFAULT NULL,
  `iva_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_liquidacion`
--

CREATE TABLE `1_4_liquidacion` (
  `liq_ch_codigo` int(11) NOT NULL,
  `usu_codigo` varchar(20) NOT NULL,
  `liq_che_nombres` varchar(200) DEFAULT NULL,
  `liq_che_valor` float(10,2) DEFAULT NULL,
  `liq_che_fecha` datetime DEFAULT NULL,
  `liq_che_numero` float(10,0) DEFAULT NULL,
  `liq_cobrado` bit(1) DEFAULT NULL,
  `ver_codigo` varchar(50) DEFAULT NULL,
  `ven_codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_matchcodigos`
--

CREATE TABLE `1_4_matchcodigos` (
  `pro_codigo` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_material_cubierta`
--

CREATE TABLE `1_4_material_cubierta` (
  `mat_cub_codigo` varchar(50) NOT NULL,
  `mat_cub_nombre` varchar(200) DEFAULT NULL,
  `mat_cub_gramaje` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_material_interior`
--

CREATE TABLE `1_4_material_interior` (
  `mat_in_codigo` varchar(50) NOT NULL,
  `mat_in_nombre` varchar(200) DEFAULT NULL,
  `mat_in_gramaje` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_nota_devolucion`
--

CREATE TABLE `1_4_nota_devolucion` (
  `nd_codigo` varchar(50) NOT NULL,
  `nd_fecha` datetime NOT NULL,
  `nd_facturacion` bit(1) NOT NULL,
  `cli_ins_codigo` float(18,0) NOT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  `usu_codigo` varchar(50) DEFAULT NULL,
  `refrencia` varchar(250) DEFAULT NULL,
  `nrd` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_orden_trabajo`
--

CREATE TABLE `1_4_orden_trabajo` (
  `or_codigo` varchar(250) NOT NULL,
  `usu_codigo` varchar(50) NOT NULL,
  `or_fecha` datetime DEFAULT NULL,
  `prov_codigo` int(11) NOT NULL,
  `or_estado` int(11) DEFAULT NULL,
  `or_observacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_pago`
--

CREATE TABLE `1_4_pago` (
  `pag_codigo` float(18,0) NOT NULL,
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
  `pag_secuencia` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_pais`
--

CREATE TABLE `1_4_pais` (
  `PAI_CODIGO` int(11) NOT NULL,
  `PAI_NOMBRE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_pantalla`
--

CREATE TABLE `1_4_pantalla` (
  `pa_codigo` bigint(20) NOT NULL,
  `pa_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `pa_lugar` bigint(20) DEFAULT NULL,
  `pa_padre` bigint(20) DEFAULT NULL,
  `pa_texto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_pedido`
--

CREATE TABLE `1_4_pedido` (
  `cli_ins_codigo` float(10,0) NOT NULL,
  `ven_d_codigo` varchar(50) NOT NULL,
  `ped_fecha_elaboracion` datetime DEFAULT NULL,
  `ped_fecha_entrega` datetime DEFAULT NULL,
  `ped_contratos` varchar(250) DEFAULT NULL,
  `pedido` varchar(50) NOT NULL,
  `ped_temporada` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_pendientes`
--

CREATE TABLE `1_4_pendientes` (
  `pen_codigo` bigint(20) NOT NULL,
  `empa_codigo` varchar(50) NOT NULL,
  `ven_codigo` varchar(50) NOT NULL,
  `pro_codigo` char(10) NOT NULL,
  `pen_cantidad` bigint(20) NOT NULL,
  `pen_peso` float(18,4) NOT NULL,
  `pen_entregado` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_permiso`
--

CREATE TABLE `1_4_permiso` (
  `pe_codigo` bigint(20) NOT NULL,
  `pe_dep` char(3) DEFAULT NULL,
  `pe_pa` bigint(20) DEFAULT NULL,
  `pe_estado` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_producto`
--

CREATE TABLE `1_4_producto` (
  `pro_codigo` varchar(20) NOT NULL,
  `gru_pro_codigo` int(11) NOT NULL,
  `pro_nombre` varchar(250) DEFAULT NULL,
  `pro_descripcion` varchar(500) DEFAULT NULL,
  `pro_iva` bit(1) DEFAULT NULL,
  `pro_valor` float(20,2) DEFAULT NULL,
  `pro_descuento` float(3,2) DEFAULT NULL,
  `pro_stock` int(11) DEFAULT NULL,
  `pro_costo` float(20,2) DEFAULT NULL,
  `pro_peso` float(18,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_productos_vendidos`
--

CREATE TABLE `1_4_productos_vendidos` (
  `codigo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_producto_caracteristica`
--

CREATE TABLE `1_4_producto_caracteristica` (
  `pro_car_codigo` varchar(50) NOT NULL,
  `pro_tamaño` varchar(50) DEFAULT NULL,
  `pro_int_pagina` bigint(20) DEFAULT NULL,
  `mat_in_codigo` varchar(100) DEFAULT NULL,
  `pro_int_tinta` varchar(100) DEFAULT NULL,
  `mat_cub_codigo` varchar(100) DEFAULT NULL,
  `pro_cub_recubrimiento` varchar(100) DEFAULT NULL,
  `pro_cub_tintas` varchar(100) DEFAULT NULL,
  `pro_acabados` varchar(250) DEFAULT NULL,
  `pro_guia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_proveedor`
--

CREATE TABLE `1_4_proveedor` (
  `prov_codigo` int(11) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `prov_nombre` varchar(200) DEFAULT NULL,
  `prov_descripcion` varchar(500) DEFAULT NULL,
  `prov_direccion` varchar(500) DEFAULT NULL,
  `prov_ruc` varchar(50) DEFAULT NULL,
  `prov_telefono` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_provincia`
--

CREATE TABLE `1_4_provincia` (
  `provi_codigo` int(11) NOT NULL,
  `pai_codigo` int(11) NOT NULL,
  `provi_nombre` varchar(100) DEFAULT NULL,
  `provi_cod_telefono` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_remision`
--

CREATE TABLE `1_4_remision` (
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
  `remi_pagado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_resultados`
--

CREATE TABLE `1_4_resultados` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_resumen_ventas`
--

CREATE TABLE `1_4_resumen_ventas` (
  `vendedor` varchar(100) DEFAULT NULL,
  `brutas` float(18,2) DEFAULT NULL,
  `netas` float(18,2) DEFAULT NULL,
  `obsequios` float(18,2) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_rsumencarteraescuelas`
--

CREATE TABLE `1_4_rsumencarteraescuelas` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_secuencial_vendedor`
--

CREATE TABLE `1_4_secuencial_vendedor` (
  `sec_ven_codigo` int(11) NOT NULL,
  `sec_ven_nombre` varchar(50) DEFAULT NULL,
  `sec_ven_valor` int(11) DEFAULT NULL,
  `ven_d_codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_secuencias`
--

CREATE TABLE `1_4_secuencias` (
  `secuencia` bigint(20) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_sec_rps`
--

CREATE TABLE `1_4_sec_rps` (
  `sec_rps_id` bigint(20) NOT NULL,
  `sec_valor` float(18,0) NOT NULL,
  `sec_codigo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_spliquidaciones`
--

CREATE TABLE `1_4_spliquidaciones` (
  `vendedor` varchar(500) DEFAULT NULL,
  `bruta` float(18,2) DEFAULT NULL,
  `neta` float(18,2) DEFAULT NULL,
  `descuento` float(18,2) DEFAULT NULL,
  `anticipo` float(18,2) DEFAULT NULL,
  `deuda` float(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_sucursal`
--

CREATE TABLE `1_4_sucursal` (
  `suc_codigo` int(11) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `suc_descripcion` varchar(500) DEFAULT NULL,
  `suc_direccion` varchar(500) DEFAULT NULL,
  `suc_zona` varchar(50) DEFAULT NULL,
  `suc_punto` varchar(50) DEFAULT NULL,
  `suc_telefono` varchar(50) DEFAULT NULL,
  `suc_correo` varchar(50) DEFAULT NULL,
  `ins_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_tablatemporal2`
--

CREATE TABLE `1_4_tablatemporal2` (
  `venta` varchar(50) DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `libreria` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_textos_clientes`
--

CREATE TABLE `1_4_textos_clientes` (
  `codigo` varchar(50) NOT NULL,
  `cantidad` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_tipo_cheque`
--

CREATE TABLE `1_4_tipo_cheque` (
  `tip_che_codigo` int(11) NOT NULL,
  `tip_che_nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_tipo_empaque`
--

CREATE TABLE `1_4_tipo_empaque` (
  `tip_empa_codigo` varchar(50) NOT NULL,
  `tip_empa_peso` float(18,4) DEFAULT NULL,
  `tip_empa_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_tipo_institucion`
--

CREATE TABLE `1_4_tipo_institucion` (
  `tip_ins_codigo` int(11) NOT NULL,
  `tip_ins_nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_tipo_pago`
--

CREATE TABLE `1_4_tipo_pago` (
  `tip_pag_codigo` int(11) NOT NULL,
  `tip_pag_nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_tipo_venta`
--

CREATE TABLE `1_4_tipo_venta` (
  `tip_ven_codigo` int(11) NOT NULL,
  `tip_ven_nombre` varchar(100) DEFAULT NULL,
  `tip_ven_descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_transporte`
--

CREATE TABLE `1_4_transporte` (
  `trans_codigo` int(11) NOT NULL,
  `trans_nombre` varchar(50) DEFAULT NULL,
  `trans_ruc` varchar(50) DEFAULT NULL,
  `trans_direccion` varchar(50) DEFAULT NULL,
  `trans_guia_remision` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_usuario`
--

CREATE TABLE `1_4_usuario` (
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
  `usu_titulo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_vendedor`
--

CREATE TABLE `1_4_vendedor` (
  `ven_d_codigo` varchar(50) NOT NULL,
  `ciu_codigo` int(11) NOT NULL,
  `ven_d_apellidos` varchar(100) DEFAULT NULL,
  `ven_d_nombres` varchar(100) DEFAULT NULL,
  `ven_d_direccion` varchar(200) DEFAULT NULL,
  `ven_d_telefono` varchar(100) DEFAULT NULL,
  `ven_d_email` varchar(100) DEFAULT NULL,
  `ven_d_ci` varchar(15) DEFAULT NULL,
  `ven_d_secuencial` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_venta`
--

CREATE TABLE `1_4_venta` (
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
  `sucursal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_venta_aux`
--

CREATE TABLE `1_4_venta_aux` (
  `ven_d_codigo` varchar(50) DEFAULT NULL,
  `valor` float(19,2) DEFAULT NULL,
  `descuento` float(19,2) DEFAULT NULL,
  `ven_codigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_verificador`
--

CREATE TABLE `1_4_verificador` (
  `ver_codigo` varchar(50) NOT NULL,
  `ciu_codigo` int(11) DEFAULT NULL,
  `ver_nombres` varchar(100) DEFAULT NULL,
  `ver_direccion` varchar(200) DEFAULT NULL,
  `ver_telefono` varchar(50) DEFAULT NULL,
  `ver_ci` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `1_4_verificados`
--

CREATE TABLE `1_4_verificados` (
  `identificador` varchar(50) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `contrato` varchar(50) DEFAULT NULL,
  `pro_codigo` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `1_4_anticipo`
--
ALTER TABLE `1_4_anticipo`
  ADD PRIMARY KEY (`ant_codigo`),
  ADD KEY `fk_1_4_anticipo1_4_cliente_institucion` (`cli_ins_codigo`);

--
-- Indices de la tabla `1_4_asignacion`
--
ALTER TABLE `1_4_asignacion`
  ADD PRIMARY KEY (`asi_id`);

--
-- Indices de la tabla `1_4_bancos`
--
ALTER TABLE `1_4_bancos`
  ADD PRIMARY KEY (`BAN_CODIGO`);

--
-- Indices de la tabla `1_4_beneficiario`
--
ALTER TABLE `1_4_beneficiario`
  ADD PRIMARY KEY (`ben_id`);

--
-- Indices de la tabla `1_4_cheque`
--
ALTER TABLE `1_4_cheque`
  ADD PRIMARY KEY (`che_codigo`),
  ADD KEY `fk_1_4_cheque1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD KEY `fk_1_4_cheque1_4_tipo_cheque` (`tip_che_codigo`),
  ADD KEY `fk_1_4_cheque1_4_estado_cheque` (`est_che_codigo`),
  ADD KEY `fk_1_4_cheque1_4_bancos` (`ban_codigo`);

--
-- Indices de la tabla `1_4_cheque_venta`
--
ALTER TABLE `1_4_cheque_venta`
  ADD PRIMARY KEY (`che_ven_codigo`),
  ADD KEY `fk_1_4_cheque_venta1_4_venta` (`ven_codigo`),
  ADD KEY `fk_1_4_cheque_venta1_4_liquidacion` (`liq_ch_codigo`);

--
-- Indices de la tabla `1_4_ciclo`
--
ALTER TABLE `1_4_ciclo`
  ADD PRIMARY KEY (`CIC_CODIGO`);

--
-- Indices de la tabla `1_4_ciudad`
--
ALTER TABLE `1_4_ciudad`
  ADD PRIMARY KEY (`CIU_CODIGO`),
  ADD KEY `fk_1_4_ciudad1_4_provincia` (`PROVI_CODIGO`);

--
-- Indices de la tabla `1_4_cliente`
--
ALTER TABLE `1_4_cliente`
  ADD PRIMARY KEY (`cli_ci`);

--
-- Indices de la tabla `1_4_cliente_institucion`
--
ALTER TABLE `1_4_cliente_institucion`
  ADD PRIMARY KEY (`cli_ins_codigo`),
  ADD KEY `fk_1_4_cliente_institucion1_4_cliente` (`cli_ci`),
  ADD KEY `fk_1_4_cliente_institucion1_4_institucion` (`ins_codigo`);

--
-- Indices de la tabla `1_4_cobrador`
--
ALTER TABLE `1_4_cobrador`
  ADD PRIMARY KEY (`cobra_codigo`);

--
-- Indices de la tabla `1_4_compra`
--
ALTER TABLE `1_4_compra`
  ADD PRIMARY KEY (`com_codigo`),
  ADD KEY `fk_1_4_compra1_4_proveedor` (`prov_codigo`);

--
-- Indices de la tabla `1_4_configuracion`
--
ALTER TABLE `1_4_configuracion`
  ADD PRIMARY KEY (`con_cod`);

--
-- Indices de la tabla `1_4_cuenta`
--
ALTER TABLE `1_4_cuenta`
  ADD PRIMARY KEY (`cuen_codigo`),
  ADD KEY `fk_1_4_cuenta1_4_bancos` (`ban_codigo`);

--
-- Indices de la tabla `1_4_cuenta_pago`
--
ALTER TABLE `1_4_cuenta_pago`
  ADD PRIMARY KEY (`cue_pag_codigo`),
  ADD KEY `fk_1_4_cuenta_pago1_4_bancos` (`ban_codigo`);

--
-- Indices de la tabla `1_4_departamento`
--
ALTER TABLE `1_4_departamento`
  ADD PRIMARY KEY (`dep_codigo`);

--
-- Indices de la tabla `1_4_detalle_compra`
--
ALTER TABLE `1_4_detalle_compra`
  ADD PRIMARY KEY (`det_com_codigo`),
  ADD KEY `fk_1_4_detalle_compra1_4_producto` (`pro_codigo`);

--
-- Indices de la tabla `1_4_detalle_conta`
--
ALTER TABLE `1_4_detalle_conta`
  ADD PRIMARY KEY (`det_cont_id`);

--
-- Indices de la tabla `1_4_detalle_empaque`
--
ALTER TABLE `1_4_detalle_empaque`
  ADD PRIMARY KEY (`det_empa_codigo`),
  ADD KEY `fk_1_4_detalle_empaque1_4_empacado` (`empa_codigo`),
  ADD KEY `fk_1_4_detalle_empaque1_4_tipo_empaque` (`tip_empa_codigo`);

--
-- Indices de la tabla `1_4_detalle_er`
--
ALTER TABLE `1_4_detalle_er`
  ADD PRIMARY KEY (`der_codigo`),
  ADD KEY `fk_1_4_detalle_er1_4_entrega_recepcion` (`er_codigo`),
  ADD KEY `fk_1_4_detalle_er1_4_cliente_institucion` (`cli_ins_codigo`);

--
-- Indices de la tabla `1_4_detalle_er_e`
--
ALTER TABLE `1_4_detalle_er_e`
  ADD PRIMARY KEY (`der_est_codigo`),
  ADD KEY `fk_1_4_detalle_er_e1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD KEY `fk_1_4_detalle_er_e1_4_entrega_recepcion_est` (`er_est_codigo`);

--
-- Indices de la tabla `1_4_detalle_liquidacion`
--
ALTER TABLE `1_4_detalle_liquidacion`
  ADD PRIMARY KEY (`det_liq_codigo`),
  ADD KEY `fk_1_4_detalle_liquidacion1_4_liquidacion` (`liq_ch_codigo`);

--
-- Indices de la tabla `1_4_detalle_nota_devolucion`
--
ALTER TABLE `1_4_detalle_nota_devolucion`
  ADD PRIMARY KEY (`d_nd_codigo`),
  ADD KEY `fk_1_4_detalle_nota_devolucion1_4_nota_devolucion` (`nd_codigo`);

--
-- Indices de la tabla `1_4_detalle_orden_trabajo`
--
ALTER TABLE `1_4_detalle_orden_trabajo`
  ADD PRIMARY KEY (`det_or_codigo`);

--
-- Indices de la tabla `1_4_detalle_rps`
--
ALTER TABLE `1_4_detalle_rps`
  ADD PRIMARY KEY (`drps_codigo`),
  ADD KEY `fk_1_4_detalle_rps1_4_producto` (`pro_codigo`);

--
-- Indices de la tabla `1_4_detalle_venta`
--
ALTER TABLE `1_4_detalle_venta`
  ADD PRIMARY KEY (`det_ven_codigo`),
  ADD KEY `fk_1_4_detalle_venta1_4_producto` (`pro_codigo`),
  ADD KEY `fk_1_4_detalle_venta1_4_venta` (`ven_codigo`);

--
-- Indices de la tabla `1_4_detalle_verificacion`
--
ALTER TABLE `1_4_detalle_verificacion`
  ADD PRIMARY KEY (`det_ver_id`);

--
-- Indices de la tabla `1_4_documento_liq`
--
ALTER TABLE `1_4_documento_liq`
  ADD PRIMARY KEY (`doc_codigo`),
  ADD KEY `fk_1_4_documento_liq1_4_venta` (`ven_codigo`);

--
-- Indices de la tabla `1_4_empacado`
--
ALTER TABLE `1_4_empacado`
  ADD PRIMARY KEY (`empa_codigo`);

--
-- Indices de la tabla `1_4_entregas_complementarias`
--
ALTER TABLE `1_4_entregas_complementarias`
  ADD PRIMARY KEY (`ent_com_codigo`);

--
-- Indices de la tabla `1_4_entrega_recepcion`
--
ALTER TABLE `1_4_entrega_recepcion`
  ADD PRIMARY KEY (`er_codigo`);

--
-- Indices de la tabla `1_4_entrega_recepcion_est`
--
ALTER TABLE `1_4_entrega_recepcion_est`
  ADD PRIMARY KEY (`er_est_codigo`);

--
-- Indices de la tabla `1_4_estado_cheque`
--
ALTER TABLE `1_4_estado_cheque`
  ADD PRIMARY KEY (`est_che_codigo`);

--
-- Indices de la tabla `1_4_estado_venta`
--
ALTER TABLE `1_4_estado_venta`
  ADD PRIMARY KEY (`est_ven_codigo`);

--
-- Indices de la tabla `1_4_geo_canton`
--
ALTER TABLE `1_4_geo_canton`
  ADD PRIMARY KEY (`can_id`),
  ADD KEY `fk_1_4_geo_canton1_4_geo_provincia` (`prov_id`);

--
-- Indices de la tabla `1_4_geo_parroquia`
--
ALTER TABLE `1_4_geo_parroquia`
  ADD PRIMARY KEY (`par_id`),
  ADD KEY `fk_1_4_geo_parroquia1_4_geo_canton` (`can_id`);

--
-- Indices de la tabla `1_4_geo_provincia`
--
ALTER TABLE `1_4_geo_provincia`
  ADD PRIMARY KEY (`prov_id`);

--
-- Indices de la tabla `1_4_grupo_productos`
--
ALTER TABLE `1_4_grupo_productos`
  ADD PRIMARY KEY (`gru_pro_codigo`);

--
-- Indices de la tabla `1_4_institucion`
--
ALTER TABLE `1_4_institucion`
  ADD PRIMARY KEY (`ins_codigo`),
  ADD KEY `fk_1_4_institucion1_4_ciudad` (`ciu_codigo`),
  ADD KEY `fk_1_4_institucion1_4_tipo_institucion` (`tip_ins_codigo`),
  ADD KEY `fk_1_4_institucion1_4_ciclo` (`cic_codigo`);

--
-- Indices de la tabla `1_4_iva`
--
ALTER TABLE `1_4_iva`
  ADD PRIMARY KEY (`iva_cod`);

--
-- Indices de la tabla `1_4_liquidacion`
--
ALTER TABLE `1_4_liquidacion`
  ADD PRIMARY KEY (`liq_ch_codigo`),
  ADD KEY `fk_1_4_liquidacion1_4_usuario` (`usu_codigo`),
  ADD KEY `fk_1_4_liquidacion1_4_verificador` (`ver_codigo`);

--
-- Indices de la tabla `1_4_material_cubierta`
--
ALTER TABLE `1_4_material_cubierta`
  ADD PRIMARY KEY (`mat_cub_codigo`);

--
-- Indices de la tabla `1_4_material_interior`
--
ALTER TABLE `1_4_material_interior`
  ADD PRIMARY KEY (`mat_in_codigo`);

--
-- Indices de la tabla `1_4_nota_devolucion`
--
ALTER TABLE `1_4_nota_devolucion`
  ADD PRIMARY KEY (`nd_codigo`);

--
-- Indices de la tabla `1_4_orden_trabajo`
--
ALTER TABLE `1_4_orden_trabajo`
  ADD PRIMARY KEY (`or_codigo`);

--
-- Indices de la tabla `1_4_pago`
--
ALTER TABLE `1_4_pago`
  ADD PRIMARY KEY (`pag_codigo`),
  ADD KEY `fk_1_4_pago1_4_tipo_pago` (`tip_pag_codigo`),
  ADD KEY `fk_1_4_pago1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD KEY `fk_1_4_pago1_4_cuenta_pago` (`cue_pag_codigo`),
  ADD KEY `fk_1_4_pago1_4_cobrador` (`cobra_codigo`);

--
-- Indices de la tabla `1_4_pais`
--
ALTER TABLE `1_4_pais`
  ADD PRIMARY KEY (`PAI_CODIGO`);

--
-- Indices de la tabla `1_4_pantalla`
--
ALTER TABLE `1_4_pantalla`
  ADD PRIMARY KEY (`pa_codigo`);

--
-- Indices de la tabla `1_4_pedido`
--
ALTER TABLE `1_4_pedido`
  ADD PRIMARY KEY (`pedido`),
  ADD KEY `fk_1_4_pedido1_4_cliente_institucion` (`cli_ins_codigo`);

--
-- Indices de la tabla `1_4_pendientes`
--
ALTER TABLE `1_4_pendientes`
  ADD PRIMARY KEY (`pen_codigo`);

--
-- Indices de la tabla `1_4_permiso`
--
ALTER TABLE `1_4_permiso`
  ADD PRIMARY KEY (`pe_codigo`),
  ADD KEY `fk_1_4_permiso1_4_departamento` (`pe_dep`),
  ADD KEY `fk_1_4_permiso1_4_pantalla` (`pe_pa`);

--
-- Indices de la tabla `1_4_producto`
--
ALTER TABLE `1_4_producto`
  ADD PRIMARY KEY (`pro_codigo`),
  ADD KEY `fk_1_4_producto1_4_grupo_productos` (`gru_pro_codigo`);

--
-- Indices de la tabla `1_4_producto_caracteristica`
--
ALTER TABLE `1_4_producto_caracteristica`
  ADD PRIMARY KEY (`pro_car_codigo`);

--
-- Indices de la tabla `1_4_proveedor`
--
ALTER TABLE `1_4_proveedor`
  ADD PRIMARY KEY (`prov_codigo`),
  ADD KEY `fk_1_4_proveedor1_4_ciudad` (`ciu_codigo`);

--
-- Indices de la tabla `1_4_provincia`
--
ALTER TABLE `1_4_provincia`
  ADD PRIMARY KEY (`provi_codigo`),
  ADD KEY `fk_1_4_provincia1_4_pais` (`pai_codigo`);

--
-- Indices de la tabla `1_4_remision`
--
ALTER TABLE `1_4_remision`
  ADD PRIMARY KEY (`remi_codigo`),
  ADD KEY `fk_1_4_remision1_4_transporte` (`trans_codigo`);

--
-- Indices de la tabla `1_4_secuencial_vendedor`
--
ALTER TABLE `1_4_secuencial_vendedor`
  ADD PRIMARY KEY (`sec_ven_codigo`),
  ADD KEY `fk_1_4_secuencial_vendedor1_4_vendedor` (`ven_d_codigo`);

--
-- Indices de la tabla `1_4_sec_rps`
--
ALTER TABLE `1_4_sec_rps`
  ADD PRIMARY KEY (`sec_rps_id`);

--
-- Indices de la tabla `1_4_sucursal`
--
ALTER TABLE `1_4_sucursal`
  ADD PRIMARY KEY (`suc_codigo`),
  ADD KEY `fk_1_4_sucursal1_4_ciudad` (`ciu_codigo`),
  ADD KEY `fk_1_4_sucursal1_4_institucion` (`ins_codigo`);

--
-- Indices de la tabla `1_4_tipo_cheque`
--
ALTER TABLE `1_4_tipo_cheque`
  ADD PRIMARY KEY (`tip_che_codigo`);

--
-- Indices de la tabla `1_4_tipo_empaque`
--
ALTER TABLE `1_4_tipo_empaque`
  ADD PRIMARY KEY (`tip_empa_codigo`);

--
-- Indices de la tabla `1_4_tipo_institucion`
--
ALTER TABLE `1_4_tipo_institucion`
  ADD PRIMARY KEY (`tip_ins_codigo`);

--
-- Indices de la tabla `1_4_tipo_pago`
--
ALTER TABLE `1_4_tipo_pago`
  ADD PRIMARY KEY (`tip_pag_codigo`);

--
-- Indices de la tabla `1_4_tipo_venta`
--
ALTER TABLE `1_4_tipo_venta`
  ADD PRIMARY KEY (`tip_ven_codigo`);

--
-- Indices de la tabla `1_4_transporte`
--
ALTER TABLE `1_4_transporte`
  ADD PRIMARY KEY (`trans_codigo`);

--
-- Indices de la tabla `1_4_usuario`
--
ALTER TABLE `1_4_usuario`
  ADD PRIMARY KEY (`usu_codigo`),
  ADD KEY `fk_1_4_usuario1_4_departamento` (`dep_codigo`),
  ADD KEY `fk_1_4_usuario1_4_ciudad` (`ciu_codigo`);

--
-- Indices de la tabla `1_4_vendedor`
--
ALTER TABLE `1_4_vendedor`
  ADD PRIMARY KEY (`ven_d_codigo`),
  ADD KEY `fk_1_4_vendedor1_4_ciudad` (`ciu_codigo`);

--
-- Indices de la tabla `1_4_venta`
--
ALTER TABLE `1_4_venta`
  ADD PRIMARY KEY (`ven_codigo`),
  ADD KEY `fk_1_4_venta1_4_usuario` (`usu_codigo`),
  ADD KEY `fk_1_4_venta1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD KEY `fk_1_4_venta1_4_tipo_venta` (`tip_ven_codigo`),
  ADD KEY `fk_1_4_venta1_4_estado_venta` (`est_ven_codigo`);

--
-- Indices de la tabla `1_4_verificador`
--
ALTER TABLE `1_4_verificador`
  ADD PRIMARY KEY (`ver_codigo`);

--
-- Indices de la tabla `1_4_verificados`
--
ALTER TABLE `1_4_verificados`
  ADD PRIMARY KEY (`identificador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `1_4_anticipo`
--
ALTER TABLE `1_4_anticipo`
  MODIFY `ant_codigo` float(19,0) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_asignacion`
--
ALTER TABLE `1_4_asignacion`
  MODIFY `asi_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_bancos`
--
ALTER TABLE `1_4_bancos`
  MODIFY `BAN_CODIGO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_beneficiario`
--
ALTER TABLE `1_4_beneficiario`
  MODIFY `ben_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_cheque`
--
ALTER TABLE `1_4_cheque`
  MODIFY `che_codigo` float(10,0) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_cheque_venta`
--
ALTER TABLE `1_4_cheque_venta`
  MODIFY `che_ven_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_ciclo`
--
ALTER TABLE `1_4_ciclo`
  MODIFY `CIC_CODIGO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_ciudad`
--
ALTER TABLE `1_4_ciudad`
  MODIFY `CIU_CODIGO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_cliente_institucion`
--
ALTER TABLE `1_4_cliente_institucion`
  MODIFY `cli_ins_codigo` float(10,0) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_configuracion`
--
ALTER TABLE `1_4_configuracion`
  MODIFY `con_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_cuenta`
--
ALTER TABLE `1_4_cuenta`
  MODIFY `cuen_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_cuenta_pago`
--
ALTER TABLE `1_4_cuenta_pago`
  MODIFY `cue_pag_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_compra`
--
ALTER TABLE `1_4_detalle_compra`
  MODIFY `det_com_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_conta`
--
ALTER TABLE `1_4_detalle_conta`
  MODIFY `det_cont_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_er`
--
ALTER TABLE `1_4_detalle_er`
  MODIFY `der_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_er_e`
--
ALTER TABLE `1_4_detalle_er_e`
  MODIFY `der_est_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_liquidacion`
--
ALTER TABLE `1_4_detalle_liquidacion`
  MODIFY `det_liq_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_nota_devolucion`
--
ALTER TABLE `1_4_detalle_nota_devolucion`
  MODIFY `d_nd_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_orden_trabajo`
--
ALTER TABLE `1_4_detalle_orden_trabajo`
  MODIFY `det_or_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_rps`
--
ALTER TABLE `1_4_detalle_rps`
  MODIFY `drps_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_venta`
--
ALTER TABLE `1_4_detalle_venta`
  MODIFY `det_ven_codigo` float(10,0) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_detalle_verificacion`
--
ALTER TABLE `1_4_detalle_verificacion`
  MODIFY `det_ver_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_documento_liq`
--
ALTER TABLE `1_4_documento_liq`
  MODIFY `doc_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_entregas_complementarias`
--
ALTER TABLE `1_4_entregas_complementarias`
  MODIFY `ent_com_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_estado_cheque`
--
ALTER TABLE `1_4_estado_cheque`
  MODIFY `est_che_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_estado_venta`
--
ALTER TABLE `1_4_estado_venta`
  MODIFY `est_ven_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_grupo_productos`
--
ALTER TABLE `1_4_grupo_productos`
  MODIFY `gru_pro_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_institucion`
--
ALTER TABLE `1_4_institucion`
  MODIFY `ins_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_iva`
--
ALTER TABLE `1_4_iva`
  MODIFY `iva_cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_liquidacion`
--
ALTER TABLE `1_4_liquidacion`
  MODIFY `liq_ch_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_pago`
--
ALTER TABLE `1_4_pago`
  MODIFY `pag_codigo` float(18,0) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_pais`
--
ALTER TABLE `1_4_pais`
  MODIFY `PAI_CODIGO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_pendientes`
--
ALTER TABLE `1_4_pendientes`
  MODIFY `pen_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_permiso`
--
ALTER TABLE `1_4_permiso`
  MODIFY `pe_codigo` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_proveedor`
--
ALTER TABLE `1_4_proveedor`
  MODIFY `prov_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_provincia`
--
ALTER TABLE `1_4_provincia`
  MODIFY `provi_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_secuencial_vendedor`
--
ALTER TABLE `1_4_secuencial_vendedor`
  MODIFY `sec_ven_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_sucursal`
--
ALTER TABLE `1_4_sucursal`
  MODIFY `suc_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_tipo_cheque`
--
ALTER TABLE `1_4_tipo_cheque`
  MODIFY `tip_che_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_tipo_institucion`
--
ALTER TABLE `1_4_tipo_institucion`
  MODIFY `tip_ins_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_tipo_pago`
--
ALTER TABLE `1_4_tipo_pago`
  MODIFY `tip_pag_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_tipo_venta`
--
ALTER TABLE `1_4_tipo_venta`
  MODIFY `tip_ven_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `1_4_transporte`
--
ALTER TABLE `1_4_transporte`
  MODIFY `trans_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `1_4_anticipo`
--
ALTER TABLE `1_4_anticipo`
  ADD CONSTRAINT `fk_1_4_anticipo1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`);

--
-- Filtros para la tabla `1_4_cheque`
--
ALTER TABLE `1_4_cheque`
  ADD CONSTRAINT `fk_1_4_cheque1_4_bancos` FOREIGN KEY (`ban_codigo`) REFERENCES `1_4_bancos` (`BAN_CODIGO`),
  ADD CONSTRAINT `fk_1_4_cheque1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD CONSTRAINT `fk_1_4_cheque1_4_estado_cheque` FOREIGN KEY (`est_che_codigo`) REFERENCES `1_4_estado_cheque` (`est_che_codigo`),
  ADD CONSTRAINT `fk_1_4_cheque1_4_tipo_cheque` FOREIGN KEY (`tip_che_codigo`) REFERENCES `1_4_tipo_cheque` (`tip_che_codigo`);

--
-- Filtros para la tabla `1_4_cheque_venta`
--
ALTER TABLE `1_4_cheque_venta`
  ADD CONSTRAINT `fk_1_4_cheque_venta1_4_liquidacion` FOREIGN KEY (`liq_ch_codigo`) REFERENCES `1_4_liquidacion` (`liq_ch_codigo`),
  ADD CONSTRAINT `fk_1_4_cheque_venta1_4_venta` FOREIGN KEY (`ven_codigo`) REFERENCES `1_4_venta` (`ven_codigo`);

--
-- Filtros para la tabla `1_4_ciudad`
--
ALTER TABLE `1_4_ciudad`
  ADD CONSTRAINT `fk_1_4_ciudad1_4_provincia` FOREIGN KEY (`PROVI_CODIGO`) REFERENCES `1_4_provincia` (`provi_codigo`);

--
-- Filtros para la tabla `1_4_cliente_institucion`
--
ALTER TABLE `1_4_cliente_institucion`
  ADD CONSTRAINT `fk_1_4_cliente_institucion1_4_cliente` FOREIGN KEY (`cli_ci`) REFERENCES `1_4_cliente` (`cli_ci`),
  ADD CONSTRAINT `fk_1_4_cliente_institucion1_4_institucion` FOREIGN KEY (`ins_codigo`) REFERENCES `1_4_institucion` (`ins_codigo`);

--
-- Filtros para la tabla `1_4_compra`
--
ALTER TABLE `1_4_compra`
  ADD CONSTRAINT `fk_1_4_compra1_4_proveedor` FOREIGN KEY (`prov_codigo`) REFERENCES `1_4_proveedor` (`prov_codigo`);

--
-- Filtros para la tabla `1_4_cuenta`
--
ALTER TABLE `1_4_cuenta`
  ADD CONSTRAINT `fk_1_4_cuenta1_4_bancos` FOREIGN KEY (`ban_codigo`) REFERENCES `1_4_bancos` (`BAN_CODIGO`);

--
-- Filtros para la tabla `1_4_cuenta_pago`
--
ALTER TABLE `1_4_cuenta_pago`
  ADD CONSTRAINT `fk_1_4_cuenta_pago1_4_bancos` FOREIGN KEY (`ban_codigo`) REFERENCES `1_4_bancos` (`BAN_CODIGO`);

--
-- Filtros para la tabla `1_4_detalle_compra`
--
ALTER TABLE `1_4_detalle_compra`
  ADD CONSTRAINT `fk_1_4_detalle_compra1_4_producto` FOREIGN KEY (`pro_codigo`) REFERENCES `1_4_producto` (`pro_codigo`);

--
-- Filtros para la tabla `1_4_detalle_empaque`
--
ALTER TABLE `1_4_detalle_empaque`
  ADD CONSTRAINT `fk_1_4_detalle_empaque1_4_empacado` FOREIGN KEY (`empa_codigo`) REFERENCES `1_4_empacado` (`empa_codigo`),
  ADD CONSTRAINT `fk_1_4_detalle_empaque1_4_tipo_empaque` FOREIGN KEY (`tip_empa_codigo`) REFERENCES `1_4_tipo_empaque` (`tip_empa_codigo`);

--
-- Filtros para la tabla `1_4_detalle_er`
--
ALTER TABLE `1_4_detalle_er`
  ADD CONSTRAINT `fk_1_4_detalle_er1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD CONSTRAINT `fk_1_4_detalle_er1_4_entrega_recepcion` FOREIGN KEY (`er_codigo`) REFERENCES `1_4_entrega_recepcion` (`er_codigo`);

--
-- Filtros para la tabla `1_4_detalle_er_e`
--
ALTER TABLE `1_4_detalle_er_e`
  ADD CONSTRAINT `fk_1_4_detalle_er_e1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD CONSTRAINT `fk_1_4_detalle_er_e1_4_entrega_recepcion_est` FOREIGN KEY (`er_est_codigo`) REFERENCES `1_4_entrega_recepcion_est` (`er_est_codigo`);

--
-- Filtros para la tabla `1_4_detalle_liquidacion`
--
ALTER TABLE `1_4_detalle_liquidacion`
  ADD CONSTRAINT `fk_1_4_detalle_liquidacion1_4_liquidacion` FOREIGN KEY (`liq_ch_codigo`) REFERENCES `1_4_liquidacion` (`liq_ch_codigo`);

--
-- Filtros para la tabla `1_4_detalle_nota_devolucion`
--
ALTER TABLE `1_4_detalle_nota_devolucion`
  ADD CONSTRAINT `fk_1_4_detalle_nota_devolucion1_4_nota_devolucion` FOREIGN KEY (`nd_codigo`) REFERENCES `1_4_nota_devolucion` (`nd_codigo`);

--
-- Filtros para la tabla `1_4_detalle_rps`
--
ALTER TABLE `1_4_detalle_rps`
  ADD CONSTRAINT `fk_1_4_detalle_rps1_4_producto` FOREIGN KEY (`pro_codigo`) REFERENCES `1_4_producto` (`pro_codigo`);

--
-- Filtros para la tabla `1_4_detalle_venta`
--
ALTER TABLE `1_4_detalle_venta`
  ADD CONSTRAINT `fk_1_4_detalle_venta1_4_producto` FOREIGN KEY (`pro_codigo`) REFERENCES `1_4_producto` (`pro_codigo`),
  ADD CONSTRAINT `fk_1_4_detalle_venta1_4_venta` FOREIGN KEY (`ven_codigo`) REFERENCES `1_4_venta` (`ven_codigo`);

--
-- Filtros para la tabla `1_4_documento_liq`
--
ALTER TABLE `1_4_documento_liq`
  ADD CONSTRAINT `fk_1_4_documento_liq1_4_venta` FOREIGN KEY (`ven_codigo`) REFERENCES `1_4_venta` (`ven_codigo`);

--
-- Filtros para la tabla `1_4_geo_canton`
--
ALTER TABLE `1_4_geo_canton`
  ADD CONSTRAINT `fk_1_4_geo_canton1_4_geo_provincia` FOREIGN KEY (`prov_id`) REFERENCES `1_4_geo_provincia` (`prov_id`);

--
-- Filtros para la tabla `1_4_geo_parroquia`
--
ALTER TABLE `1_4_geo_parroquia`
  ADD CONSTRAINT `fk_1_4_geo_parroquia1_4_geo_canton` FOREIGN KEY (`can_id`) REFERENCES `1_4_geo_canton` (`can_id`);

--
-- Filtros para la tabla `1_4_institucion`
--
ALTER TABLE `1_4_institucion`
  ADD CONSTRAINT `fk_1_4_institucion1_4_ciclo` FOREIGN KEY (`cic_codigo`) REFERENCES `1_4_ciclo` (`CIC_CODIGO`),
  ADD CONSTRAINT `fk_1_4_institucion1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`),
  ADD CONSTRAINT `fk_1_4_institucion1_4_tipo_institucion` FOREIGN KEY (`tip_ins_codigo`) REFERENCES `1_4_tipo_institucion` (`tip_ins_codigo`);

--
-- Filtros para la tabla `1_4_liquidacion`
--
ALTER TABLE `1_4_liquidacion`
  ADD CONSTRAINT `fk_1_4_liquidacion1_4_usuario` FOREIGN KEY (`usu_codigo`) REFERENCES `1_4_usuario` (`usu_codigo`),
  ADD CONSTRAINT `fk_1_4_liquidacion1_4_verificador` FOREIGN KEY (`ver_codigo`) REFERENCES `1_4_verificador` (`ver_codigo`);

--
-- Filtros para la tabla `1_4_pago`
--
ALTER TABLE `1_4_pago`
  ADD CONSTRAINT `fk_1_4_pago1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD CONSTRAINT `fk_1_4_pago1_4_cobrador` FOREIGN KEY (`cobra_codigo`) REFERENCES `1_4_cobrador` (`cobra_codigo`),
  ADD CONSTRAINT `fk_1_4_pago1_4_cuenta_pago` FOREIGN KEY (`cue_pag_codigo`) REFERENCES `1_4_cuenta_pago` (`cue_pag_codigo`),
  ADD CONSTRAINT `fk_1_4_pago1_4_tipo_pago` FOREIGN KEY (`tip_pag_codigo`) REFERENCES `1_4_tipo_pago` (`tip_pag_codigo`);

--
-- Filtros para la tabla `1_4_pedido`
--
ALTER TABLE `1_4_pedido`
  ADD CONSTRAINT `fk_1_4_pedido1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`);

--
-- Filtros para la tabla `1_4_permiso`
--
ALTER TABLE `1_4_permiso`
  ADD CONSTRAINT `fk_1_4_permiso1_4_departamento` FOREIGN KEY (`pe_dep`) REFERENCES `1_4_departamento` (`dep_codigo`),
  ADD CONSTRAINT `fk_1_4_permiso1_4_pantalla` FOREIGN KEY (`pe_pa`) REFERENCES `1_4_pantalla` (`pa_codigo`);

--
-- Filtros para la tabla `1_4_producto`
--
ALTER TABLE `1_4_producto`
  ADD CONSTRAINT `fk_1_4_producto1_4_grupo_productos` FOREIGN KEY (`gru_pro_codigo`) REFERENCES `1_4_grupo_productos` (`gru_pro_codigo`);

--
-- Filtros para la tabla `1_4_proveedor`
--
ALTER TABLE `1_4_proveedor`
  ADD CONSTRAINT `fk_1_4_proveedor1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`);

--
-- Filtros para la tabla `1_4_provincia`
--
ALTER TABLE `1_4_provincia`
  ADD CONSTRAINT `fk_1_4_provincia1_4_pais` FOREIGN KEY (`pai_codigo`) REFERENCES `1_4_pais` (`PAI_CODIGO`);

--
-- Filtros para la tabla `1_4_remision`
--
ALTER TABLE `1_4_remision`
  ADD CONSTRAINT `fk_1_4_remision1_4_transporte` FOREIGN KEY (`trans_codigo`) REFERENCES `1_4_transporte` (`trans_codigo`);

--
-- Filtros para la tabla `1_4_secuencial_vendedor`
--
ALTER TABLE `1_4_secuencial_vendedor`
  ADD CONSTRAINT `fk_1_4_secuencial_vendedor1_4_vendedor` FOREIGN KEY (`ven_d_codigo`) REFERENCES `1_4_vendedor` (`ven_d_codigo`);

--
-- Filtros para la tabla `1_4_sucursal`
--
ALTER TABLE `1_4_sucursal`
  ADD CONSTRAINT `fk_1_4_sucursal1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`),
  ADD CONSTRAINT `fk_1_4_sucursal1_4_institucion` FOREIGN KEY (`ins_codigo`) REFERENCES `1_4_institucion` (`ins_codigo`);

--
-- Filtros para la tabla `1_4_usuario`
--
ALTER TABLE `1_4_usuario`
  ADD CONSTRAINT `fk_1_4_usuario1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`),
  ADD CONSTRAINT `fk_1_4_usuario1_4_departamento` FOREIGN KEY (`dep_codigo`) REFERENCES `1_4_departamento` (`dep_codigo`);

--
-- Filtros para la tabla `1_4_vendedor`
--
ALTER TABLE `1_4_vendedor`
  ADD CONSTRAINT `fk_1_4_vendedor1_4_ciudad` FOREIGN KEY (`ciu_codigo`) REFERENCES `1_4_ciudad` (`CIU_CODIGO`);

--
-- Filtros para la tabla `1_4_venta`
--
ALTER TABLE `1_4_venta`
  ADD CONSTRAINT `fk_1_4_venta1_4_cliente_institucion` FOREIGN KEY (`cli_ins_codigo`) REFERENCES `1_4_cliente_institucion` (`cli_ins_codigo`),
  ADD CONSTRAINT `fk_1_4_venta1_4_estado_venta` FOREIGN KEY (`est_ven_codigo`) REFERENCES `1_4_estado_venta` (`est_ven_codigo`),
  ADD CONSTRAINT `fk_1_4_venta1_4_tipo_venta` FOREIGN KEY (`tip_ven_codigo`) REFERENCES `1_4_tipo_venta` (`tip_ven_codigo`),
  ADD CONSTRAINT `fk_1_4_venta1_4_usuario` FOREIGN KEY (`usu_codigo`) REFERENCES `1_4_usuario` (`usu_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
