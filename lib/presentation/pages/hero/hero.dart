import 'package:flutter/material.dart';

class RealEstateHeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1024;
    final isTablet = MediaQuery.of(context).size.width > 768 && MediaQuery.of(context).size.width <= 1024;
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.home, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Real Estate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (isDesktop || isTablet) ...[
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Home', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text('Property', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text('About us', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text('Contact us', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                // Login and Phone
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_outline, size: 20),
                        SizedBox(width: 5),
                        Text('Login', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 20),
                        SizedBox(width: 5),
                        Text('(257) 388-6895', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ] else ...[
                Icon(Icons.menu, color: Colors.black),
              ],
            ],
          ),
        ),
        
        if (isMobile) ...[
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2075&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Find a home that suits your lifestyle.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Nec risus quis viverra libero tellus eget. Leo morbi faucibus mattis pharetra tellus velit ultricies duis rhoncus.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 30),
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: Offset(0, 15),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildDropdown('Category'),
                    SizedBox(height: 16),
                    _buildDropdown('Property Type'),
                    SizedBox(height: 16),
                    _buildDropdown('Location'),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2563EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ] else ...[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=2075&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Find a home that suits your lifestyle.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Container(
                            constraints: BoxConstraints(maxWidth: 600),
                            child: Text(
                              'Nec risus quis viverra libero tellus eget. Leo morbi faucibus mattis pharetra tellus velit ultricies duis rhoncus. Porttitor fermentum eu urna eget',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -60, 
                  left: 60,
                  right: 60,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(child: _buildDropdown('Category')),
                        SizedBox(width: 16),
                        Expanded(child: _buildDropdown('Property Type')),
                        SizedBox(width: 16),
                        Expanded(child: _buildDropdown('Location')),
                        SizedBox(width: 20),
                        Container(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2563EB),
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 120),
        ],
        
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}