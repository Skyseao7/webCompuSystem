-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-10-2024 a las 20:11:25
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_compusystem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `rol` enum('ADMIN','CLIENTE') NOT NULL DEFAULT 'CLIENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `correo`, `password`, `direccion`, `telefono`, `fecha_registro`, `rol`) VALUES
(1, 'Admin', 'Usuario', 'admin@ejemplo.com', '12345', NULL, NULL, '2024-10-25 13:39:17', 'ADMIN'),
(2, 'Diego', 'Quintana', 'diego@quintana.com', '12345', 'VILLA MARIA', '963547835', '2024-10-25 13:53:31', 'CLIENTE'),
(3, 'Pamela', 'Guerrero', 'pamela@guerrero.com', 'pame123', 'SAN JUAN DE MIRAFLORES', '963464526', '2024-10-25 13:57:23', 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado_pedido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `p_nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `p_nombre`, `descripcion`, `precio`, `stock`, `categoria`, `imagen`) VALUES
(1, 'HUB USB TRIPP-LITE DE 4 PUERTOS 3.0 SUPERSPEED ULTRA DELGADO', 'Marca: Tripp-Lite\r\nN° de parte: U360-004-SLIM\r\nInterfaz: USB\r\nPuertos: USB 3.0 (X4)\r\nDimensiones: 10.7 x 3.3 x 1 cm', 87.00, 15, 'Accesorios', 'accesorios/hub-usb.jpg'),
(2, 'PAD MOUSE XBLADE MANTUS GXB-G2', 'Marca: XBLADE\r\nModelo: Mantus\r\nNúmero de Parte: GXB-G2\r\nBase: antideslizante\r\nDimensiones: 25.4 x 35.5 x 0.3 cm', 60.00, 20, 'Accesorios', 'accesorios/padmouse-xblade.jpg'),
(3, 'COMPUTADORA HP, CORE I3 3.60GHZ, 4GB RAM, 1TB HDD, WINDOWS 10 HOME + MONITOR HP V22 FHD', 'Marca: HP\r\nModelo: Slim Desktop S01-pF1004bla\r\nProcesador: Intel® Core™ i3-10100 3.60 GHz hasta 4.30 GHz\r\nAlmacenamiento: 1TB HDD 7200RPM\r\nMemoria: 4GB DDR4-2666\r\nVideo: Intel® UHD 630\r\nSistema: Windows 10 Home\r\nPeso: 3.02 kg\r\nColor: Negro', 2257.00, 8, 'Computo', 'computo/compu-hp-corei3.jpg'),
(4, 'COMPUTADORA DELL VOSTRO 3681 INTEL CORE I3 10100, 1TB, 4GB, UBUNTU', 'Marca: Dell\r\nModelo: Vostro 3681\r\nN° de parte: 7FG21\r\nProcesador: Intel® Core™ i3-10100 3.60GHz-4.30GHz\r\nAlmacenamiento: 1TB 7200RPM HDD\r\nMemoria: 4 GB DDR4\r\nVideo: Gráficos Intel® UHD 630\r\nSistema: Ubuntu Linux 18.04\r\nIncluye: Teclado y Mouse alámbrico', 1744.00, 6, 'Computo', 'computo/compu-dell-corei3.jpg'),
(5, 'Impresora Multifuncional Hp Officejet Pro 9130, Tinta, Impresión, Escaneo, Copia, Fax', 'Marca: HP\r\nModelo: OfficeJet Pro 9130\r\nFunciones: Imprime, escanea, copia y fax\r\nTecnología de impresión: Inyección térmica de tinta HP\r\nResolución de escaneo: Hasta 1200 x 1200 dpi\r\nConectividad: USB, Wifi, Ethernet\r\nCapacidad de bandeja: 250 hojas', 1000.00, 15, 'Impresoras', 'impresoras/impresora-hp-pro.jpg'),
(6, 'IMPRESORA MATRICIAL EPSON FX-890II, MATRIZ DE 9 PINES, PARALELO, USB 2.0, 100V, 240VAC', 'Marca: Epson\r\nModelo: FX-890II\r\nSoporte de papel:\r\nSobres: No. 10, No. 6\r\nContinuo\r\nMultiple original + 5 copias sin carbón\r\nCinta: Color negro S015329\r\nInterfáz: USB 2.0 / Paralelo\r\nColor: Negro', 2149.00, 12, 'Impresoras', 'impresoras/impresora-epson.jpg'),
(7, 'LAPTOP GAMER ASUS TUF FX506LH-H100, CORE I7,15.6″, 512GB SSD, 16GB RAM, GTX 1650 4GB', 'Marca: Asus FX506LH-HN100\r\nProcesador: Intel Core I7-10870H/BGA 2.50GHz – 5.0GHz\r\nAlmacenamiento: 512GB SSD M.2 G3\r\nMemoria: 16 GB DDR4 (8*2)\r\nVideo: NVIDIA GeForce GTX1650 4GB\r\nPantalla: 15.6″ FHD IPS 144HzUSB: USB3.2A*2 + USB3.2C + USB2.0\r\nColor: Gray Metal\r\nTeclado: Español Latin America (Retroiluminado RGB)', 4800.00, 16, 'Laptops', 'laptops/laptop-gamer-asus-corei7.jpg'),
(8, 'LAPTOP ASUS EXPERTBOOK, 14″ FHD, INTEL CORE I5, 8GB RAM, 1TB HDD, WINDOWS 10 PRO', 'Marca: Asus ExpertBook P2451FA\r\nProcesador: Intel Core I5-10210U 1.6GHz – 4.2GHz\r\nAlmacenamiento: 1TB HDD\r\nMemoria: 8GB DDR4 (4GB *2)\r\nVideo: Gráficos UHD Intel®\r\nPantalla: 14″ FHD (1920×1080)\r\nSistema: Windows 10 Pro 64 Bits\r\nColor: Star Black\r\nLector de huellas dactilares.\r\n\r\nGarantía 1 año', 3300.00, 18, 'Laptops', 'laptops/laptop-asus-expertbook-corei5.jpg'),
(9, 'MONITOR GAMER MSI OPTIX, 31.5” VA CURVO 1920X1080, 2X HDMI, AMD FREESYNC, EARPHONE, NEGRO', 'Marca: MSI OPTIX G32C4\r\nN° de parte: OPTIXG32C4\r\nTamaño: 31.5″\r\nResolución del panel: 1920 x 1080 a 165 Hz (FHD)\r\nPuertos de video: 1x DP (1.2a), 2x HDMI (1.4b)\r\nPuertos de audio: 1x salida de auriculares\r\nCurvatura: 1500R\r\nBrillo: 250 liendres', 1692.00, 20, 'Monitores', 'monitores/monitor-gamer-msi-optix.jpg'),
(10, 'MONITOR GAMER ASUS TUF VG27AQ HDR:27 ” (2560×1440), IPS, 165HZ, 1MS', 'Marca: Asus VG27AQ\r\nTamaño del panel (pulgadas): 27\r\nColores de pantalla: 16,7 M\r\nTiempo de respuesta: 1 ms\r\nDisplayPort 1.2 : 1\r\nHDMI (v2.0): 2\r\nToma de auriculares: Sí', 2205.00, 16, 'Monitores', 'monitores/monitor-gamer-asus.jpg'),
(11, 'MOUSE GAMER ARGOM COMBAT MS40 6 BOTONES', 'Estructura robusta y diseño ergonómico para jugadores.\r\nArco iris de fondo cambiante de luz.\r\nPlug & Play compatible con la mayoría de los sistemas operativos.\r\nInterruptor de DPI (1000/1200/1600/2400 DPI).\r\nCable USB trenzado extralargo y duradero de 1,5 m.', 46.00, 25, 'Perifericos', 'perifericos/mouse-gamer-argom-combat.jpg'),
(12, 'AUDÍFONOS GAMER LENOVO LEGION H300', 'Marca: Lenovo Legion H300\r\nColor: Negro\r\nTipo de conector: Cableado vía 3.5 mm\r\nLargo y tipo de cable: 1,85 m, cable trenzado\r\nGarantía: CRU o servicio en centros de reparación autorizados\r\nControles: Micrófono de encendido / apagado; Subir / bajar volumen\r\nDistorsión: < 5%', 239.00, 20, 'Perifericos', 'perifericos/audifonos-gamer-lenovo-legion.jpg'),
(13, 'PROYECTOR EPSON POWERLITE X49, 3600 LÚMENES, 1024×768, XGA, PARLANTE MONOAURAL', 'Marca: Epson PowerLite X49\r\nResolución Nativa: XGA\r\nRelación de Aspecto: 4:3\r\nMétodo de Proyección: Frontal / Posterior / Techo\r\nSistema de Proyección: Tecnología Epson 3LCD de 3 chips\r\nMétodo de visualización: Poly-silicon TFT active matrix\r\nVoltaje de Fuente de Poder: 100V – 240V\r\nVida Útil de la Lámpara: 6.000 horas', 2700.00, 10, 'Proyectores', 'proyectores/proyector-epson-powerlite-x49.jpg'),
(14, 'Proyector Epson PowerLite E20, 3400 Lúmenes, 1024×768, XGA, PARLANTE MONOAURAL', 'Marca: Epson PowerLite E20\r\nResolución Nativa: XGA\r\nRelación de Aspecto: 4:3\r\n* Precio incluye IGV.\r\n* Precio no incluye flete por envío.\r\n* El precio y stock están sujetos a variación sin previo aviso.', 1800.00, 10, 'Proyectores', 'proyectores/proyector-epson-powerlite-e20.jpg'),
(15, 'Patch Cord blindado Panduit Cat 6A 26 AWG, 2 m, azul', 'Marca: Panduit\r\nN° de parte: STP6X2MBU\r\nCategoría: 6A\r\nColor: Azul\r\nTipo de conector: RJ45 a RJ45\r\nLongitud: 2 M | 6.56 FT.\r\nBlindado: S/FTP – SCREENED/FOILED TWISTED PAIR', 60.00, 16, 'Redes', 'redes/patch-cord-cat6a.jpg'),
(16, 'ROUTER INALÁMBRICO TP-LINK TL-WR840N 300Mbps', 'Marca: TP-Link\r\nModelo: TL-WR840N\r\n4 modos en 1: Router, Extensor de rango, Punto de Acceso, WISP\r\nInalámbrico: N 300Mbps en 2.4GHz\r\nAntenas: 2 antenas fija Omni Direccional\r\nPuertos: 1 puerto WAN de 10/100Mbps, 4 puertos LAN de 10/100 Mbps', 71.00, 12, 'Redes', 'redes/router-inalambrico-tp.jpg'),
(17, 'MICROSOFT OFFICE HOME AND BUSINESS – LICENCIA 1PC/MAC', 'Marca: Microsoft\r\nModelo: Home and Business 2019\r\nTipo: Electrónica, descarga\r\nN° de licencias: 1 PC/Mac, 1 licencia\r\nSistema operativo requerido: Apple MacOS , Windows 10 , Microsoft Windows Server 2019', 400.00, 25, 'Software', 'software/microsoft-licencia.jpg'),
(18, 'MICROSOFT OFFICE 365 PERSONAL – LICENCIA DE SUSCRIPCIÓN (1 AÑO – 1 PERSONA)', 'Marca: Microsoft\r\nModelo: Office 365 Personal\r\nTipo: Electrónica, descarga\r\nN° de licencias: 1 licencia\r\nPeriodo de la licencia: 1 año\r\nTipo de licencia: Licencia de suscripción', 150.00, 30, 'Software', 'software/microsoft-licencia-personal.jpg'),
(19, 'CARTUCHO DE TINTA HP 954XL YELLOW ORIGINAL', 'Marca: HP\r\nRendimiento: 1600\r\nGota de tinta: 7 pl\r\nRendimiento de la página (color): ~1.600 páginas\r\nVolumen de cartucho de impresión proporcionado: 20 ml\r\nColor(es) de consumibles de impresión: Amarillo\r\nTipos de tinta: Con base de pigmento', 150.00, 8, 'Suministros', 'suministros/cartucho-tinta-hp-yellow.jpg'),
(20, 'CARTUCHO DE TINTA HP 964XL BLACK ORIGINAL', 'Marca: HP\r\nRendimiento: 2000\r\nCompatibilidad: Serie de impresoras Todo-en-Uno HP OfficeJet Pro 9010, serie de impresoras Todo-en-Uno HP OfficeJet Pro 9020\r\nRendimiento de la página: ~2.000 páginas\r\nVolumen de cartucho de impresión proporcionado: 47,86 ml\r\nTipos de tinta: Con base de pigmento\r\nColor: Negro', 230.00, 20, 'Suministros', 'suministros/cartucho-tinta-hp-black.jpg'),
(21, 'BOTELLA DE TINTA EPSON T504, COLOR NEGRO, CONTENIDO 127ML, PARA IMPRESORAS EPSON', 'Marca: Epson T504\r\nNumero De Parte: T504120-AL\r\nTipo: Liquida\r\nPresentacion: Caja\r\nCantidad: 127ML\r\nRinde: 7500 Págs.\r\nColor: Negro\r\nCompatible: Para impresoras Epson Eco Tank L4160 / L6147 / L4150', 51.00, 20, 'Partes', 'partes/botella-tinta-epson-black.jpg'),
(22, 'BOTELLA DE TINTA EPSON T504220-AL, COLOR CYAN, CONTENIDO 70ML', 'Marca: Epson T504\r\nTipo: Liquida\r\nPresentacion: Caja\r\nCantidad: 70ML\r\nRinde: 6000 Págs.\r\nColor: Cyan\r\nCompatible: Para impresoras Epson Eco Tank: L4160, L6191, L6161, L4150, L6171', 47.00, 20, 'Partes', 'partes/botella-tinta-epson-cyan.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
