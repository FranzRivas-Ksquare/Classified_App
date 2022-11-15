import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.data});

  dynamic data;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  _openURL(url) async {
    url = Uri.parse(url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.data['title'], style: TextStyle(fontSize: 24),),
            Text('\$${widget.data['price']}'),
            const SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/image_viewer', arguments: {
                    'images': widget.data['images']
                  });
                },
                child: Image.network(widget.data['images'][0])),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.person),
                  Text(widget.data['authorName']),
                  const SizedBox(width: 20),
                  const Icon(Icons.timelapse),
                  Text(widget.data['createdAt']),
                ],
              ),
            ),
            Text(widget.data['description']),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF25723)),
                  onPressed: () {
                    _openURL('tel:${widget.data['mobile']}');
                  },
                child: const Text('Contact Seller'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}