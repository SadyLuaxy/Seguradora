-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2019 às 13:22
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
-- Banco de dados: `corretora`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_apolice`
--

CREATE TABLE `tbl_apolice` (
  `id_tbl_apolice` int(11) NOT NULL,
  `n_apolice` bigint(20) DEFAULT NULL,
  `endossno` bigint(20) DEFAULT NULL,
  `emissao_apolice` date DEFAULT NULL,
  `efectivado` date DEFAULT NULL,
  `enviado` date DEFAULT NULL,
  `tbl_Proposta_id_apoliceproposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cargo`
--

CREATE TABLE `tbl_cargo` (
  `id_cargo` int(11) NOT NULL,
  `nome_cargo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `desc_cargo` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_classificacao`
--

CREATE TABLE `tbl_classificacao` (
  `id_classificacao` int(11) NOT NULL,
  `nome_classificacao` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cobertura`
--

CREATE TABLE `tbl_cobertura` (
  `id_cobertura` int(11) NOT NULL,
  `nome` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `tbl_ramos_id_ramos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_comissaocorretora`
--

CREATE TABLE `tbl_comissaocorretora` (
  `id_comissaoCorretora` int(11) NOT NULL,
  `comissao_corretora` int(11) DEFAULT NULL,
  `comissao_liquida` double(10,2) DEFAULT NULL,
  `tbl_apoliceProposta_id_apoliceproposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_condutores`
--

CREATE TABLE `tbl_condutores` (
  `id_condutor` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `profissao` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `morada` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `caixa_postal` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `localizacao` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `licenca_conducao` bigint(20) DEFAULT NULL,
  `data_licenca` date DEFAULT NULL,
  `cipes` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `bi` varchar(60) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_condutores_itens`
--

CREATE TABLE `tbl_condutores_itens` (
  `id_tbl_condutores_itens` int(11) NOT NULL,
  `tbl_condutores_id_condutor` int(11) DEFAULT NULL,
  `tbl_itens_id_itens` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_corretora`
--

CREATE TABLE `tbl_corretora` (
  `id_corretora` int(11) NOT NULL,
  `fantasia` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `cnpj` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `gerente` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `tbl_endereco_id_endereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_corretora_tbl_documentos`
--

CREATE TABLE `tbl_corretora_tbl_documentos` (
  `tbl_corretora_id_corretora` int(11) NOT NULL,
  `tbl_documentos_id_documentos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_documentos`
--

CREATE TABLE `tbl_documentos` (
  `id_documentos` int(11) NOT NULL,
  `local_documento` text COLLATE utf8_bin DEFAULT NULL,
  `tipo_documento` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `update` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_documentos_bl_seguradoras`
--

CREATE TABLE `tbl_documentos_bl_seguradoras` (
  `tbl_documentos_id_documentos` int(11) NOT NULL,
  `tbl_seguradoras_id_seguradoras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_documentos_has_tbl_apoliceproposta`
--

CREATE TABLE `tbl_documentos_has_tbl_apoliceproposta` (
  `tbl_documentos_id_documentos` int(11) NOT NULL,
  `tbl_apoliceProposta_id_apoliceproposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_documentos_has_tbl_extratoseguro`
--

CREATE TABLE `tbl_documentos_has_tbl_extratoseguro` (
  `tbl_documentos_id_documentos` int(11) NOT NULL,
  `tbl_extratoSeguro_id_extratoSeguro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_endereco`
--

CREATE TABLE `tbl_endereco` (
  `id_endereco` int(11) NOT NULL,
  `telefone` bigint(20) DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `endereco` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `bairro` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_provincia_id_tbl_provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_extratoseguro`
--

CREATE TABLE `tbl_extratoseguro` (
  `id_extratoSeguro` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `data_credito` date DEFAULT NULL,
  `data_lancamento` date DEFAULT NULL,
  `comissao_total` int(11) DEFAULT NULL,
  `tbl_recebimento_id_recebimento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_funcionarios`
--

CREATE TABLE `tbl_funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_itens`
--

CREATE TABLE `tbl_itens` (
  `id_itens` int(11) NOT NULL,
  `marca` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `modelo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ano_fabricacao` date DEFAULT NULL,
  `ano_modelo` date DEFAULT NULL,
  `placa` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `chassi` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `lotacao` int(11) DEFAULT NULL,
  `ci` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `cor` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `combustivel` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `inclusao` date DEFAULT NULL,
  `alteracao` date DEFAULT NULL,
  `exclusao` date DEFAULT NULL,
  `categoria` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `cilindrada_forca` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `peso_bruto` int(11) DEFAULT NULL,
  `forma` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `circulacao_habitual` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `servico_utilizacao` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_apoliceProposta_id_apoliceproposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pagamento`
--

CREATE TABLE `tbl_pagamento` (
  `id_recebimento` int(11) NOT NULL,
  `premio_liquido` double(10,2) DEFAULT NULL,
  `comissao_recebida` double(10,2) DEFAULT NULL,
  `diferenca` double(10,2) DEFAULT NULL,
  `tbl_apoliceProposta_id_apoliceproposta` int(11) DEFAULT NULL,
  `tbl_parcelas_id_tbl_parcelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pais`
--

CREATE TABLE `tbl_pais` (
  `id_pais` int(11) NOT NULL,
  `nome_pais` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `codigo_pais` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_parcelas`
--

CREATE TABLE `tbl_parcelas` (
  `id_tbl_parcelas` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `valor` double(10,2) DEFAULT NULL,
  `valor_liquido` double(10,2) DEFAULT NULL,
  `previsao_recebimento` double(10,2) DEFAULT NULL,
  `recebeu` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `valor_recebido` double(10,2) DEFAULT NULL,
  `diferenca` double(10,2) DEFAULT NULL,
  `data_recebimento` date DEFAULT NULL,
  `lancamento` date DEFAULT NULL,
  `tipo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_comissaoCorretora_id_comissaoCorretora` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pessoas`
--

CREATE TABLE `tbl_pessoas` (
  `id_pessoa` int(11) NOT NULL,
  `tipo_pessoa` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `desc_pessoa` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_profissao`
--

CREATE TABLE `tbl_profissao` (
  `id_profissao` int(11) NOT NULL,
  `nome_profissao` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_proposta`
--

CREATE TABLE `tbl_proposta` (
  `id_apoliceproposta` int(11) NOT NULL,
  `n_proposta` int(11) DEFAULT NULL,
  `vigencia_ini` date DEFAULT NULL,
  `vigencia_final` date DEFAULT NULL,
  `observacao` text COLLATE utf8_bin DEFAULT NULL,
  `tbl_apolicePropostacol` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_seguradoras_id_seguradoras` int(11) DEFAULT NULL,
  `tbl_ramos_id_ramos` int(11) DEFAULT NULL,
  `tbl_produtor_id_produtor` int(11) DEFAULT NULL,
  `tbl_produtor_tbl_pessoas_id_pessoa` int(11) DEFAULT NULL,
  `tbl_premio_id_premio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_prospeccoes`
--

CREATE TABLE `tbl_prospeccoes` (
  `id_prospeccoes` int(11) NOT NULL,
  `vigencia_ini` date DEFAULT NULL,
  `vigencia_final` date DEFAULT NULL,
  `observacao` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `tbl_apoliceProposta_id_apoliceproposta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_provincia`
--

CREATE TABLE `tbl_provincia` (
  `id_tbl_provincia` int(11) NOT NULL,
  `nome_provincia` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_pais_id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_ramos`
--

CREATE TABLE `tbl_ramos` (
  `id_ramos` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_classificacao_id_classificacao` int(11) DEFAULT NULL,
  `tbl_seguradoras_id_seguradoras` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_seguradoras`
--

CREATE TABLE `tbl_seguradoras` (
  `id_seguradoras` int(11) NOT NULL,
  `razao` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `cnpj` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `diretor` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `gerente` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `homepage` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `observacao` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `tbl_endereco_id_endereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_segurados`
--

CREATE TABLE `tbl_segurados` (
  `id_seguradoras` int(11) NOT NULL,
  `nome` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `nif` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `observacoes` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `tbl_profissao_id_profissao` int(11) NOT NULL,
  `tbl_cargo_id_cargo` int(11) DEFAULT NULL,
  `tbl_pessoas_id_pessoa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_bin NOT NULL,
  `senha` varchar(256) COLLATE utf8_bin NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `desc_usuario` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tbl_funcionarios_id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_apolice`
--
ALTER TABLE `tbl_apolice`
  ADD PRIMARY KEY (`id_tbl_apolice`),
  ADD KEY `fk_tbl_apolice_tbl_Proposta1_idx` (`tbl_Proposta_id_apoliceproposta`);

--
-- Índices para tabela `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Índices para tabela `tbl_classificacao`
--
ALTER TABLE `tbl_classificacao`
  ADD PRIMARY KEY (`id_classificacao`);

--
-- Índices para tabela `tbl_cobertura`
--
ALTER TABLE `tbl_cobertura`
  ADD PRIMARY KEY (`id_cobertura`),
  ADD KEY `fk_tbl_cobertura_tbl_ramos1_idx` (`tbl_ramos_id_ramos`);

--
-- Índices para tabela `tbl_comissaocorretora`
--
ALTER TABLE `tbl_comissaocorretora`
  ADD PRIMARY KEY (`id_comissaoCorretora`),
  ADD KEY `fk_tbl_comissaoCorretora_tbl_apoliceProposta1_idx` (`tbl_apoliceProposta_id_apoliceproposta`);

--
-- Índices para tabela `tbl_condutores`
--
ALTER TABLE `tbl_condutores`
  ADD PRIMARY KEY (`id_condutor`);

--
-- Índices para tabela `tbl_condutores_itens`
--
ALTER TABLE `tbl_condutores_itens`
  ADD PRIMARY KEY (`id_tbl_condutores_itens`),
  ADD KEY `fk_tbl_condutores_has_tbl_itens_tbl_itens1_idx` (`tbl_itens_id_itens`),
  ADD KEY `fk_tbl_condutores_has_tbl_itens_tbl_condutores1_idx` (`tbl_condutores_id_condutor`);

--
-- Índices para tabela `tbl_corretora`
--
ALTER TABLE `tbl_corretora`
  ADD PRIMARY KEY (`id_corretora`),
  ADD KEY `fk_tbl_corretora_tbl_endereco1_idx` (`tbl_endereco_id_endereco`);

--
-- Índices para tabela `tbl_corretora_tbl_documentos`
--
ALTER TABLE `tbl_corretora_tbl_documentos`
  ADD PRIMARY KEY (`tbl_corretora_id_corretora`,`tbl_documentos_id_documentos`),
  ADD KEY `fk_tbl_corretora_has_tbl_documentos_tbl_documentos1_idx` (`tbl_documentos_id_documentos`),
  ADD KEY `fk_tbl_corretora_has_tbl_documentos_tbl_corretora1_idx` (`tbl_corretora_id_corretora`);

--
-- Índices para tabela `tbl_documentos`
--
ALTER TABLE `tbl_documentos`
  ADD PRIMARY KEY (`id_documentos`);

--
-- Índices para tabela `tbl_documentos_bl_seguradoras`
--
ALTER TABLE `tbl_documentos_bl_seguradoras`
  ADD PRIMARY KEY (`tbl_documentos_id_documentos`,`tbl_seguradoras_id_seguradoras`),
  ADD KEY `fk_tbl_documentos_has_tbl_seguradoras_tbl_seguradoras1_idx` (`tbl_seguradoras_id_seguradoras`),
  ADD KEY `fk_tbl_documentos_has_tbl_seguradoras_tbl_documentos1_idx` (`tbl_documentos_id_documentos`);

--
-- Índices para tabela `tbl_documentos_has_tbl_apoliceproposta`
--
ALTER TABLE `tbl_documentos_has_tbl_apoliceproposta`
  ADD PRIMARY KEY (`tbl_documentos_id_documentos`,`tbl_apoliceProposta_id_apoliceproposta`),
  ADD KEY `fk_tbl_documentos_has_tbl_apoliceProposta_tbl_apolicePropos_idx` (`tbl_apoliceProposta_id_apoliceproposta`),
  ADD KEY `fk_tbl_documentos_has_tbl_apoliceProposta_tbl_documentos1_idx` (`tbl_documentos_id_documentos`);

--
-- Índices para tabela `tbl_documentos_has_tbl_extratoseguro`
--
ALTER TABLE `tbl_documentos_has_tbl_extratoseguro`
  ADD PRIMARY KEY (`tbl_documentos_id_documentos`,`tbl_extratoSeguro_id_extratoSeguro`),
  ADD KEY `fk_tbl_documentos_has_tbl_extratoSeguro_tbl_extratoSeguro1_idx` (`tbl_extratoSeguro_id_extratoSeguro`),
  ADD KEY `fk_tbl_documentos_has_tbl_extratoSeguro_tbl_documentos1_idx` (`tbl_documentos_id_documentos`);

--
-- Índices para tabela `tbl_endereco`
--
ALTER TABLE `tbl_endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_tbl_endereco_tbl_provincia1_idx` (`tbl_provincia_id_tbl_provincia`);

--
-- Índices para tabela `tbl_extratoseguro`
--
ALTER TABLE `tbl_extratoseguro`
  ADD PRIMARY KEY (`id_extratoSeguro`),
  ADD KEY `fk_tbl_extratoSeguro_tbl_recebimento1_idx` (`tbl_recebimento_id_recebimento`);

--
-- Índices para tabela `tbl_funcionarios`
--
ALTER TABLE `tbl_funcionarios`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices para tabela `tbl_itens`
--
ALTER TABLE `tbl_itens`
  ADD PRIMARY KEY (`id_itens`),
  ADD KEY `fk_tbl_itens_tbl_apoliceProposta1_idx` (`tbl_apoliceProposta_id_apoliceproposta`);

--
-- Índices para tabela `tbl_pagamento`
--
ALTER TABLE `tbl_pagamento`
  ADD PRIMARY KEY (`id_recebimento`),
  ADD KEY `fk_tbl_recebimento_tbl_apoliceProposta1_idx` (`tbl_apoliceProposta_id_apoliceproposta`),
  ADD KEY `fk_tbl_pagamento_tbl_parcelas1_idx` (`tbl_parcelas_id_tbl_parcelas`);

--
-- Índices para tabela `tbl_pais`
--
ALTER TABLE `tbl_pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Índices para tabela `tbl_parcelas`
--
ALTER TABLE `tbl_parcelas`
  ADD PRIMARY KEY (`id_tbl_parcelas`),
  ADD KEY `fk_tbl_parcelas_tbl_comissaoCorretora1_idx` (`tbl_comissaoCorretora_id_comissaoCorretora`);

--
-- Índices para tabela `tbl_pessoas`
--
ALTER TABLE `tbl_pessoas`
  ADD PRIMARY KEY (`id_pessoa`);

--
-- Índices para tabela `tbl_profissao`
--
ALTER TABLE `tbl_profissao`
  ADD PRIMARY KEY (`id_profissao`);

--
-- Índices para tabela `tbl_proposta`
--
ALTER TABLE `tbl_proposta`
  ADD PRIMARY KEY (`id_apoliceproposta`),
  ADD KEY `fk_tbl_apoliceProposta_tbl_seguradoras1_idx` (`tbl_seguradoras_id_seguradoras`),
  ADD KEY `fk_tbl_apoliceProposta_tbl_ramos1_idx` (`tbl_ramos_id_ramos`);

--
-- Índices para tabela `tbl_prospeccoes`
--
ALTER TABLE `tbl_prospeccoes`
  ADD PRIMARY KEY (`id_prospeccoes`),
  ADD KEY `fk_tbl_prospeccoes_tbl_apoliceProposta1_idx` (`tbl_apoliceProposta_id_apoliceproposta`);

--
-- Índices para tabela `tbl_provincia`
--
ALTER TABLE `tbl_provincia`
  ADD PRIMARY KEY (`id_tbl_provincia`),
  ADD KEY `fk_tbl_provincia_tbl_pais1_idx` (`tbl_pais_id_pais`);

--
-- Índices para tabela `tbl_ramos`
--
ALTER TABLE `tbl_ramos`
  ADD PRIMARY KEY (`id_ramos`),
  ADD KEY `fk_tbl_ramos_tbl_classificacao1_idx` (`tbl_classificacao_id_classificacao`),
  ADD KEY `fk_tbl_ramos_tbl_seguradoras1_idx` (`tbl_seguradoras_id_seguradoras`);

--
-- Índices para tabela `tbl_seguradoras`
--
ALTER TABLE `tbl_seguradoras`
  ADD PRIMARY KEY (`id_seguradoras`),
  ADD KEY `fk_tbl_seguradoras_tbl_endereco1_idx` (`tbl_endereco_id_endereco`);

--
-- Índices para tabela `tbl_segurados`
--
ALTER TABLE `tbl_segurados`
  ADD PRIMARY KEY (`id_seguradoras`,`tbl_profissao_id_profissao`),
  ADD KEY `fk_tbl_segurados_tbl_profissao1_idx` (`tbl_profissao_id_profissao`),
  ADD KEY `fk_tbl_segurados_tbl_cargo1_idx` (`tbl_cargo_id_cargo`),
  ADD KEY `fk_tbl_segurados_tbl_pessoas1_idx` (`tbl_pessoas_id_pessoa`);

--
-- Índices para tabela `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_tbl_usuario_tbl_funcionarios1_idx` (`tbl_funcionarios_id_funcionario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_condutores_itens`
--
ALTER TABLE `tbl_condutores_itens`
  MODIFY `id_tbl_condutores_itens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_provincia`
--
ALTER TABLE `tbl_provincia`
  MODIFY `id_tbl_provincia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbl_apolice`
--
ALTER TABLE `tbl_apolice`
  ADD CONSTRAINT `fk_tbl_apolice_tbl_Proposta1` FOREIGN KEY (`tbl_Proposta_id_apoliceproposta`) REFERENCES `tbl_proposta` (`id_apoliceproposta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cobertura`
--
ALTER TABLE `tbl_cobertura`
  ADD CONSTRAINT `fk_tbl_cobertura_tbl_ramos1` FOREIGN KEY (`tbl_ramos_id_ramos`) REFERENCES `tbl_ramos` (`id_ramos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_comissaocorretora`
--
ALTER TABLE `tbl_comissaocorretora`
  ADD CONSTRAINT `fk_tbl_comissaoCorretora_tbl_apoliceProposta1` FOREIGN KEY (`tbl_apoliceProposta_id_apoliceproposta`) REFERENCES `tbl_proposta` (`id_apoliceproposta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_condutores_itens`
--
ALTER TABLE `tbl_condutores_itens`
  ADD CONSTRAINT `fk_tbl_condutores_has_tbl_itens_tbl_condutores1` FOREIGN KEY (`tbl_condutores_id_condutor`) REFERENCES `tbl_condutores` (`id_condutor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_condutores_has_tbl_itens_tbl_itens1` FOREIGN KEY (`tbl_itens_id_itens`) REFERENCES `tbl_itens` (`id_itens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_corretora`
--
ALTER TABLE `tbl_corretora`
  ADD CONSTRAINT `fk_tbl_corretora_tbl_endereco1` FOREIGN KEY (`tbl_endereco_id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_corretora_tbl_documentos`
--
ALTER TABLE `tbl_corretora_tbl_documentos`
  ADD CONSTRAINT `fk_tbl_corretora_has_tbl_documentos_tbl_corretora1` FOREIGN KEY (`tbl_corretora_id_corretora`) REFERENCES `tbl_corretora` (`id_corretora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_corretora_has_tbl_documentos_tbl_documentos1` FOREIGN KEY (`tbl_documentos_id_documentos`) REFERENCES `tbl_documentos` (`id_documentos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_documentos_bl_seguradoras`
--
ALTER TABLE `tbl_documentos_bl_seguradoras`
  ADD CONSTRAINT `fk_tbl_documentos_has_tbl_seguradoras_tbl_documentos1` FOREIGN KEY (`tbl_documentos_id_documentos`) REFERENCES `tbl_documentos` (`id_documentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_documentos_has_tbl_seguradoras_tbl_seguradoras1` FOREIGN KEY (`tbl_seguradoras_id_seguradoras`) REFERENCES `tbl_seguradoras` (`id_seguradoras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_documentos_has_tbl_apoliceproposta`
--
ALTER TABLE `tbl_documentos_has_tbl_apoliceproposta`
  ADD CONSTRAINT `fk_tbl_documentos_has_tbl_apoliceProposta_tbl_apoliceProposta1` FOREIGN KEY (`tbl_apoliceProposta_id_apoliceproposta`) REFERENCES `tbl_proposta` (`id_apoliceproposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_documentos_has_tbl_apoliceProposta_tbl_documentos1` FOREIGN KEY (`tbl_documentos_id_documentos`) REFERENCES `tbl_documentos` (`id_documentos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_documentos_has_tbl_extratoseguro`
--
ALTER TABLE `tbl_documentos_has_tbl_extratoseguro`
  ADD CONSTRAINT `fk_tbl_documentos_has_tbl_extratoSeguro_tbl_documentos1` FOREIGN KEY (`tbl_documentos_id_documentos`) REFERENCES `tbl_documentos` (`id_documentos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_documentos_has_tbl_extratoSeguro_tbl_extratoSeguro1` FOREIGN KEY (`tbl_extratoSeguro_id_extratoSeguro`) REFERENCES `tbl_extratoseguro` (`id_extratoSeguro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_endereco`
--
ALTER TABLE `tbl_endereco`
  ADD CONSTRAINT `fk_tbl_endereco_tbl_provincia1` FOREIGN KEY (`tbl_provincia_id_tbl_provincia`) REFERENCES `tbl_provincia` (`id_tbl_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_extratoseguro`
--
ALTER TABLE `tbl_extratoseguro`
  ADD CONSTRAINT `fk_tbl_extratoSeguro_tbl_recebimento1` FOREIGN KEY (`tbl_recebimento_id_recebimento`) REFERENCES `tbl_pagamento` (`id_recebimento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_itens`
--
ALTER TABLE `tbl_itens`
  ADD CONSTRAINT `fk_tbl_itens_tbl_apoliceProposta1` FOREIGN KEY (`tbl_apoliceProposta_id_apoliceproposta`) REFERENCES `tbl_proposta` (`id_apoliceproposta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_pagamento`
--
ALTER TABLE `tbl_pagamento`
  ADD CONSTRAINT `fk_tbl_pagamento_tbl_parcelas1` FOREIGN KEY (`tbl_parcelas_id_tbl_parcelas`) REFERENCES `tbl_parcelas` (`id_tbl_parcelas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_recebimento_tbl_apoliceProposta1` FOREIGN KEY (`tbl_apoliceProposta_id_apoliceproposta`) REFERENCES `tbl_proposta` (`id_apoliceproposta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_parcelas`
--
ALTER TABLE `tbl_parcelas`
  ADD CONSTRAINT `fk_tbl_parcelas_tbl_comissaoCorretora1` FOREIGN KEY (`tbl_comissaoCorretora_id_comissaoCorretora`) REFERENCES `tbl_comissaocorretora` (`id_comissaoCorretora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_proposta`
--
ALTER TABLE `tbl_proposta`
  ADD CONSTRAINT `fk_tbl_apoliceProposta_tbl_ramos1` FOREIGN KEY (`tbl_ramos_id_ramos`) REFERENCES `tbl_ramos` (`id_ramos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_apoliceProposta_tbl_seguradoras1` FOREIGN KEY (`tbl_seguradoras_id_seguradoras`) REFERENCES `tbl_seguradoras` (`id_seguradoras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_prospeccoes`
--
ALTER TABLE `tbl_prospeccoes`
  ADD CONSTRAINT `fk_tbl_prospeccoes_tbl_apoliceProposta1` FOREIGN KEY (`tbl_apoliceProposta_id_apoliceproposta`) REFERENCES `tbl_proposta` (`id_apoliceproposta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_provincia`
--
ALTER TABLE `tbl_provincia`
  ADD CONSTRAINT `fk_tbl_provincia_tbl_pais1` FOREIGN KEY (`tbl_pais_id_pais`) REFERENCES `tbl_pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_ramos`
--
ALTER TABLE `tbl_ramos`
  ADD CONSTRAINT `fk_tbl_ramos_tbl_classificacao1` FOREIGN KEY (`tbl_classificacao_id_classificacao`) REFERENCES `tbl_classificacao` (`id_classificacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ramos_tbl_seguradoras1` FOREIGN KEY (`tbl_seguradoras_id_seguradoras`) REFERENCES `tbl_seguradoras` (`id_seguradoras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_seguradoras`
--
ALTER TABLE `tbl_seguradoras`
  ADD CONSTRAINT `fk_tbl_seguradoras_tbl_endereco1` FOREIGN KEY (`tbl_endereco_id_endereco`) REFERENCES `tbl_endereco` (`id_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_segurados`
--
ALTER TABLE `tbl_segurados`
  ADD CONSTRAINT `fk_tbl_segurados_tbl_cargo1` FOREIGN KEY (`tbl_cargo_id_cargo`) REFERENCES `tbl_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_segurados_tbl_pessoas1` FOREIGN KEY (`tbl_pessoas_id_pessoa`) REFERENCES `tbl_pessoas` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_segurados_tbl_profissao1` FOREIGN KEY (`tbl_profissao_id_profissao`) REFERENCES `tbl_profissao` (`id_profissao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `fk_tbl_usuario_tbl_funcionarios1` FOREIGN KEY (`tbl_funcionarios_id_funcionario`) REFERENCES `tbl_funcionarios` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
