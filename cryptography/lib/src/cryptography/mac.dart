// Copyright 2019-2020 Gohilla Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:cryptography/cryptography.dart';
import 'package:cryptography/helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

/// A Message Authentication Code (MAC). Usually obtained from some
/// [MacAlgorithm].
///
/// Two instances of this class are equal if the bytes are equal.
///
/// Note that [toString()] exposes the bytes.

part 'mac.g.dart';

@sealed
@JsonSerializable()
class Mac {
  /// Empty MAC.
  static const Mac empty = Mac(<int>[]);

  /// Bytes of the MAC.
  final List<int> bytes;

  const Mac(this.bytes);

  factory Mac.fromJson(Map<String, dynamic> json) => _$MacFromJson(json);

  Map<String, dynamic> toJson() => _$MacToJson(this); 

  @override
  int get hashCode => constantTimeBytesEquality.hash(bytes);

  @override
  bool operator ==(other) =>
      other is Mac && constantTimeBytesEquality.equals(bytes, other.bytes);

  @override
  String toString() {
    if (bytes.isEmpty) {
      return 'Mac.empty';
    }
    return 'Mac([${bytes.join(',')}])';
  }
}

/// Error thrown by [Cipher.decrypt] when [SecretBox] has incorrect [Mac].
class SecretBoxAuthenticationError implements Exception {
  final SecretBox secretBox;

  SecretBoxAuthenticationError({required this.secretBox});

  @override
  String toString() {
    return 'SecretBox has wrong message authentication code (MAC)';
  }
}
