import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'PeoplesAlly   Foundation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Euclid Circular B',
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),



            const SizedBox(height: 40),



            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    //width: 350,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.wallet, size: 50),
                        SizedBox(width: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rs. 600",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'My Wallet Balance',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text(
                  'Urgent Fundraising:',
                  style: TextStyle(
                    fontFamily: 'Euclid Circular B',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Icon(Icons.apps),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('All'),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Icon(Icons.medical_information),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('Medical'),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Icon(Icons.school),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('Education'),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Icon(Icons.coronavirus),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('Disaster'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
