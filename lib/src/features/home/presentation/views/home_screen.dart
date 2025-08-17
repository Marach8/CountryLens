import 'dart:ui';
import 'package:countrylens/src/global_export.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;

class CLHomeScreen extends StatelessWidget {
  const CLHomeScreen({super.key});

  @override
  Widget build(BuildContext _) {
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
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: CLSliverHeader(
                        maxExt: 70, minExt: 70,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: const CLContainer(
                              height: 70,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: CLTextField(
                                prefixIcon: Icon(CupertinoIcons.search, size: 20),
                                enabled: true,
                                hintText: CLStrings.ENTER_SEARCH_KEY,
                                // onChanged: (text) => CLHelperFuncs.callDebouncer(
                                //   500,
                                //   () => ref.read(contactsProvider.notifier).filterContacts(text.trim())
                                // )
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