import 'package:flutter/material.dart';
import 'package:flutter_faculdade/app/controllers/addProdutos_controller.dart';
import 'package:get/get.dart';

class AddprodutosScreen extends StatelessWidget {

  AddprodutosScreen({super.key});

  final AddProdutosController controller = Get.find<AddProdutosController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: controller.nomeProd,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green.shade100)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                      labelText: 'Nome Produto',
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: controller.price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green.shade100)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                      labelText: 'Preço',
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextField(
                    controller: controller.desc,
                    
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green.shade100)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                      labelText: 'Decrição',
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  
                  child: TextField(
                    controller: controller.urlImg,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green.shade100)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                      labelText: 'Url Imagem',
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.addProducts();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade800, // Cor do botão
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Borda arredondada
                          ),
                          elevation: 5, // Sombra para efeito 3D
                        ),
                        child: Text(
                          'Adicionar Produto',
                          style: const TextStyle(
                            color: Colors.white, // Cor do texto
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        )
      ],
    );
  }
  
}