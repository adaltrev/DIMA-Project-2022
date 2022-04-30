import '../model/serie.dart';
import 'package:dima_project/model/categories.dart';
import 'package:dima_project/widgets/adder_bar.dart';
import 'package:dima_project/widgets/season_grid.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SeasonsPages extends StatefulWidget {
  final Serie serie;

  const SeasonsPages(this.serie, {Key? key}) : super(key: key);

  @override
  State<SeasonsPages> createState() => _SeasonsPagesState();
}

class _SeasonsPagesState extends State<SeasonsPages> {
  int selectedCard = 0;
  final int seasonsPerPage = 8;
  //I use this to higligth the season that I'm currently watching when opening the app
  bool firstBuild = true;
  int currentPage = 0;
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.jumpToPage(currentPage);
    });
  }

  getTotalPages() {
    int totalSeasons = widget.serie.seasons.length;
    num totalPages = totalSeasons % seasonsPerPage == 0
        ? totalSeasons / seasonsPerPage
        : (totalSeasons / seasonsPerPage).floor() + 1;
    var resultList = [];
    for (int i = 0; i < totalPages; i++) {
      resultList.add(i);
    }
    return resultList;
  }

  int getPageToShowIndex(int selectedCard) {
    return (selectedCard / seasonsPerPage).floor();
  }

  updateSelectedCard(int newSelectedCardIndex) {
    setState(() {
      selectedCard = newSelectedCardIndex;
    });
  }

  addEpisode(Serie serie, int quantity) {
    setState(() {
      selectedCard = serie.addEpisodes(selectedCard, quantity);
    });

    if (controller.page! > getPageToShowIndex(selectedCard)) {
      controller.previousPage(
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    } else if (controller.page! < getPageToShowIndex(selectedCard)) {
      controller.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (firstBuild) {
      updateSelectedCard(widget.serie.currentlyWatchingSeason());
      currentPage = getPageToShowIndex(selectedCard);
      firstBuild = false;
    }
    return Column(
      children: [
        const Text("Seasons"),
        SizedBox(
          //if I have one row in the SeasonsGrid occupy only half of the space
          height: widget.serie.seasons.length > 4 ? 37.h : 19.h,
          width: 100.w,
          child: PageView(
              controller: controller,
              onPageChanged: (newPage) {
                setState(() {
                  currentPage = newPage;
                });
              },
              children: [
                ...widget.serie
                    .seasonsSublisted(seasonsPerPage)
                    .map((seasonsSublist) {
                  return Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: SeasonGrid(
                        seasonsSublist, updateSelectedCard, selectedCard),
                  );
                }),
              ]),
        ),
        if (getTotalPages().length > 1)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ...getTotalPages().map((page) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.8.w),
                child: Icon(
                  Icons.circle,
                  size: 2.w,
                  color: page == currentPage ? Colors.white : Colors.grey,
                ),
              );
            }),
          ]),

        //if I'm searching the series hide the tools to update watching episodes
        if (widget.serie.category != Categories.searched) ...[
          AdderBar(widget.serie, addEpisode, selectedCard),
          SizedBox(
            height: 5.h,
          )
        ]
      ],
    );
  }
}
