app.controller('pedidoController',['$scope', '$http', function($scope, $http){
	
	var self = this;
	self.salvo = false;
	
	self.produtoService = new ProdutoService();
	
	self.produtosDisponiveis = []; //= JSON.parse(JSON.stringify(self.produtos));
	
	self.produtosAdicionados = [];
	
	self.addProduto = function(produto) {
		var i = self.produtosDisponiveis.indexOf(produto);
		self.produtosAdicionados.push(produto);
		if(i != -1){
			self.produtosDisponiveis.splice(i,1);
		}
	};

	self.rmvProduto = function(produto) {
		console.log(produto.quantidade);
		var i = self.produtosAdicionados.indexOf(produto);
		self.produtosDisponiveis.push(produto);
		if(i != -1){
			self.produtosAdicionados.splice(i,1);
		}
	};
	
	self.addPedido = function(){
		$('form[name="formAddPedido"] input').attr('disabled', true);
		$('form[name="formAddPedido"] button').attr('disabled', true);
	};
	
	self.addList = function(){
//		var json = JSON.stringify( self.produtosAdicionados, function( key, value ) {
//		    if( key === "$$hashKey" ) {
//		        return undefined;
//		    }
//		    return value;
//		});
		self.pedido.produto = self.produtosAdicionados;
		console.log(angular.toJson(self.pedido));
		$.get("/estoquemary/pedido/addPedido?teste=" + angular.toJson(self.pedido))
//		$.ajax({url: "/estoquemary/pedido/addPedido",
//	          type: 'POST',
//	          data: angular.toJson(self.pedido),
//	   contentType: 'application/json; charset=utf-8',
//	      dataType: 'json'})
		.success(function(data){
			alert(data);
			
		});		
	}

}]);