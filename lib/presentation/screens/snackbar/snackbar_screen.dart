import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'ok', onPressed: () {}),
      duration: const Duration( seconds: 2 ),
    );

    ScaffoldMessenger.of(context).showSnackBar( snackbar );
  }

  void openDialog( BuildContext context ) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas Seguro'),
        content: const Text('Proident occaecat Lorem officia excepteur laboris sunt dolor laborum nostrud. Eu consectetur est nulla duis. Eiusmod officia nisi incididunt elit ex elit nostrud esse laboris adipisicing. Proident minim amet culpa reprehenderit aute aliquip do ipsum voluptate.'),
      actions: [
        TextButton(onPressed: () => context.pop() , child: const Text('Cancelar')),
        
        FilledButton(onPressed: () => context.pop() , child: const Text('Aceptar')),
      ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Duis incididunt culpa incididunt incididunt eu. Eiusmod eu voluptate nisi minim amet nostrud mollit commodo duis tempor cupidatat. Ullamco non exercitation reprehenderit ut duis elit qui mollit. Commodo dolore exercitation Lorem et. Amet amet dolore consequat eu magna quis quis magna ad ex voluptate. Minim aute aute proident elit sunt proident velit in do tempor nostrud do.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo de pantalla')
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () =>  showCustomSnackbar( context ), 
      ),
    );
  }
}