import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app/globalbasestate/state.dart';
import 'package:flutter_app/globalbasestate/store.dart';
import 'package:flutter_app/views/animation_detail_page/page.dart';
import 'package:flutter_app/views/home_page/page.dart';
import 'package:flutter_app/views/main_page/page.dart';
import 'package:flutter_app/views/player_page/page.dart';
import 'package:flutter_app/views/search_page/page.dart';
import 'package:flutter_app/views/week_page/page.dart';



class Routes{
  static final PageRoutes routes=PageRoutes(
      pages:<String,Page<Object,dynamic>>{
        'mainpage':MainPage(),
        'homepage':HomePage(),
        'detailpage':AnimationDetailPage(),
        'playerPage':PlayerPage(),
        'weekPage':AnimationWeekPage(),
        'searchPage':AnimationSearchPage(),
      },
    visitor: (String path, Page<Object, dynamic> page) {
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pagestate, GlobalState appState) {
              final GlobalBaseState p = pagestate;
              if (p.themeColor != appState.themeColor) {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.themeColor = appState.themeColor;

                  return newState;
                }
              }
              return pagestate;
            });
      }
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );

}


EffectMiddleware<T> _pageAnalyticsMiddleware<T>() {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}