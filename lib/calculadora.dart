import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _primeiro = "";
  String _segundo = "";
  String? _operacao;
  String _resultado = "";

  Color get _rosaForte => Colors.pinkAccent;
  Color get _rosaFundo => Colors.pink[50]!;
  BorderRadius get _radius => BorderRadius.circular(20);

  void _onDigit(String d) {
    setState(() {
      if (_operacao == null) {
        if (!(_primeiro == "0" && d == "0")) {
          _primeiro += d;
        }
      } else {
        if (!(_segundo == "0" && d == "0")) {
          _segundo += d;
        }
      }
    });
  }

  void _onDecimal() {
    setState(() {
      if (_operacao == null) {
        if (_primeiro.isEmpty) {
          _primeiro = "0,";
        } else if (!_primeiro.contains(",")) {
          _primeiro += ",";
        }
      } else {
        if (_segundo.isEmpty) {
          _segundo = "0,";
        } else if (!_segundo.contains(",")) {
          _segundo += ",";
        }
      }
    });
  }

  void _onOperator(String op) {
    if (_primeiro.isEmpty) {
      _snack("Digite o primeiro número fofis 😿");
      return;
    }
    setState(() {
      if (_segundo.isEmpty) {
        _operacao = op;
      } else {
        _calcularInterno();
        _operacao = op;
      }
    });
  }

  void _onEquals() {
    if (_primeiro.isEmpty || _operacao == null || _segundo.isEmpty) {
      _snack("Complete: número ➜ operação ➜ número 😼");
      return;
    }
    setState(_calcularInterno);
  }

  void _calcularInterno() {
    final a = _toDouble(_primeiro);
    final b = _toDouble(_segundo);
    if (a == null || b == null) {
      _snack("Use números válidos gatinho 😿");
      return;
    }
    double res;
    switch (_operacao) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '×':
        res = a * b;
        break;
      case '÷':
        if (b == 0) {
          _snack("🙀 Não dá pra dividir por zero, ta chapando?!");
          return;
        }
        res = a / b;
        break;
      default:
        return;
    }

    _resultado = _formatar(res);
    _primeiro = _resultado;
    _segundo = "";
    _operacao = null;
  }

  double? _toDouble(String s) {
    if (s.isEmpty) return null;
    return double.tryParse(s.replaceAll(',', '.'));
  }

  String _formatar(double v) {
    final s = v.toString();
    if (s.contains('.') && s.split('.').last == '0') {
      return s.split('.').first;
    }

    final fixed = v.toStringAsFixed(10);
    final semZeros =
    fixed.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
    return semZeros.replaceAll('.', ',');
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: _rosaForte,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _limparTudo() {
    setState(() {
      _primeiro = "";
      _segundo = "";
      _operacao = null;
      _resultado = "";
    });
    _snack("Tudo limpo! Pode calcular coisinhas novamente rs");
  }

  Widget _btn(String label, {VoidCallback? onTap, bool forte = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: forte ? _rosaForte : Colors.pink[200],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: _radius),
        padding: const EdgeInsets.symmetric(vertical: 18),
        elevation: 4,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.pets, size: 16),
          const SizedBox(width: 6),
          Flexible(
            child: Text(label,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  String get _expressao {
    final p = _primeiro.isEmpty ? "…" : _primeiro;
    final op = _operacao ?? "";
    final s = _segundo;
    return [p, op, s].where((e) => e.isNotEmpty).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _rosaFundo,
      appBar: AppBar(
        title: const Text("Quer calcular alguma coisa? rsrs😸"),
        backgroundColor: _rosaForte,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: _radius,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 2))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expressao,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 22,
                      color: _rosaForte,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _resultado.isEmpty
                        ? "Resultado: —"
                        : "Resultado: $_resultado",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: [
                  _btn("7", onTap: () => _onDigit("7")),
                  _btn("8", onTap: () => _onDigit("8")),
                  _btn("9", onTap: () => _onDigit("9")),
                  _btn("÷", forte: true, onTap: () => _onOperator("÷")),
                  _btn("4", onTap: () => _onDigit("4")),
                  _btn("5", onTap: () => _onDigit("5")),
                  _btn("6", onTap: () => _onDigit("6")),
                  _btn("×", forte: true, onTap: () => _onOperator("×")),
                  _btn("1", onTap: () => _onDigit("1")),
                  _btn("2", onTap: () => _onDigit("2")),
                  _btn("3", onTap: () => _onDigit("3")),
                  _btn("−", forte: true, onTap: () => _onOperator("-")),
                  _btn(",", onTap: _onDecimal),
                  _btn("0", onTap: () => _onDigit("0")),
                  _btn("=", forte: true, onTap: _onEquals),
                  _btn("CC", forte: true, onTap: _limparTudo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
