
set -x
for file in `ls  2019/*.md`;
do
    date=`ls $file|awk -F "/" '{print $2}'|awk -F "-" '{print $1,$2,$3}'|sed 's/ /-/g'`
    str="date: "${date}"T08:00:00+08:00"
    echo $str
    sed -i '' "/title: /a\\
    ${str}
    " $file

    sed -i '' "s/category:/categories: [/g" $file
    sed -i '' '/^categories: .*/s//& ]/g' $file
done
