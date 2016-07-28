
﻿<script type="text/javascript" src="{root:js/area/AreaData_min.js}" ></script>
<script type="text/javascript" src="{root:js/area/Area.js}" ></script>
			<!--start中间内容-->	
			<div class="user_c">
				<div class="user_zhxi">
					<div class="zhxi_tit">
						<p><a>产品管理</a>><a>产品详情</a></p>
					</div>
					<div class="center_tabl">
                    <form action="" method="">
					   <table class="table2" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="spmx_title" colspan="8">商品明细</td>
                            </tr>

                           <tr>
                               <td colspan="2">商品标题</td>
                               <td colspan="6">{$product['product_name']}</td>
                           </tr>

                            <tr>
                                <td colspan="2">产品大类</td>
                                 <td colspan="6">{$product['cate'][0]['name']}</td>
                            </tr>
                           <tr>
                               <td colspan="2">产品分类</td>
                               <td colspan="6">
                                   {foreach:items=$product['cate']}
                                        {if:$key!=0}
                                            {if:$key==1}
                                                {$item['name']}
                                            {else:}
                                               > {$item['name']}
                                            {/if}
                                        {/if}
                                   {/foreach}
                               </td>
                           </tr>
                            <tr>
                                <td colspan="2">规格</td>
                                <td colspan="6">
                                   {$product['attrs']}
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">产地</td>
                                <td colspan="6" id="areat">{areatext: data=$product['produce_area'] id=areat }</td>
                            </tr>
                            <tr>
                                <td colspan="2">生成日期</td>
                                <td colspan="6">{$product['create_time']}</td>
                            </tr>
                           <tr>
                               <td colspan="2">有效日期</td>
                               <td colspan="6">{$offer['expire_time']}</td>
                           </tr>
                            <tr>

                                <td colspan="2">产品数量(单位)</td>
                                <td colspan="6" class="end_td">{$product['quantity']}（{$product['unit']}）</td>

                            </tr>
                            <tr>
                                <td class="spmx_title" colspan="8">报盘详情</td>
                            </tr>
                             <tr>
                                <td colspan="2">报盘状态</td>
                                <td colspan="6">

                                    <span class="col12aa07">{$offer['status_txt']}</span>

                                </td>
                            </tr>

                          <!--   <tr>
                              <td colspan="2">交易类型</td>
                              <td colspan="6">销售</td>
                          </tr>
                          <tr>
                              <td colspan="2">担保类型</td>
                              <td colspan="6">仓单</td>
                          </tr>
                          <tr>
                              <td colspan="2">是否投保</td>
                              <td colspan="6">是</td>
                          </tr>
                          <tr>
                              <td colspan="2">支付方式</td>
                              <td colspan="6">现汇</td>
                          </tr> -->
                            <tr>
                                <td colspan="2">可否拆分</td>
                                <td colspan="6">{$offer['divide_txt']}</td>
                            </tr>
                            <tr>

                                <td colspan="2">报盘数量</td>
                                <td colspan="6">{$product['quantity']}</td>

                            </tr>
                           <tr>
                               <td colspan="2">单位</td>
                               <td colspan="6">{$product['unit']}</td>
                           </tr>
                           {if:$offer['divide']==1}
                            <tr>
                                <td colspan="2">起订量</td>
                                <td colspan="6">{$offer['minimum']}</td>
                            </tr>
                           {/if}
                            <tr>
                                <td colspan="2">商品单价</td>
                                <td colspan="6">{$offer['price']}元</td>
                            </tr>
                            <tr>
                                <td colspan="2">交货地址</td>
                                <td colspan="6">{$offer['accept_area']}</td>
                            </tr>
                           <tr>
                               <td colspan="2">交收时间</td>
                               <td colspan="6">T+{$offer['accept_day']}天</td>
                           </tr>

                            <tr>
                                <td colspan="2">产品描述</td>
                                <td colspan="6">{$product['note']}</td>
                            </tr>
                            <tr>
                                <td colspan="2">产品图片</td>
                                <td colspan="6">
                                {foreach: items=$product['photos'] item=$v}
                                    <img src="{$v}">
                                    {/foreah}

                                </td>
                            </tr>
                             <tr>
                                <td colspan="8">
                                   <input class="cg_fb" type="button" value="返回" onclick="history.go(-1)"/>
                                </td>
                            </tr>
                        </table>
            	    </form>
						
					</div>
				</div>
			</div>
			<!--end中间内容-->	

			