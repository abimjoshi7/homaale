import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/profile/presentation/pages/documents/widgets/document_text_card.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

//TODO: kyc docs implementation
class DocumentsProfile extends StatelessWidget {
  const DocumentsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<KycBloc>()
      ..add(
        KycModelLoaded(),
      )
      ..add(
        KycDocumentLoaded(),
      );
    return BlocBuilder<KycBloc, KycState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.list?.length ?? 0,
              itemBuilder: (context, index) => DocumentTextCard(
                isLocalFile: false,
                imagePath: state.list?[index].file ?? '',
                label: state.list?[index].documentId ?? '',
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
          return const Center(
            child: Text('No documents to show.'),
          );
        }
      },
    );
  }
}
