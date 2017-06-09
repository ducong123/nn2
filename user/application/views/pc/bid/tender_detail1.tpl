<!DOCTYPE html>
<html>
<head>
  <title>招标-资格预审</title>
  <meta name="keywords"/>
  <meta name="description"/>
  <meta charset="utf-8">
  <link href="../css/user_index.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
  <script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="../js/regular.js"></script>
   <script src="../js/center.js" type="text/javascript"></script>
  <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- 头部控制 -->
  <link href="../css/topnav20141027.css" rel="stylesheet" type="text/css">
  <script src="../js/topnav20141027.js" type="text/javascript"></script>
  <script src="../js/tender_con.js" type="text/javascript"></script>
    <!-- 头部控制 -->
</head>
<body>
<!--    公用头部控件 -->
    <div class="bg_topnav">
    <div class="topnav_width">
        <div class="topnav_left">
            <div class="login_link" id="toploginbox">
                <a rel="external nofollow" href="login.html" target="_blank" class="topnav_login">登录</a>
                <div class="login_box" id="login_boxMain" style="display: none;">
                    <input name="gtxh_LoginMobile" type="text" id="gtxh_LoginMobile" class="txt_topnav" value="手机号码" maxlength="11">
                    <br>
                    <input type="text" id="gtxh_importpwd" class="txt_topnav" value="登录密码" maxlength="11">
                    <input name="gtxh_LoginPwd" type="password" id="gtxh_LoginPwd" maxlength="20" style=" display:none;">
                    <br>
                    <input type="button" value="登录" id="gtxh_btnLogin" class="btn_topnav_login" onclick="javascript:_utaq.push(['trackEvent','btn-log']);">
                    &nbsp;
                    <input name="gtxh_autoLogin" type="checkbox" id="gtxh_autoLogin" style="vertical-align: middle" checked="checked">
                    <label for="checkbox">两周内自动登录</label>
                    <br>
                    <a href="PasswordReset.html" target="_blank">忘记密码</a> <a href="register.html" target="_blank">立即注册</a>
                </div>
                <div class="topnav_regsiter" style=" float:right;">
                    <a rel="external nofollow" href="register.html" target="_blank">免费注册</a>
                </div>
            </div>
            <div class="topnav_login_in" id="userCenterbox" style="display: none;">
                您好，<label class="icon_topnav_loginin" id="gtxh_uame"></label>
                <a id="userCenter" href="centre/user_index.html" target="_blank">会员中心</a>
                <a id="loginOut" href="javascript:">退出</a>
                <iframe id="iframe_loginOut" frameborder="0" height="1" width="1" scrolling="no"></iframe>
            </div>
        </div>
        <div class="topnav_right">
            <ul>
                <li>
                    <div class="top_app" id="topPhone">
                        <a href="javascript:;"><em class="icons iphone"></em><span>手机APP</span></a>
                        <a rel="external nofollow" href="http://app.nainaiwang.com/" class="top_a" target="_blank" style="display:none !important;visibility: hidden"><!--<em class="icons zz"></em>--><i style="font-size:14px;">▪</i><span>掌中耐耐APP</span></a>
                    </div>
                </li>
                <li>
                    <div class="popueButton">
                        <a href="javascript:window.external.AddFavorite('http://www.nainaiwang.com', '耐耐网——大宗商品交易中心')">加入收藏</a>
                    </div>
                </li>
                <li>
                    <div class="popueButton">
                        <div id="popue_quick">
                            网站导航<b> </b></div>
                    </div>
                    <div class="popuePanel" id="quickPanel" style="display: none;">
                        <div class="quick_market">
                            <b>产品分类</b><br>
                            <span>耐火市场 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2394&amp;nsortId=2411" target="_blank">低合金板</a>
                            <a href="http://market.nainaiwang.com/#sortId=2394&amp;nsortId=2414" target="_blank">容器板</a>
                            <a href="http://market.nainaiwang.com/#sortId=2394&amp;nsortId=2406" target="_blank">热轧开平板</a>
                            <a href="http://market.nainaiwang.com/#sortId=2394&amp;nsortId=2410" target="_blank">中厚板</a><br>
                            <span>建材市场 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2403&amp;nsortId=2405" target="_blank">热轧卷板</a>
                            <a href="http://market.nainaiwang.com/#sortId=2403&amp;nsortId=2592" target="_blank">镀锌带钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2403&amp;nsortId=2415" target="_blank">冷轧卷板</a>
                            <a href="http://market.nainaiwang.com/#sortId=2403&amp;nsortId=2603" target="_blank">低合金卷</a><br>
                            <span>钢铁市场 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2395&amp;nsortId=2475" target="_blank">等边角钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2395&amp;nsortId=2423" target="_blank">H型钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2395&amp;nsortId=2421" target="_blank">槽钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2395&amp;nsortId=2422" target="_blank">工字钢</a><br>
                            <span>冶金化工 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2397&amp;nsortId=2434" target="_blank">无缝管</a>
                            <a href="http://market.nainaiwang.com/#sortId=2397&amp;nsortId=2435" target="_blank">方管</a>
                            <a href="http://market.nainaiwang.com/#sortId=2397&amp;nsortId=2433" target="_blank">镀锌管</a>
                            <a href="http://market.nainaiwang.com/#sortId=2397&amp;nsortId=2432" target="_blank">焊管</a><br>
                            <span>其他市场 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2396&amp;nsortId=2427" target="_blank">螺纹钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2396&amp;nsortId=2429" target="_blank">圆钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2396&amp;nsortId=2430" target="_blank">高线</a>
                            <a href="http://market.nainaiwang.com/#sortId=2396&amp;nsortId=2522" target="_blank">盘螺</a><br>
                            <span>核心企业 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2440" target="_blank">合结圆</a>
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2439" target="_blank">碳结圆</a>
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2631" target="_blank">合金钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2458" target="_blank">轴承钢</a><br>
                            <span>仓储专区 </span>&nbsp; 
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2440" target="_blank">合结圆</a>
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2439" target="_blank">碳结圆</a>
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2631" target="_blank">合金钢</a>
                            <a href="http://market.nainaiwang.com/#sortId=2398&amp;nsortId=2458" target="_blank">轴承钢</a>
                        </div>
                        <div class="quick_info">
                            <div class="quick_city">
                                <b>地区分站</b><br>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E4%B8%8A%E6%B5%B7" target="_blank">上海</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E6%9D%AD%E5%B7%9E" target="_blank">杭州</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E6%97%A0%E9%94%A1" target="_blank">无锡</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E9%83%91%E5%B7%9E" target="_blank">郑州</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E6%AD%A6%E6%B1%89" target="_blank">武汉</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E9%95%BF%E6%B2%99" target="_blank">长沙</a><br>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E5%B9%BF%E5%B7%9E" target="_blank">广州</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E5%94%90%E5%B1%B1" target="_blank">唐山</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E6%88%90%E9%83%BD" target="_blank">成都</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E9%82%AF%E9%83%B8" target="_blank">邯郸</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E9%87%8D%E5%BA%86" target="_blank">重庆</a>
                                <a href="http://news.nainaiwang.com/xianhuojiage.html#areaName=%E5%A4%A9%E6%B4%A5" target="_blank">天津</a>
                            </div>
                            <b>信息行情</b><br>
                            <a href="http://news.nainaiwang.com/xianhuojiage.html" target="_blank">现货价格</a>
                            <a href="http://news.nainaiwang.com/gangweizixun.html" target="_blank">钢为资讯</a>
                            <a href="http://news.nainaiwang.com/hangyefenxi.html" target="_blank">行业分析</a><br>
                            <a href="http://news.nainaiwang.com/jiageyuce.html" target="_blank">价格预测</a>
                            <a href="http://news.nainaiwang.com/gangchangtiaojia.html" target="_blank">钢厂调价</a>
                            <a href="http://news.nainaiwang.com/yuancailiao.html" target="_blank">原材料</a>
                            <div class="quick_info_bottom">
                                <span><a href="http://market.nainaiwang.com/brand.html" target="_blank">品牌店</a></span>
                                <span><a href="http://bbs.nainaiwang.com/" target="_blank">耐耐朋友圈</a></span>
                                <span class="red"> <a href="http://app.nainaiwang.com/" target="_blank">掌中耐耐APP</a></span>
                            </div>
                        </div>
                    </div>
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
                <a href="../index.html" alt="返回耐耐首页"><img src="../images/icon/nainaiwang.png"/></a></dd>
            </div>
			<div class="nav-tit">
				<ul class="nav-list">
                    <li>
                        <a href="user_index.html">会员中心</a>
                   </li>
                    <li>
                        <a href="user_zh.html">账户信息</a>
                    </li>
                    <li>
                        <a href="user_zj.html">资金管理</a>
                    </li>
                    <li>
                        <a href="user_dd.html">交易管理</a>
                    </li>
                    <li>
                        <a href="user_cd.html">仓单管理</a>
                    </li>
                    <li>
                        <a href="user_chl.html">车辆管理</a>
                    </li>
                    <li>
                        <a href="user_gz.html">关注中心</a>
                    </li>
                    <li>
                        <a href="user_dd.html" class="cur">信息发布</a>
                    </li>
                </ul>
			</div>
		</div>
	</div>
	<div class="user_body">
		<div class="user_b">
        <!--start左侧导航-->    
            <div class="user_l">
                <div class="left_navigation">
                    <ul>
                       <li class="let_nav_tit"><h3>信息发布</h3></li>
                       <li class="btn1"><a href="tender_list.html" class="nav-first cur">我的招标</a></li> 
                       <li class="btn1"><a href="my_bid.html" class="nav-first">我的投标</a></li>
                       <li class="btn1"><a href="cd_list_sh.html" class="nav-first">仓单审核</a></li>
                    </ul>
                </div>
            </div>
			<!--end左侧导航-->	
			<!--start中间内容-->	
            <style type="text/css">
                #supplier_list .chose .ok{margin-left: 200px;}
            </style>
			<div class="user_c">
				<div class="user_zhxi">
					<div class="zhxi_tit">
						<p><a>我的招标</a>><a>资格预审</a></p>
					</div>
                                                        <div class="project_detail">
                                                            <h1>501矿</h1>
                                                            <p>招标方：海天贸易</p>
                                                            <p>招标方式：公开招标</p>
                                                            <p>评标类型：分包</p>
                                                            <p>项目地点：中国 山西省 阳泉市 郊区</p>
                                                            <p>投标时间：2015-8-10——2015-10-8</p>
                                                            <p>开标地点：[线上]</p>

                                                            <!-- 补充公告 -->
                                                            <div class="tender_handle">
                                                                <button id="chose_supplier">发布补充公告</button>
                                                                <button>撤回</button>
                                                                <button>终止</button>
                                                            </div>
                                                        </div>
					<div class="center_tabl">
                                                            <ul class="step_list">
                                                                <li class="step">
                                                                    <span class="val_on on">1</span>
                                                                    <p class="step_name">
                                                                        <span class="on">公告发布</span>
                                                                    </p>
                                                                </li>
                                                                <li class="step">                                                                    
                                                                    <span class="val_on on">2</span>
                                                                    <p class="step_name">
                                                                        <span class="on">资格预审</span>
                                                                    </p>
                                                                </li>
                                                                <li class="step">                                                                    
                                                                    <span class="val_on ">3</span>
                                                                    <p class="step_name">
                                                                        <span class="">开标</span>
                                                                    </p>
                                                                </li>
                                                                <li class="step">                                                                    
                                                                    <span class="val_on ">4</span>
                                                                    <p class="step_name">
                                                                        <span class="">中标结果</span>
                                                                    </p>
                                                                </li>
                                                            </ul>


                                                            
                                                        <div class="invite" id="invite" style="padding-top:47px;">
                                                            <div class="invite_title">
                                                                <span>补充公告</span>
                                                            </div>
                                                            <div class="bid_zige">
                                                                <h1>501矿招标公告补充公告</h1>
                                                                <p>补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1补充条款1</p>
                                                                <p style="float:right;">
                                                                    <button style="width:50px;height:30px;line-height:30px;">编辑</button>
                                                                    <button style="width:50px;height:30px;line-height:30px;">删除</button>
                                                                </p>                         
                                                            </div>

                                                            <div class="clear"></div>

                                                            <div class="invite_title">
                                                                    <span style="width:80px;">投标会员列表</span>
                                                                </div>
                                                                <div class="bid_zige">
                                                                    <p>
                                                                        <button>截标</button>
                                                                    </p>
                                                                    <p style="float:right;">
                                                                        <span>会员编号</span><input type="text">
                                                                        <span>会员名称</span><input type="text">
                                                                        <button>搜索</button>
                                                                    </p>
                                                                    <table>
                                                                        <tr>
                                                                            <td>序号</td>
                                                                            <td>会员编号</td>
                                                                            <td>会员名称</td>
                                                                            <td>资质信息</td>
                                                                            <td>标书购买</td>
                                                                            <td>是否投标</td>
                                                                            <td>保证金状态</td>
                                                                            <td>保证金金额</td>
                                                                            <td>操作</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>1</td>
                                                                            <td>02100008</td>
                                                                            <td>海天贸易</td>
                                                                            <td>未审核[<a href="" style="color:#1a59d9;">查看</a>]</td>
                                                                            <td>未购买</td>
                                                                            <td>未投标</td>
                                                                            <td>未冻结</td>
                                                                            <td></td>
                                                                            <td>
                                                                                <select>
                                                                                    <option>通过</option>
                                                                                    <option>不通过</option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                                                                                        
                                                                </div>
                                                            </div>

                                                            <div class="clear"></div>

                                                            <div class="button">
                                                                <button>提交</button>
                                                            </div>

                                                        </div>
				</div>
			</div>
            <div id="supplier_list" style="display:none;width:600px;left:35%;">
                <div class="invite_mem">
                    <div class="title" style="width:580px;">
                        <h5>发布公告</h5>
                        <i class="close">X</i>
                    </div>

                    <div class="chose" style="width:580px;">
                        <div class="search">
                            <textarea></textarea>
                        </div>
                        <button class="ok">确定</button>
                        <button class="close">关闭</button>
                    </div>
                </div>
            </div>
			<!--end中间内容-->	
			<!--start右侧广告			
			<div class="user_r">
				<div class="wrap_con">
					<div class="tit clearfix">
						<h3>公告</h3>
					</div>
					<div class="con">
						<div class="con_medal clearfix">
							<ul>
								<li><a>暂无勋章</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--end右侧广告-->
		</div>
	</div>
</body>
</html>