#
# Cookbook Name:: mariadb
# Resource:: extraconf
#

actions :add, :remove
default_action :add

# name of the extra conf file, used for .cnf filename
attribute :conf_name, kind_of: String, name_attribute: true
attribute :section, kind_of: String
attribute :option,  kind_of: Array, default: []
