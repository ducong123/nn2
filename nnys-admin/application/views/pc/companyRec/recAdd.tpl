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

  <h1><img src="{views:img/icons/dashboard.png}" alt="" />推荐管理

  </h1>

  <div class="bloc">
    <div class="title">
      添加推荐
    </div>
    <div class="pd-20">

      <form action="{url:member/companyRec/recAdd}" method="post" class="form form-horizontal" id="form-member-add" auto_submit redirect_url="{url:member/companyRec/recList}">
        <div class="row cl">
          <label class="form-label col-3"><span class="c-red">*</span>选择企业：</label>
          <div class="formControls col-5">
            <select name="user_id" id="user_id">
              {foreach: items=$cInfo}
                <option value="{$item['user_id']}">
                  {$item['company_name']}
                </option>
              {/foreach}
            </select>
          </div>
          <div class="col-4"> </div>
        </div>

        <div class="row cl">
          <label class="form-label col-3"><span class="c-red">*</span>推荐类型：</label>
          {set: $type=\nainai\companyRec::getRecType()}
          <div class="formControls col-5">
            <select name="type" id="type">
              {foreach: items=$type}
                <option value="{$key}">{$item}</option>
              {/foreach}
            </select>
          </div>
          <div class="col-4"> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-3"><span class="c-red">*</span>开始时间：</label>
          <div class="formControls col-5">

            <input type="text" name="start_time" class="Wdate addw" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y',minDate:'%y-%M-#{%d}'});">

          </div>
          <div class="col-4"> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-3"><span class="c-red">*</span>结束时间：</label>
          <div class="formControls col-5">
            <input type="text" name="end_time" class="Wdate addw" onclick="WdatePicker({dateFmt:'yyyy-MM-dd '});" >
          </div>
          <div class="col-4"> </div>
        </div>
        <div class="row cl">
          <label class="form-label col-3"><span class="c-red">*</span>是否开启：</label>
          <div class="formControls col-5">
            {if:isset($data)}
              <input type="radio" name="status" value='1' {if:$data['status'] == 1}checked='1'{/if} id="">是
              <input type="radio" name="status" value='0' {if:$data['status'] == 0}checked='1'{/if} id="">否
            {else:}
              <input type="radio" name="status" value='1' checked='1' id="">是
              <input type="radio" name="status" value='0' id="">否
            {/if}

          </div>
          <div class="col-4"> </div>
        </div>

        <div class="row cl">
          <div class="col-9 col-offset-3">
            <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

</div>


