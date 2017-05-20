# require 'trollop'
# opts = Trollop::options do
#   opt :lala, "Use monkey mode"                    # flag --monkey, default false
#   opt :name, "Monkey name", :type => :string        # string --name <s>, default nil
#   opt :depth, "Display depth of content", :default => 8  # integer --depth <i>, default to 4
# end
#
# p opts # a hash: { :monkey=>false, :name=>nil, :num_limbs=>4, :help=>false }



# opts = Trollop::options do
#   version "Search v1"
#   banner <<-EOS
# Usage:
#        st [options]
# where [options] are:
# EOS
#
#   opt :depth, "Display depth of content", :default => 8
# end
#
# p opts[:depth]
# Trollop::die :volume, "must be non-negative" if opts[:volume] < 0
# Trollop::die :file, "must exist" unless File.exist?(opts[:file]) if opts[:file]
