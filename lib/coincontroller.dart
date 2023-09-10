import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'coinmodel.dart';

class coincontroller extends GetxController{
 RxList<Coin> coinslist=<Coin>[].obs;
 RxBool isloading=true.obs;

 void onInit(){
   super.onInit();
   fetchdata();
 }

 fetchdata() async{
   try{
     isloading(true);
     var res= await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=INR&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en'));
     List<Coin> coins=coinFromJson(res.body);
     coinslist.value=coins;
   }
   finally{
     isloading(false);
   }


 }


}