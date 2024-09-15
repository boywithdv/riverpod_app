
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entries/counter.dart';

final counterProvider = ChangeNotifierProvider((ref) => Counter());
