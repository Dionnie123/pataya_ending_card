import 'package:hive/hive.dart';
import 'package:pataya_ending_card/app/models/ecard.dart';
import 'package:pataya_ending_card/app/models/slot.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

class ECardService with ListenableServiceMixin, Initialisable {
  static ECardService? _instance;
  static late Box _box;

  @override
  Future<void> initialise() async {
    Hive.registerAdapter<ECard>(ECardAdapter());
    Hive.registerAdapter<Slot>(SlotAdapter());
    _box = await Hive.openBox<ECard>("cards");

    _instance ??= ECardService();
  }

  ECardService() {
    listenToReactiveValues([
      _ecards,
    ]);
  }
  String tableName = 'cards';
  final ReactiveValue<List<ECard>> _ecards = ReactiveValue<List<ECard>>([]);
  final uuid = const Uuid();

  List<ECard> get cards => _ecards.value;

  Future getAll() async {
    _ecards.value = _box.values.toList().cast<ECard>();
    notifyListeners();
  }

  Future create(ECard card) async {
    final id = uuid.v4();
    final dateCreated = DateTime.now();
    _ecards.value.add(card.copyWith(id: id, createdAt: dateCreated));
    await _box.add(card.copyWith(id: id, createdAt: dateCreated));

    notifyListeners();
  }

  Future update(ECard card) async {
    final dateCreated = DateTime.now();
    final index = _ecards.value.indexWhere((e) => e.id == card.id);
    _ecards.value[index] = card.copyWith(createdAt: dateCreated);

    int i = _box.values
        .toList()
        .cast<ECard>()
        .lastIndexWhere((e) => e.id == card.id);

    await _box.putAt(i, card.copyWith(updatedAt: dateCreated));

    notifyListeners();
  }

  Future delete(String? id) async {
    int i =
        _box.values.toList().cast<ECard>().lastIndexWhere((e) => e.id == id);

    _ecards.value.removeWhere((e) => e.id == id);
    await _box.deleteAt(i);
    notifyListeners();
  }
}
