<?php
/**
 * @class log
 * @brief 日志记录类
 */
namespace Library;
use \Library\log\ILogFactory;
class userLog
{
	protected $tableName = 'user_log';

	public function getAuthor(){
		$userData = session::get('login');//获取管理员信息
		if(isset($userData['user_id'])){
			return $userData['user_id'];
		}
		return false;
	}





}