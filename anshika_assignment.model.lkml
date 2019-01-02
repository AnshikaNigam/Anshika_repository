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
explore: sql_runner_query2 {}
view: sql_runner_query2 {
  derived_table: {
    sql: select m_workflow.workflow_id, m_workflow.WORKFLOW_TYPE_ID,
        m_Workflow.WORKFLOW_NAME,m_workflow.ACTIVE_FLG,m_Workflow.CREATE_USER, M_TRACK_WORKFLOW_INSTANCE.STATUS_ID,
        m_workflow_type.workflow_type
            from M_workflow
            inner join M_workflow_type
            on m_workflow.workflow_type_id=m_workflow_type.workflow_type_id
            inner join M_TRACK_WORKFLOW_INSTANCE
            on m_workflow.workflow_id=M_TRACK_WORKFLOW_INSTANCE.workflow_id
            inner join [M_WORKFLOW_INSTANCE_STATUS]
            on M_TRACK_WORKFLOW_INSTANCE.status_id = [M_WORKFLOW_INSTANCE_STATUS].status_id
       ;;
  }

  measure: count2 {
    type: count
    drill_fields: [detail*]
  }

  dimension: workflow_id {
    type: string
    sql: ${TABLE}.workflow_id ;;
  }

  dimension: workflow_type_id {
    type: string
    sql: ${TABLE}.WORKFLOW_TYPE_ID ;;
  }

  dimension: workflow_name {
    type: string
    sql: ${TABLE}.WORKFLOW_NAME ;;
  }

  dimension: active_flg {
    type: string
    sql: ${TABLE}.ACTIVE_FLG ;;
  }

  dimension: create_user {
    type: string
    sql: ${TABLE}.CREATE_USER ;;
  }

  dimension: status_id {
    type: string
    sql: ${TABLE}.STATUS_ID ;;
  }

  dimension: workflow_type {
    type: string
    sql: ${TABLE}.workflow_type ;;
  }

  set: detail {
    fields: [
      workflow_id,
      workflow_type_id,
      workflow_name,
      active_flg,
      create_user,
      status_id,
      workflow_type
    ]
  }
}
