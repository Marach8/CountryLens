import '../global_export.dart';

class CLFilterWidget<B extends BlocBase<String>> extends StatelessWidget{

  const CLFilterWidget({
    super.key,
    required this.title,
    required this.style,
    this.padLeft,
    this.padRight,
  });
  final String title;
  final TextStyle? style;
  final String? padLeft, padRight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, String>(
      builder: (_, String state) {
        final Characters characters = title.trim().characters;

        return Text.rich(
          TextSpan(
            children: <InlineSpan>[
              if (padLeft != null) TextSpan(
                text: padLeft,
                style: style,
              ),
              ...characters.map(
                (String char) {
                  final bool shouldHighlightString = state.toLowerCase().contains(char.toLowerCase());
                  return TextSpan(
                    text: char,
                    style: shouldHighlightString 
                      ? style?.copyWith(color: CLColors.hex307FE2)
                      : style,
                  );
                },
              ),
              if (padRight != null) TextSpan(
                text: padRight,
                style: style,
              ),
            ],
          ),
        );
      },
    );
  }
}



class SearchkeyBloc extends Cubit<String>{
  SearchkeyBloc() : super('');

  void updateSearchKey(String searchKey) => emit(searchKey);

  void resetSearch() => emit('');
}