echo '1 2 2 3 4 4'|xargs -n 1|uniq -c|awk '{print $2,$1}'|cut -d" " -f1-2  --output-delimiter=":"|sort -t ':' -nrk2
4:2
2:2
3:1
1:1

---------------------------------------------------------------------------------------------------
#-d(目录) -f(文件) -e(文件、目录exists) -r(读) -w(写) -x(执行) -s(非空则真) -z(为空则真) -n(非空则真)
val=hello
if [ $val ]  if [ -n $val ]  if [ -z $val] 
fi


#!/bin/bash
value = 6
if [ $value -gt 4 ] && [ $value -lt 7 ] && [ $value -ne 8 ]
then
	echo "正确"
else
	echo "错误"
fi




#!/bin/bash
value1=hello
value2=hi
#>必须要转义，否则会被当做重定向使用
if [ $value1 \> $value ]; then
	echo "$value1 greater than $value2"
else
	echo "$value1 less than $value2"
fi 

#!/bin/bash 
val1=testing 
val2='' 
# 
if [ -n $val1 ] 
then 
   echo "The string '$val1' is not empty" 
else 
   echo "The string '$val1' is empty" 
fi 
# 
if [ -z $val2 ] 
then 
   echo "The string '$val2' is empty" 
else 
   echo "The string '$val2' is not empty" 
fi 
# 
if [ -z $val3 ] 
then 
   echo "The string '$val3' is empty" 
else 
   echo "The string '$val3' is not empty" 
fi 


#!/bin/bash
do_date=$1
echo '$do_date'
echo "$do_date"
echo "'$do_date'"
echo '"$do_date"'
echo `date`
echo $do_date
echo date

test.sh 2020-06-06
运行结果如下：
$do_date
2020-06-06
'2020-06-06'
"$do_date"
2020年 07月 01日 星期三 14:47:59 CST
2020-06-06
date

（1）单引号不取变量值
（2）双引号取变量值
（3）反引号``，执行引号中命令
（4）双引号内部嵌套单引号，取出变量值
（5）单引号内部嵌套双引号，不取出变量值

[root@hadoop101 bigdata]# echo `date`
2020年 07月 01日 星期三 17:19:00 CST
[root@hadoop101 bigdata]# echo $(date)
2020年 07月 01日 星期三 17:19:45 CST
[root@hadoop101 bigdata]# 


[root@hadoop101 /]# wc < host_ip.txt 
  3  12 114

#[root@hadoop101 /]# wc << EOF
> hadoop101
> hadoop102
> hadoop103
> EOF

 3  3 30(行数 词数 字节数)
 
 
bash shell为了保持跟Bourne shell的兼容而包含了expr命令，但它同样也提供了一种更简单
的方法来执行数学表达式。在bash中，在将一个数学运算结果赋给某个变量时，可以用美元符和
方括号（$[ operation ]）将数学表达式围起来。


双括号的作用：
在shell中，[ $a != 1 || $b = 2 ]是不允许的，要用[ $a != 1 ] || [ $b = 2 ]，
而双括号就可以解决这个问题的，[[ $a != 1 || $b = 2 ]]。
又比如这个[ "$a" -lt "$b" ]，也可以改成双括号的形式(("$a" < "$b"))

#!/bin/bash

#a>b且a<c
a=5
b=2
c=8
if [ $a -gt $b ] && [ $a -lt $c ]; then
	echo "1"
else
	echo "-1"
fi

if [ $a \> $b ] && [ $a \< $c ]; then
	echo "2"
else
	echo "-1"
fi

if [ $a -gt $b -a $a -lt $c ]; then
	echo "3"
else
	echo "-1"
fi

if [[ $a > $b ]] && [[ $a < $c ]]; then
	echo "4"
else
	echo "-1"
fi

if (( $a > $b )) && (( $a < $c )); then
	echo "5"
else
	echo "-1"
fi


#!/bin/bash
case $1 in
start | restart){
	echo "start | restart"
};;
stop){
	echo "stop"
};;
*){
	echo "default commands"
};;
esac

#!/bin/bash
file="/host_ip.txt"
#内部字段分隔符:空格、制表符、换行符作为默认字段分隔符 如果bash shell在数据中看到了这些字符中的任意一个，它就会以该分隔符进行分隔。
IFS_OLD=$IFS 
IFS=$'\n'
for i in $(cat $file)
do
	echo "映射信息是 $i"
done
IFS=$IFS_OLD


#!/bin/bash 
# changing the IFS value 
 
IFS.OLD=$IFS 
IFS=$'\n' 
for entry in $(cat /etc/passwd) 
do 
    echo "Values in $entry –" 
	#IFS=$'\n':;" 这个赋值会将换行符、冒号、分号和双引号作为字段分隔符
    IFS=: 
    for value in $entry 
    do 
       echo "   $value" 
    done 
done 


#!/bin/bash
while read line
do
   echo $line | awk -F" " '{print $1}'
done < /host_ip.txt

-n 读取字符数   -p提示符   -s隐藏输入
read -n1 -p "Do you want to continue [Y/N]? " answer 
read -s -p "Enter your password: " pass 


#!/bin/bash 
# read file and create INSERT statements for MySQL 
outfile='/usr/local/bin/members.sql' 
IFS=,
while read name age sex address city  
do
   cat >> $outfile << EOF
INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('$lname', '$fname', '$address', '$city', '$state', '$zip'); 
EOF
done < $1

test.sh members.csv

members.csv: 
xiaohei,20,男,陕西,西安
xiaobai,19,女,广东,广州
zhansan,18,男,浙江,杭州
lissani,17,女,江苏,南京


#!/bin/sh
#“<<EOF“表示后续的输入作为子命令或子shell的输入，直到遇到”EOF“，再次返回到主调shell
mysql -uroot -p <<EOF
use rdd;
select * from student;
exit
EOF




#awk
var="http://www.aaa.com/root/123.htm"

echo $var |awk -F '//' '{print $2}'
echo $var |awk -F '/' '{print $5}'
echo $var |grep -o 'http.*root'
echo $var |awk -F '/' '{print $1}'
echo $var |grep -o 'http://'
echo $var |grep -o 'www.*htm'
echo $var |grep -o '123'
echo $var |grep -o '123.htm'


 
#heae -100查看文件前100行 tail -20 查看文件后20行
head -100 /etc/profile | tail -20 

#sed命令 中-n 参数搭配p 一起来使用
#打印文件第一行
sed -n '1p' /etc/profile

#打印文件第1到3行
sed -n '1,3p' /etc/profile

#打印含有HOME的所有行，打印以HOME结尾的所有行
sed -n '/HOME/p'  /etc/profile
sed -n '/.*HOME/p' /etc/profile


sed 's/^$/\!/g' /etc/profile  将空行替换成！

sed 's:/bin/bash:/bin/csh:' /etc/passwd
sed 's!/bin/bash!/bin/csh!' /etc/passwd
sed '/bigdata/s!/bin/bash!/bin/csh!' /etc/passwd #把/etc/passwd中含有bigdata的行的/bin/bash替换为/bin/csh,!为分隔符，否自要用\来转义/


sort:
-n:按照数字排序
-r:倒叙
-k:第几列
-t:分隔符

awk:
-F:分隔符
OFS：要输出字段的分隔符
print $1,$3：打印第一列和第三列
sort -nrk3 -t: /etc/passwd | awk -F: '{print $1,$3}' OFS=":"

--------------------------------------------------------------------------

words.txt：
the day is sunny the the
the sunny is is
#统计单词个数并降序排序

cat words.txt | xargs -n1 | sort | uniq -c | sort -nr | awk '{print $2,$1}'

--------------------------------------------------------------------------



批量删除jps下的所有进程
jps | awk  '{print $1}' | xargs kill -9












































