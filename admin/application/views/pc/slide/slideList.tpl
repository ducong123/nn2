
<!--
      CONTENT
                -->
<div id="content" class="white">
    <h1><img src="{views:img/icons/posts.png}" alt="" /> 幻灯片管理</h1>
    <div class="bloc">
        <div class="title">
            幻灯片列表
        </div>
        <div class="content">
            <div class="pd-20">
                <div class="cl pd-5 bg-1 bk-gray"> <a class="btn btn-primary radius" href="{url:/system/slide/addSlide}"><i class=" icon-plus"></i> 添加幻灯片</a> </span>  </div>
                <div class="mt-20">
                    <table class="table table-border table-bordered table-hover table-bg table-sort">
                        <thead>
                        <tr class="text-c">
                            <th width="25"><input type="checkbox" name="" value=""></th>
                            <th width="100">名称</th>
                            <th width="90">图片</th>
                            <th width="60">状态</th>
                            <th width="50">排序</th>
                            <th width='100'>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach:items=$slideList}
                            <tr class="text-c">
                                <td><input type="checkbox" value="" name=""></td>
                                <td><u style="cursor:pointer" class="text-primary" >{$item['name']}</u></td>
                                <td><img src="{echo: \Library\Thumb::get($item['img'])}" /></td>
                                <td class="td-status">
                                    {if:$item['status'] == 1}

                                        <span class="label label-success radius">已启用</span>
                                    {else:}
                                        <span class="label label-error radius">停用</span>
                                    {/if}
                                </td>
                                <td>{$item['order']}</td>
                                <td class="td-manage">
                                    {if:$item['status'] == 1}
                                        <a style="text-decoration:none" href="javascript:;" title="停用" ajax_status=0 ajax_url="{url:system/slide/setStatus?id=$item['id']}"><i class="icon-pause"></i></a>
                                    {elseif:$item['status'] == 0}
                                        <a style="text-decoration:none" href="javascript:;" title="启用" ajax_status=1 ajax_url="{url:system/slide/setStatus?id=$item['id']}"><i class="icon-play"></i></a>
                                    {/if}
                                    <a title="编辑" href="{url:/system/slide/editSlide}?id={$item['id']}" class="ml-5" style="text-decoration:none"><i class="icon-edit"></i></a>
                                    <a title="删除" href="javascript:void(0);"ajax_status=-1 ajax_url="{url:system/slide/del?name=$item['id']}" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
                            </tr>
                        {/foreach}
                        </tbody>
                        <script type="text/javascript">
                            function delFundOut(name,obj){
                                var obj=$(obj);
                                var name=name;
                                var url="{url:/system/slide/del}";
                                if(confirm("确定要删除吗")){
                                    $.ajax({
                                        type:'get',
                                        cache:false,
                                        data:{name:name},
                                        url:url,
                                        dataType:'json',
                                        success:function(msg){
                                            if(msg['success']==1){

                                                obj.parents("tr").remove();
                                            }else{
                                                alert(msg['info']);
                                            }
                                        }
                                    });
                                }
                            }
                        </script>
                    </table>
                    {$pageBar}
                </div>
            </div>