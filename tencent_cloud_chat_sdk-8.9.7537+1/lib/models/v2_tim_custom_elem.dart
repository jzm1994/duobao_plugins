import 'dart:convert';

import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/native_im/adapter/tim_c_enum.dart';
import 'package:tencent_cloud_chat_sdk/utils/utils.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_elem.dart';
import 'package:flutter/foundation.dart';

/// V2TimCustomElem
///
/// {@category Models}
///
class V2TimCustomElem extends V2TIMElem {
  late String? data;
  late String? desc;
  late String? extension;
  Map<String, dynamic>? dataMap;

  V2TimCustomElem({
    this.data,
    this.desc,
    this.extension,
  }): super(elemType: MessageElemType.V2TIM_ELEM_TYPE_CUSTOM);

  V2TimCustomElem.fromJson(Map json) {
    elemType = MessageElemType.V2TIM_ELEM_TYPE_CUSTOM;
    json = Utils.formatJson(json);
    data = json['custom_elem_data'];
    desc = json['custom_elem_desc'];
    extension = json['custom_elem_ext'];
    if (data?.isNotEmpty ?? false) {
      try {
        var decodeData = jsonDecode(data!);
        dataMap = decodeData?.cast<String, dynamic>();
        // ignore: empty_catches
      } catch (e) {
        debugPrint('err V2TimCustomElem.fromJson $e');
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['elem_type'] = CElemType.ElemCustom;
    data['custom_elem_data'] = this.data;
    data['custom_elem_desc'] = desc;
    data['custom_elem_ext'] = extension;
    return data;
  }
  String toLogString() {
    String res = "data:$data|desc:$desc|extension:$extension";
    return res;
  }
}
