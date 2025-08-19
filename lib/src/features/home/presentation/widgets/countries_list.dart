import '../../../../global_export.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CLAppState<List<Country>>>(
      builder: (_, CLAppState<List<Country>> state) {
        return switch (state) {
          InitialState<List<Country>>() || LoadingState<List<Country>>() => const Center(
            child: CLLoadingIndicator(size: 40,)
          ),
          SuccessState<List<Country>>(data: final List<Country> countries, message: _) => CLRefreshIndicator(
            onRefresh: () => context.read<CountriesBloc>().fetchCountries(),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemCount: countries.length,
              itemBuilder: (_, int index) {
                final Country country = countries.elementAt(index);
                return RenderACountry(country: country);
              },
            ),
          ),
          FailureState<List<Country>>(message: _, oldData: _, type: final FailureType type) => Center(
            child: switch(type){
              FailureType.apiCallFailure || FailureType.unknownFailure => RetryBtn(
                onRetry: () => context.read<CountriesBloc>().fetchCountries()
              ),
              FailureType.searchFailure => SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.search_off_outlined, size: 100,),
                    const SizedBox(height: 10,),
                    Text(
                      CLStrings.NO_SEARCH_RESULTS,
                      style: context.textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            },
          ),
        };
      },
    );
  }
}
