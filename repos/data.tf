data "terraform_remote_state" "base" {
  backend = "pg"

  config = {
    conn_str = "host=localhost port=5432 user=tfstate dbname=base sslmode=disable"
  }
}
