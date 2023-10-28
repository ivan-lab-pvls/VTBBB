import 'package:banking_app/dataSet/data.dart';
import 'package:banking_app/presentation/screens/all_news_page.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final PageController controller;
  const NewsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.sizeOf(context).height * .035,
      ),
      itemCount: Constants.dailynews.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllNewsPage(
                  controller: controller,
                  indexOfNews: index,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      Constants.dailynews[index].title.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    Text(
                      Constants.dailynews[index].desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 81, 80, 80)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * .05),
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("${Constants.dailynews[index].img}", fit: BoxFit.cover,),),
                width: MediaQuery.sizeOf(context).width * .28,
                height: MediaQuery.sizeOf(context).height * .11,
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewsListNoOnPressed extends StatelessWidget {
  final PageController controller;
  const NewsListNoOnPressed({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: MediaQuery.sizeOf(context).height * .035,
      ),
      itemCount: Constants.dailynews.length - 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllNewsPage(
                  controller: controller,
                  indexOfNews: index,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      Constants.dailynews[index].title.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    Text(
                      Constants.dailynews[index].desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 81, 80, 80)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * .05),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${Constants.dailynews[index].img}",
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.sizeOf(context).width * .28,
                height: MediaQuery.sizeOf(context).height * .11,
              ),
            ],
          ),
        );
      },
    );
  }
}
