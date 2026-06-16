class SubDetailsModel {
  bool? purchase;
  List<ListPlan>? listPlan;
  List<ListReward>? listReward;
  List<Leaderboard>? leaderboard;

  SubDetailsModel({this.purchase, this.listPlan,  this.listReward, this.leaderboard});

  SubDetailsModel.fromJson(Map<String, dynamic> json) {
    purchase = json['purchase'];
    if (json['ListPlan'] != null) {
      listPlan = <ListPlan>[];
      json['ListPlan'].forEach((v) {
        listPlan!.add(ListPlan.fromJson(v));
      });
    }
    if (json['ListReward'] != null) {
      listReward = <ListReward>[];
      json['ListReward'].forEach((v) {
        listReward!.add(ListReward.fromJson(v));
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
    if (listReward != null) {
      data['ListReward'] = listReward!.map((v) => v.toJson()).toList();
    }
    if (leaderboard != null) {
      data['leaderboard'] = leaderboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // ✅ copyWith
  SubDetailsModel copyWith({
    bool? purchase,
    List<ListPlan>? listPlan,
    List<Leaderboard>? leaderboard,
  }) {
    return SubDetailsModel(
      purchase: purchase ?? this.purchase,
      listPlan: listPlan ?? this.listPlan,
      leaderboard: leaderboard ?? this.leaderboard,
    );
  }
}

class ListPlan {
  String? planName;
  String? hashrate;
  String? efficiency;
  String? miningBoost;
  int? adTime;
  String? image;
  bool? planads;
  String? description;
  List<Plans>? plans;

  ListPlan({
    this.planName,
    this.hashrate,
    this.efficiency,
    this.miningBoost,
    this.adTime,
    this.image,
    this.planads,
    this.description,
    this.plans,
  });

  ListPlan.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    hashrate = json['hashrate'];
    efficiency = json['efficiency'];
    miningBoost = json['Mining_boost'];
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
    data['efficiency'] = efficiency;
    data['Mining_boost'] = miningBoost;
    data['adTime'] = adTime;
    data['image'] = image;
    data['planads'] = planads;
    data['description'] = description;
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // ✅ copyWith
  ListPlan copyWith({
    String? planName,
    String? hashrate,
    String? efficiency,
    String? miningBoost,
    int? adTime,
    String? image,
    bool? planads,
    String? description,
    List<Plans>? plans,
  }) {
    return ListPlan(
      planName: planName ?? this.planName,
      hashrate: hashrate ?? this.hashrate,
      efficiency: efficiency ?? this.efficiency,
      miningBoost: miningBoost ?? this.miningBoost,
      adTime: adTime ?? this.adTime,
      image: image ?? this.image,
      planads: planads ?? this.planads,
      description: description ?? this.description,
      plans: plans ?? this.plans,
    );
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
    amount = json['amount'];
    discount = json['discount'];
    durationSeconds = json['durationSeconds'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planId'] = planId;
    data['validity'] = validity;
    data['renetalDays'] = renetalDays;
    data['amount'] = amount;
    data['discount'] = discount;
    data['durationSeconds'] = durationSeconds;
    data['description'] = description;
    return data;
  }

  // ✅ copyWith
  Plans copyWith({
    String? planId,
    String? validity,
    int? renetalDays,
    String? amount,
    int? discount,
    int? durationSeconds,
    String? description,
  }) {
    return Plans(
      planId: planId ?? this.planId,
      validity: validity ?? this.validity,
      renetalDays: renetalDays ?? this.renetalDays,
      amount: amount ?? this.amount,
      discount: discount ?? this.discount,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      description: description ?? this.description,
    );
  }
}

class ListReward {
  String? rewardName;
  String? task;
  String? reward;
  String? rewardUnit;
  int? time;
  String? rewardType;
  int? renewTime;
  bool? availble;

  ListReward(
      {this.rewardName,
        this.task,
        this.reward,
        this.rewardUnit,
        this.time,
        this.rewardType,
        this.renewTime,
        this.availble});

  ListReward.fromJson(Map<String, dynamic> json) {
    rewardName = json['reward_name'];
    task = json['task'];
    reward = json['reward'];
    rewardUnit = json['reward_unit'];
    time = json['time'];
    rewardType = json['reward_type'];
    renewTime = json['renew_time'];
    availble = json['availble'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reward_name'] = rewardName;
    data['task'] = task;
    data['reward'] = reward;
    data['reward_unit'] = rewardUnit;
    data['time'] = time;
    data['reward_type'] = rewardType;
    data['renew_time'] = renewTime;
    data['availble'] = availble;
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
