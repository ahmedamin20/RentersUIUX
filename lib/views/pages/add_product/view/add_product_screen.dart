
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../../../../view_model/cubit/add_product_screen_cubit/cubit/add_product_screen_cubit.dart';
class AddProductScreen extends StatefulWidget 
{
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Add Product'),
      ),
      body:  BlocProvider(
        create: (context) => AddProductScreenCubit(),
        child: BlocConsumer<AddProductScreenCubit
      , 
      AddProductScreenState>(
        listener: (context, state) 
        {
          if(state is AddProductScreenSuccess)
          {
            
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product Added successfuly") , 
            backgroundColor: ColorsManager.green,
            ));
          }else if(state is AddProductScreenError)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error) , 
                backgroundColor: ColorsManager.redColor,
                ) , 
            
            );
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          AddProductScreenCubit cubit = context.read<AddProductScreenCubit>();

          return  Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children:  
              [
                // add Image
                const Text("Main Image",),
                              SizedBox(height: 10,),

                cubit.mainImage==null?
                 InkWell(
                    onTap: ()
                    {
                      cubit.pickImage();
                    },
                   child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                    child: Center(child: const Text("Add Image",)),
                                   ),
                 ) : InkWell(
                    onTap: ()
                    {
                      cubit.pickImage();
                    },
                  child: Image.file(File(cubit.mainImage!.path))),
                               SizedBox(height: 10,),

                  InkWell(
                onTap: ()
                {
                  cubit.pickImageMutiImage();
                },
                child: const Text("Add Other images", 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) ,
                ),
              ),
             
              SizedBox(
                height: 100,
                width: 500,
                child: ListView.builder
                (
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.otherImages.length,
                  itemBuilder: (context, index)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () 
                        {
                          setState(() =>                           cubit.otherImages.removeAt(index));
                        },
                        child: Image.file(File(cubit.otherImages[index].path))),
                    );
                  }
                  ),
              ),
            

              
           const  SizedBox(height: 10,),
               const  Text("Name Product",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) 
                ) ,
                                SizedBox(height: 10,),

                CustomTextFormField(textHint: "price Product",
                controller: cubit.nameController,
                
                ),
                const SizedBox(height: 10,),
                 const Text("Price Product" ,
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) ,
                 ) ,
                                const  SizedBox(height: 10,),

                CustomTextFormField(textHint: "Price Product",
                controller: cubit.priceController,),
                const SizedBox(height: 10,),
                const  Text("Description Product" ,
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) ,
                 ) ,
                                 SizedBox(height: 10,),

                CustomTextFormField(textHint: "description ",
                controller: cubit.descriptionController,),
               const  SizedBox(height: 10,),
                const  Text("Minimum Days" ,
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) ,
                 ) ,
                                 const SizedBox(height: 10,),

                CustomTextFormField(textHint: "Minimum Days",
                controller: cubit.minimumDays,),
                const SizedBox(height: 10,),
                const Text("Maximum Days" ,
                 style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) ,
                 ) ,
                                 SizedBox(height: 10,),

                CustomTextFormField(textHint: "Maximum Days",
                controller: cubit.maximumDays,),
                const SizedBox(height: 10,),
                 const Text("Health" ,
                style:  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold , 
                  color: ColorsManager.blackColor
                  ) 
                 ) ,
                                 const SizedBox(height: 10,),

                CustomTextFormField(textHint: "Health",
                controller: cubit.health,),
                const SizedBox(height: 10,),
                A2zCustomButton(buttonName: "Add Product", 
                onPressed: ()
                {
                  cubit.sendData();
                },)
            
            
              ],
            ),
          );
        },
      ) ,
    
    
      )
    );
  }
}