import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rikmorti/data/models/character_Model.dart';
import 'package:rikmorti/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rikmorti/presentation/screens/chars_detail_page.dart';
import 'package:rikmorti/presentation/theme/app_colors.dart';
import 'package:rikmorti/presentation/theme/app_fonts.dart';
import 'package:rikmorti/presentation/widgets/list_view_widget.dart';
import 'package:rikmorti/resources/resources.dart';
import '../theme/themeProvider.dart';
import '../widgets/grid_view_widget.dart';

class CharectersPage extends StatefulWidget {
  const CharectersPage({super.key});

  @override
  State<CharectersPage> createState() => _CharectersPageState();
}

class _CharectersPageState extends State<CharectersPage> {
  @override
  void initState() {
    BlocProvider.of<CharsBloc>(context).add(
      GetCharsList(),
    );
    super.initState();
  }

  bool isGridView = false;
  int charsCount = 0;
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ThemeProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 55,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(color: vm.textFildColorText),
              onChanged: (val) {
                BlocProvider.of<CharsBloc>(context).add(
                  GetCharsList(name: val),
                );
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppSvgs.search,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppSvgs.filter,
                  ),
                ),
                hintText: 'Найти персонажа',
                hintStyle: AppFonts.textAppearanceBody1,
                fillColor: vm.textFildColorBeg,
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.darkTextFillColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Text(
                  'Всего персонажей: 200',
                  style: AppFonts.roboto,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    isGridView = !isGridView;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    isGridView ? AppSvgs.list : AppSvgs.grid,
                  ),
                ),
              ],
            ),
            BlocBuilder<CharsBloc, CharsState>(
              builder: (context, state) {
                if (state is CharsSuccess) {
                  return isGridView
                      ? Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: state.model.results?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                            ),
                            itemBuilder: (context, index) => GridViewWidget(
                              characters:
                                  state.model.results?[index] ?? MyCharacters(),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.model.results?.length ?? 0,
                            itemBuilder: (context, index) => ListViewWidget(
                              characters:
                                  state.model.results?[index] ?? MyCharacters(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharsDetailsPage(
                                      data: state.model.results?[index] ??
                                          MyCharacters(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
        // charsCount = state.model.results?.length ?? 0;