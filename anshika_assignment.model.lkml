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
    sql: select *
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
    sql: ${TABLE}.WORKFLOW_ID ;;
  }

  dimension: no_of_active_workflows {
    type: string
    sql: ${TABLE}.no_of_active_workflows ;;
  }

  set: detail {
    fields: [workflow_id, no_of_active_workflows]
  }
}
