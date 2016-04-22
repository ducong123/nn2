<?php
/**
 * 用户中心
 * User: weipinglee
 * Date: 2016/3/4 0004
 * Time: 上午 9:35
 */
use \Library\checkRight;
use \Library\PlUpload;
use \Library\photoupload;
use \Library\json;
use \Library\url;
use \Library\Safe;
use \Library\Thumb;
use \Library\tool;
use \nainai\store;
use \nainai\offer;
class ManagerDealController extends \nainai\Abstruct\UcenterControllerAbstract {


    /**
     * 设置分类多少以后有展开
     * @var integer
     */
    private $_limiteProduct = 2;

    /**
     * 提示mode对应的类型
     * @var array
     */
    private $_mode = array(
        1 => '保证金报盘',
        2 => '自由报盘',
        3 => '委托报盘'
    );



    protected function  getLeftArray(){
        return array(
            array('name' => '交易管理', 'list' => array()),
            array('name' => '销售管理', 'list' => array(
                array('url' => '', 'title' => '销售列表' ),
                array('url' => url::createUrl('/ManagerDeal/indexOffer'), 'title' => '发布产品' ),
            )),
            array('name' => '仓单管理', 'list' => array(
                array('url' => url::createUrl('/product/storeProduct'), 'title' => '申请仓单' ),
                array('url' => '', 'title' => '仓单列表' ),
            )),
            array('name' => '采购管理', 'list' => array(
                array('url' => '', 'title' => '采购列表' ),
                array('url' => '', 'title' => '发布采购' ),
            )),
            array('name' => '合同管理', 'list' => array(
                array('url' => '', 'title' => '销售合同' ),
                array('url' => '', 'title' => '购买合同' ),
            ))
        );
    }
    /**
     * 个人中心首页
     */
    public function indexAction(){

    }

    /**
     * 产品发布页面展示
     * @return
     */
    public function indexOfferAction(){

    }

   /**
     * 商品添加页面展示
     */
    private function productAddAction(){
        
        $category = array();

        //获取商品分类信息，默认取第一个分类信息
        $productModel = new \nainai\product();
        $category = $productModel->getCategoryLevel();
        $attr = $productModel->getProductAttr($category['chain']);
        //上传图片插件
        $plupload = new PlUpload(url::createUrl('/ManagerDeal/swfupload'));

        //注意，js要放到html的最后面，否则会无效
        $this->getView()->assign('plupload',$plupload->show());
        $this->getView()->assign('categorys', $category['cate']);
        $this->getView()->assign('attrs', $attr);
        $this->getView()->assign('cate_id', $category['default']);
    }

    /**
     * 自由报盘和保证金、委托报盘
     *
     */
    public function OfferAction(){
        $mode = $this->getRequest()->getParam('mode');
        if(!isset($this->_mode[$mode]))//如果mode不在三中模式当中，默认为1，自由报盘
            $mode = 1;
        $this->getView()->assign('mode',$mode);
        $this->productAddAction();
    }

    public function storeAction(){

    }
    /**
     * 申请仓单页面
     */
    public function storeProductAction(){
        $store_list = store::getStoretList();
        $this->getView()->assign('storeList',$store_list);
        $this->getView()->assign('mode',3);
        $this->productAddAction();

    }
    /**
     * AJax获取产品分类信息
     * @return [Json]
     */
    public function ajaxGetCategoryAction(){
        $pid = Safe::filterPost('pid', 'int',0);
        if($pid){
            $productModel = new \nainai\product();
            $cate = $productModel->getCategoryLevel($pid);
            $cate['attr'] = $productModel->getProductAttr($cate['chain']);
            unset($cate['chain']);
            echo JSON::encode($cate);
        }
        return false;

    }


    /**
     * 获取POST提交上来的商品数据,报盘处理和申请仓单处理都会用到
     * @return array 商品数据数组
     */
    private function getProductData(){
        $attrs = Safe::filterPost('attribute');
        foreach($attrs as $k=>$v){
            if(!is_numeric($k)){
                echo JSON::encode(tool::getSuccInfo(0,'属性错误'));
                exit;
            }
        }
        $time = date('Y-m-d H:i:s', time());


        $detail = array(
            'name'         => Safe::filterPost('warename'),
            'cate_id'      => Safe::filterPost('cate_id', 'int'),
            'price'        => Safe::filterPost('price', 'float'),
            'quantity'     => Safe::filterPost('quantity', 'int'),
            'attribute'    => serialize($attrs),
            'note'         => Safe::filterPost('note'),
            'produce_area' => Safe::filterPost('area'),
            'create_time'  => $time
        );


        //图片数据
        $imgData = Safe::filterPost('imgData');

        $resImg = array();
        if(!empty($imgData)){

            foreach ($imgData as $imgUrl) {
                if (!empty($imgUrl) && is_string($imgUrl)) {
                    array_push($resImg, array('img' => tool::setImgApp($imgUrl)));
                }
            }
        }

        return array($detail,$resImg);
    }
    /**
     * 处理报盘
     */
    public function doOfferAction(){
       if (IS_POST) {
           $productData = $this->getProductData();
           $mode = Safe::filterPost('mode', 'int');
           if (!isset($this->_mode[$mode])){
               throw new Exception("Error Mode", 1);
           }

            // 报盘数据
            $offerData = array(
                'mode'          => $mode,
                'apply_time'  => \Library\Time::getDateTime(),
                'divide'      => Safe::filterPost('divide', 'int'),
                'minimum'     => ($this->getRequest()->getPost('divide') == 0) ? Safe::filterPost('minimum', 'int') : 0,
                'status'      => 0,
                'accept_area' => Safe::filterPost('accept_area'),
                'accept_day' => Safe::filterPost('accept_day', 'int'),
                'price'        => Safe::filterPost('price', 'float'),
            );

           $offerObj = new \nainai\product();
            $res = $offerObj->insertOffer($productData,$offerData);
           if($res['success']==1)
               $this->redirect('offerList');
           else $this->redirect('offer');
       }

        return false;
    }

    /**
     * 申请仓单处理
     */
    public function doStoreProductAction(){
        if(IS_POST){
            $productData = $this->getProductData();//获取商品数据
            $storeList = array(
                'store_id' => Safe::filterPost('store_id', 'int'),
                'package'  => Safe::filterPost('package','int'),
                'package_num' => Safe::filterPost('package_num'),
                'package_unit' => Safe::filterPost('package_unit'),
                'package_weight' => Safe::filterPost('package_weight'),
                'status' => 0,
                'apply_time'  => \Library\Time::getDateTime(),
            );
            $storeObj = new store();
            $res = $storeObj->createStoreProduct($productData,$storeList);
            if($res['success']==1)
                $this->redirect('offerList');
            else $this->redirect('offer');

        }
        return false;
    }

    //上传接口
    public function swfuploadAction(){
        //调用文件上传类
        $photoObj = new photoupload();
        $photoObj->setThumbParams(array(180,180));
        $photo = current($photoObj->uploadPhoto());

        if($photo['flag'] == 1)
        {
            $result = array(
                'flag'=> 1,
                'img' => $photo['img'],
                'thumb'=> $photo['thumb'][1]
            );
        }
        else
        {
            $result = array('flag'=> $photo['flag'],'error'=>$photo['errInfo']);
        }
        echo JSON::encode($result);

        return false;
    }







}