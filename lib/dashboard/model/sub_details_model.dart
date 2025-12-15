class SubDetailsModel {
  bool? purchase;
  List<ListPlan>? listPlan;
  List<Leaderboard>? leaderboard;

  SubDetailsModel({this.purchase, this.listPlan, this.leaderboard});

  SubDetailsModel.fromJson(Map<String, dynamic> json) {
    purchase = json['purchase'];
    if (json['ListPlan'] != null) {
      listPlan = <ListPlan>[];
      json['ListPlan'].forEach((v) {
        listPlan!.add(ListPlan.fromJson(v));
      });
    }
    if (json['leaderboard'] != null) {
      leaderboard = <Leaderboard>[];
      json['leaderboard'].forEach((v) {
        leaderboard!.add(Leaderboard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchase'] = purchase;
    if (listPlan != null) {
      data['ListPlan'] = listPlan!.map((v) => v.toJson()).toList();
    }
    if (leaderboard != null) {
      data['leaderboard'] = leaderboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListPlan {
  String? planName;
  String? name;
  String? hashrate;
  String? power;
  String? efficiency;
  String? algorithm;
  String? image;
  int? adTime;
  List<Plans>? plans;
  bool? planads;

  ListPlan({
    this.planName,
    this.name,
    this.hashrate,
    this.power,
    this.efficiency,
    this.algorithm,
    this.image,
    this.adTime,
    this.plans,
    this.planads,
  });

  ListPlan.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    name = json['name'];
    hashrate = json['hashrate'];
    power = json['power'];
    efficiency = json['efficiency'];
    algorithm = json['algorithm'];
    image = json['image'];
    adTime = json['adTime'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
    planads = json['planads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planName'] = planName;
    data['name'] = name;
    data['hashrate'] = hashrate;
    data['power'] = power;
    data['efficiency'] = efficiency;
    data['algorithm'] = algorithm;
    data['image'] = image;
    data['adTime'] = adTime;
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    data['planads'] = planads;

    return data;
  }
}

class Plans {
  String? planId;
  int? renetalDays;
  String? amount;
  int? discount;
  int? durationSeconds;
  String? description;

  Plans({
    this.planId,
    this.renetalDays,
    this.amount,
    this.discount,
    this.durationSeconds,
    this.description,
  });

  Plans.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    renetalDays = json['renetalDays'];
    amount = json['amount'].toString();
    discount = json['discount'];
    durationSeconds = json['durationSeconds'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planId'] = planId;
    data['renetalDays'] = renetalDays;
    data['amount'] = amount.toString();
    data['discount'] = discount;
    data['durationSeconds'] = durationSeconds;
    data['description'] = description;
    return data;
  }
}

class Leaderboard {
  String? name;
  String? btc;
  String? message;

  Leaderboard({this.name, this.btc, this.message});

  Leaderboard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    btc = json['btc'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['btc'] = btc;
    data['message'] = message;
    return data;
  }
}
