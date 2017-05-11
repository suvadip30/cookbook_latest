#
# mysqld default configuration
#
default['mariadb']['mysqld']['user']                    = 'mysql'
default['mariadb']['mysqld']['pid_file']                = '/var/run/mysqld' + \
  '/mysqld.pid'
default['mariadb']['mysqld']['socket']                  = '/var/run/mysqld' + \
  '/mysqld.sock'
default['mariadb']['mysqld']['port']                    = '3306'
default['mariadb']['mysqld']['basedir']                 = '/usr'
default['mariadb']['mysqld']['datadir']                 = '/var/lib/mysql'
default['mariadb']['mysqld']['tmpdir']                  = '/var/tmp'
default['mariadb']['mysqld']['lc_messages_dir']         = '/usr/share/mysql'
default['mariadb']['mysqld']['lc_messages']             = 'en_US'
default['mariadb']['mysqld']['skip_external_locking']   = 'true'
default['mariadb']['mysqld']['bind_address']            = '127.0.0.1'
default['mariadb']['mysqld']['max_connections']         = '100'
default['mariadb']['mysqld']['connect_timeout']         = '5'
default['mariadb']['mysqld']['wait_timeout']            = '600'
default['mariadb']['mysqld']['max_allowed_packet']      = '16M'
default['mariadb']['mysqld']['thread_cache_size']       = '128'
default['mariadb']['mysqld']['sort_buffer_size']        = '4M'
default['mariadb']['mysqld']['bulk_insert_buffer_size'] = '16M'
default['mariadb']['mysqld']['tmp_table_size']          = '32M'
default['mariadb']['mysqld']['max_heap_table_size']     = '32M'
default['mariadb']['mysqld']['myisam_recover']          = 'BACKUP'
default['mariadb']['mysqld']['key_buffer_size']         = '128M'
# if not defined default is 2000
default['mariadb']['mysqld']['open_files_limit']        = ''
default['mariadb']['mysqld']['table_open_cache']        = '400'
default['mariadb']['mysqld']['myisam_sort_buffer_size'] = '512M'
default['mariadb']['mysqld']['concurrent_insert']       = '2'
default['mariadb']['mysqld']['read_buffer_size']        = '2M'
default['mariadb']['mysqld']['read_rnd_buffer_size']    = '1M'
default['mariadb']['mysqld']['query_cache_limit']       = '128K'
default['mariadb']['mysqld']['query_cache_size']        = '64M'
# if not defined default is ON
default['mariadb']['mysqld']['query_cache_type']        = ''
default['mariadb']['mysqld']['default_storage_engine']  = 'InnoDB'
default['mariadb']['mysqld']['options']                 = {}

#
# InnoDB default configuration
#
# if not defined default is 50M
default['mariadb']['innodb']['log_file_size']          = ''
default['mariadb']['innodb']['bps_percentage_memory']  = false
default['mariadb']['innodb']['buffer_pool_size']       = '256M'
default['mariadb']['innodb']['log_buffer_size']        = '8M'
default['mariadb']['innodb']['file_per_table']         = '1'
default['mariadb']['innodb']['open_files']             = '400'
default['mariadb']['innodb']['io_capacity']            = '400'
default['mariadb']['innodb']['flush_method']           = 'O_DIRECT'
default['mariadb']['innodb']['options']                = {}

#
# Galera default configuration
#
default['mariadb']['galera']['cluster_name'] = 'galera_cluster'
default['mariadb']['galera']['wsrep_sst_method']   = 'rsync'
default['mariadb']['galera']['wsrep_provider']     = \
  '/usr/lib/galera/libgalera_smm.so'
default['mariadb']['galera']['options']            = {}

#
# Replication default configuration
#
default['mariadb']['replication']['server_id']        = ''
default['mariadb']['replication']['log_bin']          = \
  '/var/log/mysql/mariadb-bin'
default['mariadb']['replication']['log_bin_index']    = \
  '/var/log/mysql/mariadb-bin.index'
default['mariadb']['replication']['expire_logs_days'] = '10'
default['mariadb']['replication']['max_binlog_size']  = '100M'

#
# mysqldump default configuration
#
default['mariadb']['mysqldump']['quick'] = 'true'
default['mariadb']['mysqldump']['quote_names'] = 'true'
default['mariadb']['mysqldump']['max_allowed_packet'] = '16M'

#
# isamchk default configuration
default['mariadb']['isamchk']['key_buffer'] = '16M'

#
# mysqld_safe default configuration
#
default['mariadb']['mysqld_safe']['socket']  = '/var/run/mysqld/mysqld.sock'
default['mariadb']['mysqld_safe']['options'] = {}

#
# client default configuration
#
default['mariadb']['client']['port']    = 3306
default['mariadb']['client']['socket']  = '/var/run/mysqld/mysqld.sock'
default['mariadb']['client']['options'] = {}

#
# debian specific conficguration
#
default['mariadb']['debian']['user']     = 'debian-sys-maint'
default['mariadb']['debian']['password'] = 'please-change-me'
default['mariadb']['debian']['host']     = 'localhost'

#
# mariadb default install configuration
#
# install valid values are 'apt', (for now, and 'yum' or 'from_source' in the future)
default['mariadb']['install'] = 'apt'

#
# apt default configuration
#
default['mariadb']['apt']['use_default_repository'] = false
