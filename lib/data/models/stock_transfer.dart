import 'package:equatable/equatable.dart';

class StockTransfer extends Equatable {
  final int? id;
  final int sourceProductId;
  final int targetProductId;
  final double sourceQty;
  final double targetQty;
  final double multiplier;
  final String? notes;
  final DateTime? createdAt;

  // These are for UI display, Not stored in stock_transfers table
  final String? sourceProductName;
  final String? targetProductName;

  const StockTransfer({
    this.id,
    required this.sourceProductId,
    required this.targetProductId,
    required this.sourceQty,
    required this.targetQty,
    required this.multiplier,
    this.notes,
    this.createdAt,
    this.sourceProductName,
    this.targetProductName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'source_product_id': sourceProductId,
      'target_product_id': targetProductId,
      'source_qty': sourceQty,
      'target_qty': targetQty,
      'multiplier': multiplier,
      'notes': notes,
      'created_at': createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }

  factory StockTransfer.fromMap(Map<String, dynamic> map) {
    return StockTransfer(
      id: map['id'] as int?,
      sourceProductId: map['source_product_id'] as int,
      targetProductId: map['target_product_id'] as int,
      sourceQty: (map['source_qty'] as num).toDouble(),
      targetQty: (map['target_qty'] as num).toDouble(),
      multiplier: (map['multiplier'] as num).toDouble(),
      notes: map['notes'] as String?,
      createdAt: map['created_at'] != null 
          ? DateTime.parse(map['created_at'] as String) 
          : null,
      sourceProductName: map['source_product_name'] as String?,
      targetProductName: map['target_product_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        sourceProductId,
        targetProductId,
        sourceQty,
        targetQty,
        multiplier,
        notes,
        createdAt,
      ];
}
