class Cases {
  CountriesRoute? countriesRoute;
  CountriesRoute? countryDayOneRoute;
  CountriesRoute? countryDayOneTotalRoute;
  CountriesRoute? countryRoute;
  CountriesRoute? countryRoutePremium;
  CountriesRoute? countryRoutePremiumData;
  CountriesRoute? countryStatusDayOneLiveRoute;
  CountriesRoute? countryStatusDayOneRoute;
  CountriesRoute? countryStatusDayOneTotalRoute;
  CountriesRoute? countryStatusLiveRoute;
  CountriesRoute? countryStatusRoute;
  CountriesRoute? countryStatusTotalRoute;
  CountriesRoute? countrySummaryRoutePremium;
  CountriesRoute? countryTestingPremium;
  CountriesRoute? countryTotalRoute;
  CountriesRoute? exportRoute;
  CountriesRoute? liveCountryRoute;
  CountriesRoute? liveCountryStatusAfterDateRoute;
  CountriesRoute? liveCountryStatusRoute;
  CountriesRoute? summaryRoute;
  CountriesRoute? travelAdvicePremium;
  CountriesRoute? webhookRoute;

  Cases(
      {this.countriesRoute,
      this.countryDayOneRoute,
      this.countryDayOneTotalRoute,
      this.countryRoute,
      this.countryRoutePremium,
      this.countryRoutePremiumData,
      this.countryStatusDayOneLiveRoute,
      this.countryStatusDayOneRoute,
      this.countryStatusDayOneTotalRoute,
      this.countryStatusLiveRoute,
      this.countryStatusRoute,
      this.countryStatusTotalRoute,
      this.countrySummaryRoutePremium,
      this.countryTestingPremium,
      this.countryTotalRoute,
      this.exportRoute,
      this.liveCountryRoute,
      this.liveCountryStatusAfterDateRoute,
      this.liveCountryStatusRoute,
      this.summaryRoute,
      this.travelAdvicePremium,
      this.webhookRoute});

  Cases.fromJson(Map<String, dynamic> json) {
    countriesRoute = json['countriesRoute'] != null
        ? CountriesRoute?.fromJson(json['countriesRoute'])
        : null;
    countryDayOneRoute = json['countryDayOneRoute'] != null
        ? CountriesRoute?.fromJson(json['countryDayOneRoute'])
        : null;
    countryDayOneTotalRoute = json['countryDayOneTotalRoute'] != null
        ? CountriesRoute?.fromJson(json['countryDayOneTotalRoute'])
        : null;
    countryRoute = json['countryRoute'] != null
        ? CountriesRoute?.fromJson(json['countryRoute'])
        : null;
    countryRoutePremium = json['countryRoutePremium'] != null
        ? CountriesRoute?.fromJson(json['countryRoutePremium'])
        : null;
    countryRoutePremiumData = json['countryRoutePremiumData'] != null
        ? CountriesRoute?.fromJson(json['countryRoutePremiumData'])
        : null;
    countryStatusDayOneLiveRoute = json['countryStatusDayOneLiveRoute'] != null
        ? CountriesRoute?.fromJson(json['countryStatusDayOneLiveRoute'])
        : null;
    countryStatusDayOneRoute = json['countryStatusDayOneRoute'] != null
        ? CountriesRoute?.fromJson(json['countryStatusDayOneRoute'])
        : null;
    countryStatusDayOneTotalRoute =
        json['countryStatusDayOneTotalRoute'] != null
            ? CountriesRoute?.fromJson(json['countryStatusDayOneTotalRoute'])
            : null;
    countryStatusLiveRoute = json['countryStatusLiveRoute'] != null
        ? CountriesRoute?.fromJson(json['countryStatusLiveRoute'])
        : null;
    countryStatusRoute = json['countryStatusRoute'] != null
        ? CountriesRoute?.fromJson(json['countryStatusRoute'])
        : null;
    countryStatusTotalRoute = json['countryStatusTotalRoute'] != null
        ? CountriesRoute?.fromJson(json['countryStatusTotalRoute'])
        : null;
    countrySummaryRoutePremium = json['countrySummaryRoutePremium'] != null
        ? CountriesRoute?.fromJson(json['countrySummaryRoutePremium'])
        : null;
    countryTestingPremium = json['countryTestingPremium'] != null
        ? CountriesRoute?.fromJson(json['countryTestingPremium'])
        : null;
    countryTotalRoute = json['countryTotalRoute'] != null
        ? CountriesRoute?.fromJson(json['countryTotalRoute'])
        : null;
    exportRoute = json['exportRoute'] != null
        ? CountriesRoute?.fromJson(json['exportRoute'])
        : null;
    liveCountryRoute = json['liveCountryRoute'] != null
        ? CountriesRoute?.fromJson(json['liveCountryRoute'])
        : null;
    liveCountryStatusAfterDateRoute =
        json['liveCountryStatusAfterDateRoute'] != null
            ? CountriesRoute?.fromJson(json['liveCountryStatusAfterDateRoute'])
            : null;
    liveCountryStatusRoute = json['liveCountryStatusRoute'] != null
        ? CountriesRoute?.fromJson(json['liveCountryStatusRoute'])
        : null;
    summaryRoute = json['summaryRoute'] != null
        ? CountriesRoute?.fromJson(json['summaryRoute'])
        : null;
    travelAdvicePremium = json['travelAdvicePremium'] != null
        ? CountriesRoute?.fromJson(json['travelAdvicePremium'])
        : null;
    webhookRoute = json['webhookRoute'] != null
        ? CountriesRoute?.fromJson(json['webhookRoute'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (countriesRoute != null) {
      data['countriesRoute'] = countriesRoute?.toJson();
    }
    if (countryDayOneRoute != null) {
      data['countryDayOneRoute'] = countryDayOneRoute?.toJson();
    }
    if (countryDayOneTotalRoute != null) {
      data['countryDayOneTotalRoute'] = countryDayOneTotalRoute?.toJson();
    }
    if (countryRoute != null) {
      data['countryRoute'] = countryRoute?.toJson();
    }
    if (countryRoutePremium != null) {
      data['countryRoutePremium'] = countryRoutePremium?.toJson();
    }
    if (countryRoutePremiumData != null) {
      data['countryRoutePremiumData'] = countryRoutePremiumData?.toJson();
    }
    if (countryStatusDayOneLiveRoute != null) {
      data['countryStatusDayOneLiveRoute'] =
          countryStatusDayOneLiveRoute?.toJson();
    }
    if (countryStatusDayOneRoute != null) {
      data['countryStatusDayOneRoute'] = countryStatusDayOneRoute?.toJson();
    }
    if (countryStatusDayOneTotalRoute != null) {
      data['countryStatusDayOneTotalRoute'] =
          countryStatusDayOneTotalRoute?.toJson();
    }
    if (countryStatusLiveRoute != null) {
      data['countryStatusLiveRoute'] = countryStatusLiveRoute?.toJson();
    }
    if (countryStatusRoute != null) {
      data['countryStatusRoute'] = countryStatusRoute?.toJson();
    }
    if (countryStatusTotalRoute != null) {
      data['countryStatusTotalRoute'] = countryStatusTotalRoute?.toJson();
    }
    if (countrySummaryRoutePremium != null) {
      data['countrySummaryRoutePremium'] = countrySummaryRoutePremium?.toJson();
    }
    if (countryTestingPremium != null) {
      data['countryTestingPremium'] = countryTestingPremium?.toJson();
    }
    if (countryTotalRoute != null) {
      data['countryTotalRoute'] = countryTotalRoute?.toJson();
    }
    if (exportRoute != null) {
      data['exportRoute'] = exportRoute?.toJson();
    }
    if (liveCountryRoute != null) {
      data['liveCountryRoute'] = liveCountryRoute?.toJson();
    }
    if (liveCountryStatusAfterDateRoute != null) {
      data['liveCountryStatusAfterDateRoute'] =
          liveCountryStatusAfterDateRoute?.toJson();
    }
    if (liveCountryStatusRoute != null) {
      data['liveCountryStatusRoute'] = liveCountryStatusRoute?.toJson();
    }
    if (summaryRoute != null) {
      data['summaryRoute'] = summaryRoute?.toJson();
    }
    if (travelAdvicePremium != null) {
      data['travelAdvicePremium'] = travelAdvicePremium?.toJson();
    }
    if (webhookRoute != null) {
      data['webhookRoute'] = webhookRoute?.toJson();
    }
    return data;
  }
}

class CountriesRoute {
  String? name;
  String? description;
  String? path;

  CountriesRoute({this.name, this.description, this.path});

  CountriesRoute.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Name'] = name;
    data['Description'] = description;
    data['Path'] = path;
    return data;
  }
}
