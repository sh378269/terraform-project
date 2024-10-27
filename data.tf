data "terraform_remote_state" "shared" {
  backend = "s3"
  config = {
    bucket  = var.shared_state_bucket
    key     = "shared/terraform-shared.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
 
locals {
  ecrpermission                   = data.terraform_remote_state.shared.outputs.ecrpermission-json
  sg                              = data.terraform_remote_state.shared.outputs.registrations-sg
  subnet-ids                      = data.terraform_remote_state.shared.outputs.subnet-ids
  terraform_role                  = data.terraform_remote_state.shared.outputs.terraform_role_arn
  eventbridge_role                = data.terraform_remote_state.shared.outputs.eventbridge-role
  cardo_lambda_arn                = data.terraform_remote_state.shared.outputs.cardo-lambda-arn
  lambda_deploy_bucket            = data.terraform_remote_state.shared.outputs.registrations-deploy-bucket
  initial_lambda_bucket           = data.terraform_remote_state.shared.outputs.initial-lambda-bucket
  lambda_bucket_key               = data.terraform_remote_state.shared.outputs.lambda-bucket-key
  initial_lambda_cloudwatch_grp   = data.terraform_remote_state.shared.outputs.initial-lambda-cloudwatch-grp
  initial_lambda_bucket_arn       = data.terraform_remote_state.shared.outputs.initial-lambda-bucket-arn
  cardo_eventbridge_group         = data.terraform_remote_state.shared.outputs.cardo-data-group
  cardo_lambda_funtion_name       = data.terraform_remote_state.shared.outputs.cardo-lambda-function-name
  cloudwatch_log_stream           = data.terraform_remote_state.shared.outputs.cloudwatch_log_stream
  retention_period                = data.terraform_remote_state.shared.outputs.retention_period
  registrations_deploy_bucket_id  = data.terraform_remote_state.shared.outputs.registrations-deploy-bucket-id
  aws_account                     = data.terraform_remote_state.shared.outputs.aws-account
  timeout                         = data.terraform_remote_state.shared.outputs.timeout
  memory_size                     = data.terraform_remote_state.shared.outputs.memory-size
  table_billing_mode              = data.terraform_remote_state.shared.outputs.table-billing-mode
  dynamodb_point_in_time_recovery = data.terraform_remote_state.shared.outputs.dynamodb_point_in_time_recovery
  region                          = data.terraform_remote_state.shared.outputs.region
  environment                     = data.terraform_remote_state.shared.outputs.environment
  project_name                    = data.terraform_remote_state.shared.outputs.project_name
}
has context menu