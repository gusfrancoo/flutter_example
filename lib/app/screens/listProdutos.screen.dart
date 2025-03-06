import 'package:flutter/material.dart';
import 'package:flutter_faculdade/app/controllers/addProdutos_controller.dart';
import 'package:flutter_faculdade/app/controllers/listProdutos_controller.dart';
import 'package:flutter_faculdade/app/models/product_model.dart';
import 'package:flutter_faculdade/utils/widgets/global_scaffold.dart';
import 'package:get/get.dart';

class ListProdutosScreen extends StatelessWidget {
  
  ListProdutosScreen({super.key});

  // final ListprodutosController controller =
  //     Get.find<ListprodutosController>(); //Finalizar depois criando lógica para buscar itens da visualização

  final AddProdutosController controller = Get.find<AddProdutosController>();


  @override
  Widget build(BuildContext context) {
    return 
    Obx(() {
      return 
        Column(
          children: [
            controller.products.isNotEmpty ?
              Expanded(
                child: ListView.builder(
                  itemCount: controller.products.length,
                  
                  itemBuilder: (context, index) {
                  final product = controller.products[index];
                  
                    return Card(
                      color: Colors.white,
                      shadowColor: Colors.black,
                      
                      child: ListTile(
                          leading: 
                            product.imageUrl.isNotEmpty ? 
                            Image.network(
                              product.imageUrl,
                              width: 50, 
                              height: 50, 
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                                return const CircularProgressIndicator();
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            )
                            : Container(),
                          onTap: () {
                            Get.to(ProductDetailsScreen(product: product));
                          },
                          
                          title: Text(
                            product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(
                            "R\$ ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                controller.products.removeAt(index),
                          ),
                        ),
                    );
                    },
                ),
              ) 
            : 
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.not_interested),
                      Text(
                        'Ainda não há produtos',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                )
              ),
          ],
        );
    },);
  }
}
class ProductDetailsScreen extends StatelessWidget {
  final Product product; // Substitua 'dynamic' pelo tipo adequado, se houver

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product.imageUrl.isNotEmpty
                  ? Center(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const CircularProgressIndicator();
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    )
                  : Container(),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Preço: R\$ ${product.price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                "Descrição: ${product.description ?? 'Sem descrição'}",
                style: const TextStyle(fontSize: 16),
              ),
              // Adicione mais informações do produto conforme necessário
            ],
          ),
        ),
      ),
    );
  }
}
