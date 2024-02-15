import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class PainelCheckinRepository {
  openChannelSocket();
  getTodayPanel(WebSocketChannel channel);
}
