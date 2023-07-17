// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromptRecord> _$promptRecordSerializer =
    new _$PromptRecordSerializer();

class _$PromptRecordSerializer implements StructuredSerializer<PromptRecord> {
  @override
  final Iterable<Type> types = const [PromptRecord, _$PromptRecord];
  @override
  final String wireName = 'PromptRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromptRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.avatarName;
    if (value != null) {
      result
        ..add('AvatarName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.controlnetInputImage;
    if (value != null) {
      result
        ..add('ControlnetInputImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.positivePrompt;
    if (value != null) {
      result
        ..add('PositivePrompt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.negativePrompt;
    if (value != null) {
      result
        ..add('NegativePrompt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.steps;
    if (value != null) {
      result
        ..add('Steps')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seed;
    if (value != null) {
      result
        ..add('Seed')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.aspectRatio;
    if (value != null) {
      result
        ..add('AspectRatio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.faceCorrection;
    if (value != null) {
      result
        ..add('FaceCorrection')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.superResolution;
    if (value != null) {
      result
        ..add('Super-resolution')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainImage;
    if (value != null) {
      result
        ..add('MainImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paragraph;
    if (value != null) {
      result
        ..add('Paragraph')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cfg;
    if (value != null) {
      result
        ..add('CFG')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.avatarPosterPhoto;
    if (value != null) {
      result
        ..add('AvatarPosterPhoto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.controlnetHint;
    if (value != null) {
      result
        ..add('controlnet_hint')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PromptRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromptRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'AvatarName':
          result.avatarName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ControlnetInputImage':
          result.controlnetInputImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PositivePrompt':
          result.positivePrompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'NegativePrompt':
          result.negativePrompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Steps':
          result.steps = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Seed':
          result.seed = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'AspectRatio':
          result.aspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'FaceCorrection':
          result.faceCorrection = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Super-resolution':
          result.superResolution = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'MainImage':
          result.mainImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Paragraph':
          result.paragraph = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'CFG':
          result.cfg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'AvatarPosterPhoto':
          result.avatarPosterPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'controlnet_hint':
          result.controlnetHint = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PromptRecord extends PromptRecord {
  @override
  final String? avatarName;
  @override
  final String? controlnetInputImage;
  @override
  final String? positivePrompt;
  @override
  final String? negativePrompt;
  @override
  final int? steps;
  @override
  final int? seed;
  @override
  final String? aspectRatio;
  @override
  final bool? faceCorrection;
  @override
  final bool? superResolution;
  @override
  final String? category;
  @override
  final String? mainImage;
  @override
  final String? paragraph;
  @override
  final double? cfg;
  @override
  final String? avatarPosterPhoto;
  @override
  final String? controlnetHint;
  @override
  final String? gender;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromptRecord([void Function(PromptRecordBuilder)? updates]) =>
      (new PromptRecordBuilder()..update(updates))._build();

  _$PromptRecord._(
      {this.avatarName,
      this.controlnetInputImage,
      this.positivePrompt,
      this.negativePrompt,
      this.steps,
      this.seed,
      this.aspectRatio,
      this.faceCorrection,
      this.superResolution,
      this.category,
      this.mainImage,
      this.paragraph,
      this.cfg,
      this.avatarPosterPhoto,
      this.controlnetHint,
      this.gender,
      this.ffRef})
      : super._();

  @override
  PromptRecord rebuild(void Function(PromptRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromptRecordBuilder toBuilder() => new PromptRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromptRecord &&
        avatarName == other.avatarName &&
        controlnetInputImage == other.controlnetInputImage &&
        positivePrompt == other.positivePrompt &&
        negativePrompt == other.negativePrompt &&
        steps == other.steps &&
        seed == other.seed &&
        aspectRatio == other.aspectRatio &&
        faceCorrection == other.faceCorrection &&
        superResolution == other.superResolution &&
        category == other.category &&
        mainImage == other.mainImage &&
        paragraph == other.paragraph &&
        cfg == other.cfg &&
        avatarPosterPhoto == other.avatarPosterPhoto &&
        controlnetHint == other.controlnetHint &&
        gender == other.gender &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, avatarName.hashCode);
    _$hash = $jc(_$hash, controlnetInputImage.hashCode);
    _$hash = $jc(_$hash, positivePrompt.hashCode);
    _$hash = $jc(_$hash, negativePrompt.hashCode);
    _$hash = $jc(_$hash, steps.hashCode);
    _$hash = $jc(_$hash, seed.hashCode);
    _$hash = $jc(_$hash, aspectRatio.hashCode);
    _$hash = $jc(_$hash, faceCorrection.hashCode);
    _$hash = $jc(_$hash, superResolution.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, mainImage.hashCode);
    _$hash = $jc(_$hash, paragraph.hashCode);
    _$hash = $jc(_$hash, cfg.hashCode);
    _$hash = $jc(_$hash, avatarPosterPhoto.hashCode);
    _$hash = $jc(_$hash, controlnetHint.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromptRecord')
          ..add('avatarName', avatarName)
          ..add('controlnetInputImage', controlnetInputImage)
          ..add('positivePrompt', positivePrompt)
          ..add('negativePrompt', negativePrompt)
          ..add('steps', steps)
          ..add('seed', seed)
          ..add('aspectRatio', aspectRatio)
          ..add('faceCorrection', faceCorrection)
          ..add('superResolution', superResolution)
          ..add('category', category)
          ..add('mainImage', mainImage)
          ..add('paragraph', paragraph)
          ..add('cfg', cfg)
          ..add('avatarPosterPhoto', avatarPosterPhoto)
          ..add('controlnetHint', controlnetHint)
          ..add('gender', gender)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromptRecordBuilder
    implements Builder<PromptRecord, PromptRecordBuilder> {
  _$PromptRecord? _$v;

  String? _avatarName;
  String? get avatarName => _$this._avatarName;
  set avatarName(String? avatarName) => _$this._avatarName = avatarName;

  String? _controlnetInputImage;
  String? get controlnetInputImage => _$this._controlnetInputImage;
  set controlnetInputImage(String? controlnetInputImage) =>
      _$this._controlnetInputImage = controlnetInputImage;

  String? _positivePrompt;
  String? get positivePrompt => _$this._positivePrompt;
  set positivePrompt(String? positivePrompt) =>
      _$this._positivePrompt = positivePrompt;

  String? _negativePrompt;
  String? get negativePrompt => _$this._negativePrompt;
  set negativePrompt(String? negativePrompt) =>
      _$this._negativePrompt = negativePrompt;

  int? _steps;
  int? get steps => _$this._steps;
  set steps(int? steps) => _$this._steps = steps;

  int? _seed;
  int? get seed => _$this._seed;
  set seed(int? seed) => _$this._seed = seed;

  String? _aspectRatio;
  String? get aspectRatio => _$this._aspectRatio;
  set aspectRatio(String? aspectRatio) => _$this._aspectRatio = aspectRatio;

  bool? _faceCorrection;
  bool? get faceCorrection => _$this._faceCorrection;
  set faceCorrection(bool? faceCorrection) =>
      _$this._faceCorrection = faceCorrection;

  bool? _superResolution;
  bool? get superResolution => _$this._superResolution;
  set superResolution(bool? superResolution) =>
      _$this._superResolution = superResolution;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _mainImage;
  String? get mainImage => _$this._mainImage;
  set mainImage(String? mainImage) => _$this._mainImage = mainImage;

  String? _paragraph;
  String? get paragraph => _$this._paragraph;
  set paragraph(String? paragraph) => _$this._paragraph = paragraph;

  double? _cfg;
  double? get cfg => _$this._cfg;
  set cfg(double? cfg) => _$this._cfg = cfg;

  String? _avatarPosterPhoto;
  String? get avatarPosterPhoto => _$this._avatarPosterPhoto;
  set avatarPosterPhoto(String? avatarPosterPhoto) =>
      _$this._avatarPosterPhoto = avatarPosterPhoto;

  String? _controlnetHint;
  String? get controlnetHint => _$this._controlnetHint;
  set controlnetHint(String? controlnetHint) =>
      _$this._controlnetHint = controlnetHint;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromptRecordBuilder() {
    PromptRecord._initializeBuilder(this);
  }

  PromptRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _avatarName = $v.avatarName;
      _controlnetInputImage = $v.controlnetInputImage;
      _positivePrompt = $v.positivePrompt;
      _negativePrompt = $v.negativePrompt;
      _steps = $v.steps;
      _seed = $v.seed;
      _aspectRatio = $v.aspectRatio;
      _faceCorrection = $v.faceCorrection;
      _superResolution = $v.superResolution;
      _category = $v.category;
      _mainImage = $v.mainImage;
      _paragraph = $v.paragraph;
      _cfg = $v.cfg;
      _avatarPosterPhoto = $v.avatarPosterPhoto;
      _controlnetHint = $v.controlnetHint;
      _gender = $v.gender;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromptRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromptRecord;
  }

  @override
  void update(void Function(PromptRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromptRecord build() => _build();

  _$PromptRecord _build() {
    final _$result = _$v ??
        new _$PromptRecord._(
            avatarName: avatarName,
            controlnetInputImage: controlnetInputImage,
            positivePrompt: positivePrompt,
            negativePrompt: negativePrompt,
            steps: steps,
            seed: seed,
            aspectRatio: aspectRatio,
            faceCorrection: faceCorrection,
            superResolution: superResolution,
            category: category,
            mainImage: mainImage,
            paragraph: paragraph,
            cfg: cfg,
            avatarPosterPhoto: avatarPosterPhoto,
            controlnetHint: controlnetHint,
            gender: gender,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
