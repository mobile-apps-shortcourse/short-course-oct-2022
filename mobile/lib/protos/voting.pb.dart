///
//  Generated code. Do not modify.
//  source: voting.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $2;

import 'voting.pbenum.dart';

export 'voting.pbenum.dart';

class Poll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Poll',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'organizer')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categories')
    ..e<PollStatus>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: PollStatus.unknown,
        valueOf: PollStatus.valueOf,
        enumValues: PollStatus.values)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..pc<PollCandidate>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'candidates',
        $pb.PbFieldType.PM,
        subBuilder: PollCandidate.create)
    ..aOM<$2.Timestamp>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTimestamp',
        protoName: 'startTimestamp',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTimestamp',
        protoName: 'endTimestamp',
        subBuilder: $2.Timestamp.create)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerImage',
        protoName: 'bannerImage')
    ..hasRequiredFields = false;

  Poll._() : super();
  factory Poll({
    $core.String? id,
    $core.String? title,
    $core.String? organizer,
    $core.Iterable<$core.String>? categories,
    PollStatus? status,
    $core.String? description,
    $core.Iterable<PollCandidate>? candidates,
    $2.Timestamp? startTimestamp,
    $2.Timestamp? endTimestamp,
    $core.String? bannerImage,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (organizer != null) {
      _result.organizer = organizer;
    }
    if (categories != null) {
      _result.categories.addAll(categories);
    }
    if (status != null) {
      _result.status = status;
    }
    if (description != null) {
      _result.description = description;
    }
    if (candidates != null) {
      _result.candidates.addAll(candidates);
    }
    if (startTimestamp != null) {
      _result.startTimestamp = startTimestamp;
    }
    if (endTimestamp != null) {
      _result.endTimestamp = endTimestamp;
    }
    if (bannerImage != null) {
      _result.bannerImage = bannerImage;
    }
    return _result;
  }
  factory Poll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Poll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Poll clone() => Poll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Poll copyWith(void Function(Poll) updates) =>
      super.copyWith((message) => updates(message as Poll))
          as Poll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Poll create() => Poll._();
  Poll createEmptyInstance() => create();
  static $pb.PbList<Poll> createRepeated() => $pb.PbList<Poll>();
  @$core.pragma('dart2js:noInline')
  static Poll getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Poll>(create);
  static Poll? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get organizer => $_getSZ(2);
  @$pb.TagNumber(3)
  set organizer($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOrganizer() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrganizer() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get categories => $_getList(3);

  @$pb.TagNumber(5)
  PollStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(PollStatus v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<PollCandidate> get candidates => $_getList(6);

  @$pb.TagNumber(8)
  $2.Timestamp get startTimestamp => $_getN(7);
  @$pb.TagNumber(8)
  set startTimestamp($2.Timestamp v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStartTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartTimestamp() => clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureStartTimestamp() => $_ensure(7);

  @$pb.TagNumber(9)
  $2.Timestamp get endTimestamp => $_getN(8);
  @$pb.TagNumber(9)
  set endTimestamp($2.Timestamp v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEndTimestamp() => $_has(8);
  @$pb.TagNumber(9)
  void clearEndTimestamp() => clearField(9);
  @$pb.TagNumber(9)
  $2.Timestamp ensureEndTimestamp() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get bannerImage => $_getSZ(9);
  @$pb.TagNumber(10)
  set bannerImage($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBannerImage() => $_has(9);
  @$pb.TagNumber(10)
  void clearBannerImage() => clearField(10);
}

class PollCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PollCategory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerImage',
        protoName: 'bannerImage')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poll')
    ..hasRequiredFields = false;

  PollCategory._() : super();
  factory PollCategory({
    $core.String? id,
    $core.String? name,
    $core.String? bannerImage,
    $core.String? poll,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (bannerImage != null) {
      _result.bannerImage = bannerImage;
    }
    if (poll != null) {
      _result.poll = poll;
    }
    return _result;
  }
  factory PollCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PollCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PollCategory clone() => PollCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PollCategory copyWith(void Function(PollCategory) updates) =>
      super.copyWith((message) => updates(message as PollCategory))
          as PollCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PollCategory create() => PollCategory._();
  PollCategory createEmptyInstance() => create();
  static $pb.PbList<PollCategory> createRepeated() =>
      $pb.PbList<PollCategory>();
  @$core.pragma('dart2js:noInline')
  static PollCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollCategory>(create);
  static PollCategory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bannerImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set bannerImage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBannerImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearBannerImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get poll => $_getSZ(3);
  @$pb.TagNumber(4)
  set poll($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPoll() => $_has(3);
  @$pb.TagNumber(4)
  void clearPoll() => clearField(4);
}

class PollCandidate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PollCandidate',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'candidate')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'votes')
    ..hasRequiredFields = false;

  PollCandidate._() : super();
  factory PollCandidate({
    $core.String? candidate,
    $core.String? category,
    $core.Iterable<$core.String>? votes,
  }) {
    final _result = create();
    if (candidate != null) {
      _result.candidate = candidate;
    }
    if (category != null) {
      _result.category = category;
    }
    if (votes != null) {
      _result.votes.addAll(votes);
    }
    return _result;
  }
  factory PollCandidate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PollCandidate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PollCandidate clone() => PollCandidate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PollCandidate copyWith(void Function(PollCandidate) updates) =>
      super.copyWith((message) => updates(message as PollCandidate))
          as PollCandidate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PollCandidate create() => PollCandidate._();
  PollCandidate createEmptyInstance() => create();
  static $pb.PbList<PollCandidate> createRepeated() =>
      $pb.PbList<PollCandidate>();
  @$core.pragma('dart2js:noInline')
  static PollCandidate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PollCandidate>(create);
  static PollCandidate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get candidate => $_getSZ(0);
  @$pb.TagNumber(1)
  set candidate($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCandidate() => $_has(0);
  @$pb.TagNumber(1)
  void clearCandidate() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get votes => $_getList(2);
}

class GetPollsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetPollsResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..pc<Poll>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'polls',
        $pb.PbFieldType.PM,
        subBuilder: Poll.create)
    ..hasRequiredFields = false;

  GetPollsResponse._() : super();
  factory GetPollsResponse({
    $core.Iterable<Poll>? polls,
  }) {
    final _result = create();
    if (polls != null) {
      _result.polls.addAll(polls);
    }
    return _result;
  }
  factory GetPollsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetPollsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetPollsResponse clone() => GetPollsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetPollsResponse copyWith(void Function(GetPollsResponse) updates) =>
      super.copyWith((message) => updates(message as GetPollsResponse))
          as GetPollsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPollsResponse create() => GetPollsResponse._();
  GetPollsResponse createEmptyInstance() => create();
  static $pb.PbList<GetPollsResponse> createRepeated() =>
      $pb.PbList<GetPollsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPollsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPollsResponse>(create);
  static GetPollsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Poll> get polls => $_getList(0);
}

class GetPollsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetPollsRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..e<PollStatus>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: PollStatus.unknown,
        valueOf: PollStatus.valueOf,
        enumValues: PollStatus.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        protoName: 'userId')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userType',
        $pb.PbFieldType.O3,
        protoName: 'userType')
    ..hasRequiredFields = false;

  GetPollsRequest._() : super();
  factory GetPollsRequest({
    PollStatus? status,
    $core.String? userId,
    $core.int? userType,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    return _result;
  }
  factory GetPollsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetPollsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetPollsRequest clone() => GetPollsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetPollsRequest copyWith(void Function(GetPollsRequest) updates) =>
      super.copyWith((message) => updates(message as GetPollsRequest))
          as GetPollsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPollsRequest create() => GetPollsRequest._();
  GetPollsRequest createEmptyInstance() => create();
  static $pb.PbList<GetPollsRequest> createRepeated() =>
      $pb.PbList<GetPollsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPollsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPollsRequest>(create);
  static GetPollsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  PollStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(PollStatus v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userType => $_getIZ(2);
  @$pb.TagNumber(3)
  set userType($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserType() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserType() => clearField(3);
}

class GetCategoriesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetCategoriesRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poll')
    ..hasRequiredFields = false;

  GetCategoriesRequest._() : super();
  factory GetCategoriesRequest({
    $core.String? poll,
  }) {
    final _result = create();
    if (poll != null) {
      _result.poll = poll;
    }
    return _result;
  }
  factory GetCategoriesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetCategoriesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetCategoriesRequest clone() =>
      GetCategoriesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetCategoriesRequest copyWith(void Function(GetCategoriesRequest) updates) =>
      super.copyWith((message) => updates(message as GetCategoriesRequest))
          as GetCategoriesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCategoriesRequest create() => GetCategoriesRequest._();
  GetCategoriesRequest createEmptyInstance() => create();
  static $pb.PbList<GetCategoriesRequest> createRepeated() =>
      $pb.PbList<GetCategoriesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCategoriesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCategoriesRequest>(create);
  static GetCategoriesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get poll => $_getSZ(0);
  @$pb.TagNumber(1)
  set poll($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPoll() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoll() => clearField(1);
}

class GetVotingItemRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetVotingItemRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..hasRequiredFields = false;

  GetVotingItemRequest._() : super();
  factory GetVotingItemRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetVotingItemRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetVotingItemRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetVotingItemRequest clone() =>
      GetVotingItemRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetVotingItemRequest copyWith(void Function(GetVotingItemRequest) updates) =>
      super.copyWith((message) => updates(message as GetVotingItemRequest))
          as GetVotingItemRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVotingItemRequest create() => GetVotingItemRequest._();
  GetVotingItemRequest createEmptyInstance() => create();
  static $pb.PbList<GetVotingItemRequest> createRepeated() =>
      $pb.PbList<GetVotingItemRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVotingItemRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVotingItemRequest>(create);
  static GetVotingItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetCategoriesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetCategoriesResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..pc<PollCategory>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categories',
        $pb.PbFieldType.PM,
        subBuilder: PollCategory.create)
    ..hasRequiredFields = false;

  GetCategoriesResponse._() : super();
  factory GetCategoriesResponse({
    $core.Iterable<PollCategory>? categories,
  }) {
    final _result = create();
    if (categories != null) {
      _result.categories.addAll(categories);
    }
    return _result;
  }
  factory GetCategoriesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetCategoriesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetCategoriesResponse clone() =>
      GetCategoriesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetCategoriesResponse copyWith(
          void Function(GetCategoriesResponse) updates) =>
      super.copyWith((message) => updates(message as GetCategoriesResponse))
          as GetCategoriesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCategoriesResponse create() => GetCategoriesResponse._();
  GetCategoriesResponse createEmptyInstance() => create();
  static $pb.PbList<GetCategoriesResponse> createRepeated() =>
      $pb.PbList<GetCategoriesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCategoriesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCategoriesResponse>(create);
  static GetCategoriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PollCategory> get categories => $_getList(0);
}

class DeleteVotingItemRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteVotingItemRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..hasRequiredFields = false;

  DeleteVotingItemRequest._() : super();
  factory DeleteVotingItemRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory DeleteVotingItemRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteVotingItemRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteVotingItemRequest clone() =>
      DeleteVotingItemRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteVotingItemRequest copyWith(
          void Function(DeleteVotingItemRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteVotingItemRequest))
          as DeleteVotingItemRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteVotingItemRequest create() => DeleteVotingItemRequest._();
  DeleteVotingItemRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteVotingItemRequest> createRepeated() =>
      $pb.PbList<DeleteVotingItemRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteVotingItemRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteVotingItemRequest>(create);
  static DeleteVotingItemRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class VotingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'VotingResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'crowder'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'successful')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOM<Poll>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poll',
        subBuilder: Poll.create)
    ..aOM<PollCategory>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        subBuilder: PollCategory.create)
    ..hasRequiredFields = false;

  VotingResponse._() : super();
  factory VotingResponse({
    $core.bool? successful,
    $core.String? message,
    Poll? poll,
    PollCategory? category,
  }) {
    final _result = create();
    if (successful != null) {
      _result.successful = successful;
    }
    if (message != null) {
      _result.message = message;
    }
    if (poll != null) {
      _result.poll = poll;
    }
    if (category != null) {
      _result.category = category;
    }
    return _result;
  }
  factory VotingResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VotingResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VotingResponse clone() => VotingResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VotingResponse copyWith(void Function(VotingResponse) updates) =>
      super.copyWith((message) => updates(message as VotingResponse))
          as VotingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VotingResponse create() => VotingResponse._();
  VotingResponse createEmptyInstance() => create();
  static $pb.PbList<VotingResponse> createRepeated() =>
      $pb.PbList<VotingResponse>();
  @$core.pragma('dart2js:noInline')
  static VotingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VotingResponse>(create);
  static VotingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get successful => $_getBF(0);
  @$pb.TagNumber(1)
  set successful($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccessful() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccessful() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  Poll get poll => $_getN(2);
  @$pb.TagNumber(3)
  set poll(Poll v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPoll() => $_has(2);
  @$pb.TagNumber(3)
  void clearPoll() => clearField(3);
  @$pb.TagNumber(3)
  Poll ensurePoll() => $_ensure(2);

  @$pb.TagNumber(4)
  PollCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(PollCategory v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => clearField(4);
  @$pb.TagNumber(4)
  PollCategory ensureCategory() => $_ensure(3);
}
