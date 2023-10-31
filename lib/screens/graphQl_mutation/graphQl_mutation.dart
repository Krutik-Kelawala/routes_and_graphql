import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/graphQl_SendData/graph_ql_send_data_bloc.dart';
import 'package:test_project/utilities/common_logic.dart';
import 'package:test_project/utilities/custom_colors.dart';
import 'package:test_project/widgets/common_widgets.dart';

class GraphQlMutation extends StatefulWidget {
  const GraphQlMutation({super.key});

  @override
  State<GraphQlMutation> createState() => _GraphQlMutationState();
}

class _GraphQlMutationState extends State<GraphQlMutation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  late BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    CommonLogic.initiateHeightWidth(context);
    return Scaffold(
      appBar: AppBar(title: Text("Send data to server", style: TextStyle(fontSize: CommonLogic.textSize * 0.02))),
      body: BlocProvider(
        create: (context) => GraphQlSendDataBloc(),
        child: BlocConsumer<GraphQlSendDataBloc, GraphQlSendDataState>(
          listener: (context, state) {
            if (state is GraphQlSendDataLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("data send successfully")));
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            blocContext = context;
            return Column(children: [
              Padding(
                padding: EdgeInsets.all(CommonLogic.textSize * 0.01),
                child: TextField(
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Your Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(CommonLogic.textSize * 0.01),
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(CommonLogic.textSize * 0.01),
                child: TextField(
                  controller: passwordController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(CommonLogic.textSize * 0.01),
                child: TextField(
                  controller: imageUrlController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Image URL',
                    hintText: 'Upload Your Image URL',
                  ),
                ),
              ),
              InkWell(
                  onTap: (emailController.text.isNotEmpty && nameController.text.isNotEmpty && passwordController.text.isNotEmpty && imageUrlController.text.isNotEmpty)
                      ? () {
                          CommonWidgets.printFunction("name ${nameController.text} email ${emailController.text} password ${passwordController.text}");
                          blocContext.read<GraphQlSendDataBloc>().add(sendData(emailController.text, nameController.text, passwordController.text, imageUrlController.text));
                        }
                      : null,
                  child: Container(
                      color: (emailController.text.isNotEmpty && nameController.text.isNotEmpty && passwordController.text.isNotEmpty && imageUrlController.text.isNotEmpty)
                          ? CustomColors.filedBtnColor
                          : CustomColors.filedBtnColor.withOpacity(0.2),
                      padding: EdgeInsets.all(CommonLogic.textSize * 0.016),
                      margin: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.02),
                      child: Text("Submit", style: TextStyle(fontSize: CommonLogic.textSize * 0.02, color: CustomColors.whiteTextColor)))),
            ]);
          },
        ),
      ),
    );
  }
}
