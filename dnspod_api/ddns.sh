#!/bin/bash
real_ip=`wget -q -O - http://icanhazip.com/`
content=`echo $real_ip|sed 's/\.//g'`
content_ip_record=`ping fuckme.ingogogo.com -c 1|grep -oP '(?<=\().*(?=\) \d)'|sed 's/\.//g'`
dns_ip_len=`echo $content_ip_record|wc -l`
if [ ${#dns_ip_len} -eq 5 ];
then content_ip_record='114114114114'
fi
# api_token 去这里申请 https://www.dnspod.cn/console/user/security 


api_token="API_TOKEN"
id="ID"

#添加域名信息
function add_domin()
{
curl -X POST https://dnsapi.cn/Domain.Create -d "login_token=$api_token
&domain=fuckme.ingogogo.com&format=json"
}

#获取域名信息 

function get_domin_info()
{
curl -X POST https://dnsapi.cn/Domain.Info -d "login_token=$id,$api_token&format=json&domain_id=71663193"
}

#获取记录列表
function get_domain()
{
curl -X POST https://dnsapi.cn/Record.List -d "login_token=$id,$api_token&format=json&domain_id=71663193&sub_domain=fuckme&record_type=A&offset=0&length=3"|jq
}

#修改记录

function modify_record()
{
ip=$1
curl -X POST https://dnsapi.cn/Record.Modify -d "login_token=$id,$api_token&format=json&domain_id=71663193&record_id=561684631&sub_domain=fuckme&value=${ip}&record_type=A&record_line_id=10%3D0"
}



#获取外网ip



function judge()
{
if [ $content == $content_ip_record ];
	then echo 'do nothing';
else modify_record $real_ip;
fi
}
