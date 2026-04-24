SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS `apms_brand` (
  `brand_id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_code` varchar(50) DEFAULT NULL COMMENT '品牌编码',
  `sort_num` int NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `uk_apms_brand_name` (`brand_name`),
  KEY `idx_apms_brand_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 品牌表';

CREATE TABLE IF NOT EXISTS `apms_device_type` (
  `device_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备类型ID',
  `brand_id` bigint NOT NULL COMMENT '品牌ID',
  `type_name` varchar(100) NOT NULL COMMENT '设备类型名称',
  `type_code` varchar(50) DEFAULT NULL COMMENT '设备类型编码',
  `sort_num` int NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`device_type_id`),
  UNIQUE KEY `uk_apms_device_type_brand_name` (`brand_id`, `type_name`),
  KEY `idx_apms_device_type_brand_id` (`brand_id`),
  KEY `idx_apms_device_type_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 设备类型表';

CREATE TABLE IF NOT EXISTS `apms_device_model` (
  `device_model_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备型号ID',
  `device_type_id` bigint NOT NULL COMMENT '设备类型ID',
  `model_name` varchar(100) NOT NULL COMMENT '设备型号名称',
  `model_code` varchar(50) DEFAULT NULL COMMENT '设备型号编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`device_model_id`),
  UNIQUE KEY `uk_apms_device_model_type_name` (`device_type_id`, `model_name`),
  KEY `idx_apms_device_model_type_id` (`device_type_id`),
  KEY `idx_apms_device_model_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 设备型号表';

CREATE TABLE IF NOT EXISTS `apms_manufacturer` (
  `manufacturer_id` bigint NOT NULL AUTO_INCREMENT COMMENT '生产厂商ID',
  `manufacturer_name` varchar(100) NOT NULL COMMENT '生产厂商名称',
  `manufacturer_code` varchar(50) DEFAULT NULL COMMENT '生产厂商编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`manufacturer_id`),
  UNIQUE KEY `uk_apms_manufacturer_name` (`manufacturer_name`),
  KEY `idx_apms_manufacturer_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 生产厂商表';

CREATE TABLE IF NOT EXISTS `apms_customer` (
  `customer_id` bigint NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `customer_code` varchar(50) DEFAULT NULL COMMENT '客户编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `uk_apms_customer_name` (`customer_name`),
  KEY `idx_apms_customer_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 客户表';

CREATE TABLE IF NOT EXISTS `apms_device` (
  `device_id` bigint NOT NULL AUTO_INCREMENT COMMENT '具体设备ID',
  `device_model_id` bigint NOT NULL COMMENT '设备型号ID',
  `manufacturer_id` bigint NOT NULL COMMENT '生产厂商ID',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`device_id`),
  UNIQUE KEY `uk_apms_device_model_manufacturer` (`device_model_id`, `manufacturer_id`),
  KEY `idx_apms_device_model_id` (`device_model_id`),
  KEY `idx_apms_device_manufacturer_id` (`manufacturer_id`),
  KEY `idx_apms_device_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 具体设备表';

CREATE TABLE IF NOT EXISTS `apms_part` (
  `part_id` bigint NOT NULL AUTO_INCREMENT COMMENT '配件ID',
  `device_id` bigint NOT NULL COMMENT '具体设备ID',
  `part_name` varchar(100) NOT NULL COMMENT '配件名称',
  `part_code` varchar(50) DEFAULT NULL COMMENT '配件编码',
  `sort_num` int NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`part_id`),
  UNIQUE KEY `uk_apms_part_device_name` (`device_id`, `part_name`),
  KEY `idx_apms_part_device_id` (`device_id`),
  KEY `idx_apms_part_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 配件表';

CREATE TABLE IF NOT EXISTS `apms_part_item` (
  `part_item_id` bigint NOT NULL AUTO_INCREMENT COMMENT '配件型号项ID',
  `part_id` bigint NOT NULL COMMENT '配件ID',
  `internal_code` varchar(64) NOT NULL COMMENT '内部编码',
  `part_model` varchar(100) NOT NULL COMMENT '配件型号',
  `part_description` varchar(500) NOT NULL DEFAULT '' COMMENT '配件描述',
  `part_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '内部备注',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`part_item_id`),
  UNIQUE KEY `uk_apms_part_item_internal_code` (`internal_code`),
  UNIQUE KEY `uk_apms_part_item_part_model_desc` (`part_id`, `part_model`, `part_description`(255)),
  KEY `idx_apms_part_item_part_id` (`part_id`),
  KEY `idx_apms_part_item_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 配件型号与描述表';

CREATE TABLE IF NOT EXISTS `apms_part_item_customer_code` (
  `mapping_id` bigint NOT NULL AUTO_INCREMENT COMMENT '客户编码映射ID',
  `part_item_id` bigint NOT NULL COMMENT '配件型号项ID',
  `customer_id` bigint NOT NULL COMMENT '客户ID',
  `customer_part_code` varchar(100) NOT NULL COMMENT '客户配件编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`mapping_id`),
  UNIQUE KEY `uk_apms_customer_part_code` (`customer_id`, `customer_part_code`),
  KEY `idx_apms_mapping_part_item_id` (`part_item_id`),
  KEY `idx_apms_mapping_customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 配件型号客户编码映射表';

CREATE TABLE IF NOT EXISTS `apms_photo` (
  `photo_id` bigint NOT NULL AUTO_INCREMENT COMMENT '照片ID',
  `part_item_id` bigint NOT NULL COMMENT '配件型号项ID',
  `original_file_name` varchar(255) NOT NULL COMMENT '原始文件名',
  `file_name` varchar(255) NOT NULL COMMENT '存储文件名',
  `storage_path` varchar(500) NOT NULL COMMENT '存储路径',
  `file_url` varchar(500) DEFAULT NULL COMMENT '访问地址',
  `file_suffix` varchar(20) DEFAULT NULL COMMENT '文件后缀',
  `mime_type` varchar(100) DEFAULT NULL COMMENT '文件MIME类型',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小（字节）',
  `file_hash` varchar(64) DEFAULT NULL COMMENT '文件哈希值',
  `view_type` varchar(32) DEFAULT NULL COMMENT '照片视角类型',
  `sort_num` int NOT NULL DEFAULT '0' COMMENT '排序号',
  `upload_user_id` bigint NOT NULL COMMENT '上传人用户ID',
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `audit_status` char(1) NOT NULL DEFAULT '0' COMMENT '审核状态（0待审核 1通过 2驳回）',
  `audit_user_id` bigint DEFAULT NULL COMMENT '审核人用户ID',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_remark` varchar(500) DEFAULT NULL COMMENT '审核备注',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  PRIMARY KEY (`photo_id`),
  KEY `idx_apms_photo_part_item_id` (`part_item_id`),
  KEY `idx_apms_photo_audit_status` (`audit_status`),
  KEY `idx_apms_photo_upload_user_id` (`upload_user_id`),
  KEY `idx_apms_photo_audit_user_id` (`audit_user_id`),
  KEY `idx_apms_photo_file_hash` (`file_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='APMS 照片表';
