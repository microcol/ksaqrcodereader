import '../../../../core/common/widgets/scanned_details_card.dart';
import '../../../../core/helpers/common_helper.dart';
import '../manager/actions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/functions_actions.dart';

class Faqs extends StatelessWidget with FunctionsActions {
  const Faqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionsCubit, ActionsState>(
      builder: (context, state) {
        if (state is DisplayInvoiceList) {
          return state.info.invoices.isEmpty
              ? const Center(
                  child: Text("Scan Some QRs!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                )
              : ListView.separated(
                  itemCount: state.info.invoices.length,
                  separatorBuilder: (context, index) {
                    if (state.info.invoices[index].scannedDate.day.isEven) {
                      return _DateDivider(
                        date: state.info.invoices[index].scannedDate,
                      );
                    } else {
                      return const Divider(thickness: 2);
                    }
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 5,
                              color: Colors.white,
                            ),
                            BoxShadow(
                              offset: Offset(-2, -1),
                              blurRadius: 3,
                              color: Colors.black87,
                            ),
                          ],
                          color: Colors.grey.shade700),
                      child: ScannedDetailsCardWidget(
                        info: state.info.invoices[index],
                      ),
                    );
                  },
                );
        } else {
          return const Center(
            child: Text("Error Happened"),
          );
        }
      },
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            flex: 1,
            child: Divider(
              thickness: 2,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: Text(
            CommonHelper.formatDate(date: date, withTime: true),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const Expanded(flex: 10, child: Divider(thickness: 2)),
      ],
    );
  }
}
