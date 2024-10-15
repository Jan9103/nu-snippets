# Documentation: https://docs.voidlinux.org/config/services/index.html#managing-services

def enabled_services [] {
  ls /var/service | get name | each {|i| $i | path basename}
}

def disabled_services [] {
  let enabled_services = (enabled_services)
  ls /etc/sv
  | get name
  | each {|i| $i | path basename}
  | where not $it in $enabled_services
}

def all_services [] {
  ls /etc/sv | get name | each {|i| $i | path basename}
}

# start a service
export extern up [
  service: string@"disabled_services"
]

# stop a service
export extern down [
  service: string@"enabled_services"
]

# restart a service
export extern restart [
  service: string@"enabled_services"
]

# get the status of a service
export extern status [
  service: string@"all_services"
]
