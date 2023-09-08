import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/character_Model.dart';
import '../theme/app_fonts.dart';
import '../theme/themeProvider.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.characters,
  });

  final MyCharacters characters;
  @override
  Widget build(BuildContext context) {
      final vm = context.watch<ThemeProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(characters.image ?? ''),
        ),
        const SizedBox(
          height: 18,
        ),
        Column(
     
          children: [
            Text(
              characters.status?.toUpperCase() ?? '',
              style: AppFonts.textAppearanceOverline,
            ),
            Text(
              characters.name ?? '',
              style: AppFonts.robotoName.copyWith(color: vm.textFildColorText),
              textAlign: TextAlign.center,
            ),
            Text(
              '${characters.species}, ${characters.gender}',
              style: AppFonts.textAppearanceCaption,
            ),
          ],
        ),
      ],
    );
  }
}