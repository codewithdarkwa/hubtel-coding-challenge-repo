import 'package:flutter/material.dart';
import 'package:todo_app/model/history_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(searchController: searchController),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'May 24, 2022',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  itemCount: histories.length,
                  shrinkWrap: true,
                  separatorBuilder: (_, index) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    History history = histories[index];
                    return HistoryCard(
                      name: history.name,
                      status: history.status,
                      image: history.image,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xff19BEA1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: const Row(
          children: [
            Icon(Icons.add_circle, size: 30),
            SizedBox(
              width: 10,
            ),
            Text(
              'Add Transaction',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Color(0xff19BEA1),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'History',
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.name,
    required this.status,
    required this.image,
  });

  final String name;
  final String status;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Time
          const Text(
            "14:45PM",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage(image),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Text("Kwabena Uncle Ebo", style: TextStyle(fontWeight: FontWeight.w400)),
                        const SizedBox(height: 5),
                        const Text(
                          "024 123 4567",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: const Color(0xffD3F6D9),
                      color: status == 'Successful' ? const Color(0xffD3F6D9) : const Color(0xffFA9E9C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        status == "Successful"
                            ? const Icon(
                                Icons.check_circle,
                                size: 20,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.close_rounded,
                                size: 20,
                                color: Colors.red,
                              ),
                        Text(
                          status,
                          style: TextStyle(
                            color: status == 'Successful' ? Colors.green : Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'GHS 500',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Personal  ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(
                  Icons.circle,
                  size: 8,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Cool your heart wai  ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.star,
                  size: 24,
                  color: Colors.yellow,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 320,
            height: 50,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset("assets/filter.png"),
        )
      ],
    );
  }
}
