感謝您點進來，此為視覺化mysql的腳本，透過./sql.sh可以直接進入mysql並透過表單選擇的方式輕鬆創建使用者帳號
描述檔如下，請按下方步驟執行
使用者要先自己下載mysql
```
sudo apt update
sudo apt install mariadb-server
sudo mysql
```
輸入以上指令可以進入mysql
接著在mysql中輸入
```
GRANT ALL   #授予用戶「所有權限」
ON *.*     #指定授予範圍 *.* 表示所有數據庫和所有表
TO '管理者名子'@'localhost'
IDENTIFIED BY '密碼'
WITH GRANT OPTION;
```
接著按ctrl+d便可退出


下載程式後使用vim sql.sh進入編輯頁面
```
mysql -u"帳號名子" -p"密碼" -e "GRANT $perm_str ON mydb.* TO '$user'@localhost IDENTIFIED BY '$password';"
```
更改為你管理者的user與密碼後，便可跳出去，並使用./sql.sh執行此程式碼
