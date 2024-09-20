import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:sunrise_cafe/common/widgets/custom_expansion_tile.dart';
import 'package:sunrise_cafe/common/widgets/expansion_menu_title_widget.dart';
import 'package:sunrise_cafe/module/cafe_home/view/widgets/special_menu/special_item_grid.dart';

class HomeSpecialMenu extends StatelessWidget {
  const HomeSpecialMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(15))),
              ),
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFC4C4C4),
                      Color(0xffd9d9d9e5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 05,
                      offset: const Offset(0, 6),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                height: 130,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Welcome to\nSunrise Cafe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const CustomExpansionTile(
              titleWidget: ExpanderMenuTitleWidget(
                title: "Today's Special",
              ),
              childWidget: [
                SpecialItemsGrid(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
