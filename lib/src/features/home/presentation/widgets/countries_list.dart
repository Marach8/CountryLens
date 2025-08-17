import '../../../../global_export.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CLAppState<List<Country>>>(
      builder: (_, CLAppState<List<Country>> state) {
        return switch (state) {
          InitialState<List<Country>>() || LoadingState<List<Country>>() => const Center(
            child: CLLoadingIndicator()
          ),
          SuccessState<List<Country>>(data: final List<Country> countries, message: _) => ListView.builder(
            padding: const EdgeInsets.only(left: 15, right: 15),
            itemCount: countries.length,
            itemBuilder: (_, int index) {
              final Country country = countries.elementAt(index);
              return RenderACountry(country: country);
            },
          ),
          FailureState<List<Country>>(message: final String? msg, oldData: _) => Center(
            child: Text(msg ?? 'Something went wrong'),
          ),
        };
      },
    );
  }
}
