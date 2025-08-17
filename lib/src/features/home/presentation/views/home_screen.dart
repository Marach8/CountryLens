import 'dart:ui';
import 'package:countrylens/src/global_export.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter_bloc/flutter_bloc.dart';


class CLHomeScreen extends StatefulWidget {
  const CLHomeScreen({super.key});

  @override
  State<CLHomeScreen> createState() => _CLHomeScreenState();
}

class _CLHomeScreenState extends State<CLHomeScreen> {

  @override
  Widget build(BuildContext _) {

    return BlocProvider(
      create: (_) => CountriesBloc(HomeRepoImpl()),
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
          
                  body: Container()
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
