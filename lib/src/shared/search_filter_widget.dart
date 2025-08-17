// import '../global_export.dart';

// class CLFilterWidget extends ConsumerWidget {
//   final String title;
//   final String providerId;
//   final TextStyle? style;
//   final String? padLeft, padRight;

//   const CLFilterWidget({
//     super.key,
//     required this.title,
//     required this.providerId,
//     required this.style,
//     this.padLeft, 
//     this.padRight
//   });

//   @override
//   Widget build(context, ref) {
//     final searchQuery = ref.watch(stringProvider(providerId));
//     final listOfStrings = title.trim().split('');

//     return Text.rich(
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//       TextSpan(
//         children: [
//           if(padLeft != null) TextSpan(
//             text: padLeft,
//             style:style                              
//           ),
//           ...listOfStrings.map(
//             (stringOfText){
//               final shouldHighlightString = searchQuery.contains(stringOfText.toLowerCase());
//               return TextSpan(
//                 text: stringOfText,
//                 style: shouldHighlightString ? style?.copyWith(
//                   color: CLColors.successColor
//                 ) : style                              
//               );
//             }
//           ),
//           if(padRight != null) TextSpan(
//             text: padRight,
//             style:style                              
//           ),
//         ]
//       )
//     );
//   }
// }