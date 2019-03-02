<?php
	function db_config_one(){//数据来源
		return array(
			'DB_USER'=>'root',
			'DB_PWD'=>'',
			'DB_NAME'=>'shangcheng',
			'DB_HOST'=>'localhost',
		);
	}

	function db_config_two(){//被导入数据
		return array(
			'DB_USER'=>'root',
			'DB_PWD'=>'',
			'DB_NAME'=>'shangcheng2',
			'DB_HOST'=>'localhost',
		);
	}
	function db_config_three(){//被导入数据
		return array(
			'DB_USER'=>'root',
			'DB_PWD'=>'',
			'DB_NAME'=>'shangcheng2',
			'DB_HOST'=>'localhost',
		);
	}
$sql1="CREATE TABLE `ecs_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8";
$sql2="
INSERT INTO `ecs_account_log` VALUES   ( '1', '0', '0.00', '0.00', '100', '100', '1539278257', '注册送积分', '99')";
$dbconn1   =   db_connect(3);//连接数据库
$res = mysqli_query($dbconn1,$sql1);//执行语句
//$res = mysqli_query($dbconn1,$sql2);//执行语句
var_dump($res);exit;

	$shangcheng=daochu_sql(2);
//	$shangcheng2=daochu_sql('shangcheng2');

	var_dump(111);exit;
/*************************************************对比数据库差异并修改start**********************************************************/
/**
 * 对比数组文件
 */
function copy_data($data1,$data2){
	//首先过滤相同的数据
	$da=[];
	foreach($data1 as $k=>$v){
		if(in_array($v,$data2)){
			$da[]=$v;
		}else{

		}
	}

}



/*************************************************对比数据库差异并修改end**********************************************************/


/*************************************************导出数据库部分start**********************************************************/

	/**
	 * 导出数据库
	 */
	function daochu_sql($dbname='shangcheng'){
		//sql基础文件头
		$base_txt='SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
	SET time_zone = "+00:00";
	';
		$data=[];
		//创建sql文件
//		$filename=$dbname.'.sql';
//		$f1=fopen($filename,'w');
//		fwrite($f1,$base_txt);
		//导出数据库
		$i   =   0;
		$crlf="\r\n";
		$dbconn1   =   db_connect();//连接数据库
		$tables =list_tables($dbname,$dbconn1);
		$num_tables   =   count($tables);
		while($i   <   $num_tables)
		{
			$data[]=get_table_structure($dbconn1,$tables[$i],$crlf).";$crlf$crlf";
			$data[]=get_table_content($dbconn1,$tables[$i],$crlf);
//			fwrite($f1,get_table_structure($dbconn1,$tables[$i],$crlf).";$crlf$crlf");//创建部分
//			fwrite($f1,get_table_content($dbconn1,$tables[$i],$crlf));//插入数据部分
			$i++;
		}
		return $data;
//		fclose($f1);
	}

	/**
	 * @param $database 数据库名
	 * @param $con 连接句柄
	 *	遍历数据库所有表
	 */
	function list_tables($database,$con)
	{
		$sql ="select table_name from information_schema.tables where table_schema='$database'";
		$res = mysqli_query($con,$sql);//执行语句

		$tables = array();
		while($row = mysqli_fetch_assoc($res)){
			$tables[] = $row['table_name'];
		}
		mysqli_free_result($res);
		return $tables;
	}

	/**
	 * @param $db 连接句柄
	 * @param $table 表名
	 * @param $crlf 空格
	 * @return 创建表
	 */
	function get_table_structure($db,$table,$crlf)
	{
		global   $drop;
		$schema_create   =   "";
		if(!empty($drop)){ $schema_create   .=   "DROP TABLE IF EXISTS `$table`;$crlf";}
		$result   =mysqli_query($db,   "SHOW CREATE TABLE $table");
		$row=mysqli_fetch_assoc($result);
//		$schema_create   .= $crlf."-- ".$row['Table'].$crlf;
		$schema_create   .= $row['Create Table'].$crlf;


		return $schema_create;
	}

	/**
	 * @param $db 连接句柄
	 * @param $table 表名
	 * @param $crlf 空格
	 * @return 插入数据
	 */
	function   get_table_content($db, $table,   $crlf)
	{
		$schema_create   =   "";
		$temp   =   "";
		$result   =   mysqli_query($db,"SELECT   *   FROM   $table");

		$i   =   0;
		while($row   =   mysqli_fetch_row($result))
		{

			$schema_insert   =   "INSERT INTO `$table` VALUES   (";
			for($j=0;$j<mysqli_num_fields($result);$j++)
			{
				if(!isset($row[$j]))
					$schema_insert   .=   " NULL,";
				elseif($row[$j]   !=   "")
					$schema_insert   .=   " '".addslashes($row[$j])."',";
				else
					$schema_insert   .=   " '',";
			}
			$schema_insert   =   ereg_replace(",$", "",$schema_insert);
			$schema_insert   .=   ");$crlf";
			$temp   =   $temp.$schema_insert   ;
			$i++;
		}

		return   $temp;
	}

	/**
	 * @param int $type 1 数据库1 2 数据库就2
	 * @return 连接数据库
	 */
	function db_connect($type=1){
		if($type==1){
			$config = db_config_one();
		}elseif($type==2){
			$config = db_config_two();
		}else{
			$config=db_config_three();
		}

		$con = mysqli_connect($config['DB_HOST'],$config['DB_USER'],$config['DB_PWD'],$config['DB_NAME']);//服务器地址,数据库的帐号,数据库密码,数据库名字

		if(!$con){
			exit('数据库连接失败');
		}
		mysqli_query($con,'set names utf8');//设置传输编码为utf8，防止数据库与php通讯时出现乱码
		return $con;
	}
/*************************************************导出数据库部分end**********************************************************/
?>