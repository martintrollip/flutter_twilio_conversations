// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_twilio_conversations/flutter_twilio_conversations.dart';
import 'package:flutter_twilio_conversations_platform_interface/flutter_twilio_conversations_platform_interface.dart';
import 'package:meta/meta.dart' show required;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import '../method_channel/method_channel_flutter_twilio_conversations.dart';

export '../models/model_exports.dart';

/// The interface that implementations of flutter_twilio_conversations must implement.
///
/// Platform implementations that live in a separate package should extend this
/// class rather than implement it as `flutter_twilio_conversations` does not consider newly
/// added methods to be breaking changes. Extending this class (using `extends`)
/// ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by
/// newly added [FlutterTwilioConversationsPlatform] methods.
abstract class FlutterTwilioConversationsPlatform extends PlatformInterface {
  FlutterTwilioConversationsPlatform() : super(token: _token);

  static final Object _token = Object();

  /// The default instance of [FlutterTwilioConversationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTwilioConversations].
  static FlutterTwilioConversationsPlatform _instance =
      MethodChannelFlutterTwilioConversations();

  /// Platform-specific plugins should override this with their own
  /// platform-specific class that extends [FlutterTwilioConversationsPlatform] when they
  /// register themselves.

  static FlutterTwilioConversationsPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterTwilioConversationsPlatform] when they register themselves.
  static set instance(FlutterTwilioConversationsPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<dynamic> create(String token, Properties properties) {
    throw UnimplementedError('create() has not been implemented.');
  }

  Future<Map<dynamic, dynamic>> createChannel(String friendlyName, String channelType) {
    throw UnimplementedError('createChannel() has not been implemented.');
  }

  Future<dynamic> getChannel(String channelSidOrUniqueName) {
    throw UnimplementedError('getChannel() has not been implemented.');
  }

  /// Stream of the BaseRoomEvent model.
  ///
  /// This stream is used to update the Room in a plugin implementation.
  Stream<BaseChatClientEvent>? chatClientStream() {
    throw UnimplementedError('chatClientStream() has not been implemented');
  }

  //  {
  // print("here");
  // throw UnimplementedError('canLaunch() has not been implemented.');
  // }
}
