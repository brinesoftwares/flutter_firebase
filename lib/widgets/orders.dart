import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final String id, product, price, name, userId, qty, date;
  final Color color;
  OrderWidget(this.id,this.product,this.price,this.name,this.userId,this.qty,this.date,this.color);

  @override
  Widget build(BuildContext context) {
    return
    
     Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
           border: new Border.all(
                            color: Colors.grey[700],
                            width: 0.2,
                          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "# $id",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.pink[700]),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  product,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "RM $price",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "$name ($userId)",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Qty: ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        qty,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 12, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget orderWidget(String id, product, price, name, userId, qty, date) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 8),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.amber[50],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Text(
//                 "# $id",
//                 style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.pink[700]),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//             ],
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 product,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "RM $price",
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   "$name ($userId)",
//                   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text(
//                       "Qty: ",
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                     Text(
//                       qty,
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(fontSize: 12, color: Colors.grey[800]),
//           ),
//         ],
//       ),
//     ),
//   );
// }
