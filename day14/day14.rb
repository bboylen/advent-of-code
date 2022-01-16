lines = File.open('input').readlines.map(&:chomp)
template = lines[0]
rules = lines[2..-1]
rules.map! { |rule| rule.split(' -> ') }

def transform(template, rules)
  return_template = template
  rules.each do |rule|
    return_template = template.gsub(rule[0], "#{rule[0][0]}#{rule[1]}#{rule[0][1]}")
    # iterate through string with sliding window of size 2. if substring matches rule AND hasn't been "visited", make the replacement
  end
  return_template
end

template_a = template
10.times do |_i|
  template_a = transform(template_a, rules)
end

print template_a
