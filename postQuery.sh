#/bin/sh
#about jq ,please go to http://stedolan.github.io/jq/manual/
RANDOMNUMBER=`echo $RANDOM`
EMAIL=your_email
POSTID=your_post_id
COMPANYCODE=company_code
curl -o jsontest 'http://www.kuaidi100.com/query?type='$COMPANYCODE'&postid='$POSTID'&id=11&temp='$RANDOMNUMBER
cat jsontest | /usr/local/bin/jq .data[0].time  >post_result
cat jsontest | /usr/local/bin/jq .data[0].context >>post_result
mail -s '快递查询结果' $EMAIL < post_result