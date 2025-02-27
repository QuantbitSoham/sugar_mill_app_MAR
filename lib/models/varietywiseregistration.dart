
class CircleData {
  final List<ColumnDefinition> columns;
  final List<CircleRecord> data;

  CircleData({required this.columns, required this.data});

  factory CircleData.fromJson(Map<String, dynamic> json) {
    return CircleData(
      columns: (json['columns'] as List)
          .map((col) => ColumnDefinition.fromJson(col))
          .toList(),
      data: (json['data'] as List)
          .map((record) => CircleRecord.fromJson(record))
          .toList(),
    );
  }
}

class ColumnDefinition {
  final String field; // Column field name
  final String headerName; // Column display name

  ColumnDefinition({required this.field, required this.headerName});

  factory ColumnDefinition.fromJson(Map<String, dynamic> json) {
    return ColumnDefinition(
      field: json['field'] ?? '',
      headerName: json['headerName'] ?? '',
    );
  }
}

class CircleRecord {
  final String circle;
  final int totalBTS;
  final int proposed4G;
  final int target2023;
  final int achievement;
  final double achievementPercentage;
  final int balance;
  final double totalBudget;
  final double utilized;
  final double utilizedPercentage;
  final double remaining;

  CircleRecord({
    required this.circle,
    required this.totalBTS,
    required this.proposed4G,
    required this.target2023,
    required this.achievement,
    required this.achievementPercentage,
    required this.balance,
    required this.totalBudget,
    required this.utilized,
    required this.utilizedPercentage,
    required this.remaining,
  });

  factory CircleRecord.fromJson(Map<String, dynamic> json) {
    return CircleRecord(
      circle: json['Circle'] ?? '',
      totalBTS: json['Total BTS'] ?? 0,
      proposed4G: json['Proposed 4G'] ?? 0,
      target2023: json['Target 2023'] ?? 0,
      achievement: json['Achievement'] ?? 0,
      achievementPercentage: (json['Achievement%'] ?? 0).toDouble(),
      balance: json['Balance'] ?? 0,
      totalBudget: (json['Total Budget'] ?? 0).toDouble(),
      utilized: (json['Utilized'] ?? 0).toDouble(),
      utilizedPercentage: (json['Utilized%'] ?? 0).toDouble(),
      remaining: (json['Remaining'] ?? 0).toDouble(),
    );
  }
}
