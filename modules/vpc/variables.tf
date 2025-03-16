variable private_nacl_ingress_rules {
  type        = map
  default     = {
    "allTraficFromPublicSubnet": {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block = null
        from_port = 0
        to_port = 0
    },
    "http": {
        protocol = "tcp"
        rule_no = 70
        action = "allow"
        cidr_block = null
        from_port = 80
        to_port = 80
    },
    "https": {
        protocol = "tcp"
        rule_no = 80
        action = "allow"
        cidr_block = null
        from_port = 443
        to_port = 443
    },
    "ephemeralDoors": {
        protocol = "tcp"
        rule_no = 90
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 32768
        to_port = 61000
    }
  }
  description = "private nacl ingress rules"
}
