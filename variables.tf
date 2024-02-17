variable "aws_region" {
    description = "AWS region for infrastructure"

    type = string
    default = "us-west-2"
}

variable "availability_zone_one" {
    description = "Public subnet AZ"

    type = string
    default = "us-west-2a"
}

variable "availability_zone_two" {
    description = "Private subnet AZ"

    type = string
    default = "us-west-2b"
}
