<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<div class="container" ng-controller="pedidoViewController as ctrl">
	<span ng-init='ctrl.pedidos = ${pedido}'></span>
<%-- 	<span ng-init='ctrl.produtos = ${produtos}'></span> --%>
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color:#E7E3E2;color:black;"><!-- #CCA498 -->
			<h2 style="text-align:center;">Veja os <span style="color:#CCA498;">Pedidos</span></h2>
		</div>
		<div class="panel-body">
			<div class="tbResponsive miniTdv table-responsive">
				<input class="form-control input-md" ng-model="ctrl.filtro"/>
				<table id="tbItensColeta" class="miniTdv table table-hover table-bordered table-condensed table-striped table-hover">
					<thead>
						<tr>
							<th>Código do Pedido</th>
							<th>Data de Entrega</th>
							<th>Valor Pago</th>
							<th class="colTarefas text-center"><i class="glyphicon glyphicon-tasks"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="pedido in ctrl.pedidos| filter: ctrl.filtro">
							<td>{{pedido.codPedido}}</td>
							<td>{{pedido.dtEntrega}}</td>
							<td>{{pedido.valorPago}}</td>
							<td>
								<a href="/estoquemary/pedido/listPedido/{{pedido.codPedido}}"><i class="glyphicon glyphicon-eye-open"></i></a>
								<a ng-click="ctrl.rmvPedido(pedido)"><i class="glyphicon glyphicon-minus"></i></a>
							</td> 
			            </tr>
					</tbody>
				</table>
			</div>
			<a href="/estoquemary/pedido/newPedido" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-plus"> Novo Pedido</i></a>
		</div>
	</div>
</div>