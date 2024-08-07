
import 'package:get/get.dart';
import 'package:sgfl_sales/app/data/model/lorry_model.dart';
import '../model/baseResponse_model.dart';
import '../model/contractor_model.dart';
import '../model/depot_model.dart';
import '../model/driver_mode.dart';
import '../model/home_model.dart';
import '../model/login_model.dart';
import '../model/product_model.dart';
import '../model/requisition_model.dart';
import '../model/reset_pass_model.dart';
import '../model/unassign_model.dart';
import '../remote/remote_source.dart';

abstract class Repository {
  Future<LoginModel> loginResponse(LoginModel request);
  Future<BaseResponseModel> logoutReqData();
  Future<List<DepotModel>> getAllDepot({int? depotId});
  Future<List<ProductModel>> getAllProduct();
  Future<UserModel> getProfileData();
  Future<UserModel> updateProfileData(UserModel profile);
  Future<BaseResponseModel> updatePassword(PasswordReqModel passwordReqModel);
  Future<BaseResponseModel> requisitionReqData(RequisitionReqModel reqModel);
  Future<dynamic> getOrderData({dynamic query});
  Future<HomeModel> getDashBoardData();
  Future<BaseResponseModel> orderConfirm(int id, String status);
  Future<List<UnassignedModel>> getAllUnassigned();
  Future<List<Contractor>> getContractorData();
  Future<BaseResponseModel> assignOrder(List<AssignModel> assignModel);
  Future<BaseResponseModel> orderItemUpdate(int id, int itemId, String receivedQty);
  Future<List<LorryModel>> getLorryData(int contractorId, int itemId);
  Future<List<DriverModel>> getAllDriverData(int contractorId, int itemId);

}

class RepositoryImpl implements Repository{

  final RemoteDataSource _remoteSource = Get.find(tag: (RemoteDataSource).toString());

  @override
  Future<LoginModel> loginResponse(LoginModel request) {
    return _remoteSource.loginReqData(request);
  }

  @override
  Future<BaseResponseModel> logoutReqData() {
   return _remoteSource.logoutReqData();
  }

  @override
  Future<List<DepotModel>> getAllDepot({int? depotId}) {
    return _remoteSource.getAllDepot(depotId: depotId);
  }

  @override
  Future<List<ProductModel>> getAllProduct() {
    return _remoteSource.getAllProduct();
  }

  @override
  Future<UserModel> getProfileData() {
    return _remoteSource.getProfileData();
  }

  @override
  Future<UserModel> updateProfileData(UserModel profile) {
    return _remoteSource.updateProfileData(profile);
  }

  @override
  Future<BaseResponseModel> updatePassword(PasswordReqModel passwordReqModel) {
    return _remoteSource.updatePassword(passwordReqModel);
  }

  @override
  Future<BaseResponseModel> requisitionReqData(RequisitionReqModel reqModel) {
    return _remoteSource.requisitionReqData(reqModel);
  }

  @override
  Future<dynamic> getOrderData({dynamic query}) {
    return _remoteSource.getOrderData(query: query);
  }

  @override
  Future<HomeModel> getDashBoardData() {
    return _remoteSource.getDashBoardData();
  }

  @override
  Future<BaseResponseModel> orderConfirm(int id, String status) {
    return _remoteSource.orderConfirm(id, status);
  }

  @override
  Future<List<UnassignedModel>> getAllUnassigned() {
    return _remoteSource.getAllUnassigned();
  }

  @override
  Future<List<Contractor>> getContractorData() {
    return _remoteSource.getContractorData();
  }

  @override
  Future<BaseResponseModel> assignOrder(List<AssignModel> assignModel) {
    return _remoteSource.assignOrder(assignModel);
  }

  @override
  Future<BaseResponseModel> orderItemUpdate(int id, int itemId, String receivedQty) {
    return _remoteSource.orderItemUpdate(id, itemId, receivedQty);
  }

  @override
  Future<List<LorryModel>> getLorryData(int contractorId, int itemId) {
    return _remoteSource.getLorryData(contractorId, itemId);
  }

  @override
  Future<List<DriverModel>> getAllDriverData(int contractorId, int itemId) {
    return _remoteSource.getAllDriverData(contractorId, itemId);
  }

}

