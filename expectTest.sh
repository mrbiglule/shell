#!/usr/bin/expect -f
send "please input root account name\n"
expect "root"
set account [string trim $expect_out(buffer)]
send "input passwd: \n"
expect "123456"
set passwd [string trim $expect_out(buffer)]
spawn echo p$passwd
spawn mysql -u$account -p$passwd
#spawn ssh mrbiglule@lule.me
send "use yourdb\n"
send "show tables;\n"
interact
