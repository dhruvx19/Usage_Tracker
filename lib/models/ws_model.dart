class UsageModel {
  final double cpuUsage;
  final double totalRam;
  final double usedRam;


//model from web socket response
  UsageModel(
      {required this.cpuUsage, required this.totalRam, required this.usedRam});

  factory UsageModel.fromJson(Map<String, dynamic> json) {
    return UsageModel(
      cpuUsage: json['CPU Usage (%)'].toDouble(),
      totalRam: json['RAM Usage']['Total Physical Memory (MB)'].toDouble(),
      usedRam: json['RAM Usage']['Used Physical Memory (MB)'].toDouble(),
    );
  }

  double get ramUsage => (usedRam / totalRam) * 100;
}
