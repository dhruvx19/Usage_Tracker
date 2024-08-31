class WebSocketUsageModel {
  final double cpuUsage;
  final double totalRam;
  final double usedRam;


//model from web socket response
  WebSocketUsageModel(
      {required this.cpuUsage, required this.totalRam, required this.usedRam});

  factory WebSocketUsageModel.fromJson(Map<String, dynamic> json) {
    return WebSocketUsageModel(
      //cpu usage
      cpuUsage: json['CPU Usage (%)'].toDouble(),
      //total physical memory
      totalRam: json['RAM Usage']['Total Physical Memory (MB)'].toDouble(),
      //total ram used
      usedRam: json['RAM Usage']['Used Physical Memory (MB)'].toDouble(),
    );
  }

  double get ramUsage => (usedRam / totalRam) * 100;
}
