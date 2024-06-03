import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sgfl_sales/app/core/widget/order_dataTable.dart';
import 'package:sgfl_sales/app/core/widget/step_widget.dart';
import 'package:sgfl_sales/app/data/model/order_history.dart';

import '../../../routes/app_pages.dart';
import '/app/core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import 'customer_home_controller.dart';


class CustomerHomeView extends BaseView<CustomerHomeController> {


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.colorWhite),
      title: const Text("SGFL Sales", style: TextStyle(color: AppColors.colorWhite)),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
      ),
      backgroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8,right: 8,top: 16),
            decoration: AppColors.defaultDecoration(),
            child: ListTile(
             onTap: (){},
             leading: AppColors.circleIconBG(AppColors.primary, Icons.person),
             trailing: const Icon(Icons.chevron_right, size: 32,),
             title: const Text('Hasan Mahamud',style: TextStyle(fontWeight: FontWeight.bold)),
             subtitle: const Text('You can change your information',style: TextStyle(fontSize: 12)),
           ),
          ),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.only(left: 8,right: 8,top: 8),
            decoration: AppColors.defaultDecoration(),
            child: ListTile(
               onTap: (){Get.toNamed(Routes.PRODUCTS);},
               leading: AppColors.circleIconBG(AppColors.orange, Icons.water_drop_outlined),
               trailing: const Icon(Icons.chevron_right, size: 32,),
               title: const Text('Add Requisition',style: TextStyle(fontWeight: FontWeight.bold)),
               subtitle: const Text('Make a new order',style: TextStyle(fontSize: 12)),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Status', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Bellow are your most recent orders', style: TextStyle(fontSize: 12, color: AppColors.gray)),
            ],
          ).marginOnly(left: 10, top: 16),
          SizedBox(
            height: 135,
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
                  return orderStatusBarUI();
                }
            ),
          ),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.only(left: 8,right: 8,top: 24),
            decoration:AppColors.defaultDecoration(),
            child: ListTile(
              onTap: (){Get.toNamed(Routes.ORDER);},
              leading: AppColors.circleIconBG(AppColors.colorPrimary, Icons.oil_barrel_outlined),
              trailing: const Icon(Icons.chevron_right, size: 32,),
              title: const Text('Order List',style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Show total order',style: TextStyle(fontSize: 12)),
            ),
          ),
          const Text("Order History", style: TextStyle(fontSize: 14, color:AppColors.gray)).marginOnly(left: 10, top: 16),
          OrderDatatable(history: OrderHistory.orderList.take(3)).marginAll(8)
        ],
      ),
    );
  }

  Widget orderStatusBarUI() {
    return Container(
      width: Get.width - 35,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: AppColors.defaultDecoration(color: AppColors.primary),
      margin: const EdgeInsets.only(left: 8,right:8, top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primary.withOpacity(0.15),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Order# ', style: TextStyle(fontSize: 18, color: AppColors.textColor)),
                    Text('2551646', style: TextStyle(fontSize: 18, color: AppColors.primary)),
                  ],
                ),
                Text('12 JUN 2024', style: TextStyle(fontSize: 13, color: AppColors.gray)),
              ],
            ),
          ),
          SizedBox(height: 80, child: StepWidget(step: 1)),
        ],
      ),
    );
  }
}
