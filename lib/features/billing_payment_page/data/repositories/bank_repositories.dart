import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/billing_payment_page/data/model/bank_branch_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/bank_names_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/linked_bank_response_dto.dart';

class BankRepository {
  final _dio = DioHelper();

  Future<LinkedBankResponseDto> fetchLinkedBankAccount([int startIndex = 1]) async {
    try {
      final response = await _dio.getDatawithCredential(
        query: {
          'page': startIndex,
        },
        url: 'tasker/bank-account/',
        token: CacheHelper.accessToken,
      );

      if (response != null) {
        return LinkedBankResponseDto.fromJson(response as Map<String, dynamic>);
      } else {
        throw Exception('error fetching linked accounts list');
      }
    } catch (_) {
      throw Exception('error fetching linked accounts list');
    }
  }

  Future<List<BankNamesResponseDto>> fetchBankNames({bool? isWallet, String? search}) async {
    try {
      final response = await _dio.getDatawithCredential(
        query: {
          'is_wallet': isWallet,
          'search': search,
        },
        url: 'payment/bank-name/options/',
        token: CacheHelper.accessToken,
      );

      List<BankNamesResponseDto> bankList = [];

      if (response != null) {
        var res = response as List<dynamic>;
        res.forEach((element) {
          bankList.add(BankNamesResponseDto.fromJson(element as Map<String, dynamic>));
        });

        return bankList;
      } else {
        throw Exception('error fetching bank names');
      }
    } catch (_) {
      throw Exception('error fetching bank names');
    }
  }

  Future<List<BankBranchResponseDto>> fetchBankBranchNames({required int bankId}) async {
    try {
      final response = await _dio.getDatawithCredential(
        url: 'payment/bank-branch/$bankId/',
        token: CacheHelper.accessToken,
      );

      List<BankBranchResponseDto> bankBranchList = [];

      if (response != null) {
        var res = response as List<dynamic>;
        res.forEach((element) {
          bankBranchList.add(BankBranchResponseDto.fromJson(element as Map<String, dynamic>));
        });

        return bankBranchList;
      } else {
        throw Exception('error fetching bank names');
      }
    } catch (_) {
      throw Exception('error fetching bank names');
    }
  }

  Future<bool> addPaymentMethod({required Map<String, dynamic> data}) async {
    try {
      final response = await _dio.postDataWithCredential(
        data: data,
        url: 'tasker/bank-account/',
        token: CacheHelper.accessToken,
      );

      if (response != null) {
        return true;
      } else {
        throw Exception('error post accounts');
      }
    } catch (_) {
      throw Exception('error post accounts');
    }
  }

  Future<bool> deletePaymentMethod({required int bankId}) async {
    try {
      final response = await _dio.deleteDataWithCredential(
        url: 'tasker/bank-account/',
        id: bankId,
        token: CacheHelper.accessToken,
      );

      if (response == null) {
        return true;
      } else {
        throw Exception('error delete accounts');
      }
    } catch (_) {
      throw Exception('error delete accounts');
    }
  }
}
