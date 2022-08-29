import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Boissons extends StatefulWidget {
  const Boissons({ Key? key }) : super(key: key);

  @override
  State<Boissons> createState() => _BoissonsState();
}

dynamic BoissonsList;


class _BoissonsState extends State<Boissons> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Query(
          options: QueryOptions(
            document: gql(Boissons),
            fetchPolicy: FetchPolicy.cacheAndNetwork,
          ),
          builder: (QueryResult result, {refetch, fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            BoissonsList = result.data?['mealsByType'];
            //print(PlatsList);
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: BoissonsList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(18),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 335,
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxHeight: 140),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${BoissonsList[index]['photo']}'),
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 10, 6, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  BoissonsList[index]['title'],
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  BoissonsList[index]['price'].toString() + "dt",
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 0, 141, 54),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      BoissonsList[index]['description'],
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Mutation(
                                    options: MutationOptions(
                                      document: gql(addToCart),
                                      //  update: (Cache cache, QueryResult result) {
                                      //   return cache;
                                      //   },
                                      onCompleted: (dynamic resultData) {
                                        print(resultData);
                                      },
                                    ),
                                    builder: (runMutation, result
                                        // RunMutation runMutation,
                                        // QueryResult? result,
                                        ) {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 0, 10),
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    90, 60, 170, 54),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: IconButton(
                                              icon: const Icon(
                                                  Icons.shopping_cart),
                                              color: const Color.fromRGBO(
                                                  60, 170, 54, 1),
                                              onPressed: () => {
                                                //print('${[index]}add to cart')
                                                runMutation(
                                                  {
                                                    'mealId': BoissonsList[index]['id'],

                                                  },
                                                ),
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  String Boissons = """
query{
  mealsByType(mealtype: Boissons) {
    id
    title
    description
    price
    photo
  }
}


""";

  String addToCart = """
mutation AddOrderItem() {
  addOrderItem(input : {mealId : \$mealId}) {
    id
    meal {
      id : mealId
    }
    order {
      id : orderId
    }
  }
}

""";
}
