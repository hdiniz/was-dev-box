print "WAS Default configuration"

cellName = AdminControl.getCell()

server = AdminConfig.getid('/Server:server1/')

print "Enabling server1 debug"
AdminConfig.modify(server, '[[developmentMode "true"] [parallelStartEnabled "true"] [provisionComponents "false"]]')
jvm = AdminConfig.list('JavaVirtualMachine', server)
AdminConfig.modify(jvm, '[[debugMode "true"]]')
AdminConfig.create('DebugService', server, '[[BSFDebugPort "4444"] [enable "true"] [jvmDebugPort "7777"] [jvmDebugArgs "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=7777"] [debugClassFilters ""] [BSFLoggingLevel "0"]]')

print "Saving configuration"
AdminConfig.save()

