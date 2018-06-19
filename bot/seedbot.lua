
<?php
$token = "616783674:AAGWB4kJXV56xENYVZbqO0IEIxftEzfU1iM ";  //<====   616783674:AAGWB4kJXV56xENYVZbqO0IEIxftEzfU1iM
/*
سپس ربات را در گروه اضافه کنید و آن را مدیر کنید
روش استفاده:/delmsg 10
دستور فوق 10 پیام آخر را پاک میکند که میتوانید آن عدد رو تغییر دهید
*/
//***************
//  FoxLearn.ir
//***************
header('Content-Type: text/html; charset=utf-8');
$json = file_get_contents("php://input");
$update = json_decode($json);
//--------------
function bot($method,$datas=[]){
	global $token;
    $url = "https://api.telegram.org/bot".$token."/".$method;
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$datas);
    $res = curl_exec($ch);
    if(curl_error($ch)){
        var_dump(curl_error($ch));
        return "null";
    }else{
        return json_decode($res);
    }
}
//--------------
$message = $update->message;
$from_id = $message->from->id;
$chat_id = $message->chat->id;
$text = $message->text;
$msgid = $message->message_id;
//--------------
$get = file_get_contents("https://api.telegram.org/bot$token/getChatMember?chat_id=$chat_id&user_id=$from_id");
$info = json_decode($get, true);
$you = $info['result']['status'];
//==================
if (strpos($text,"/delmsg ") !== false ) {
if($you == "creator" || $you == "administrator" ) {
$dlis = str_replace("/delmsg ","",$text); 
$dlis = (int)$dlis;
$msgnun = $msgid;
$msgnun = $msgnun-1;
$mdgto = $msgnun - $dlis;
for($i=$msgnun+1;$i>$mdgto;$i--)
  bot('deleteMessage',[
  'chat_id'=>$chat_id,
  'message_id'=>$i
]);  

}
}
//==================
//@vikiy88vvvvvvvvvvv8
?>
