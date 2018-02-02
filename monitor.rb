#!/usr/bin/env ruby

disk_path = "--disk-path=/rootfs"
if ENV["PATHS"]
  ENV["PATHS"].split(",").each do |path|
    disk_path += " --disk-path=/rootfs" + path
  end
end

asg_flag = ""
if ENV["IS_ASG"]
  asg_flag = "--auto-scaling"
end

while 1 do
  puts `/aws-scripts-mon/mon-put-instance-data.pl --mem-util --swap-util #{disk_path} --disk-space-util #{asg_flag}`
  sleep(300)
end
