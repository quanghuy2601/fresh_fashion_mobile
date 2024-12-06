import 'package:either_dart/either.dart';
import 'package:fresh_fashion_mobile/core/error/exception.dart';

abstract class AppInfoDataSourceInterface {
  Future<Either<APIServiceException, String>> getSupportedVersion();
}

class AppInfoDataSource implements AppInfoDataSourceInterface {
  @override
  Future<Either<APIServiceException, String>> getSupportedVersion() async {
    try {
      // String? supportedVersion;
      // dynamic rawData = await ApiServiceClient.get(
      //   withToken: false,
      //   uri: APIServicePath.sgasAppInfo,
      // );
      // if (rawData['data'] != null) {
      //   rawData['data'].forEach((value) {
      //     if (value['key'] == "APP_VERSION") supportedVersion = value['value'];
      //   });
      // }
      // return Right(supportedVersion!);

      String supportedVersion = "1.0.0";
      return Right(supportedVersion);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerException());
      }
      return Left(DataParsingException());
    }
  }
}
