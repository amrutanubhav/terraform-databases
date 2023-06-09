# module "mongodb" {
#   source               = "./vendor/modules/mongodb"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
#   ENV                  = var.ENV
# }

# module "redis" {
#   source               = "./vendor/modules/redis"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
#   ENV                  = var.ENV
# }

# module "mysql" {
#   source               = "./vendor/modules/mysql"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
#   ENV                  = var.ENV
# }

module "mongodb" {
  source               = "./vendor/modules/mongodb"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  ENV                  = var.ENV
  DOCDB_PORT           = var.DOCDB_PORT
  DOCDB_INSTANCE_CLASS = var.DOCDB_INSTANCE_CLASS
  DOCDB_INSTANCE_COUNT = var.DOCDB_INSTANCE_COUNT

}

module "redis" {
  source                  = "./vendor/modules/redis"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  ENV                     = var.ENV
  REDIS_PORT              = var.REDIS_PORT
  REDIS_INSTANCE_NODETYPE = var.REDIS_INSTANCE_NODETYPE
  REDIS_INSTANCE_COUNT    = var.REDIS_INSTANCE_COUNT
  REDIS_ENGINE_VERSION    = var.REDIS_ENGINE_VERSION

}

module "mysql" {
  source               = "./vendor/modules/mysql"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  ENV                  = var.ENV
  RDS_MYSQL_PORT       = var.RDS_MYSQL_PORT
  RDS_MYSQL_STORAGE    = var.RDS_MYSQL_STORAGE
  RDS_MYSQL_ENGINE_VERSION = var.RDS_MYSQL_ENGINE_VERSION
  RDS_INSTANCE_TYPE    = var.RDS_INSTANCE_TYPE
}

# Provisioning RabbitMQ on EC2
module "rabbitmq" {
  source               = "./vendor/modules/rabbitmq"     # Terrafile is going to download the code from the respective branch of the repo and keeps it local
  ENV                  = var.ENV
  RABBITMQ_PORT        = var.RABBITMQ_PORT
}

# # Just for debugging
output "MONGO_ENDPOINT" {
    value = module.mongodb.MONGO_ENDPOINT
}

# output "secret-data" {
#   value = module.mongodb.data
  
# }