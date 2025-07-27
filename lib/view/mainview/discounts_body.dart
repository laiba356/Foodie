import 'package:flutter/material.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/view/mainview/discount_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({super.key});

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  bool isScanning = false; // Tracks whether the scanner is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.close, color: Colors.white),
        //   onPressed: () {
        //     Navigator.pop(context); // Closes the page
        //   },
        // ),
        title: const Text(
          "Scan QR Code",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scan the QR code given at our website and avail the discount of 15%",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 40),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink, width: 4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: isScanning
                  ? MobileScanner(
                      controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.noDuplicates),
                      onDetect: (capture) {
                        List<Barcode> barcodes = capture.barcodes;
                        if (barcodes.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiscountPage(
                                discountMessage: barcodes.first.rawValue ?? '',
                              ),
                            ),
                          );
                        }
                      },
                    )
                  : const Center(
                      child: Icon(
                        Icons.qr_code,
                        size: 150,
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Place the QR code properly inside the area\nScanning will start automatically",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (globlePriceTotal >= 1000) {
                  setState(() {
                    isScanning = true;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Oops!"),
                        content: const Text(
                            "Looks like your order is below 1000 Rs."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                "Scan",
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
