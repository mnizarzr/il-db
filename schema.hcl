schema "il_db" {}

table "visitors" {
  schema = schema.il_db
  column "id" {
    type = bigint
  }
  column "name" {
    type   = varchar(255)
  }
  column "email" {
    type   = varchar(255)
  }
  column "phone_number" {
    type   = varchar(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "idx_email" {
    unique = true
    columns = [column.email]
  }
  index "idx_phone" {
    unique = true
    columns = [column.phone_number]
  }
}

table "schedules" {
  schema = schema.il_db
  column "id" {
    type = bigint
  }
  column "start_date" {
    type = date
  }
  column "end_date" {
    type = date
  }
  column "visitor_qty" {
    type = int
  }
  primary_key {
    columns = [column.id]
  }
}

table "visits" {
  schema = schema.il_db
  column "id" {
    type = bigint
  }
  column "visitor_id" {
    type = bigint
  }
  column "schedule_id" {
    type = bigint
  }
  column "time_in" {
    type = time
  }
  column "time_out" {
    type = time
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "fk_visitor_id" {
    columns     = [column.visitor_id]
    ref_columns = [table.visitors.column.id]
    on_update   = CASCADE
    on_delete   = CASCADE
  }
  foreign_key "fk_schedule_id" {
    columns     = [column.schedule_id]
    ref_columns = [table.schedules.column.id]
    on_update   = CASCADE
    on_delete   = CASCADE
  }
}
