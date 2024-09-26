import 'package:api_call_sample_fapp/widget/vertical_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';
import '../data/response/status.dart';
import '../model/ticket_list_response.dart';
import '../view_model/ticket_list_view_model.dart';
import '../widget/my_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  late String? technicianId;
  late String? technicianName;
  late String? ticketStatus;
  late String? filterBy;
  TicketListViewModel ticketListVM = TicketListViewModel();

  @override
  initState()   {
    super.initState();
    getTicketData();
  }

  Future<void> getTicketData() async {
    technicianId= "6";
    technicianName= "GurpreetS";
    ticketStatus =  Constants.ticketTypeAssigned;
    filterBy = "USER";
    ticketListVM.getTicketListData(context, technicianId!, technicianName!, ticketStatus!, filterBy!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(  "Home Screen",style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),),
        backgroundColor: Colors.black54,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            headerWidget(),
            const VerticalSpacing(5.0),
            Expanded(
              child: ChangeNotifierProvider<TicketListViewModel>(
                create: (BuildContext context) => ticketListVM,
                child: Consumer<TicketListViewModel>(builder: (context, value, child) {
                  switch (value.ticketListResponseData.status) {
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator(color: Colors.orange,));
                    case Status.ERROR:
                      return Center(child: Text('${value.ticketListResponseData.message}',
                        style: const TextStyle(color: Colors.orange, fontSize: 20.0, fontWeight: FontWeight.w700),));
                    case Status.COMPLETED:
                      return Container(
                          child: ticketListVM.ticketListData. ticketDetailsList ==null
                              ? const Center(child: CircularProgressIndicator(),)
                              : listViewWidget(ticketListVM.ticketListData.ticketDetailsList!));
                    case null:
                      break;
                  }
                  return Container();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(){
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.all( 5.0),
      child: const SizedBox(
        height: 25.0,
        child: MyTextWidget(text: 'TICKETS', color: Colors.black87, size: 14.0, fontWeight: FontWeight.w600,)
      ),
    );
  }

  Widget listViewWidget(List<TicketDetailsList> ticketList  ) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 4.0, bottom: 5.0),
      scrollDirection: Axis.vertical,
      itemCount:  ticketList.length,
      itemBuilder: (context, index) {
        TicketDetailsList ticketDetails = ticketList[index];
        Color priorityColorValue = Colors.black;

        return Card(color: Colors.white, elevation: 10, shadowColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.only(left: 5.0, right: 5.0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const MyTextWidget(isExpand: true, flexVal: 3,  text: 'Ticket No.', size: 11.0, isMarquee: true,),
                      const MyTextWidget(text: ': ', color: Colors.black, size: 12.0,  ),
                      MyTextWidget(isExpand: true, flexVal: 7,  text: '${ticketDetails.ticketNo}', size: 12.0, fontWeight: FontWeight.w600, isMarquee: true,),
                    ],
                  ),
                  const VerticalSpacing(5.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const MyTextWidget(isExpand: true, flexVal: 3,  text: 'Customer', size: 11.0, isMarquee: true,),
                      const MyTextWidget(text: ': ', color: Colors.black, size: 12.0,  ),
                      MyTextWidget(isExpand: true, flexVal: 7,  text: '${ticketDetails.customer!.firstName} ${ticketDetails.customer!.lastName}', size: 12.0, fontWeight: FontWeight.w400, isMarquee: true,),
                    ],
                  ),
                  const VerticalSpacing(5.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const MyTextWidget(isExpand: true, flexVal: 3, text: 'Mobile No.', size: 11.0,isMarquee: true,),
                      const MyTextWidget(text: ': ', size: 12.0,),
                      MyTextWidget(isExpand: true, flexVal: 7, text: '${ticketDetails.customer!.mobileNo}', size: 12.0, fontWeight: FontWeight.w400, isMarquee: true,),
                    ],
                  ),
                  const VerticalSpacing(5.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const MyTextWidget(isExpand: true, flexVal: 3, text: 'Date & Time', size: 11.0,isMarquee: true,),
                      const MyTextWidget(text: ': ', size: 12.0,),
                      MyTextWidget(isExpand: true, flexVal: 7, text: '${ticketDetails.complaintDate} ${ticketDetails.complaintTime}', size: 12.0, fontWeight: FontWeight.w400, isMarquee: true,),
                    ],
                  ),
                  const VerticalSpacing(5.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const MyTextWidget(isExpand: true, flexVal: 3, text: 'Priority', size: 11.0,isMarquee: true,),
                      const MyTextWidget(text: ': ', size: 12.0,),
                      MyTextWidget( isExpand: true, flexVal: 7, text: ticketDetails.priorityStatus ?? "",  color: priorityColorValue, size: 12.0, fontWeight: FontWeight.w600, isMarquee: true,),

                    ],
                  ),
                  const VerticalSpacing(5.0),
                ],
              ),
              onTap: () => _onTapItem(context, index),
            ),
          ),
        );
      },
    );
  }

  void _onTapItem(BuildContext context, int position) {

  }
}