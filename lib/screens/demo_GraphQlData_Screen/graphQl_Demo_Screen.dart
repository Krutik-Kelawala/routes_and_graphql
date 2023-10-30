import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/blocs/graphQL_demo/demo_graph_ql_bloc.dart';
import 'package:test_project/routeFile.dart' as router;
import 'package:test_project/utilities/common_logic.dart';
import 'package:test_project/utilities/custom_colors.dart';

class GraphQlDemoScreen extends StatefulWidget {
  const GraphQlDemoScreen({super.key});

  @override
  State<GraphQlDemoScreen> createState() => _GraphQlDemoScreenState();
}

class _GraphQlDemoScreenState extends State<GraphQlDemoScreen> {
  int pageLimit = 0;

  @override
  Widget build(BuildContext context) {
    CommonLogic.initiateHeightWidth(context);
    return Scaffold(
      appBar: AppBar(title: Text("GraphQl Demo Screen", style: TextStyle(fontSize: CommonLogic.textSize * 0.02)), titleSpacing: 0, actions: [
        IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, router.mutationScreen);
          },
          icon: const Icon(Icons.production_quantity_limits),
          tooltip: "Add New Product",
        )
      ]),
      body: BlocProvider(
        create: (context) => DemoGraphQlBloc()..add(getProductData(pageLimit)),
        child: BlocConsumer<DemoGraphQlBloc, DemoGraphQlState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is DemoGraphQlLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DemoGraphQlInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DemoGraphQlLoaded) {
              return dataView(state, context);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget dataView(DemoGraphQlLoaded state, BuildContext context1) {
    return SingleChildScrollView(
      child: Column(children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.graphqlDemoModel.users.length,
          itemBuilder: (context, index) {
            return Column(
              key: const PageStorageKey("key"),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.01),
                  padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01, horizontal: CommonLogic.textSize * 0.01),
                  decoration: BoxDecoration(color: CustomColors.bgColor, border: Border.all(color: CustomColors.greyTextColor, width: 1)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: CommonLogic.textSize * 0.01), child: Image.network(state.graphqlDemoModel.users[index].avatar, height: CommonLogic.textSize * 0.1)),
                        IconButton(
                            onPressed: () {
                              context1.read<DemoGraphQlBloc>().add(deleteUserData(state.graphqlDemoModel.users[index].id));
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: CommonLogic.textSize * 0.04,
                            ))
                      ],
                    ),
                    Text("Email : ${state.graphqlDemoModel.users[index].email}"),
                    Text("Name : ${state.graphqlDemoModel.users[index].name}"),
                    Text("Role : ${state.graphqlDemoModel.users[index].role}"),
                  ]),
                ),
                Visibility(
                  // visible: state.graphqlDemoModel.users.length - 1 == index,
                  visible: false,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          pageLimit = pageLimit + 10;
                          context1.read<DemoGraphQlBloc>().add(getProductData(pageLimit));
                        },
                        child: const Text("View More")),
                  ),
                )
              ],
            );
          },
        )
      ]),
    );
  }
}
