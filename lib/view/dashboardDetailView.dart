import 'package:blood_donation/model/publish_event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/my_color.dart';
import '../model/publish_post_model.dart';
import '../widgets/texts/my_text.dart';

class DashboardDetailView extends StatelessWidget {
  const DashboardDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    PublishPostModel data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: MyText(
            text: "Detail",
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           data.image_url !=
                                          ""
                                      ? CachedNetworkImage(
                                        height: height * 0.5,
                                          imageUrl: data
                                                  .image_url ??
                                              "",
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator()
                                                  .centered(), // Placeholder widget while loading
                                          errorWidget: (context, url,
                                                  error) =>
                                              const Icon(Icons.error)
                                                  .centered(), // Widget to display on error

                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // Other CachedNetworkImage properties...
                                        )
                                      : Image.asset("images/google_add.png"),
            MyText(
                                          text: 
                                                  data.category
                                                  ?.toUpperCase() ??
                                              "",
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: MyColor.blue1))
                                      .pOnly(left: 10, right: 10, top: 8),
                                  ( data.title ?? "")
                                      .text
                                      .bold
                                      .make()
                                      .pOnly(left: 10, right: 10, top: 8),
                                   Html(data: data.content),
          ],
        ).p8().p12(),
      ),
    );
  }
}


class DashboardEventsDetailView extends StatelessWidget {
  const DashboardEventsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    PublishEvent data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: MyText(
            text: "Detail",
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           data.image_url !=
                   ""
               ? CachedNetworkImage(
                height: height * 0.5,
                   imageUrl: data
                           .image_url ??
                       "",
                   placeholder: (context, url) =>
                       const CircularProgressIndicator()
                           .centered(), // Placeholder widget while loading
                   errorWidget: (context, url,
                           error) =>
                       const Icon(Icons.error)
                           .centered(), // Widget to display on error

                   imageBuilder:
                       (context, imageProvider) =>
                           Container(
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: imageProvider,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                   // Other CachedNetworkImage properties...
                 )
               : Image.asset("images/google_add.png"),
            MyText(
                                          text: 
                                                  data.event_name
                                                  ?.toUpperCase() ??
                                              "",
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              color: MyColor.blue1))
                                      .pOnly(left: 10, right: 10, top: 8),
                                  ( data.address ?? "")
                                      .text
                                      .bold
                                      .make()
                                      .pOnly(left: 10, right: 10, top: 8),
                                Html(data: data.content),
          ],
        ).p8().p12(),
      ),
    );
  }
}


// Html(
//                                                           data: _controller
//                                                               .searchText[index]
//                                                               .textList[
//                                                                   position]
//                                                               .searchText
//                                                               .replaceAll(
//                                                                   _controller
//                                                                       .searchVal
//                                                                       .value,
//                                                                   "<font color='red'>" +
//                                                                       _controller
//                                                                           .searchVal
//                                                                           .value +
//                                                                       "</font>"),
//                                                           style: {
//                                                             "body": Style(
//                                                               maxLines: 3,
//                                                               direction:
//                                                                   TextDirection
//                                                                       .rtl,
//                                                               color: _controller
//                                                                       .headingI
//                                                                       .hasData(
//                                                                           "color")
//                                                                   ? Color(_controller
//                                                                       .headingI
//                                                                       .read(
//                                                                           "color"))
//                                                                   : Colors
//                                                                       .black,
//                                                               textOverflow:
//                                                                   TextOverflow
//                                                                       .ellipsis,
//                                                               fontFamily:
//                                                                   'Mehr',
//                                                               fontSize: FontSize(_controller
//                                                                       .headingI
//                                                                       .hasData(
//                                                                           "fontSize")
//                                                                   ? _controller
//                                                                       .headingI
//                                                                       .read(
//                                                                           "fontSize")
//                                                                   : 20),
//                                                             ),
//                                                           },
//                                                         ).marginAll(12),
//                                                       );
