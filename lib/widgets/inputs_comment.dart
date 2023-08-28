import 'package:flutter/material.dart';
import 'package:practica_3_julio/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class InputComment extends StatefulWidget {
  final int id;
  const InputComment({super.key, required this.id});

  @override
  State<InputComment> createState() => _InputCommentState();
}

class _InputCommentState extends State<InputComment> {
  final _formKey = GlobalKey<FormState>(); //clase para id el widget unico
  final _myController = TextEditingController();

late FocusNode _textFocus;
  _printText() {
    //imoput cambie entonces se puede ver lo q se ha cambiado
    print('el texto del inpout : ${_myController.text}');
  }

  @override
  void initState() {
    _myController.addListener(_printText);
    _textFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                //suffixIcon: Icon(Icons.close),
                  hintText: 'Ingrese un comentario', 
                  labelText: 'Comentario',
                  ),
              validator: (value) {
                if ((value == null || value.isEmpty)) {
                  return "el comentario es ";
                }
                return null;
              },
              controller: _myController,
              focusNode: _textFocus,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('agregando comentario'),
                      ));
                    print('el valor del comentario es:${widget.id}: ${_myController.text}'); // esto es para que el usuario si o si ponga texto si no pasa a la linea 41
                  Provider.of<PokemonProvider>(context, listen: false).addCommentToPokemonDoc(widget.id, 
                  _myController.text);
                  _myController.text = '';
                  
                  }
                },
              child: const Text("submit"),
              
              ),
               OutlinedButton(
                onPressed: (){
              _textFocus.requestFocus();                
               }  ,
               child: const Text('set focus'),
              )
            ],
          )
        ],
      ),
    );
  }
}
