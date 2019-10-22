-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Out-2019 às 21:31
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agencia_seguro`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clienteseditar_save` (`pd_id_cliente` INT, `pd_nome_cliente` VARCHAR(45), `pd_data_inicio` DATE, `pd_sexo` VARCHAR(10), `pd_data_nascimento` DATE, `pd_estado_civil` VARCHAR(20), `pd_desc_cliente` VARCHAR(60), `pd_nome_rua` VARCHAR(45), `pd_n_rua` BIGINT, `pd_id_bairro` INT, `pd_telefone` BIGINT, `pd_email` VARCHAR(64), `pd_fax` VARCHAR(64))  BEGIN
        Declare idcliente INT;

        SELECT id_cliente INTO idcliente FROM endereco WHERE id_cliente = pd_id_cliente;

        UPDATE cliente SET nome_cliente = pd_nome_cliente, data_inicio = pd_data_inicio, sexo = pd_sexo, data_nascimento = pd_data_nascimento, estado_civil = pd_estado_civil, desc_cliente = pd_desc_cliente WHERE id_cliente = idcliente;

        UPDATE endereco SET nome_rua = pd_nome_rua, n_rua = pd_n_rua, id_bairro = pd_id_bairro, telefone = pd_telefone, email = pd_email, fax = pd_fax WHERE id_cliente = pd_id_cliente;

    
    Select * from cliente a INNER JOIN endereco b using(id_endereco) WHERE a.id_cliente = pd_id_cliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clientes_deletar` (`pd_id_cliente` INT)  BEGIN
        Declare idcliente INT;

        SELECT id_cliente INTO idcliente FROM endereco WHERE id_cliente = pd_id_cliente;
	
	   DELETE FROM endereco WHERE id_cliente = idcliente;
       DELETE FROM cliente WHERE id_cliente = pd_id_cliente;
      
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clientes_save` (`pd_nome_cliente` VARCHAR(45), `pd_data_inicio` DATE, `pd_sexo` VARCHAR(10), `pd_data_nascimento` DATE, `pd_estado_civil` VARCHAR(20), `pd_desc_cliente` VARCHAR(60), `pd_nome_rua` VARCHAR(45), `pd_n_rua` BIGINT, `pd_id_bairro` INT, `pd_telefone` BIGINT, `pd_email` VARCHAR(64), `pd_fax` VARCHAR(64))  BEGIN
        Declare idcliente INT;
    INSERT INTO cliente(nome_cliente, data_inicio, sexo, data_nascimento, estado_civil, desc_cliente) VALUES (pd_nome_cliente, pd_data_inicio, pd_sexo, pd_data_nascimento, pd_estado_civil, pd_desc_cliente);
        SET idcliente = last_insert_id();
    INSERT INTO endereco(nome_rua, n_rua, id_bairro, telefone, email, fax, id_cliente) VALUES (pd_nome_rua, pd_n_rua, pd_id_bairro, pd_telefone, pd_email, pd_fax, idcliente);
    
    Select * from cliente a INNER JOIN endereco b using(id_endereco) WHERE a.id_cliente = last_insert_id();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_save` (`pd_nome_funcionario` VARCHAR(45), `pd_email_funcionario` VARCHAR(45), `pd_usuario` VARCHAR(45), `pd_senha` VARCHAR(256), `pd_nivel` INT, `pd_desc_usuario` VARCHAR(45))  BEGIN
	Declare idfuncionario INT;
    
    INSERT INTO funcionarios(nome_funcionario, email) VALUES (pd_nome_funcionario, pd_email_funcionario);
    SET idfuncionario = last_insert_id();
    INSERT INTO usuario(username, senha, nivel, desc_usuario, funcionario) VALUES (pd_usuario, pd_senha, pd_nivel, pd_desc_usuario, idfuncionario);
    Select * from usuario a INNER JOIN funcionarios b using(funcionario) WHERE a.id_usuario = last_insert_id();
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `id_bairro` int(11) NOT NULL,
  `nome_bairro` varchar(64) NOT NULL,
  `id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`id_bairro`, `nome_bairro`, `id_municipio`) VALUES
(1, 'Golfe 2', 1),
(2, '500 Casas', 2),
(3, 'Ritondo', 4),
(4, 'Catepa', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classe_bonus`
--

CREATE TABLE `classe_bonus` (
  `id_classe_bonus` int(11) NOT NULL,
  `desc_classe_bonus` varchar(45) DEFAULT NULL,
  `tipo_classe_bonus` varchar(45) DEFAULT NULL,
  `n_classe` int(11) NOT NULL,
  `seguro_auto` int(11) DEFAULT NULL,
  `seguros` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(45) NOT NULL,
  `data_inicio` date NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `desc_cliente` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `data_inicio`, `sexo`, `data_nascimento`, `estado_civil`, `desc_cliente`) VALUES
(1, 'Sady Luaxy Luis Eduardo', '2019-10-19', 'Masculino', '1970-01-01', 'Solteiro', 'csafcsafsafsafas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comissao`
--

CREATE TABLE `comissao` (
  `id_comissao` int(11) NOT NULL,
  `valor_comissao` decimal(2,0) NOT NULL,
  `seguro_auto` int(11) DEFAULT NULL,
  `seguros` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `seguradora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesas`
--

CREATE TABLE `despesas` (
  `id_despesas` int(11) NOT NULL,
  `data_despesa` varchar(45) NOT NULL,
  `qtde_despesa` int(11) NOT NULL,
  `v_unit_desp` decimal(2,0) NOT NULL,
  `parcelas_desp` int(11) DEFAULT NULL,
  `cliente` int(11) NOT NULL,
  `forma_pagamento` int(11) NOT NULL,
  `tipo_despesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `nome_rua` varchar(45) NOT NULL,
  `n_rua` bigint(20) DEFAULT NULL,
  `id_bairro` int(11) NOT NULL,
  `telefone` bigint(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `nome_rua`, `n_rua`, `id_bairro`, `telefone`, `email`, `fax`, `id_cliente`) VALUES
(1, 'Av. Pedro De Castro Van DÃºnem Loy', 12, 4, 936268603, 'eduardosmithpitxo@gmail.com', 'fax@fx.com', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `facturamento`
--

CREATE TABLE `facturamento` (
  `id_facturamento` int(11) NOT NULL,
  `qtde_facturamento` int(11) NOT NULL,
  `v_unitario` decimal(10,0) NOT NULL,
  `v_total` decimal(10,0) DEFAULT NULL,
  `facturamentocol` varchar(45) DEFAULT NULL,
  `facturamentocol1` varchar(45) DEFAULT NULL,
  `facturamentocol2` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `seguradora` int(11) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int(11) NOT NULL,
  `nome_forma` varchar(45) NOT NULL,
  `desc_forma` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao`
--

CREATE TABLE `funcao` (
  `id_funcao` int(11) NOT NULL,
  `nome_funcao` varchar(45) NOT NULL,
  `desc_funcao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nome_funcionario`, `email`) VALUES
(1, 'Sady', 'eduarosmithpitxo@gmail.com'),
(2, 'Sady', 'eduardosmithpitxogmail.com'),
(3, 'Sady', 'eduardosmithpitxogmail.com'),
(4, 'Sady', 'eduardosmithpitxogmail.com'),
(5, 'Sady', 'eduardosmithpitxogmail.com'),
(6, 'Sady', 'eduardosmithpitxogmail.com'),
(7, 'Sady', 'eduardosmithpitxogmail.com'),
(8, 'Sady', 'eduardosmithpitxogmail.com'),
(9, 'Sady', 'eduardosmithpitxogmail.com'),
(10, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com'),
(11, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com'),
(12, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com'),
(13, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com'),
(14, 'Sady Luaxy', 'sadyluaxy123@gmail.com'),
(15, 'Sady Luaxy', 'sadyluaxy123@gmail.com'),
(16, 'Sady Luaxy', 'sadyluaxy123@gmail.com'),
(17, 'Sady Luaxy', 'sadyluaxy123@gmail.com'),
(18, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com'),
(19, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com'),
(20, 'Sady Luaxy', 'sadyluaxy123@gmail.com'),
(21, 'Sady Luaxy', 'eduardosmithpitxo@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL,
  `nome_municipio` varchar(64) NOT NULL,
  `id_provincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `nome_municipio`, `id_provincia`) VALUES
(1, 'Belas', 3),
(2, 'Cacuaco', 3),
(3, 'Cacuso', 4),
(4, 'Malanje', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `nome_pais` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`id_pais`, `nome_pais`) VALUES
(1, 'Angola');

-- --------------------------------------------------------

--
-- Estrutura da tabela `premio`
--

CREATE TABLE `premio` (
  `id_premio` int(11) NOT NULL,
  `valor_premio` decimal(2,0) NOT NULL,
  `seguro_auto` int(11) DEFAULT NULL,
  `seguros` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `nome_provincia` varchar(45) DEFAULT NULL,
  `id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nome_provincia`, `id_pais`) VALUES
(3, 'Luanda', 1),
(4, 'Malanje', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguradora`
--

CREATE TABLE `seguradora` (
  `id_seguradora` int(11) NOT NULL,
  `nome_seguradora` varchar(45) NOT NULL,
  `obs_seguradora` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguros`
--

CREATE TABLE `seguros` (
  `id_seguros` int(11) NOT NULL,
  `data_seguros` date NOT NULL,
  `desc_seguros` varchar(45) DEFAULT NULL,
  `end_risco_seguros` varchar(60) NOT NULL,
  `sinistro_seguros` varchar(45) NOT NULL,
  `tipo_cliente_seguros` int(11) NOT NULL,
  `data_vigencia_seguros` date NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguro_auto`
--

CREATE TABLE `seguro_auto` (
  `id_seguro_auto` int(11) NOT NULL,
  `data_seguro_auto` date NOT NULL,
  `desc_seguro_auto` varchar(45) NOT NULL,
  `ano_fabri` year(4) NOT NULL,
  `ano_modelo` year(4) NOT NULL,
  `img_automovel` text DEFAULT NULL,
  `cor_automovel` varchar(45) NOT NULL,
  `placa_automovel` varchar(45) NOT NULL,
  `chassi_automovel` text NOT NULL,
  `rastreador_automovel` varchar(10) NOT NULL,
  `sinistro_automovel` varchar(10) NOT NULL,
  `tipo_cliente_automovel` varchar(20) NOT NULL,
  `data_vigência` date NOT NULL,
  `seguradora` int(11) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_despesa`
--

CREATE TABLE `tipo_despesa` (
  `id_tipo_despesa` int(11) NOT NULL,
  `nome_tipo_desp` varchar(45) NOT NULL,
  `desc_tipo_desp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `senha` varchar(256) CHARACTER SET utf8 NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL,
  `nivel` int(11) NOT NULL,
  `desc_usuario` varchar(45) DEFAULT NULL,
  `funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `username`, `senha`, `create_time`, `modified`, `nivel`, `desc_usuario`, `funcionario`) VALUES
(1, 'BadLuaxera', '$2y$11$TfJjax8yXpMvNX80nyz1Nu1L8y7B5TXb04IxRF', '2019-10-17 21:55:42', NULL, 1, '123', 16),
(2, 'root', '$2y$10$dr2rkT4lEtQmu0xm5Eqa9O93GKBlcIVZKwmLLb', '2019-10-17 22:10:49', NULL, 1, '123', 17),
(6, 'Eduardo', '$2y$12$hDXiw8y2YzTCSD5zOH2/1etGSJjsrizVHTE32TjGtIeHJiHCz59OC', '2019-10-19 07:09:01', NULL, 1, '123', 21);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id_bairro`),
  ADD KEY `municipio` (`id_municipio`);

--
-- Índices para tabela `classe_bonus`
--
ALTER TABLE `classe_bonus`
  ADD PRIMARY KEY (`id_classe_bonus`),
  ADD KEY `fk_classe_bonus_seguro_auto1` (`seguro_auto`),
  ADD KEY `fk_classe_bonus_auto_seguros1` (`seguros`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `comissao`
--
ALTER TABLE `comissao`
  ADD PRIMARY KEY (`id_comissao`),
  ADD KEY `fk_comissao_seguro_auto1` (`seguro_auto`),
  ADD KEY `fk_comissao_auto_seguros1` (`seguros`);

--
-- Índices para tabela `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `fk_contacto_seguradora1` (`seguradora`);

--
-- Índices para tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id_despesas`),
  ADD KEY `fk_despesas_cliente` (`cliente`),
  ADD KEY `fk_despesas_forma_pagamento1` (`forma_pagamento`),
  ADD KEY `fk_despesas_tipo_despesa1` (`tipo_despesa`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `cliente` (`id_cliente`),
  ADD KEY `endereco_ bairro` (`id_bairro`);

--
-- Índices para tabela `facturamento`
--
ALTER TABLE `facturamento`
  ADD PRIMARY KEY (`id_facturamento`),
  ADD KEY `fk_facturamento_seguradora1` (`seguradora`),
  ADD KEY `fk_facturamento_cliente1` (`cliente`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_pagamento`);

--
-- Índices para tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`id_funcao`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `provincia` (`id_provincia`);

--
-- Índices para tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Índices para tabela `premio`
--
ALTER TABLE `premio`
  ADD PRIMARY KEY (`id_premio`),
  ADD KEY `fk_premio_seguro_auto1` (`seguro_auto`),
  ADD KEY `fk_premio_auto_seguros1` (`seguros`);

--
-- Índices para tabela `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `pais` (`id_pais`);

--
-- Índices para tabela `seguradora`
--
ALTER TABLE `seguradora`
  ADD PRIMARY KEY (`id_seguradora`);

--
-- Índices para tabela `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`id_seguros`),
  ADD KEY `fk_seguros_cliente1` (`cliente`);

--
-- Índices para tabela `seguro_auto`
--
ALTER TABLE `seguro_auto`
  ADD PRIMARY KEY (`id_seguro_auto`),
  ADD KEY `fk_seguro_auto_seguradora1` (`seguradora`),
  ADD KEY `fk_seguro_auto_cliente1` (`cliente`);

--
-- Índices para tabela `tipo_despesa`
--
ALTER TABLE `tipo_despesa`
  ADD PRIMARY KEY (`id_tipo_despesa`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_funcionario1` (`funcionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id_bairro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `comissao`
--
ALTER TABLE `comissao`
  MODIFY `id_comissao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id_despesas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `facturamento`
--
ALTER TABLE `facturamento`
  MODIFY `id_facturamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
  MODIFY `id_funcao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `premio`
--
ALTER TABLE `premio`
  MODIFY `id_premio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `seguradora`
--
ALTER TABLE `seguradora`
  MODIFY `id_seguradora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `seguros`
--
ALTER TABLE `seguros`
  MODIFY `id_seguros` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `seguro_auto`
--
ALTER TABLE `seguro_auto`
  MODIFY `id_seguro_auto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_despesa`
--
ALTER TABLE `tipo_despesa`
  MODIFY `id_tipo_despesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bairro`
--
ALTER TABLE `bairro`
  ADD CONSTRAINT `municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`);

--
-- Limitadores para a tabela `classe_bonus`
--
ALTER TABLE `classe_bonus`
  ADD CONSTRAINT `fk_classe_bonus_auto_seguros1` FOREIGN KEY (`seguros`) REFERENCES `seguros` (`id_seguros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_bonus_seguro_auto1` FOREIGN KEY (`seguro_auto`) REFERENCES `seguro_auto` (`id_seguro_auto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `comissao`
--
ALTER TABLE `comissao`
  ADD CONSTRAINT `fk_comissao_auto_seguros1` FOREIGN KEY (`seguros`) REFERENCES `seguros` (`id_seguros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comissao_seguro_auto1` FOREIGN KEY (`seguro_auto`) REFERENCES `seguro_auto` (`id_seguro_auto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `fk_contacto_seguradora1` FOREIGN KEY (`seguradora`) REFERENCES `seguradora` (`id_seguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `despesas`
--
ALTER TABLE `despesas`
  ADD CONSTRAINT `fk_despesas_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_despesas_forma_pagamento1` FOREIGN KEY (`forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_despesas_tipo_despesa1` FOREIGN KEY (`tipo_despesa`) REFERENCES `tipo_despesa` (`id_tipo_despesa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `endereco_ bairro` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Limitadores para a tabela `facturamento`
--
ALTER TABLE `facturamento`
  ADD CONSTRAINT `fk_facturamento_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_facturamento_seguradora1` FOREIGN KEY (`seguradora`) REFERENCES `seguradora` (`id_seguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Limitadores para a tabela `premio`
--
ALTER TABLE `premio`
  ADD CONSTRAINT `fk_premio_auto_seguros1` FOREIGN KEY (`seguros`) REFERENCES `seguros` (`id_seguros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_premio_seguro_auto1` FOREIGN KEY (`seguro_auto`) REFERENCES `seguro_auto` (`id_seguro_auto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Limitadores para a tabela `seguros`
--
ALTER TABLE `seguros`
  ADD CONSTRAINT `fk_seguros_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seguro_auto`
--
ALTER TABLE `seguro_auto`
  ADD CONSTRAINT `fk_seguro_auto_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seguro_auto_seguradora1` FOREIGN KEY (`seguradora`) REFERENCES `seguradora` (`id_seguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_funcionario1` FOREIGN KEY (`funcionario`) REFERENCES `funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
