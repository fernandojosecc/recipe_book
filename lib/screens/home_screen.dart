import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _RecipesCard(context),
          _RecipesCard(context),
          _RecipesCard(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showBottom(context);
        },
      ),
    );
  }

  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder:
          (contexto) => Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            color: Colors.white,
            child: RecipeForm(),
          ),
    );
  }

  Widget _RecipesCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://static.platzi.com/media/uploads/flutter_lasana_b894f1aee1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 26),
              Column(
                mainAxisAlignment: MainAxisAlignment.center, //centrarlo
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Plate: Lasagna',
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                  ),
                  SizedBox(height: 2),
                  Container(height: 2, width: 190, color: Colors.red),
                  SizedBox(height: 2),
                  Text(
                    'Chef: Fernando C',
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                  ),
                  Text(
                    'Duration: 30 min',
                    style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        // key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //Alineamos verticalmente
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Add New Recipe',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildTextField(label: 'Recipe Name'),
            SizedBox(height: 16),
            _buildTextField(label: 'Chef Name'),
            SizedBox(height: 16),
            _buildTextField(label: 'Ingredients'),
            SizedBox(height: 16),
            _buildTextField(label: 'Duration of recipe'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontFamily: 'Quicksand', color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
