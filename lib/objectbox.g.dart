// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/local/objectbox/ToDoRecord.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 4432563677256222154),
      name: 'ToDoRecord',
      lastPropertyId: const IdUid(4, 8351208928148245190),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7545433747765124613),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1344065019265232660),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6541954628373734237),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8351208928148245190),
            name: 'done',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 4432563677256222154),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [3201067195661710600],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        1095283554426810962,
        8823422389742133942,
        352152343764569796,
        8840526516900515115
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ToDoRecord: EntityDefinition<ToDoRecord>(
        model: _entities[0],
        toOneRelations: (ToDoRecord object) => [],
        toManyRelations: (ToDoRecord object) => {},
        getId: (ToDoRecord object) => object.id,
        setId: (ToDoRecord object, int id) {
          object.id = id;
        },
        objectToFB: (ToDoRecord object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addInt64(2, object.createdAt.millisecondsSinceEpoch);
          fbb.addBool(3, object.done);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ToDoRecord()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..title =
                const fb.StringReader().vTableGet(buffer, rootOffset, 6, '')
            ..createdAt = DateTime.fromMillisecondsSinceEpoch(
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0))
            ..done =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 10, false);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ToDoRecord] entity fields to define ObjectBox queries.
class ToDoRecord_ {
  /// see [ToDoRecord.id]
  static final id =
      QueryIntegerProperty<ToDoRecord>(_entities[0].properties[0]);

  /// see [ToDoRecord.title]
  static final title =
      QueryStringProperty<ToDoRecord>(_entities[0].properties[1]);

  /// see [ToDoRecord.createdAt]
  static final createdAt =
      QueryIntegerProperty<ToDoRecord>(_entities[0].properties[2]);

  /// see [ToDoRecord.done]
  static final done =
      QueryBooleanProperty<ToDoRecord>(_entities[0].properties[3]);
}
