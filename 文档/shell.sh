

#-d(目录) -f(文件) -e(文件、目录exists) -r(读) -w(写) -x(执行) -s(空) -z(判断字符串是否为空，默认为true)
if [ -d $file2 ]
then
   echo "-d:是"
else
   echo "-d:不是目录"
fi


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