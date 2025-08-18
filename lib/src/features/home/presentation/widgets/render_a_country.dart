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
        color: context.textTheme.headlineMedium?.color ?? CLColors.hex1B1B1B
      ),
      child: Row(
        children: <Widget>[
          Text(
            country.emoji ?? '',
            style: context.textTheme.displaySmall,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CLFilterWidget<SearchkeyBloc>(
                  title: country.name ?? '',
                  style: context.textTheme.titleSmall,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      country.capital ?? '',
                      style: context.textTheme.labelMedium,
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        country.continent ?? '',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.textTheme.labelMedium?.color?.withValues(alpha: 0.6)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}