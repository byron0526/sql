dialog --title "訊息盒子" --msgbox "接下來為您增添使用者" 10 50
user=`dialog --title "請用英文輸入USER名子" --inputbox "USER的名子:" 10 50 2>&1 >/dev/tty`
password=`dialog --title "請輸入密碼"  --passwordbox "你的密碼:" 10 50 2>&1 >/dev/tty`
permission=`dialog --title "表單模式" --checklist "請選擇要開啟的權限(空白建為選擇與取消)" 13 50 5 1 "ALL PRIVILEGES" on 2 "SELECT" off 3 "INSERT" off 4 "UPDATE" off 5 "DELETE" off 2>&1 >/dev/tty`
perm_str=""
for p in $permission; do
        case $p in
                1) perm_str="ALL PRIVILEGES";break;;
                2) perm_str="$perm_str, SELECT";;
                3) perm_str="$perm_str, INSERT";;
                4) perm_str="$perm_str, UPDATE";;
                5) perm_str="$perm_str, DELETE";;
        esac
done

perm_str=`echo "$perm_str" | sed 's/^, //'`
dialog --title "選單模式" --menu "請確認以下資訊" 10 50 2 1 "使用者名稱: $user" 2 "使用者權限:$perm_str"
mysql -uadmin -p123456 -e "GRANT $perm_str ON mydb.* TO '$user'@localhost IDENTIFIED BY '$password';"

if [ $? -eq 0 ]; then
        echo "已新增使用者"
else
        echo "使用者新增失敗"
fi
