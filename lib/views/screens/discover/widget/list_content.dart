
import 'package:flutter/material.dart';
import 'package:sportify/constants/app_colors.dart';

import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_images.dart';

class ListViewContent extends StatelessWidget {
  const ListViewContent({
    Key? key,
    this.type,
    required this.image,
    required this.name,
    required this.sports,
    required this.rating,
  }) : super(key: key);

  final String? type;
  final String image;
  final String name;
  final String sports;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8,left: 8,right: 8),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(119, 138, 150, 159),
              blurRadius: 7.0,
              spreadRadius: 1.0,
              offset: Offset(
                1.0,
                1.5,
              ),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  Image.asset(
                        image,
                        height: 150,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
              ),
              const Positioned(
                right: 5,
                top: 5,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.coloredHeading.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    sports,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.hintStyle.copyWith(fontSize: 11),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.star,
                        color: Pallete.kPrimaryColor,
                        height: 8,
                        width: 8,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        rating,
                        overflow: TextOverflow.fade,
                        style: AppFonts.hintStyle.copyWith(fontSize: 11),
                      ),
                      SizedBox(height: 8,)
                    ],
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
