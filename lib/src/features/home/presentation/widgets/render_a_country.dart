import 'package:countrylens/src/global_export.dart';

class RenderACountry extends StatelessWidget {
  const RenderACountry({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return CLContainer(
      color: Theme.of(context).scaffoldBackgroundColor,
      radius: 8, margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      border: Border.all(
        width: 0.2,
        color: Theme.of(context).textTheme.headlineMedium?.color ?? CLColors.hex1B1B1B
      ),
      child: Row(
        children: <Widget>[
          Text(
            country.emoji ?? '',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CLFilterWidget<SearchkeyBloc>(
                  title: country.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  country.capital ?? '',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}