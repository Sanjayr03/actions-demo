variable "bucket" { 
    description = "Enter a bucket name "
    type = string
}
variable "acl" {
    type = bool
    description = "Enter a acl method"
}
variable "versioning" {
    type = bool
    description="Enter Versioning type" 
}