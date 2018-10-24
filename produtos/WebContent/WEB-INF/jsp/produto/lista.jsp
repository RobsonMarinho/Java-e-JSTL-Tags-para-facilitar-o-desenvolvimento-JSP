<%@page import="br.com.caelum.produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>

	<h1>Produtos</h1>
	<div id="mensagem"></div>
	<table width="100%">
		<tr>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
		</tr>

		<!-- usando jstl!!! Atribui cada item que existe no produtoList e atribue à variável 'p'  -->
		<c:forEach var="p" items="${produtoList}">

			<tr id="produto${p.id}">
				<!--Exibe id de produto  -->
				<td>${p.nome}</td>
				<!-- Exibe nome de produto -->
				<td>${p.preco}</td>
				<!--Exibe preco de produto  -->
				<td>${p.descricao}</td>
				<!-- Exibe descricao de produto -->
				<td>${p.dataInicioVenda.time}</td>
				<!-- Exibe a dataInicioVenda de produto -->

				<!--Cria status de usado(SIM ou NAO) do produto  -->
				<c:choose>

					<c:when test="${p.usado}">
						<td>Sim</td>
					</c:when>

					<c:otherwise>
						<td>Não</td>
					</c:otherwise>
				</c:choose>

				<td><a href="#" onclick="return removeProduto(${p.id})">Remover</a></td>
			</tr>

		</c:forEach>
	</table>
	<a href="/produtos/produto/formulario">Adicionar um produto</a>
</body>
</html>