class StorePlanModel {
  String? planName;
  String? name;
  String? hashrate;
  String? power;
  String? efficiency;
  String? algorithm;
  List<PlanDetails>? planDetails;

  StorePlanModel(
      {this.planName,
        this.name,
        this.hashrate,
        this.power,
        this.efficiency,
        this.algorithm,
        this.planDetails});

  StorePlanModel.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    name = json['name'];
    hashrate = json['hashrate'];
    power = json['power'];
    efficiency = json['efficiency'];
    algorithm = json['algorithm'];
    if (json['planDetails'] != null) {
      planDetails = <PlanDetails>[];
      json['planDetails'].forEach((v) {
        planDetails!.add(PlanDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planName'] = planName;
    data['name'] = name;
    data['hashrate'] = hashrate;
    data['power'] = power;
    data['efficiency'] = efficiency;
    data['algorithm'] = algorithm;
    if (planDetails != null) {
      data['planDetails'] = planDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanDetails {
  String? planId;
  int? renetalDays;
  int? price;
  int? durationSeconds;

  PlanDetails(
      {this.planId, this.renetalDays, this.price, this.durationSeconds});

  PlanDetails.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    renetalDays = json['renetalDays'];
    price = json['price'];
    durationSeconds = json['durationSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planId'] = planId;
    data['renetalDays'] = renetalDays;
    data['price'] = price;
    data['durationSeconds'] = durationSeconds;
    return data;
  }
}

class WatchRewardModel {
  String? name;
  String? hashrate;
  int? duration;

  WatchRewardModel({this.name, this.hashrate, this.duration});

  WatchRewardModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hashrate = json['hashrate'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['hashrate'] = hashrate;
    data['duration'] = duration;
    return data;
  }
}
