import 'package:flutter/material.dart';
import 'package:listaai/modules/gastos/model/produto_grafico.dart';

class GraficoBarrasPainter extends CustomPainter {
  final List<ProdutoGrafico> produtos;
  final List<Rect> _barRects = [];

  GraficoBarrasPainter({required this.produtos});

  @override
  void paint(Canvas canvas, Size size) {
    if (produtos.isEmpty) return;

    final paint = Paint()..style = PaintingStyle.fill;

    // Encontrar o produto mais caro
    final precoMaximo = produtos
        .map((p) => p.preco)
        .reduce((a, b) => a > b ? a : b);

    // Configurações do gráfico
    const padding = 20.0;
    const espacoEntreBars = 8.0;
    final larguraDisponivel = size.width - (padding * 2);
    final alturaDisponivel = size.height - (padding * 2) - 60;
    final larguraBarra =
        (larguraDisponivel - (espacoEntreBars * (produtos.length - 1))) /
        produtos.length;

    _barRects.clear();

    for (int i = 0; i < produtos.length; i++) {
      final produto = produtos[i];
      final alturaRelativa = (produto.preco / precoMaximo) * alturaDisponivel;

      final left = padding + (i * (larguraBarra + espacoEntreBars));
      final top = padding + (alturaDisponivel - alturaRelativa);
      final right = left + larguraBarra;
      final bottom = padding + alturaDisponivel;

      final barRect = Rect.fromLTRB(left, top, right, bottom);
      _barRects.add(barRect);

      // Cor da barra
      if (produto.preco == precoMaximo) {
        paint.color = const Color(0xFF1565C0); // Azul forte
      } else {
        paint.color = const Color(0xff4169E1); // Cor padrão
      }

      final rrect = RRect.fromRectAndRadius(barRect, const Radius.circular(4));
      canvas.drawRRect(rrect, paint);

      _drawLabel(
        canvas,
        produto.nome,
        Offset(left + larguraBarra / 2, bottom + 10),
        larguraBarra,
      );
      _drawPrice(
        canvas,
        'R\$ ${produto.preco.toStringAsFixed(0)}',
        Offset(left + larguraBarra / 2, top - 5),
      );
    }

    // Linha base
    paint.color = Colors.grey[300]!;
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(padding, padding + alturaDisponivel),
      Offset(size.width - padding, padding + alturaDisponivel),
      paint,
    );
  }

  void _drawLabel(
    Canvas canvas,
    String text,
    Offset position,
    double maxWidth,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text.length > 8 ? '${text.substring(0, 8)}...' : text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    textPainter.layout(maxWidth: maxWidth);
    textPainter.paint(
      canvas,
      Offset(position.dx - textPainter.width / 2, position.dy),
    );
  }

  void _drawPrice(Canvas canvas, String price, Offset position) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: price,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        position.dx - textPainter.width / 2,
        position.dy - textPainter.height,
      ),
    );
  }

  int getBarAtPosition(Offset position, Size size) {
    for (int i = 0; i < _barRects.length; i++) {
      if (_barRects[i].contains(position)) {
        return i;
      }
    }
    return -1;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! GraficoBarrasPainter ||
        oldDelegate.produtos != produtos;
  }
}
