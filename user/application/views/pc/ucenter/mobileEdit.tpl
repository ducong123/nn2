<script type="text/javascript" src="{root:js/jquery/jquery-1.7.2.min.js}"></script>
			<div class="user_c">
				<div class="user_zhxi">
					<div class="zhxi_tit">
						<p><a>账户管理</a>><a>修改绑定手机</a></p>
					</div>
					<div>
						<form action="{url:/ucenter/checkMobileCode}" method="post" auto_submit redirect_url="{url:/ucenter/mobileNew}">
       
                        <div class="jd_img"><img src="{views:images/center/yz_jd1.jpg}"></div>
						<div class="zhxi_con">
							<span class="con_tit"><i></i>手机号码：</span>
							<span>{$userInfo['mobile']}</span>
						</div>
						<div class="zhxi_con">
                            <span class="con_tit"><i></i>验证码：</span>
                              <div>

                                <input id="inputCode" placeholder="请输入验证码" type="text" class="gradient" style="float:left;">
                                <img id='image' width="140px" height="37px" src="{url:/login/getCaptcha}" onclick="this.src='{url:/login/getCaptcha}?'+Math.random()" style="border:1px solid #c0c0c0;float:left;margin-left:5px;"/>
                              <!--   <input type="button" class="yzm_submit" value="确定" id="submit"> -->
                            </div>
                        </div>
                    <div style="clear:both;"></div>

						<div class="zhxi_con">
                            <span class="con_tit"><i></i>短信验证码：</span>
                            <span><input type="text" name='mobileCode' id="phone" class="infos text gradient" placeholder="请输入验证码" style="float:left;"/></span><input class="send1" type="button" value="免费获取短信验证码" onClick="getMobileCode()"  style="float:left;"/>
                            <div><input type="text" readonly="readonly" name="checkCode" class="mobile_no"/></div>
                        </div>
                    <div style="clear:both;"></div>
						<div class="zhxi_con">
                                                                            <input type='hidden' value="{$userInfo['mobile']}" name='mobile' id='mobile'/>
							<span><!-- <a href="mobile_new.html" onclick="return checkMobileCode()"> --><input class="submit" type="button" value="下一步" onclick="checkMobileCode()"/></a></span>
						</div>
						</form>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
<script type="text/javascript">
    function getMobileCode(){
        var code=$('#inputCode').val();
        if(code==''){
            $("input[name='checkCode']").val('请输入验证码');
            return false;
        }
        if(code.length!=4){
            $("input[name='checkCode']").val('验证码不正确');
            return false;          
        }
        var mobile=$('#mobile').val();
        $.ajax(
                {
                    type:'post',
                    url:"{url:/ucenter/getOldMobileCode}",
                    cache:false,
                    dataType:'json',
                    data:{mobileCode:code,mobile:mobile},
                    success:function(msg){
                        if(msg.success==0){
                            $('#image').click();
                            alert(msg['info']);
                        }else{
                            $('#image').click();
                            alert(msg['info']);
                        }
                    }
                }

            );
    }
   function checkMobileCode(){
        var code=$('#phone').val();
        $.ajax({
            type:'post',
            url:"{url:/ucenter/checkMobileCode}",
            dataType:'json',
            data:{mobileCode:code},
            success:function(msg){
                if(msg.success==0){
                    alert('验证失败');
                    return false;
                }else{

                     window.location="{url:/ucenter/MobileNew}";
                    return true;
                }
            }
        });

    }


</script>