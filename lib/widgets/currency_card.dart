
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget{

  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({super.key, required this.name, required this.code, required this.amount, required this.icon, required this.isInverted});

  @override
  Widget build(BuildContext context) {
    return Container(
            clipBehavior: Clip.hardEdge, // 오버플로우 되는거 가리기
            decoration: BoxDecoration(
              color: isInverted ? Colors.white : const Color(0xFF1F2123),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(name,
                      style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),),
                      const SizedBox(height:10,),
                      Row(
                        children: [
                          Text(amount,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize:  20,
                          )),
                          const SizedBox(width:10),
                          Text(code, 
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20
                          )),
                      ]
                    ),]
                  ),
                  Transform.scale( // 해당 위젯이 커지면 이걸 감싸고 있는 위젯 자체가 커지는 걸 막기 위한 설정 또는 위젯
                    scale: 2.2,
                    child: Transform.translate(
                      offset: const Offset(8, 12),
                      child: Icon(icon,
                      color: Colors.white,
                      size:88
                      ),
                    ),
                  )
              ],),
            ),
          );
  }
}