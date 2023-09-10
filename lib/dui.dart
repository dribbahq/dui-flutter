library dui;

import 'core/badges.dart';
import 'core/buttons.dart';
import 'core/colors.dart';
import 'core/inputs.dart';
import 'core/misc.dart';
import 'core/picker.dart';
import 'core/skeleton.dart';
import 'core/spacing.dart';
import 'core/text.dart';
import 'core/theme.dart';
import 'core/tiles.dart';

class DUI {
  static final DUIText text = DUIText();
  static final DUIColor color = DUIColor();
  static final DUITheme theme = DUITheme();
  static final DUISpacing spacing = DUISpacing();
  static final DUIInput input = DUIInput();
  static final DUIButton button = DUIButton();
  static final DUISkeleton skeleton = DUISkeleton();
  static final DUITile tile = DUITile();
  static final DUIBadge badge = DUIBadge();
  static final DUIPicker picker = DUIPicker();
  static final DUIMisc misc = DUIMisc();
}
