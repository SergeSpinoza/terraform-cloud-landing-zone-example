variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

### BUCKETS ###
# terraform_ci_storage_bucket
variable bucket_01_location {
  description = "The GCS location."
  default     = ""
}

variable bucket_01_storage_class {
  description = "The Storage Class of the new bucket. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default     = "REGIONAL"
}

variable bucket_01_versioning {
  description = "While set to true, versioning is fully enabled for this bucket."
  default     = "true"
}

variable bucket_01_action_type {
  description = "The type of the action of this Lifecycle Rule. Supported values include: Delete and SetStorageClass."
  default     = "SetStorageClass"
}

variable bucket_01_action_storage_class {
  description = "The target Storage Class of objects affected by this Lifecycle Rule. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default     = "NEARLINE"
}

variable bucket_01_condition_age {
  description = "Minimum age of an object in days to satisfy this condition."
  default     = "60"
}

variable bucket_01_condition_created_before {
  description = "Creation date of an object in RFC 3339 (e.g. 2017-06-13) to satisfy this condition."
  default     = "2020-01-27"
}

variable bucket_01_condition_is_live {
  description = "Relevant only for versioned objects. If true, this condition matches live objects, archived objects otherwise."
  default     = "false"
}

variable bucket_01_condition_storage_class {
  description = "Storage Class of objects to satisfy this condition. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, DURABLE_REDUCED_AVAILABILITY."
  type        = list
  default     = ["REGIONAL"]
}

variable bucket_01_condition_num_newer_versions {
  description = "Relevant only for versioned objects. The number of newer versions of an object to satisfy this condition."
  default     = "10"
}

