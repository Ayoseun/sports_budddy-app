
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../providers/auth_provider.dart';

class AppProviders {
  //list for providers
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<AuthProvider>(
      create: (ctx) => AuthProvider(),
    ),
    
    
  ];
}
