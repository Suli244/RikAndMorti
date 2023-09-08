import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/character_Model.dart';
import '../theme/app_fonts.dart';
import '../theme/themeProvider.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.characters, required this.onTap,
  }) : super(key: key);
  final MyCharacters characters;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
      final vm = context.watch<ThemeProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: NetworkImage(
                characters.image ?? '',
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                characters.status?.toUpperCase() ?? '',
                  style: AppFonts.textAppearanceOverline.copyWith(color: characters.status == 'Alive' ? const Color(0xFF42D048) : Colors.red),
                ),
                 Text(
                  characters.name ?? '',
                  style: AppFonts.robotoName.copyWith(color: vm.textFildColorText),
                ),
                 Text(
                  '${characters.species}, ${characters.gender}',
                  style: AppFonts.textAppearanceCaption,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
