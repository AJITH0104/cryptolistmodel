import 'package:cryptolist/coincontroller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
class Homescreen extends StatelessWidget {


  final coincontroller control=Get.put(coincontroller());

  @override
  Widget build(BuildContext context) {
    TextStyle infostyle=GoogleFonts.playfairDisplay(
      fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.white,
    );
    return Scaffold(

      backgroundColor: Colors.black45,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),

          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CRYPTO list',style:GoogleFonts.ptSans(
                fontStyle: FontStyle.italic,color: Colors.white,fontSize: 40.0) ,),
                Obx(
                  ()=> control.isloading.value?const Center(child: CircularProgressIndicator(),):ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,id){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    SizedBox(height: 20.0,),
                                    Container(
                                      width: 60.0,height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,borderRadius: BorderRadius.circular(15.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[700]!,
                                            offset: const Offset(4, 4),
                                          blurRadius: 5,
                                          ),
                                        ],

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(control.coinslist[id].image
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0,),
                                    Container(

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(control.coinslist[id].name,style: infostyle ,),
                                          Text('Rs${control.coinslist[id].priceChangePercentage24H.toStringAsFixed(2)} %',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 18.0),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.0,),

                                Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Rs${control.coinslist[id].currentPrice.round()} %',style: infostyle ,),
                                      Text(control.coinslist[id].symbol.toUpperCase(),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 18.0),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
