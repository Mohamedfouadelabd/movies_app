
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Main Screen/main_screen.dart';
import '../../Theme/my_Theme.dart';
import '../../dailog _utils/Dailog_Utils.dart';
import '../CustomTextField/custom_text_field.dart';
import '../CustomTextField/cutom_text.dart';
import '../Login/login_screen.dart';
import 'Cubit/register_screen_view_model.dart';
import 'Cubit/statae.dart';
import 'domain/usecase/register_usecase.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';

  RegisterScreenViewModel viewModel =
      RegisterScreenViewModel(injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DailogUtils.showLoading(context, state.loadingMassage ?? "waiting");
        } else if (state is RegisterErrorState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(context, state.errorMassage ?? "error",
              posActionName: 'ok');
        } else if (state is RegisterSuccessState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(
            context,
            state.response!.user!.name ?? '',
            titel: 'success',
            posActionName: 'OK',
            posAc: () {


              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MainScreen()),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.primaryColor,
        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Movies App',
             style: Theme.of(context).textTheme.titleLarge!.copyWith(
               fontSize: 22,
                color: MyTheme.yellow

             ),

             ),
           ),
              Form(
                  key: viewModel.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(name: 'Full Name'),
                      CustomTextFormField(
                        lable: 'enter your full name',
                        keyboardType: TextInputType.name,
                        controller: viewModel.namecontroller,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter UserName';
                          }
                          return null;
                        },
                      ),
                      CustomText(name: 'E-mail address'),
                      CustomTextFormField(
                        lable: 'enter your email address',
                        controller: viewModel.emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Email';
                          }

                          bool emailvalid =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(text);
                          if (!emailvalid) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                      CustomText(name: 'Password'),
                      CustomTextFormField(
                        lable: 'enter your password',
                        keyboardType: TextInputType.number,
                        controller: viewModel.passwordcontroller,
                        isPassword: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password';
                          }
                          if (text.length < 6) {
                            return 'password greater than 6 char';
                          }
                          return null;
                        },
                      ),
                      CustomText(name: 'Conformation Password'),
                      CustomTextFormField(
                        lable: 'enter your conformation password',
                        keyboardType: TextInputType.number,
                        controller: viewModel.conformationpasswordcontroller,
                        isPassword: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter conformation Password';
                          }
                          if (text != viewModel.passwordcontroller.text) {
                            return 'password doesnt match';
                          }
                          return null;
                        },
                      ),
                      CustomText(name: 'Mobile Number'),
                      CustomTextFormField(
                        lable: 'enter your mobile nu.',
                        keyboardType: TextInputType.number,
                        controller: viewModel.mobilecontroller,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter  your mobile nu';
                          }
                          if (text.length < 11) {
                            return 'password greater than 11 char';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(MyTheme.yellow)),
                    onPressed: () {
                      viewModel.register();
                    },
                    child: Text('Sign',
                        style: Theme.of(context).textTheme.titleSmall)),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: CustomText(name: 'AllReady have an account?'))
            ],
          ),
        ),
      ),
    );
  }
}
