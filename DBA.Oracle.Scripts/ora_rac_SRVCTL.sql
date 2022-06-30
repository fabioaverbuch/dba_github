Database:
srvctl remove database -d db_name [-f]
srvctl start database -d db_name [-o start_options] [-c connect_str|-q]
srvctl start database -d db_name [-o open]
srvctl start database -d db_name -o nomount
srvctl start database -d db_name -o mount
srvctl stop database -d db_name [-o stop_options] [-c connect_str|-q]
srvctl stop database -d db_name [-o normal]
srvctl stop database -d db_name -o transactional
srvctl stop database -d db_name -o immediate
srvctl stop database -d db_name -o abort
srvctl status database -d db_name [-f] [-v] [-S level]
srvctl status database -d db_name -v service_name
srvctl enable database -d db_name
srvctl disable database -d db_name
srvctl getenv database -d db_name [-t name_list]
srvctl setenv database -d db_name {-t name=val[,name=val,...]|-T name=val}
srvctl unsetenv database -d db_name [-t name_list]					 

Instance:
srvctl add instance –d db_name –i inst_name -n node_name
srvctl remove instance –d db_name –i inst_name [-f]
srvctl start instance -d db_name -i inst_names [-o start_options] [-c connect_str|-q]
srvctl start instance –d db_name –i inst_names [-o open]
srvctl start instance –d db_name –i inst_names -o nomount
srvctl start instance –d db_name –i inst_names -o mount
srvctl stop instance -d db_name -i inst_names [-o stop_options] [-c connect_str|-q]
srvctl stop instance –d db_name –i inst_names [-o normal]
srvctl stop instance –d db_name –i inst_names -o transactional
srvctl stop instance –d db_name –i inst_names -o immediate
srvctl stop instance –d db_name –i inst_names -o abort
srvctl status instance –d db_name –i inst_names [-f] [-v] [-S level]
srvctl enable instance –d db_name –i inst_names
srvctl disable instance –d db_name –i inst_names
srvctl modify instance -d db_name -i inst_name {-s asm_inst_name|-r} 
srvctl modify instance -d db_name -i inst_name -n node_name 
srvctl modify instance -d db_name -i inst_name -r 
srvctl getenv instance –d db_name –i inst_name [-t name_list]
srvctl setenv instance –d db_name [–i inst_name] {-t "name=val[,name=val,...]" | -T "name=val"}
srvctl unsetenv instance –d db_name [–i inst_name] [-t name_list]
								 
Service:
srvctl add service -d db_name -s service_name -r pref_insts [-a avail_insts] [-P TAF_policy]
srvctl add service -d db_name -s service_name -u {-r "new_pref_inst" | -a "new_avail_inst"}
srvctl start service -d db_name [-s service_names [-i inst_name]] [-o start_options]
srvctl start service -d db_name -s service_names [-o open]
srvctl start service -d db_name -s service_names -o nomount
srvctl start service -d db_name -s service_names -o mount						   
srvctl remove service -d db_name -s service_name [-i inst_name] [-f]
srvctl stop service -d db_name [-s service_names [-i inst_name]] [-f]
srvctl status service -d db_name [-s service_names] [-f] [-v] [-S level]
srvctl relocate service -d db_name -s service_name –i old_inst_name -t target_inst [-f]
srvctl enable service -d db_name -s service_names [–i inst_name]
srvctl disable service -d db_name -s service_names [–i inst_name]
srvctl config service -d db_name [-s service_name] [-a] [-S level]
srvctl config service -d db_name -a -- -a shows TAF configuration
srvctl modify service -d db_name -s service_name -i old_inst_name -t new_inst_name [-f]
srvctl modify service -d db_name -s service_name -i avail_inst_name -r [-f]
srvctl modify service -d db_name -s service_name -n -i preferred_list [-a available_list] [-f]
srvctl modify service -d db_name -s service_name -i old_inst_name -a avail_inst -P TAF_policy
srvctl getenv service -d db_name -s service_name -t name_list
srvctl setenv service -d db_name [-s service_name] {-t "name=val[,name=val,...]" | -T "name=val"}
srvctl unsetenv service -d db_name -s service_name -t name_list											  

ASM:
srvctl add asm -n node_name -i asminstance -o ORACLE_HOME [-p spfile]
srvctl remove asm -n node_name [-i asminstance] [-f]
srvctl start asm -n node_name [-i asminstance] [-o start_options] [-c connect_str|-q]
srvctl start asm -n node_name [-i asminstance] [-o open]
srvctl start asm -n node_name [-i asminstance] -o nomount
srvctl start asm -n node_name [-i asminstance] -o mount
srvctl stop asm -n node_name [-i asminstance] [-o stop_options] [-c connect_str|-q]
srvctl stop asm -n node_name [-i asminstance] [-o normal]
srvctl stop asm -n node_name [-i asminstance] -o transactional
srvctl stop asm -n node_name [-i asminstance] -o immediate
srvctl stop asm -n node_name [-i asminstance]-o abort
srvctl status asm -n node_name
srvctl enable asm -n node_name [-i asminstance]
srvctl disable asm -n node_name [-i asminstance]
srvctl config asm -n node_name
srvctl modify asm -n node_name -i asminstance [-o ORACLE_HOME] [-p spfile]											  

Listener:
srvctl add listener -n node_name -o ORACLE_HOME [-l listener_name]  
srvctl remove listener -n node_name [-l listener_name] 
srvctl start listener -n node_name [-l listener_names]
srvctl stop listener -n node_name [-l listener_names]
srvctl status listener [-n node_name] [-l listener_names] 
srvctl config listener -n node_name
srvctl modify listener -n node_name [-l listener_names] -o ORACLE_HOME     
												  
Diskgroup:
srvctl remove diskgroup -g diskgroup_name [-n node_list] [-f]
srvctl start diskgroup -g diskgroup_name [-n node_list]
srvctl stop diskgroup -g diskgroup_name [-n node_list] [-f]
srvctl status diskgroup -g diskgroup_name [-n node_list] [-a]
srvctl enable diskgroup -g diskgroup_name [-n node_list]
srvctl disable diskgroup -g diskgroup_name [-n node_list]												  
												  
Home:
srvctl start home -o ORACLE_HOME -s state_file [-n node_name]
srvctl stop home -o ORACLE_HOME -s state_file [-t stop_options] [-n node_name] [-f]
srvctl status home -o ORACLE_HOME -s state_file [-n node_name]
												  
FileSystem:
srvctl add filesystem -d volume_device -v volume_name -g diskgroup_name [-m mountpoint_path] [-u user_name]
srvctl remove filesystem -d volume_device_name [-f]
srvctl start filesystem -d volume_device_name [-n node_name]
srvctl stop filesystem -d volume_device_name [-n node_name] [-f]
srvctl status filesystem -d volume_device_name
srvctl enable filesystem -d volume_device_name
srvctl disable filesystem -d volume_device_name
srvctl config filesystem -d volume_device_path
srvctl modify filesystem -d volume_device_name -u user_name											  
												  
SrvPool (Server Pool):
srvctl add srvpool -g server_pool [-i importance] [-l min_size] [-u max_size] [-n node_list] [-f]
srvctl remove srvpool -g server_pool
srvctl status srvpool [-g server_pool] [-a]
srvctl config srvpool [-g server_pool]
srvctl modify srvpool -g server_pool [-i importance] [-l min_size] [-u max_size] [-n node_name_list] [-f]											  
												  
Server:
srvctl status server -n "server_name_list" [-a]
srvctl relocate server -n "server_name_list" -g server_pool_name [-f]											  
												  
Scan (Single Client Access Name):
srvctl add scan -n scan_name [-k network_number] [-S subnet/netmask[/if1[|if2|...]]]
srvctl remove scan [-f]
srvctl start scan [-i ordinal_number] [-n node_name]
srvctl stop scan [-i ordinal_number] [-f]
srvctl status scan [-i ordinal_number]
srvctl enable scan [-i ordinal_number]
srvctl disable scan [-i ordinal_number]
srvctl config scan [-i ordinal_number]
srvctl modify scan -n scan_name
srvctl relocate scan -i ordinal_number [-n node_name]																	 
																		 
Scan_listener:
srvctl add scan_listener [-l lsnr_name_prefix] [-s] [-p "[TCP:]port_list[/IPC:key][/NMP:pipe_name][/TCPS:s_port] [/SDP:port]"]
srvctl remove scan_listener [-f]
srvctl start scan_listener [-n node_name] [-i ordinal_number]
srvctl stop scan_listener [-i ordinal_number] [-f]
srvctl status scan_listener [-i ordinal_number]
srvctl enable scan_listener [-i ordinal_number]
srvctl disable scan_listener [-i ordinal_number]
srvctl config scan_listener [-i ordinal_number]
srvctl modify scan_listener {-p [TCP:]port[/IPC:key][/NMP:pipe_name] [/TCPS:s_port][/SDP:port] | -u }
srvctl relocate scan_listener -i ordinal_number [-n node_name]																	 
																		 
GNS (Grid Naming Service):
srvctl add gns -i ip_address -d domain
srvctl remove gns [-f]
srvctl start gns [-l log_level] [-n node_name]
srvctl stop gns [-n node_name [-v] [-f]
srvctl status gns [-n node_name]
srvctl enable gns [-n node_name]
srvctl disable gns [-n node_name]
srvctl config gns [-a] [-d] [-k] [-m] [-n node_name] [-p] [-s] [-V] [-q name] [-l] [-v]
srvctl modify gns [-i ip_address] [-d domain]
srvctl relocate gns [-n node_name