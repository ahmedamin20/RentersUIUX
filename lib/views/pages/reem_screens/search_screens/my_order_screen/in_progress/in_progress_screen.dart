import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../view_model/cubit/requests_cubit/requests_cubit.dart';
import 'component/build_listview_inprogress_item.dart';

class InProgressScreen extends StatefulWidget {
  InProgressScreen({Key? key, required this.status}) : super(key: key);
  int status;
  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RequestsCubit.get(context).getOrder(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RequestsCubit, RequestsState>(
        buildWhen: (previous, current) {
          if (current is RequestsSuccess ||
              current is RequestsLoading ||
              current is RequestsError) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = RequestsCubit.get(context);
          if (state is RequestsSuccess) {
            return ListView.separated(
                itemBuilder: (builder, index) => BuildListViewInProgressItem(
                      baseShowOrderModel: cubit.showOrderModel!.data![index],
                    ),
                separatorBuilder: (builder, context) => const SizedBox(),
                itemCount: cubit.showOrderModel!.data!.length);
          } else if (state is RequestsLoading) 
          {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RequestsError) 
          {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
