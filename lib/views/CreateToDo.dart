import 'package:flutter/material.dart';

class createTodo extends StatelessWidget {
  createTodo({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
//to check the state of your form
//global keys are labels used to check fields
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text('Create To Do'),
      ),
      body: Container(
        //  to create spacing around the container
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            //form key checks the state of each field in  our form
            key: formKey,
            child: ListView(children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  //for adding a text in afield
                  labelText: 'Title',
                  hintText: 'Please enter title',
                  //  border: UnderlineInputBorder(borderSide: BorderSide(color:Colors.black,))
                  labelStyle: TextStyle(color: Colors.black),
                ),
                //makes sure the data is available
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title is required";
                  }
                },
              ),
              TextFormField(
                controller: descriptionController,
                //to add spacing between the label and te border
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'Please enter description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description is empty";
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      // onTap: (){
                      //   showDatePicker(context: context,
                      //   initialDate: DateTime.now(),
                      //   firstDate: DateTime.now(),
                      //   lastDate: DateTime.now().add(const Duration(days:365),),
                      //   ).then((selectedDate){
                      //     final DateFormat dateFormat=DateFormat("dd/MM/yyy");
                      //     dateController.text=dateFormat.format(selectedDate!);
                      // }
                      // );
                      // },
                      decoration: InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Please enter date'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date is empty";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: TextFormField(
                      //keyboardType: TextInputType.number,for inputing numbers
                      // contruller helps you to grasp data and edit your data
                      controller: timeController,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((selectedTime) {
                          timeController.text = selectedTime!.format(context);
                        });
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                          labelText: 'Time',
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Please enter Time'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Time is empty";
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),

              TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(titleController.text);
                      print(descriptionController.text);
                      print(dateController.text);
                      print(timeController.text);
                    } else {
                      print('failed');
                    }
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.only(top: 15, bottom: 15)))
//OR
              // Card(
              //   color: Colors.blue,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15),
              //     child: Row(mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text('Create')
              //       ],
              //     ),
              //   ),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
