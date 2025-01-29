// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

class SharedFile {
  /// Image or Video path or text
  /// NOTE. for iOS only the file is always copied
  String? value;

  /// Video thumbnail
  String? thumbnail;

  /// Video duration in milliseconds
  int? duration;

  /// Whether its a video or image or file
  SharedMediaType type = SharedMediaType.OTHER;

  /// Action type
  ActionType action = ActionType.ASK;

  /// Whether its a context menu
  bool isContextMenu = false;

  SharedFile({
    required this.value,
    this.thumbnail,
    this.duration,
    this.type = SharedMediaType.OTHER,
    this.action = ActionType.ASK,
    this.isContextMenu = false,
  });

  SharedFile.fromJson(Map<String, dynamic> json)
      : value = json['value'] ?? json['path'],
        thumbnail = json['thumbnail'],
        duration = json['duration'],
        type = SharedMediaType.values[json['type']],
        action = ActionType.values.byName(json['action']),
        isContextMenu = json['isContextMenu'] ?? false;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'value': value,
      'thumbnail': thumbnail,
      'duration': duration,
      'type': type.name,
      'action': action.name,
      'isContextMenu': isContextMenu,
    };
  }

  @override
  String toString() {
    return 'SharedFile(value: $value, thumbnail: $thumbnail, duration: $duration, type: $type, action: $action, isContextMenu: $isContextMenu)';
  }
}

enum SharedMediaType { TEXT, URL, IMAGE, VIDEO, FILE, OTHER }

enum ActionType {
  ASK,
  SAVE;
}
