library dalai;

import 'core/animations.dart';
import 'core/badges.dart';
import 'core/buttons.dart';
import 'core/cards.dart';
import 'core/colors.dart';
import 'core/icons.dart';
import 'core/inputs.dart';
import 'core/misc.dart';
import 'core/picker.dart';
import 'core/skeleton.dart';
import 'core/spacing.dart';
import 'core/text.dart';
import 'core/theme.dart';
import 'core/tiles.dart';
import 'common_utils/alert.dart';

class Dalai {
  static final DalaiText text = DalaiText();
  static final DalaiColor color = DalaiColor();
  static final DalaiTheme theme = DalaiTheme();
  static final DalaiSpacing spacing = DalaiSpacing();
  static final DalaiIcons icon = DalaiIcons();
  static final DalaiInputs input = DalaiInputs();
  static final DalaiButtons button = DalaiButtons();
  static final DalaiSkeleton skeleton = DalaiSkeleton();
  static final DalaiCards card = DalaiCards();
  static final DalaiTiles tile = DalaiTiles();
  static final DalaiBadges badge = DalaiBadges();
  static final DalaiAnimations animations = DalaiAnimations();
  static final DalaiPickers picker = DalaiPickers();
  static final Misc misc = Misc();
}
