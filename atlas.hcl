env "local" {
  src = "./schema.hcl"
  dev = "docker://mariadb/latest/dev"
  url = "maria://root:root@127.0.0.1:3306/il_db"
  migration {
    dir = "file://migrations"
  }
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}
