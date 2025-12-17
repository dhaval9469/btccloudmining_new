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
  String? hashrate;
  String? power;
  String? efficiency;
  int? adTime;
  String? image;
  bool? planads;
  String? description;
  List<Plans>? plans;

  ListPlan({
    this.planName,
    this.hashrate,
    this.power,
    this.efficiency,
    this.adTime,
    this.image,
    this.planads,
    this.description,
    this.plans,
  });

  ListPlan.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    hashrate = json['hashrate'];
    power = json['power'];
    efficiency = json['efficiency'];
    adTime = json['adTime'];
    image = json['image'];
    planads = json['planads'];
    description = json['description'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planName'] = planName;
    data['hashrate'] = hashrate;
    data['power'] = power;
    data['efficiency'] = efficiency;
    data['adTime'] = adTime;
    data['image'] = image;
    data['planads'] = planads;
    data['description'] = description;
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  String? planId;
  String? validity;
  int? renetalDays;
  String? amount;
  int? discount;
  int? durationSeconds;
  String? description;

  Plans({
    this.planId,
    this.validity,
    this.renetalDays,
    this.amount,
    this.discount,
    this.durationSeconds,
    this.description,
  });

  Plans.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    validity = json['validity'];
    renetalDays = json['renetalDays'];
    amount = json['amount'].toString();
    discount = json['discount'];
    durationSeconds = json['durationSeconds'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planId'] = planId;
    data['validity'] = validity;
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
