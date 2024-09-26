import 'package:flutter/material.dart';
import 'package:store_app/screens/base.dart';
import 'package:store_app/services/model.dart';

class Description extends StatefulWidget {
  final Product product; // تأكد أن المتغير معرف كـ final
  const Description({super.key, required this.product});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product; // الوصول إلى بيانات المنتج
    final title = product.title; // عنوان المنتج
    final description = product.description; // وصف المنتج

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double responsiveHeight = constraints.maxHeight;
            double responsiveWidth = constraints.maxWidth;

            return Column(
              children: [
                SizedBox(
                  height: responsiveHeight * 0.6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Base()));
                                },
                                icon: const Icon(Icons.arrow_back)),
                            const Icon(
                              Icons.favorite_border,
                              size: 30,
                            ),
                            const ImageIcon(
                              AssetImage(
                                  "images/adobe-creative-cloud-svgrepo-com.png"),
                              size: 60,
                              color: Color.fromARGB(255, 81, 189, 195),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 100.0, bottom: 10.0),
                        // استخدام صورة من المنتج
                        child: Image.asset(
                          "images/adobe-creative-cloud-svgrepo-com.png", // عرض الصورة التي تأتي من الـ API
                          height: 200,
                          width: 300,
                        ),
                      ),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    height: responsiveHeight * 0.4,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.amber,
                              height: responsiveHeight * 0.19,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: responsiveHeight * 0.03,
                                        right: 8.0,
                                        left: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          title, // استخدام عنوان المنتج
                                          style: const TextStyle(
                                            fontFamily: "arabic",
                                            fontSize: 30,
                                            color: Color.fromARGB(
                                                255, 71, 171, 176),
                                          ),
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              "(5)",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 40,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      product.description,
                                      style: const TextStyle(
                                          fontFamily: "arabic",
                                          fontSize: 18,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "الاحجام :", // استخدام وصف المنتج
                                      style: TextStyle(
                                          fontFamily: "arabic",
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 160, 160, 160)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: responsiveHeight * 0.1,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.add_shopping_cart,
                                      size: 40,
                                    ),
                                    Text(
                                      "${product.price}\$ ",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontFamily: "arabic",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
