import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/injection/injection.dart';
import 'package:weather/core/util/constants.dart';
import 'package:weather/features/forecast/cubits/forecast_cubit/forecast_cubit.dart';
import 'package:weather/features/forecast/presentation/widgets/forecast_tile.dart';
import 'package:weather/features/forecast/presentation/widgets/forecast_view.dart';
import 'package:weather/features/forecast/presentation/widgets/skeleton_placeholder.dart';

@RoutePage()
class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage>
    with WidgetsBindingObserver {
  final _cubit = getIt<ForecastCubit>();
  late PageController _pageController;
  bool _permissionGranted = true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (!_permissionGranted) {
          // _cubit.getForecast(isRetry: true);
        }
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: CustomColors.background,
        child: SafeArea(
          child: BlocProvider(
            create: (_) => _cubit..getForecast(),
            child: BlocConsumer<ForecastCubit, ForecastState>(
              listener: (context, state) => state.maybeMap(
                  orElse: () => null,
                  locationDenied: (_) {
                    _permissionGranted = false;
                    return;
                  },
                  success: (s) {
                    if (_pageController.hasClients &&
                        s.currentForecastIndex != _pageController.page) {
                      _pageController.animateToPage(
                        s.currentForecastIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                    return;
                  }),
              builder: (context, state) => state.map(
                locationDenied: (_) => SkeletonPlaceholder(
                  buttonTitle: 'Enable Location',
                  shimmerEnabled: false,
                  onTap: () => AppSettings.openAppSettings(
                      type: AppSettingsType.location),
                ),
                loading: (_) => const SkeletonPlaceholder(),
                failure: (_) => SkeletonPlaceholder(
                  shimmerEnabled: false,
                  onTap: () => _cubit.getForecast(isRetry: true),
                ),
                success: (s) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                s.weather.location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                DateFormat('E, MMMM d').format(s.weather
                                    .forecasts[s.currentForecastIndex].date),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: s.isRefreshing
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )
                                    : IconButton(
                                        onPressed: () => _cubit.getForecast(),
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(
                                          Icons.refresh,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          s.weather.forecasts.length,
                          (index) => ForecastView(
                            index: index,
                            forecast: s.weather.forecasts[index],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 24,
                        children: List.generate(
                          s.weather.forecasts.length,
                          (index) => ForecastTile(
                            forecast: s.weather.forecasts[index],
                            isSelected: s.currentForecastIndex == index,
                            onTap: () => _cubit.onForecastIndexChanged(index),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
