<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="http://localhost/nn2/admin/public/views/pc/js/libs/jquery/1.6/jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost/nn2/admin/public/views/pc/js/libs/jquery/1.11/jquery.min.js"></script>

	<link rel="stylesheet" href="http://localhost/nn2/admin/public/views/pc/css/min.css" />
	<script type="text/javascript" src="http://localhost/nn2/admin/public/views/pc/js/validform/validform.js"></script>
	<script type="text/javascript" src="http://localhost/nn2/admin/public/views/pc/js/validform/formacc.js"></script>
	<script type="text/javascript" src="http://localhost/nn2/admin/public/views/pc/js/layer/layer.js"></script>
	<link rel="stylesheet" href="http://localhost/nn2/admin/public/views/pc/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="http://localhost/nn2/admin/public/views/pc/css/H-ui.min.css">
</head>
<body>

          
            
                
                <script type="text/javascript" src="http://localhost/nn2/admin/public/views/pc/js/product/cate.js"></script>
        <!--            
              CONTENT 
                        --> 
        <div id="content" class="white">
            <h1><img src="img/icons/posts.png" alt="" /> 菜单管理</h1>
<div class="bloc">
    <div class="title">
        添加菜单
    </div>
    <div class="content">
        <div class="pd-20">

            <div class="zhannei">
             <form action="http://localhost/nn2/admin/public/member/menu/addmenu" method="post" class="form form-horizontal" id="form-user-character-add">

                <div class="row cl">
                    <label class="form-label col-2">菜单名称：</label>
                    <div class="formControls col-10">
                        <input type="text" class="input-text" value="" placeholder="" id="" name="name">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-2">菜单链接：</label>
                    <div class="formControls col-10">
                        <input type="text" class="input-text" value="" placeholder="" id="" name="url">
                    </div>
                </div>
                
                <div class="row cl">
                    <label class="form-label col-2"><span class="c-red">*</span>上级分类:</label>
                    <div class="formControls col-10">
                        <select name="pid" id="pid">
                        <option value="0">顶级分类</option>
                        <?php echo isset($category)?$category:"";?>
                    </select>   
                    </div>
                </div>

                <div class="row cl">
                    <label class="form-label col-2">排序：</label>
                    <div class="formControls col-10">
                        <input type="text" class="input-text" value="" placeholder="" id="" name="sort">
                    </div>
                </div>

                <div class="row cl">
                    <div class="col-10 col-offset-2">
                        <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 提交</button>
                    </div>
                </div>
            </form>
        </div>
       
</div>


</body>
</html>