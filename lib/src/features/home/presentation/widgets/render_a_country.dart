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
                  title: country.name ?? CLStrings.UNAVAILABLE,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: country.name == null ? CLColors.red : null
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      country.capital ?? CLStrings.UNAVAILABLE,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: country.capital == null ? CLColors.red : null
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        country.continent ?? CLStrings.UNAVAILABLE,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: country.continent == null ? CLColors.red 
                          : context.textTheme.labelMedium?.color?.withValues(alpha: 0.6)
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