connection: "cdptraining01_sqls_staging_conn"

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
explore:  sql_runner_query3{}
view: sql_runner_query3 {
  derived_table: {
    sql: select * from STG_ANSHIKA_LKR_SOURCE
      ;;
  }

  measure: count3 {
    type: count
    drill_fields: [detail*]
  }

  dimension: dataset_instance_id {
    type: string
    sql: ${TABLE}.DATASET_INSTANCE_ID ;;
  }

  dimension: loan_id {
    type: string
    sql: ${TABLE}.Loan_ID ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: married {
    type: string
    sql: ${TABLE}.Married ;;
  }

  dimension: dependents {
    type: string
    sql: ${TABLE}.Dependents ;;
  }

  dimension: education {
    type: string
    sql: ${TABLE}.Education ;;
  }

  dimension: self_employed {
    type: string
    sql: ${TABLE}.Self_Employed ;;
  }

  dimension: applicant_income {
    type: string
    sql: ${TABLE}.ApplicantIncome ;;
  }

  dimension: coapplicant_income {
    type: string
    sql: ${TABLE}.CoapplicantIncome ;;
  }

  dimension: loan_amount {
    type: string
    sql: ${TABLE}.LoanAmount ;;
  }

  dimension: loan_amount_term {
    type: string
    sql: ${TABLE}.Loan_Amount_Term ;;
  }

  dimension: credit_history {
    type: string
    sql: ${TABLE}.Credit_History ;;
  }

  dimension: property_area {
    type: string
    sql: ${TABLE}.Property_Area ;;
  }

  dimension: loan_status {
    type: string
    sql: ${TABLE}.Loan_Status ;;
  }

  set: detail {
    fields: [
      dataset_instance_id,
      loan_id,
      gender,
      married,
      dependents,
      education,
      self_employed,
      applicant_income,
      coapplicant_income,
      loan_amount,
      loan_amount_term,
      credit_history,
      property_area,
      loan_status
    ]
  }
}
