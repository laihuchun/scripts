#!/bin/bash
id="你的id"
api_token="你的token"
#domain_id和record_id没写函数，自己请求一下

real_ip=`wget -q -O - http://icanhazip.com/`
real_ip_bijiao=`echo $real_ip|sed 's/\.//g'`
dns_ip=
dns_ip_bijiao=

# api_token 去这里申请 https://www.dnspod.cn/console/user/security 


#添加域名信息
function add_domin()
{
curl -X POST https://dnsapi.cn/Domain.Create -d "login_token=$api_token
&domain=fuckme.ingogogo.com&format=json"
}

#获取你的域名ip，以便判断避免相同记录重复提交
function get_ip4_dns()
   {
    dns_ip=`curl -s -X POST https://dnsapi.cn/Record.List -d "login_token=$id,$api_token&format=json&domain_id=71663193&sub_domain=fuckme&record_type=A&offset=0&length=3"|grep -oP '(?<=value":").*(?=","enable)'`
    dns_ip_bijiao=`echo $dns_ip|sed 's/\.//g'`
    }

#获取域名信息 

function get_domin_info()
{
curl -s -X POST https://dnsapi.cn/Domain.Info -d "login_token=$id,$api_token&format=json&domain_id=71663193"
}

#获取记录列表
function get_domain()
{
curl -s -X POST https://dnsapi.cn/Record.List -d "login_token=$id,$api_token&format=json&domain_id=71663193&sub_domain=fuckme&record_type=A&offset=0&length=3"|jq
}

#修改记录

function modify_record()
{
ip=$1
curl -s -X POST https://dnsapi.cn/Record.Modify -d "login_token=$id,$api_token&format=json&domain_id=71663193&record_id=561684631&sub_domain=fuckme&value=${ip}&record_type=A&record_line=默认"
}



#获取外网ip



function judge()
{
if [ $real_ip_bijiao == $dns_ip_bijiao ];
	then echo 'do nothing';
else modify_record $real_ip;
fi
}
