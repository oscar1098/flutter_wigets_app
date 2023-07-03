import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollSreen extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScrollSreen({super.key});

  @override
  State<InfiniteScrollSreen> createState() => _InfiniteScrollSreenState();
}

class _InfiniteScrollSreenState extends State<InfiniteScrollSreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;


  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent  ){

        loadNextPage();
      }
    });


  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage () async {
    
    if ( isLoading ) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration( seconds: 2 ));
    addFiveImages();
    isLoading = false;

    if ( !isMounted ) return;

    setState(() {});
 
    moveScrollToBottom();
  } 

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration( seconds: 3 ));
    if ( !isMounted ) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add( lastId + 1 );
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {

    if ( scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,  
      duration: const Duration( milliseconds: 300 ), 
      curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [ 1,2,3,4,5 ].map((e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: !isLoading ? const Icon(Icons.arrow_back_ios_new_outlined) : 
        SpinPerfect(
          infinite: true,
          child: FadeIn(child: const Icon(Icons.refresh_rounded))),
      ),
    );
  }
}