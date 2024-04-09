import 'package:censusdemo/src/constants/colors.dart';
import 'package:censusdemo/src/constants/image_strings.dart';
import 'package:censusdemo/src/constants/sizes.dart';
import 'package:censusdemo/src/constants/text_strings.dart';
import 'package:censusdemo/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:censusdemo/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashBoard extends StatelessWidget {
   DashBoard({super.key});

  bool violenceDetected = false;

  @override
  Widget build(BuildContext context) {

    final txtTheme=Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.menu,color:Colors.black87),
        title: Text(tAppName,style:Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions:[
          Container(
            margin:const EdgeInsets.only(right:20, top:7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:tCardBgColor),
            child:IconButton(onPressed: (){},icon:const Image(image: AssetImage(tUserProfileImage))),
          )
        ],
      ),


      body: SingleChildScrollView( // Allow scrolling if content overflows
        child: Container(
          padding:const EdgeInsets.all(tDashboardCardPadding),
          child:Column(
            children: [
              Text("SafeSpace : Promoting healthy workplace",style: txtTheme.bodyText1),
              Text("Keep Workplace Safer",style: txtTheme.bodyText2),
              const SizedBox(height:tDashboardCardPadding),

              //3 buttons
          //
          Wrap(
               // spacing: 20,

                children: [

                              ElevatedButton(
                                onPressed: (){
                                  Get.to(()=>SignUpScreen());
                                },
                                style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,

                                ),
                                child: Expanded(
                                  child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
                                padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                child:Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(child: Icon(Icons.star,color:Colors.amber)),
                                        Flexible(child: Icon(Icons.history, color:Colors.blue)),
                                      ],
                                    ),
                                    const SizedBox(height: 15,),

                                    Text("Past detected Violence", style:txtTheme.headline4,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    Text("view perivious violence", style:txtTheme.bodyText2,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                  ],
                                ),
                                  ),


                                    ),
                              ),



                const SizedBox(width: tDashboardCardPadding,),


                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                              child:Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Flexible(child:
                                      Icon(Icons.star,color:Colors.amber)),
                                      Flexible(child: Icon(Icons.panorama_fish_eye, color:Colors.blue)),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Text("Live Monitoring", style:txtTheme.headline4,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  Text("View your workplace", style:txtTheme.bodyText2,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                  const SizedBox(width:tDashboardCardPadding),



                      Expanded(
                        child: Column(
                          children: [
                            Container(

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                              child:Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Flexible(child:
                                      Icon(Icons.star,color:Colors.amber)),
                                      Flexible(child: Icon(Icons.phone_android_outlined, color:Colors.blue)),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Text("Change Alert contacts", style:txtTheme.headline4,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  Text("Share the emergency to all", style:txtTheme.bodyText2,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                ],
                              ),



                            )
                          ],
                        ),),


                ],
              ),



            ],
          ),
        ),
      ),
    );
  }




  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image.asset(tBannerImage2, height: 50.0), // Replace with your logo path
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lakshita', // Replace with user name
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _buildButton('Past Detected', Icons.history, () {
          // Handle 'Past Detected' button press
          // Navigate to a past detections screen or perform relevant actions
        }),
        SizedBox(height: tDefaultSize,),
        _buildButton('Live Monitoring', Icons.panorama_fish_eye, () {
          // Handle 'Live Monitoring' button press
          // Navigate to a live monitoring screen or initiate video stream processing
        }),
        SizedBox(height: tDefaultSize,),
        _buildButton('Alter Contacts', Icons.phone_android_outlined, () {
          // Handle 'Alter Contacts' button press
          // Navigate to a contact management screen or perform contact update actions
        }),
        SizedBox(height: tDefaultSize,),
      ],
    );
  }

  Widget _buildButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20.0),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),

      ),
    );
  }


  Widget _buildViolenceDetectedSection() {
    return Visibility(
      visible: violenceDetected,
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Violence Detected!',
              style: TextStyle(color: Colors.red, fontSize: 18.0),
            ),
            SizedBox(width: 10.0),
            Icon(
              Icons.warning,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }


}




