lines = File.open('input').readlines.map(&:chomp)
template = lines[0]
rules = lines[2..-1]
rules.map! { |rule| rule.split(' -> ') }

def transform(template, rules)
  return_template = template
  print return_template
  puts
  rules.each do |rule|
    print rule[0][0]
    puts
    return_template = template.gsub(rule[0], "#{rule[0][0]}#{rule[1]}#{rule[0][1]}")
  end
  return_template
end

template_a = template
10.times do |_i|
  template_a = transform(template_a, rules)
end

print template_a
