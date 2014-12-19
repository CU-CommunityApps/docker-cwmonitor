#!/usr/bin/env ruby

while 1 do
  puts `/aws-scripts-mon/mon-put-instance-data.pl --mem-util --swap-util --disk-path=/ --disk-space-util`
  sleep(300)
end