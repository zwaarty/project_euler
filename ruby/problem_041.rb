require_relative 'project_euler'

# FIXME: too slow!
p Prime.each(1_000_000_000).select(&:pandigital?).last

