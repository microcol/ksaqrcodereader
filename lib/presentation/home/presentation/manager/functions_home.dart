import 'package:e_invoice_qrcode_reader/presentation/home/presentation/manager/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin FunctionsHome {
  void validateQrCode(BuildContext context, String scannedString) {
    BlocProvider.of<HomeCubit>(context)
        .validateQrCode(scannedString: scannedString);
  }
}
