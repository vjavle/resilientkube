variable "environment" {
  type = string
}
variable "application_name" {
  type = string
}
variable "business_unit" {
  type = string
}
variable "administrator_login_uid" {
    type = string
}
variable "administrator_login_pwd" {
    type = string
}
variable "start_ip_address" {
    type = string
}
variable "end_ip_address" {
    type = string
}
variable "dr_regions" {
    type = map
}