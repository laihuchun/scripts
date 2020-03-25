#!/bin/bash

content=`wget -q -O - http://icanhazip.com/|sed 's/\.//g'`
content_ip_record=`ping fuckme.ingogogo.com -c 1|grep -oP '(?<=\().*(?=\):)'|sed 's/\.//g'`

api_token="API_TOKEN"
id="ID"

#添加域名信息
function add_domin()
{
curl -X POST https://dnsapi.cn/Domain.Create -d 'login_token=cfacc360bc7588e959394e481fe54b24
&domain=fuckme.ingogogo.com&format=json'
}

#获取域名信息 

function get_domin_info()
{
curl -X POST https://dnsapi.cn/Domain.Info -d 'login_token=148346，cfacc360bc7588e959394e481fe54b24&format=json&domain_id=71663193'
}

#ingogo的domain_id为
71663193

#获取记录列表
function get_domain()
{
curl -X POST https://dnsapi.cn/Record.List -d 'login_token=148346,cfacc360bc7588e959394e481fe54b24&format=json&domain_id=71663193&sub_domain=fuckme&record_type=A&offset=0&length=3'|jq
}

#record_id 561684631
#修改记录

function modify_record()
{
ip=$1
curl -X POST https://dnsapi.cn/Record.Modify -d "login_token=148346,cfacc360bc7588e959394e481fe54b24&format=json&domain_id=71663193&record_id=561684631&sub_domain=fuckme&value=${ip}&record_type=A&record_line_id=10%3D0"
}



#获取外网ip



function judge()
{
if [ $content = $content_ip_record ]; 
	then echo 11; 
else echo 22; 
fi
}	
