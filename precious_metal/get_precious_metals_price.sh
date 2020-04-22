#!/bin/bash
#   http://tool.ccb.com/webtran/static/trendchart/index.html 这里爬
#  品种code
#					<option value="019995">AU9995</option>
#					<option value="019999">AU9999</option>
#					<option value="030001">人民币铂</option>
#					<option value="020001">人民币银</option>
#					<option value="030002">美元铂(钞)</option>
#					<option value="030003">美元铂(汇)</option>
#					<option value="010002">美元金(钞)</option>
#					<option value="010003">美元金(汇)</option>
#					<option value="020002">美元银(钞)</option>
#					<option value="020003">美元银(汇)</option>
#                    <option value="999927">人民币钯</option>
#                    <option value="999928">美元钯(钞)</option>
#                    <option value="999929">美元钯(汇)</option>

curl -s 'http://tool.ccb.com/webtran/static/trendchart/getAccountData.gsp?dateType=timeSharing&sec_code=020001'|grep -oP '(?<="new_pri":")[0-9.]*'
