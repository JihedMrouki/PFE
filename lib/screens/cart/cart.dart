import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

dynamic cartList;

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  right: 8,
                  child: SvgPicture.asset(
                    "assets/images/inscription.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            90, 60, 170, 54), // to be changed to right oppacity
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: const Color.fromRGBO(60, 170, 54, 1),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Mon panier",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Query(
          //   options: QueryOptions(
          //     document: gql(cartList),
          //     fetchPolicy: FetchPolicy.cacheAndNetwork,
          //   ),
          //   builder: (QueryResult result, {refetch, fetchMore}) {
          //     if (result.hasException) {
          //       return Text(result.exception.toString());
          //     }

          //     if (result.isLoading) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     cartList = result.data?['esm l query'];
          //     //print(PlatsList);
          //     return ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       physics: const ClampingScrollPhysics(),
          //       shrinkWrap: true,
          //       itemCount: cartList.length,
          //       itemBuilder: (_, index) {
          //         return Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: ListTile(
          //             shape: const RoundedRectangleBorder(
          //               borderRadius: BorderRadius.horizontal(
          //                 right: Radius.circular(15),
          //                 left: Radius.circular(15),
          //               ),
          //               side: BorderSide(
          //                 color: Colors.transparent,
          //               ),
          //             ),
          //             leading: CircleAvatar(
          //               radius: 15,
          //               backgroundImage:
          //                   NetworkImage('${cartList[index]['photo']}'),
          //             ),
          //             title: Text(cartList[index]['title']),
          //             subtitle: Text(
          //               cartList[index]['price'].toString() + "dt",
          //             ),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

//   String cartList = """
// query(esm l query){
//     id
//     title
//     description
//     price
//     photo
//   }

// """;

//   String cartmutation = """
// mutation

// """;

}
