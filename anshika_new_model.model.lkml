connection: "cdptraining01_metastore"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


explore: sql_runner_query1 {}
view: sql_runner_query1 {
  derived_table: {
    sql: select * from m_Source_entity
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: system_id {
    type: string
    sql: ${TABLE}.SYSTEM_ID ;;
  }

  dimension: dataset_id {
    type: string
    sql: ${TABLE}.DATASET_ID ;;
  }

  dimension: entity_nm {
    type: string
    sql: ${TABLE}.ENTITY_NM ;;
  }

  dimension: entity_desc {
    type: string
    sql: ${TABLE}.ENTITY_DESC ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}.FREQUENCY ;;
  }

  dimension: frequency_days {
    type: string
    sql: ${TABLE}.FREQUENCY_DAYS ;;
  }

  dimension: include_header {
    type: string
    sql: ${TABLE}.INCLUDE_HEADER ;;
  }

  dimension: num_header_rows {
    type: string
    sql: ${TABLE}.NUM_HEADER_ROWS ;;
  }

  dimension: stage_strategy {
    type: string
    sql: ${TABLE}.STAGE_STRATEGY ;;
  }

  dimension: stage_table_nm {
    type: string
    sql: ${TABLE}.STAGE_TABLE_NM ;;
  }

  dimension: next_extract_value {
    type: string
    sql: ${TABLE}.NEXT_EXTRACT_VALUE ;;
  }

  dimension: stage_package_path {
    type: string
    sql: ${TABLE}.STAGE_PACKAGE_PATH ;;
  }

  dimension: source_file_mask {
    type: string
    sql: ${TABLE}.SOURCE_FILE_MASK ;;
  }

  dimension: file_format_id {
    type: string
    sql: ${TABLE}.FILE_FORMAT_ID ;;
  }

  dimension: control_file_flg {
    type: string
    sql: ${TABLE}.CONTROL_FILE_FLG ;;
  }

  dimension: control_file_ext {
    type: string
    sql: ${TABLE}.CONTROL_FILE_EXT ;;
  }

  dimension: control_file_delimiter {
    type: string
    sql: ${TABLE}.CONTROL_FILE_DELIMITER ;;
  }

  dimension: control_file_mask {
    type: string
    sql: ${TABLE}.CONTROL_FILE_MASK ;;
  }

  dimension: column_delimiter {
    type: string
    sql: ${TABLE}.COLUMN_DELIMITER ;;
  }

  dimension: text_qualifier {
    type: string
    sql: ${TABLE}.TEXT_QUALIFIER ;;
  }

  dimension: allow_string_truncation {
    type: string
    sql: ${TABLE}.ALLOW_STRING_TRUNCATION ;;
  }

  dimension: row_delimiter {
    type: string
    sql: ${TABLE}.ROW_DELIMITER ;;
  }

  dimension: pre_process_function {
    type: string
    sql: ${TABLE}.PRE_PROCESS_FUNCTION ;;
  }

  dimension: database_host {
    type: string
    sql: ${TABLE}.DATABASE_HOST ;;
  }

  dimension: database_nm {
    type: string
    sql: ${TABLE}.DATABASE_NM ;;
  }

  dimension: database_username {
    type: string
    sql: ${TABLE}.DATABASE_USERNAME ;;
  }

  dimension: database_password {
    type: string
    sql: ${TABLE}.DATABASE_PASSWORD ;;
  }

  dimension: required_flg {
    type: string
    sql: ${TABLE}.REQUIRED_FLG ;;
  }

  dimension: required_date_diff {
    type: string
    sql: ${TABLE}.REQUIRED_DATE_DIFF ;;
  }

  dimension: download_only_flg {
    type: string
    sql: ${TABLE}.DOWNLOAD_ONLY_FLG ;;
  }

  dimension: unzip_file_flg {
    type: string
    sql: ${TABLE}.UNZIP_FILE_FLG ;;
  }

  dimension: unzip_file_password {
    type: string
    sql: ${TABLE}.UNZIP_FILE_PASSWORD ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: active_flg {
    type: string
    sql: ${TABLE}.ACTIVE_FLG ;;
  }

  dimension: std_config_id {
    type: string
    sql: ${TABLE}.STD_CONFIG_ID ;;
  }

  dimension: match_config_id {
    type: string
    sql: ${TABLE}.MATCH_CONFIG_ID ;;
  }

  dimension: delete_source_file_flg {
    type: string
    sql: ${TABLE}.DELETE_SOURCE_FILE_FLG ;;
  }

  dimension: parent_source_entity_id {
    type: string
    sql: ${TABLE}.PARENT_SOURCE_ENTITY_ID ;;
  }

  dimension: source_uow_id_funct {
    type: string
    sql: ${TABLE}.SOURCE_UOW_ID_FUNCT ;;
  }

  dimension: source_lineage_dt_funct {
    type: string
    sql: ${TABLE}.SOURCE_LINEAGE_DT_FUNCT ;;
  }

  dimension: create_user {
    type: string
    sql: ${TABLE}.CREATE_USER ;;
  }

  dimension: create_dt {
    type: string
    sql: ${TABLE}.CREATE_DT ;;
  }

  dimension: update_user {
    type: string
    sql: ${TABLE}.UPDATE_USER ;;
  }

  dimension: update_dt {
    type: string
    sql: ${TABLE}.UPDATE_DT ;;
  }

  dimension: header_exclude_expression {
    type: string
    sql: ${TABLE}.HEADER_EXCLUDE_EXPRESSION ;;
  }

  dimension: row_delim_escape_char {
    type: string
    sql: ${TABLE}.ROW_DELIM_ESCAPE_CHAR ;;
  }

  dimension: column_delim_escape_char {
    type: string
    sql: ${TABLE}.COLUMN_DELIM_ESCAPE_CHAR ;;
  }

  set: detail {
    fields: [
      id,
      system_id,
      dataset_id,
      entity_nm,
      entity_desc,
      frequency,
      frequency_days,
      include_header,
      num_header_rows,
      stage_strategy,
      stage_table_nm,
      next_extract_value,
      stage_package_path,
      source_file_mask,
      file_format_id,
      control_file_flg,
      control_file_ext,
      control_file_delimiter,
      control_file_mask,
      column_delimiter,
      text_qualifier,
      allow_string_truncation,
      row_delimiter,
      pre_process_function,
      database_host,
      database_nm,
      database_username,
      database_password,
      required_flg,
      required_date_diff,
      download_only_flg,
      unzip_file_flg,
      unzip_file_password,
      status,
      active_flg,
      std_config_id,
      match_config_id,
      delete_source_file_flg,
      parent_source_entity_id,
      source_uow_id_funct,
      source_lineage_dt_funct,
      create_user,
      create_dt,
      update_user,
      update_dt,
      header_exclude_expression,
      row_delim_escape_char,
      column_delim_escape_char
    ]
  }
}
