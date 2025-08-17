// import 'package:flutter/cupertino.dart';
// import '../../../../global_export.dart';

// class CLContactList extends ConsumerWidget {
//   const CLContactList({super.key});

//   @override
//   Widget build(context, ref) {
//     List<Contact>? contacts;
//     final asyncContacts = ref.watch(contactsProvider);
//     final hasData = asyncContacts is AsyncData;
//     final hasError = asyncContacts is AsyncError;
//     final inFilterMode = ref.read(stringProvider(CLStrings.ENTER_SEARCH_KEY)).isNotEmpty;

//     if(hasData){
//       contacts = asyncContacts.value;
//     }

//     if(contacts != null && contacts.isEmpty){
//       return Center(
//         child: Text(
//           inFilterMode ? CLStrings.NO_SEARCH_RESULTS : CLStrings.NO_CONTACTS,
//           style: Theme.of(context).textTheme.titleSmall,
//         ),
//       );
//     }

//     return RefreshIndicator(
//       color: Theme.of(context).textTheme.headlineMedium?.color,
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       onRefresh: (){
//         return (hasData || hasError) ? ref.read(contactsProvider.notifier).loadContacts()
//           : Future<void>.value();
//       },
//       child: LayoutBuilder(
//         builder: (_, constraints) {
//           return ListView.builder(
//             itemCount: contacts?.length ?? (constraints.maxHeight ~/ 50),
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (_, listIndex){
//               final contact = contacts?.elementAt(listIndex);

//               if(!hasData || contact == null){
//                 return ContactLoadingShimmer(parentWidth: constraints.maxWidth);
//               }
              
//               return Dismissible(
//                 key: UniqueKey(),
//                 background: CLContainer(
//                   color: CLColors.red, radius: 8,
//                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.filled(2, Icon(CupertinoIcons.delete)),
//                   ),
//                 ),
//                 confirmDismiss: (_) => confirmActionDialog(
//                   context: context,
//                   title: '${CLStrings.DELETE} ${contact.name}?',
//                   content: CLStrings.CONFIRM_DELETION,
//                   yesString: CLStrings.DELETE, noString: CLStrings.CANCEL
//                 ),
//                 onDismissed: (direction)async{
//                   final isDeleted = await ref.read(deleteContactProvider.notifier).deleteContact(contact);
//                   //Refresh UI
//                   ref.read(contactsProvider.notifier).loadContacts(delay: 0);

//                   if(context.mounted){
//                     showAppNotification(
//                       context: context,
//                       icon: Icon(
//                         isDeleted ? Icons.check_circle : Icons.warning_rounded,
//                         color: CLColors.white
//                       ),
//                       bgColor: isDeleted ? CLColors.successColor : null,
//                       text: isDeleted ? '${contact.name ?? ''} ${CLStrings.HAS_BEEN_DELETED}'
//                         :'${CLStrings.COULD_NOT_DELETE} ${contact.name ?? ''}',
//                     );
//                   }
//                 },
//                 child: CLContainer(
//                   color: Theme.of(context).scaffoldBackgroundColor,
//                   radius: 8,
//                   margin: const EdgeInsets.only(bottom: 10),
//                   padding: const EdgeInsets.all(10),
//                   border: Border.all(
//                     width: 0.2,
//                     color: Theme.of(context).textTheme.headlineMedium?.color ?? CLColors.hex1B1B1B
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(CupertinoIcons.person_circle, size: 30,),
//                       const SizedBox(width: 15),
//                       Expanded(
//                         child: Column(
//                           spacing: 5,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CLFilterWidget(
//                               title: contact.name ?? '',
//                               providerId: CLStrings.ENTER_SEARCH_KEY,
//                               style: Theme.of(context).textTheme.titleSmall,
//                             ),
//                             Text(
//                               contact.phoneNumber ?? '',
//                               style: Theme.of(context).textTheme.labelMedium,
//                             )
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       NotificationIcon(contact: contact),
//                     ],
//                   ),
//                 ),
//               );
//             }
//           );
//         }
//       ),
//     );
//   }
// }



// class ContactLoadingShimmer extends StatelessWidget {
//   const ContactLoadingShimmer({super.key, required this.parentWidth});
//   final double parentWidth;

//   @override
//   Widget build(BuildContext context) {
//     return CLContainer(
//       color: Theme.of(context).scaffoldBackgroundColor,
//       radius: 8,
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(10),
//       border: Border.all(
//         width: 0.2,
//         color: Theme.of(context).textTheme.headlineMedium?.color ?? CLColors.hex1B1B1B
//       ),
//       child: Row(
//         children: [
//           CLShimmer(height: 30, width: 30, radius: 15),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               spacing: 5,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CLShimmer(
//                   height: 15, radius: 5,
//                   width: CLHelperFuncs.getRandomNumber(parentWidth).toDouble(),
//                 ),
//                 CLShimmer(height: 10, width: 120, radius: 3,)
//               ],
//             ),
//           ),
//           CLShimmer(height: 30, width: 30, radius: 15) 
//         ],
//       ),
//     );
//   }
// }