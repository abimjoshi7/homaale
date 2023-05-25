// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_retrive_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItemRetriveList _$$_OrderItemRetriveListFromJson(
        Map<String, dynamic> json) =>
    _$_OrderItemRetriveList(
      id: json['id'] as String?,
      user: json['user'] as String?,
      currency: json['currency'] as String?,
      status: json['status'] as String?,
      isActive: json['is_active'] as bool?,
      orderItem: (json['order_item'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      grandTotal: (json['grand_total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_OrderItemRetriveListToJson(
        _$_OrderItemRetriveList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'currency': instance.currency,
      'status': instance.status,
      'is_active': instance.isActive,
      'order_item': instance.orderItem,
      'grand_total': instance.grandTotal,
    };

_$_OrderItem _$$_OrderItemFromJson(Map<String, dynamic> json) => _$_OrderItem(
      id: json['id'] as String?,
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      amount: json['amount'] as String?,
      tax: json['tax'] as String?,
      vat: json['vat'] as String?,
      offerValue: json['offer_value'] as String?,
      discount: json['discount'] as String?,
      platformCharge: json['platform_charge'] as String?,
      platformChargeDiscount: json['platform_charge_discount'] as String?,
      equipmentCharges: json['equipment_charges'] as String?,
      revisionCharges: json['revision_charges'] as String?,
      otherCharges: json['other_charges'] as String?,
      otherDiscounts: json['other_discounts'] as String?,
      isActive: json['is_active'] as bool?,
      order: json['order'] as String?,
      offer: json['offer'],
    );

Map<String, dynamic> _$$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'amount': instance.amount,
      'tax': instance.tax,
      'vat': instance.vat,
      'offer_value': instance.offerValue,
      'discount': instance.discount,
      'platform_charge': instance.platformCharge,
      'platform_charge_discount': instance.platformChargeDiscount,
      'equipment_charges': instance.equipmentCharges,
      'revision_charges': instance.revisionCharges,
      'other_charges': instance.otherCharges,
      'other_discounts': instance.otherDiscounts,
      'is_active': instance.isActive,
      'order': instance.order,
      'offer': instance.offer,
    };

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String?,
      title: json['title'] as String?,
      booking: json['booking'] as int?,
      entityService: json['entity_service'] as String?,
      entityServiceImages: json['entity_service_images'] as List<dynamic>?,
      assigner: json['assigner'] == null
          ? null
          : Assigne.fromJson(json['assigner'] as Map<String, dynamic>),
      assignee: json['assignee'] == null
          ? null
          : Assigne.fromJson(json['assignee'] as Map<String, dynamic>),
      currency: json['currency'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'booking': instance.booking,
      'entity_service': instance.entityService,
      'entity_service_images': instance.entityServiceImages,
      'assigner': instance.assigner,
      'assignee': instance.assignee,
      'currency': instance.currency,
      'location': instance.location,
    };

_$_Assigne _$$_AssigneFromJson(Map<String, dynamic> json) => _$_Assigne(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_images'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['created_at'] as String?,
      designation: json['designation'] as String?,
      userType: json['user_type'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      isFollowed: json['is_followed'] as bool?,
      isFollowing: json['is_following'] as bool?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AssigneToJson(_$_Assigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'profile_images': instance.profileImage,
      'bio': instance.bio,
      'created_at': instance.createdAt,
      'designation': instance.designation,
      'user_type': instance.userType,
      'is_profile_verified': instance.isProfileVerified,
      'is_followed': instance.isFollowed,
      'is_following': instance.isFollowing,
      'badge': instance.badge,
    };

_$_Badge _$$_BadgeFromJson(Map<String, dynamic> json) => _$_Badge(
      id: json['id'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_BadgeToJson(_$_Badge instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
    };
