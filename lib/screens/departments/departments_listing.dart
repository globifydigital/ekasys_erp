import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/models/departments/departments_model.dart';
import 'package:ekasys/providers/departments/departments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_router.gr.dart';

@RoutePage()
class DepartmentsListingScreen extends ConsumerStatefulWidget {
  const DepartmentsListingScreen({super.key});

  @override
  ConsumerState<DepartmentsListingScreen> createState() => _DepartmentsListingScreenState();
}

class _DepartmentsListingScreenState extends ConsumerState<DepartmentsListingScreen> {

  var _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(departmentsListProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        forceMaterialTransparency: true,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.11,
        leading: GestureDetector(
          onTap: (){
            context.pushRoute(URLEnteringRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(Icons.arrow_back_ios, color: Colors.black,),
          ),
        ),
        title: TextFormField(
          controller: _search,
          decoration: const InputDecoration(
            hintText: 'Search Departments',
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 16.0),
            prefixIconConstraints: BoxConstraints(minWidth: 50),
          ),
        ),
      ),
      body: FutureBuilder<Departments>(
        future: ref.read(departmentsListProvider).getDepartmentList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              var departments = snapshot.data;
              var wishlistItems = departments?.oList ?? []; // Access the oList property

              return ListView.builder(
                itemCount: wishlistItems.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = wishlistItems[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        context.pushRoute(SignInRoute(departmentValue: item.departmentName ?? "", departmentId: item.departmentId.toString()));
                      },
                      child: Card(
                        elevation: 0,
                        color: const Color(0xfff0f5ff),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Icon(Iconsax.buildings4)
                                ),
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                flex: 10,
                                fit: FlexFit.tight,
                                child: Text(
                                  item.departmentName ?? '',
                                  style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text("No data available"));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      )
    );
  }
}
