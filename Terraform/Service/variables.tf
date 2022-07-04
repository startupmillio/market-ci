variable "project_name" {
  type = string
}

variable "project_region" {
    type = string
}

variable "project_env" {
    type = string
}

variable "service_name" {
    type = string
}

variable "service_replica_count" {
    type = string
}

variable "service_image" {
    type = string
}

variable "k8s_cluster_endpoint" {
    type = string
}

variable "k8s_cluster_cert" {
    type = string
}

variable "k8s_cluster_name" {
    type = string
}

variable "k8s_cluster_token" {
    type = string
}