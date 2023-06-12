import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final List<String> photoList = [
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 49, 47, 47),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),

              // Photo Grid Starts
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List<Widget>.generate(photoList.length, (int index) {
                  return Container(
                    width: 120.0,
                    height: 120.0,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Clicked on photo!'),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Image.network(
                            photoList[index],
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              color: const Color.fromARGB(137, 84, 84, 84),
                              child: Center(
                                child: Text(
                                  'Caption',
                                  style: TextStyle(
                                    backgroundColor: Colors.black,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              // Photo Grid Ends

              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24, 8, 16, 8),
                leading: CircleAvatar(
                  radius: 24, // Adjust the radius as needed
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
                title: Text(
                  'Sample Photo 1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Category 1'),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24, 0, 16, 8),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
                title: Text(
                  'Sample Photo 2',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Category 2'),
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(24, 0, 8, 8),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
                title: Text(
                  'Sample Photo 3',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Category 3'),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Photos Uploaded Successfully!'),
                        ),
                      );
                    },
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.cloud_upload_rounded),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
