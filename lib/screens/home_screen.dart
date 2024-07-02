import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: Color(0xFF252525),
        title: Text('Hello, Human!', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          Image.asset(
            'assets/img_3.png',
            height: 40.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF252525),
          ),
          child: Column(
            children: [
              SizedBox(height: 5),
              GreetingSection(),
              SizedBox(height: 16),
              SearchBar(),
              SizedBox(height: 16),
              CategoryChips(),
              SizedBox(height: 16),
              Expanded(child: DoctorList()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF252525),
      ),
    );
  }
}
class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF8494FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your ',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Catrine ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'will get\n',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'vaccination',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' tommorow\n',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'at 07:00 am!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Color(0xFFb3b9fb)),
                child: Text(
                  'See details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/home_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Find best vaccinates, treatments...',
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CategoryChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryChip(label: 'Vaccine',color: Color(0xFF8494FA,),color2: Colors.black,),
          CategoryChip(label: 'Surgery',color: Colors.white,color2: Colors.grey,),
          CategoryChip(label: 'SPA & Treatment',color: Colors.white,color2: Colors.grey,),
          CategoryChip(label: 'Consultation',color: Colors.white,color2: Colors.grey,),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final Color color;
  final Color color2;
  CategoryChip({required this.label,required this.color,required this.color2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: Chip(
        label: Text(label),
        backgroundColor: color,
        labelStyle: TextStyle(color: color2),
      ),
    );
  }
}
class DoctorList extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Stone',
      service: 'Vaccine, Surgery',
      distance: '10km',
      availability: 'Available for',
      imageUrl: 'assets/img.png', // Replace with your actual image path
    ),
    Doctor(
      name: 'Dr. Vanessa',
      service: 'Consultation, Therapy',
      distance: '5km',
      availability: 'Available for',
      imageUrl: 'assets/img_1.png', // Replace with your actual image path
    ),
    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(
          name: doctors[index].name,
          service: doctors[index].service,
          distance: doctors[index].distance,
          availability: doctors[index].availability,
          imageUrl: doctors[index].imageUrl,
        );
      },
    );
  }
}

class Doctor {
  final String name;
  final String service;
  final String distance;
  final String availability;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.service,
    required this.distance,
    required this.availability,
    required this.imageUrl,
  });
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String service;
  final String distance;
  final String availability;
  final String imageUrl;

  DoctorCard({
    required this.name,
    required this.service,
    required this.distance,
    required this.availability,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Service: $service',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 14),
                      SizedBox(width: 4),
                      Text(
                        distance,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        availability,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50,),
                      Row(
                        children: [
                          Icon(Icons.pets, color: Colors.purple),
                          SizedBox(width: 10),
                          Icon(Icons.pets, color: Colors.blue),
                        ],
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}