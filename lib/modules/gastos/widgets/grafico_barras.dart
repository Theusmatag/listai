import 'package:flutter/material.dart';
import 'package:listaai/modules/gastos/model/produto_grafico.dart';

import 'grafico_barras_painter.dart';

class GraficoBarras extends StatefulWidget {
  final List<ProdutoGrafico> produtos;
  final double altura;

  const GraficoBarras({super.key, required this.produtos, this.altura = 300});

  @override
  State<GraficoBarras> createState() => _GraficoBarrasState();
}

class _GraficoBarrasState extends State<GraficoBarras> {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    if (widget.produtos.isEmpty) {
      return Container(
        height: widget.altura,
        alignment: Alignment.center,
        child: const Text('Nenhum produto para exibir'),
      );
    }

    return GestureDetector(
      onTapDown: (details) {
        _handleTap(details.localPosition);
      },
      child: Container(
        height: widget.altura,
        padding: const EdgeInsets.all(16),
        child: CustomPaint(
          size: Size.infinite,
          painter: GraficoBarrasPainter(produtos: widget.produtos),
        ),
      ),
    );
  }

  void _handleTap(Offset position) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final painter = GraficoBarrasPainter(produtos: widget.produtos);
    final barIndex = painter.getBarAtPosition(
      position,
      Size(size.width - 32, widget.altura - 32),
    );

    if (barIndex != -1) {
      final produto = widget.produtos[barIndex];
      _showTooltip(produto.nome, produto.preco, position);
    } else {
      _hideTooltip();
    }
  }

  void _showTooltip(String nome, double preco, Offset position) {
    _hideTooltip();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx - 60,
        top: position.dy - 80,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'R\$ ${preco.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 3), () {
      _hideTooltip();
    });
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }
}
