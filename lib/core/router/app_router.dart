import 'package:alianza_admin/ui/screens/client_history/client_history_screen.dart';
import 'package:alianza_admin/ui/screens/emergency_pin/emergency_pin_screen.dart';
import 'package:alianza_admin/ui/screens/emrgency_pin_history/emergency_pin_history_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:alianza_admin/ui/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const ClientsScreen()),
  GoRoute(
      path: '/client-history',
      builder: (context, state) => const ClientHistoryScreen()),
  GoRoute(
      path: '/pin', builder: (context, state) => const EmergencyPinScreen()),
  GoRoute(
      path: '/pin-history',
      builder: (context, state) => const EmergencyPinHistoryScreen()),
]);
