import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/profile/presentation/pages/documents/widgets/document_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentsProfile extends StatelessWidget {
  const DocumentsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycBloc, KycState>(
      builder: (context, state) {
        if (state is KycLoadSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) => DocumentTextCard(
                isLocalFile: false,
                imagePath: state.list[index].file ?? '',
                label: state.list[index].documentId ?? '',
                iconPath: 'assets/2.png',
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
