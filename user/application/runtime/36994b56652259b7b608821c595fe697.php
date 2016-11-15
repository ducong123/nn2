<!DOCTYPE html>
<html>
<head>
  <title>个人中心</title>
  <meta name="keywords"/>
  <meta name="description"/>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE">
  <link href="/nn2/user/public/views/pc/css/user_index.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/nn2/user/public/js/jquery/jquery-1.7.2.min.js"></script>



  <script language="javascript" type="text/javascript" src="/nn2/user/public/views/pc/js/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="/nn2/user/public/views/pc/js/regular.js"></script>
   <script src="/nn2/user/public/views/pc/js/center.js" type="text/javascript"></script>
  <link href="/nn2/user/public/views/pc/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- 头部控制 -->
  <link href="/nn2/user/public/views/pc/css/topnav20141027.css" rel="stylesheet" type="text/css">
  <script src="/nn2/user/public/views/pc/js/topnav20141027.js" type="text/javascript"></script>
    <!-- 头部控制 -->

    <script type="text/javascript" src="/nn2/user/public/js/form/validform.js" ></script>
    <script type="text/javascript" src="/nn2/user/public/js/form/formacc.js" ></script>
    <script type="text/javascript" src="/nn2/user/public/js/layer/layer.js"></script>
    <script type="text/javascript" src="/nn2/user/public/js/layer/extend/layer.ext.js"></script>

     <link href="/nn2/user/public/js/form/validate/error.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/nn2/user/public/js/area/AreaData_min.js" ></script>
    <script type="text/javascript" src="/nn2/user/public/js/area/Area.js" ></script>

</head>
<body>
<!--    公用头部控件 -->
    <div class="bg_topnav">
    <div class="topnav_width">
        <div class="topnav_left">
            <div class="top_index">
                <img class="index_img" src="/nn2/user/public/views/pc/images/icon/icon_index.png"/>
                <a rel="external nofollow" href="http://localhost/nn2/deal/public/index/index" target="_blank" >耐耐网首页</a>
            </div>

            <div class="index_user">
            <?php if($username){?>
                <a rel="external nofollow"  href="http://localhost/nn2/user/public/ucenterindex/index"  target="_blank" class="">您好，<?php echo isset($username)?$username:"";?></a>
                <?php }else{?>
                <span>您好，欢迎进入耐耐网</span>
                <?php }?>
            </div>
            <?php if($login==0){?>
            <div class="login_link" id="toploginbox">
                <a rel="external nofollow" href="http://localhost/nn2/user/public/login/login" target="_blank" class="topnav_login">请登录</a>
            </div>
            <div class="topnav_regsiter">
                <a rel="external nofollow" href="http://localhost/nn2/user/public/login/register" target="_blank">免费注册</a>
            </div>
            <?php }else{?>
            <div class="login_link" id="toploginbox">
                <a rel="external nofollow" href="http://localhost/nn2/user/public/login/logout" target="_blank" class="topnav_login">退出</a>
            </div>
            <?php }?>
        </div>
        <div class="topnav_right">
            <ul>
                <?php if($login!=0){?>
                 <li>
                   <a href="http://localhost/nn2/user/public/ucenterindex/index">会员中心</a><span class="line_l">|<span>
                </li>
                <li>
                    <?php if($usertype==1){?>
                        <a href="http://localhost/nn2/user/public/contract/sellerlist">我的合同</a>
                    <?php }else{?>
                        <a href="http://localhost/nn2/user/public/contract/buyerlist">我的合同</a>
                    <?php }?>
                    <span class="line_l">|<span>
                </li>
                <?php }?>
                <li>
                    <a href="http://localhost/nn2/user/public/message/usermail">消息中心<?php if($mess!=0){?><em class="information"><?php echo isset($mess)?$mess:"";?></em><?php }?></a><span class="line_l">|<span>
                </li>
                <!--<li>
                    <img class="iphon_img" src="/nn2/user/public/views/pc/images/icon/icon_iphon.png"/>
                    <a href="">手机版</a><span class="line_l">|<span>
                </li>-->
                <li>
                    <a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4006238086&aty=0&a=0&curl=&ty=1" target="_blank" ><!--onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=279020473&o=new.nainaiwang.com&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" --> 在线客服</a><span class="line_l">|<span>
                </li>
                <li style="padding-top:2px;">
                    <span>交易时间：09:00--17:30</span>
                </li>

            </ul>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<!-- 公用头部控件 -->
<div class="header">
		<div class="nav">
            <div class="logo-box zn-l">
                <a href="http://localhost/nn2/deal/public/index/index" alt="返回耐耐首页"><img src="/nn2/user/public/views/pc/images/icon/nainaiwang.png"/></a></dd>
            </div>
			<div class="nav-tit">
                <ul class="nav-list">
                    <?php if(!empty($topArray)) foreach($topArray as $key => $topList){?>
                        <li>
                            <a href="<?php echo isset($topList['url'])?$topList['url']:"";?>" <?php if( isset($topList['isSelect']) && $topList['isSelect'] == 1){?> class="cur" <?php }?>><?php echo isset($topList['title'])?$topList['title']:"";?></a>
                        </li>
                    <?php }?>

                </ul>
			</div>
		</div>
	</div>
	<div class="user_body">
		<div class="user_b">
			<!--start左侧导航--> 
            <div class="user_l">
                <?php if(!empty($leftArray) && count($leftArray)>1){?>
                <div class="left_navigation">
                    <ul>

                    	<?php if(!empty($leftArray)) foreach($leftArray as $k => $leftList){?>
                    		<?php if( $k == 0){?>
                    		<li class="let_nav_tit"><h3><?php echo isset($leftList['title'])?$leftList['title']:"";?></h3></li>
                    		<?php }else{?>
                            <li class="btn1" id="btn<?php echo isset($k)?$k:"";?>">
                                <a class="nav-first <?php if($action==$leftList['action']){?>cur<?php }?>" <?php if( !empty($leftList['url'])){?> href="<?php echo isset($leftList['url'])?$leftList['url']:"";?>"<?php }?> >
                                    <?php echo isset($leftList['title'])?$leftList['title']:"";?>
                                    <i class="icon-caret-down"></i>
                                </a>
                                <?php if( !empty($leftList['list'])){?>
                                    <ul class="zj_zh" >
                                        <?php if(!empty($leftList['list'])) foreach($leftList['list'] as $key => $list){?>
                                            <li><a  href="<?php echo isset($list['url'])?$list['url']:"";?>" <?php if($action==$list['action']){?>class="cur"<?php }?> ><?php echo isset($list['title'])?$list['title']:"";?></a></li>
                                        <?php }?>
                                    </ul>
                                <?php }?>
                            </li>

                    		<?php }?>



                    	<?php }?>
                        
                      
                    </ul>
                </div>
                <?php }else{?>
                    <div class="wrap_con">
                        <div class="personal_data">
                            <div class="head_portrait">
                                <a href="#">
                                    <img src="/nn2/user/public/views/pc/images/icon/head_portrait.jpg">
                                </a>
                            </div>
                            <div class="per_username">
                                <p class="username_p"><b>您好，<?php echo isset($username)?$username:"";?></b></p>
                                <p class="username_p"><!--<img src="<?php echo isset($group['icon'])?$group['icon']:"";?>">--><?php echo isset($group['group_name'])?$group['group_name']:"";?></p>
                                <p class="username_p">消息提醒：<a href="http://localhost/nn2/user/public/message/usermail"><b class="colaa0707"><?php echo isset($mess)?$mess:"";?></b></a></p>
                            </div>
                            <div class="per_function">
                                <a href="http://localhost/nn2/user/public/ucenter/baseinfo">基本信息设置</a>
                                <a href="http://localhost/nn2/user/public/ucenter/password">修改密码</a>
                            </div>

                        </div>
                    </div>
                <?php }?>
            </div>
            <!--end左侧导航-->
            <div id="cont"><script type="text/javascript" src='/nn2/user/public/js/area/Area.js'></script>
<script type="text/javascript" src='/nn2/user/public/js/area/AreaData_min.js'></script>
			<!--start中间内容-->	
			<div class="user_c">
				<div class="user_zhxi">
					<div class="zhxi_tit">
						<p><a>交易管理</a>><a>发货合同详情</a></p>
					</div>
					<div class="chp_xx">
						<div class="de_ce">
							<div class="detail_chj">
								&nbsp;&nbsp;<span><?php echo isset($info['create_time'])?$info['create_time']:"";?></span>
								<span>订单创建</span>
							</div>
							<div class="" style="line-height: 25px">
								<?php if(!empty($info['pay_log'])) foreach($info['pay_log'] as $key => $item){?>&nbsp;&nbsp;
									<span><?php echo isset($item['create_time'])?$item['create_time']:"";?></span>
									<span><?php echo isset($item['remark'])?$item['remark']:"";?></span>
									
									<br>
								<?php }?>
							</div>
							<div class="detail_chj" style="font-weight:bold;border-top:1px dashed #ddd">
								<b>订单号：</b><span><?php echo isset($info['order_no'])?$info['order_no']:"";?></span>
								<b>下单日期:</b><span><?php echo isset($info['create_time'])?$info['create_time']:"";?></span>
								<b>状态:</b><span><?php echo isset($info['title'])?$info['title']:"";?></span>
							</div>
							<div class="detail_chj">
								<!-- <input class="qx_butt" type="button" value="取消订单"/> -->
								<!-- <?php if($info['complain']==1){?>
									<a  href="http://localhost/nn2/user/public/contract/complaincontract?id=<?php echo isset($info['id'])?$info['id']:"";?>"><input class="fk_butt" type="button" value="我要申诉"/></a>
								<?php }?>
								<?php if(isset($info['action'][0]['url'])){?><input class="fk_butt" type="button" url="<?php echo isset($info['action'][0]['url'])?$info['action'][0]['url']:"";?>" onclick="window.location.href='<?php echo isset($info['action'][0]['url'])?$info['action'][0]['url']:"";?>'" value="<?php echo isset($info['title'])?$info['title']:"";?>"/><?php }?> -->
								<a href="http://localhost/nn2/user/public/depositdelivery/sellerconsignment/id/<?php echo $info['delivery_id'];?>" confirm><input class="fk_butt" type="button" value="发货"/></a>
							</div>
						</div>
						<div class="sjxx">

							<p>配送信息</p>
							<div class="sj_detal">
								<b class="sj_de_tit">预计提货日期：</b>
								<span>&nbsp;<?php echo isset($info['expect_time'])?$info['expect_time']:"";?></span>
							</div>
							<div class="sj_detal">
								<b class="sj_de_tit">提货人：</b>
								<span>&nbsp;<?php echo isset($info['delivery_man'])?$info['delivery_man']:"";?></span>
							</div>
							<div class="sj_detal">
								<b class="sj_de_tit">联系电话：</b>
								<span>&nbsp;<?php echo isset($info['phone'])?$info['phone']:"";?></span>
							</div>
							<div class="sj_detal">
								<b class="sj_de_tit">身份证：</b>
								<span>&nbsp;<?php echo isset($info['idcard'])?$info['idcard']:"";?></span>
							</div>
							<div class="sj_detal">
								<b class="sj_de_tit">车牌号：</b>
								<span>&nbsp;<?php echo isset($info['plate_number'])?$info['plate_number']:"";?></span>
							</div>
							<div class="sj_detal">
								<b class="sj_de_tit">备注：</b>
								<span>&nbsp;<?php echo isset($info['remark'])?$info['remark']:"";?></span>
							</div>

							<p>生产厂家信息</p>
							<div class="sj_detal">
								<b class="sj_de_tit">企业名称：</b>
								<span>&nbsp;<?php echo isset($info['userinfo']['company_name'])?$info['userinfo']['company_name']:"";?></span>
							</div>
							<div class="sj_detal">
								<b class="sj_de_tit">地址：</b>
								<span id='area'>&nbsp;                    <span id="areatextarea">
                        <script type="text/javascript">
                         ( function(){
                            var areatextObj = new Area();
                            var text = areatextObj.getAreaText('<?php echo $info['userinfo']['area'] ; ?>',' ');
                            $('#areatextarea').html(text);

                            })()
                        </script>
                     </span>

</span>&nbsp;<?php echo isset($info['userinfo']['address'])?$info['userinfo']['address']:"";?>
							</div>

							<p>开票信息</p>

							<?php if($info['invoice']==1){?>
							<div class="sj_detal">
								<b class="sj_de_tit">是否开票：</b>&nbsp;
									是
							</div>
								<?php if(!empty($invoice['order_invoice'])){?>

									<div class="sj_detal">
										<b class="sj_de_tit">开票状态：</b>
										&nbsp;<span>已开票</span>

									</div>
									<div class="sj_detal">
										<b class="sj_de_tit">快递公司：</b>
										&nbsp;<span><?php echo isset($invoice['order_invoice']['post_company'])?$invoice['order_invoice']['post_company']:"";?></span>

									</div>
									<div class="sj_detal">
										<b class="sj_de_tit">快递单号：</b>
										&nbsp;<span><?php echo isset($invoice['order_invoice']['post_no'])?$invoice['order_invoice']['post_no']:"";?></span>

									</div>
									<div class="sj_detal">
										<b class="sj_de_tit">开票时间：</b>
										&nbsp;<span><?php echo isset($invoice['order_invoice']['create_time'])?$invoice['order_invoice']['create_time']:"";?></span>

									</div>
									<div class="sj_detal">
										<b class="sj_de_tit">发票图片：</b>
										&nbsp;<img src="<?php echo isset($invoice['order_invoice']['image'])?$invoice['order_invoice']['image']:"";?>" />

									</div>
								<?php }else{?>
									<div class="sj_detal">
										<b class="sj_de_tit">开票状态：</b>
										&nbsp;<span>待开票</span>

									</div>
								<?php }?>


							<?php }else{?>
								<div class="sj_detal">
									<b class="sj_de_tit">是否开票：</b>&nbsp;
									否
								</div>
							<?php }?>




						</div>
						<div class="xx_center">
							<table border="0" cellpadding="" cellspacing="">
								<tbody>
								<tr class="title" >
									<td align="left" colspan="7">&nbsp;商品清单</td>
								</tr>
								<tr>
									<th>图片</th>
									<th>商品名称</th>
									<th>商品价格</th>
									<th>提货数量</th>
									<th>小计</th>
									<th>提货</th>
								</tr>
								<tr>
									<td><img src="<?php echo isset($info['img_thumb'])?$info['img_thumb']:"";?>"/></td>
									<td><?php echo isset($info['name'])?$info['name']:"";?></td>
									<td><?php echo isset($info['price'])?$info['price']:"";?></td>
									<td><?php echo isset($info['num'])?$info['num']:"";?><?php echo isset($info['unit'])?$info['unit']:"";?></td>
									<td><?php echo isset($info['amount'])?$info['amount']:"";?></td>
									<td>待发货</td>

								</tr>
							</tbody></table>
						</div>
					</div>
				</div>
			</div>
			<!--end中间内容-->	
			<!--end右侧广告-->

			<script type="text/javascript">
				$(function(){
					$('.fk_butt').click(function(){
						// window.location.href = $(this).attr('url');
					});
				})
			</script>
		</div>
	</div></div>

				<!--end中间内容-->	
			
		</div>
	</div>
<script type="text/javascript">
    $(function() {
        $('.left_navigation ').find('.cur').parents('.btn1').find('.nav-first').trigger('click');
    })
</script>
</body>
</html>