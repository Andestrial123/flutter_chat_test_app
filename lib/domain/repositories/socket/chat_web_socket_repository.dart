abstract interface class  ChatWebSocketRepository {

  void sendMessage(String data);

  void connect();

  Stream get socketStream;

  void disconnect();


}