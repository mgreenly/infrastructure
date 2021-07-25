
[prefix]-[project]-[env]-[resource]-[location]-[description]-[suffix]


Prefix
  lr         all projects have this `LogicRefiner' prefix

Project values
  none       root infrastructure

environment values
  t          test
  s          stage
  p          prod

Region
  ue1        us-east-1
  ue2        us-east-2
  uw2        us-west-2

Resource Type
  s3bk       s3 bucket
  52zn       route 52 zone
  ecin       ec2 instance
  ecsg       ec2 security group


Description/Suffix
  this part should be human readable and with a random suffix if it makes sense (think pod names in kubernetes)

