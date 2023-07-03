import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo> [
  SlideInfo('Busca la comida', 'Laboris sunt aliquip sint id nisi ex voluptate aliqua pariatur sit ut anim aliquip voluptate.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Ex cupidatat cillum voluptate id eu adipisicing ex veniam et ex commodo voluptate sit.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Nulla sunt veniam esse aute.', 'assets/images/3.png')

];



class AppTutorialScreen extends StatefulWidget {

  static const name = 'App tutorial screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewControler = PageController(); 
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewControler.addListener(() { 

      final page = pageViewControler.page ?? 0;

      if ( !endReached && page >= (slides.length - 1.5 ) ){
        setState(() {
          endReached = true;
        });
      }
     });
  }

  @override
  void dispose() {
    pageViewControler.dispose();
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewControler,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop() , 
              child: const Text('Salir')
              )
            ),
          
          endReached ?
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration( seconds: 1 ),
                child: FilledButton(
                  onPressed: () =>  context.pop(), 
                  child: const Text('Comenzar')
                ),
              )
            ): const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox( height: 20 ),
            Text(title, style: titleStyle),
            const SizedBox( height: 20 ),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}