<script type="text/javascript" src="{views:js/libs/jquery/1.11/jquery.min.js}"></script>
<script type="text/javascript" src="{views:js/validform/validform.js}"></script>
<script type="text/javascript" src="{views:js/validform/formacc.js}"></script>
<script type="text/javascript" src="{views:js/layer/layer.js}"></script>
<script type="text/javascript" src="{views:content/settings/main.js}"></script>
<link rel="stylesheet" href="{views:content/settings/style.css}" />
<link rel="stylesheet" type="text/css" href="{views:css/H-ui.admin.css}">

<!--
      CONTENT
                -->
<div id="content" class="white">
    <h1><img src="{views:img/icons/dashboard.png}" alt="" />入金审核
    </h1>

    <div class="bloc">
        <div class="title">
            入金详情
        </div>
        <div class="pd-20">
            <table class="table table-border table-bordered table-bg">
                <tr>

                    <th>当前状态</th>
                    <td>{$reInfo['statusText']}</td>
                    <th>用户名</th>
                    <td>{$reInfo['username']}</td>
                </tr>
                <tr>

                    <th>手机号</th>
                    <td>{$reInfo['mobile']}</td>
                    <th>支付方式</th>
                    <td>线下</td>
                </tr>
                <tr>

                    <th>订单号</th>
                    <td>{$reInfo['order_no']}</td>
                    <th>金额</th>
                    <td>{$reInfo['amount']}</td>

                </tr>
                <tr>
                    <th>申请时间：</th>
                    <td>{$reInfo['create_time']}</td>
                    <th></th>
                    <td> </td>

                </tr>
                <tr>

                    <th>凭证：</th>
                    <td>{img:data=$reInfo['proot'] width=200 height=200}  </td>
                    <th></th>
                    <td> </td>
                </tr>
                {if:$reInfo['first_time']!=null}
                <tr>

                    <th>初审时间</th>
                    <td>{$reInfo['first_time']}</td>
                    <th>初审意见</th>
                    <td>{$reInfo['first_message']}</td>

                </tr>
                {/if}
                {if:$reInfo['final_time']!=null}
                    <tr>

                        <th>终审时间</th>
                        <td>{$reInfo['final_time']}</td>
                        <th>终审意见</th>
                        <td>{$reInfo['final_message']}</td>
                    </tr>
                {/if}
                {if:$reInfo['action']!=null}
                    <tr>
                        <th>意见</th>
                        <td scope="col" colspan="6">
                            <textarea name="message" id="message" style="width:250px;height:100px;"></textarea>
                        </td>

                    </tr>
                <tr>
                    <th scope="col" colspan="6">
                        <a href="javascript:;" class="btn btn-danger radius pass"><i class="icon-ok"></i> 通过</a>
                        <a href="javascript:;" class="btn btn-primary radius ref"><i class="icon-remove"></i> 不通过</a>
                        <a onclick="history.go(-1)" class="btn btn-default radius"><i class="icon-remove"></i> 返回</a>

                    </th>

                </tr>

            {/if}

            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        var formacc = new nn_panduo.formacc();
        var status = '';
        $('a.pass').click(function(){
            $(this).unbind('click');
            var mess=$('#message').val();
            msg = '已通过';
            setStatus(1,msg,mess);
        })

        $('a.ref').click(function(){
            $(this).unbind('click');
            var mess=$('#message').val();
            msg = '已驳回';
            setStatus(0,msg,mess);
        })

        function setStatus(status,msg,mess){
            formacc.ajax_post("{$reInfo['url']}",{re_id:"{$reInfo['id']}",user_id:"{$reInfo['user_id']}",status:status,message:mess,user_name:"{$reInfo['username']}"},function(){
                layer.msg(msg+"稍后自动跳转");
                setTimeout(function() {
                    window.location.href = "{url:balance/fundIn/checkofflineList}"
                },1500);
            });
        }
    })

</script>

