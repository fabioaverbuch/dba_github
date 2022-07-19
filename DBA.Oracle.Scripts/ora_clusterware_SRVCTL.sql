Database:
srvctl remove database -d db_name [-f]
srvctl start database -d db_name [-o open | nomount | mount] 
srvctl stop database -d db_name [-o normal | transactional | immediate | abort]
srvctl status database -d db_name [-f] [-v] [-S level]
srvctl enable database -d db_name
srvctl disable database -d db_name

Instance:
srvctl add instance –d db_name –i inst_name -n node_name
srvctl remove instance –d db_name –i inst_name [-f]
srvctl start instance -d db_name -i inst_names [-o open | nomount | mount] 
srvctl stop instance -d db_name -i inst_names [-o normal | transactional | immediate | abort]
srvctl status instance –d db_name –i inst_names [-f] [-v] [-S level]
srvctl enable instance –d db_name –i inst_names
srvctl disable instance –d db_name –i inst_names
								 
Service:
srvctl add service -d db_name -s service_name -r pref_insts [-a avail_insts] [-P TAF_policy]
srvctl start service -d db_name [-s service_names [-i inst_name]] [-o open | nomount | mount] 
srvctl stop service -d db_name [-s service_names [-i inst_name]] [-f]
srvctl status service -d db_name [-s service_names] [-f] [-v] [-S level]
srvctl remove service -d db_name -s service_name [-i inst_name] [-f]
srvctl enable service -d db_name -s service_names [–i inst_name]
srvctl disable service -d db_name -s service_names [–i inst_name]			  

ASM:
srvctl add asm -n node_name -i asminstance -o ORACLE_HOME [-p spfile]
srvctl remove asm -n node_name [-i asminstance] [-f]
srvctl start asm -n node_name [-i asminstance] [-o open | nomount | mount]
srvctl stop asm -n node_name [-i asminstance] [-o normal | transactional | immediate | abort]
srvctl status asm -n node_name
srvctl enable asm -n node_name [-i asminstance]
srvctl disable asm -n node_name [-i asminstance]									  

Listener:
srvctl add listener -n node_name -o ORACLE_HOME [-l listener_name]  
srvctl remove listener -n node_name [-l listener_name] 
srvctl start listener -n node_name [-l listener_names]
srvctl stop listener -n node_name [-l listener_names]
srvctl status listener [-n node_name] [-l listener_names] 
srvctl config listener -n node_name   
												  
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