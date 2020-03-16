variable project {
  description = "Projects name"
  default     = ""
}

variable folder_id {
  description = "Folder id"
  default     = ""
}

variable billing_account {
  description = "Billing Account"
  default     = ""
}

variable apis_list {
  description = "List of apis for enable"
  type        = list(string)
  default     = [""]
}

variable sa_roles_list {
  description = "List of sa roles"
  type        = list(string)
  default     = [""]
}

