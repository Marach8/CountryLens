import 'dart:ui';
import 'package:countrylens/src/global_export.dart';

class CLHomeScreen extends StatelessWidget {
  const CLHomeScreen({super.key});

  @override
  Widget build(BuildContext _) {
    final double headerHeight = 70;
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<CountriesBloc>(create: (_) => CountriesBloc(HomeRepoImpl())),
        BlocProvider<SearchkeyBloc>(create: (_) => SearchkeyBloc()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => context.read<CountriesBloc>().fetchCountries()
          );
          return CLAnnotatedRegion(
            child: Scaffold(
              body: SafeArea(
                child: NestedScrollView(
                  floatHeaderSlivers: true,
                  physics: const BouncingScrollPhysics(),
                  headerSliverBuilder: (_, __) => <Widget>[
                    SliverAppBar(
                      floating: true,
                      title: Text(
                        CLStrings.COUNTRY_XPLORER,
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: CLSliverHeader(
                        maxExt: headerHeight, minExt: headerHeight,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: CLContainer(
                              height: headerHeight,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              child: BlocBuilder<CountriesBloc, CLAppState<List<Country>>>(
                                builder: (_, CLAppState<List<Country>> state) {
                                  final bool hasCountries = state is SuccessState<List<Country>> && state.data.isNotEmpty;
                                  final bool isInSearchMode = state is FailureState<List<Country>> && state.type == FailureType.searchFailure;
                                  return CLTextField(
                                    prefixIcon: const Icon(Icons.search, size: 20),
                                    enabled: hasCountries || isInSearchMode,
                                    hintText: CLStrings.SEARCH_COUNTRIES,
                                    onChanged: (String text) => CLHelperFuncs.callDebouncer(
                                      500,
                                      (){
                                        context.read<CountriesBloc>().searchCountries(text);
                                        context.read<SearchkeyBloc>().updateSearchKey(text);
                                      }
                                    )
                                  );
                                }
                              )
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                
                  body: const CountriesList()
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}