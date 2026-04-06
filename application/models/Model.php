<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
class Model extends CI_Model {
  
  function __construct(){
    /* Call the Model constructor */
    parent::__construct();
  }
  
  function custom($theme="index"){

    $name = $this->core->select("name", "cms_pages", "id = 2");

    switch ($theme) {
        case "home":
            $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'),

                "banner" => $this->core->cms_widget('banner'),
                "banner_action" => $this->core->cms_widget_action('banner'), 
 

                "infoHome" => $this->core->cms_widget('infoHome'),
                "infoHome_action" => $this->core->cms_widget_action('infoHome'),
                
                "videoHome" => $this->core->cms_widget('videoHome'),
                "videoHome_action" => $this->core->cms_widget_action('videoHome'),

                  "kreasiKilatImg" => $this->core->cms_widget('kreasiKilatImg'),
                "kreasiKilatImg_action" => $this->core->cms_widget_action('kreasiKilatImg'),


                "sales" => $this->core->cms_widget('sales'),
                "sales_action" => $this->core->cms_widget_action('sales'),

                "kreasiKilat" => $this->core->post(10, $name ),
                "promo" => $this->core->post(3, 'promo'),
                
            );
            return $data;
            break;
          case "KreasiKilat":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'),
                "kreasiKilatTitle" => $this->core->cms_label('kreasiKilatTitle'),

                "bannerAds"   => $this->core->cms_widget('bannerAds'),
                "bannerAds_action" => $this->core->cms_widget_action('bannerAds'),

              );
              return $data;
          break;

          case "about":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'), 

                "widgetAbout"   => $this->core->cms_widget('widgetAbout'),
                "widgetAbout_action" => $this->core->cms_widget_action('widgetAbout'), 

                 "widgetAboutTitle"   => $this->core->cms_label('widgetAboutTitle'),
              );
              return $data;
          break;


            case "sales":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'),  
              );
              return $data;
          break;


          case "blog":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'), 
              );
              return $data;
          break;

          case "product":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'), 
              );
              return $data;
          break;

          case "order":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'), 

                "onlineShop"   => $this->core->cms_widget('onlineShop'),
                "onlineShop_action" => $this->core->cms_widget_action('onlineShop'), 


                "bannerOrder"   => $this->core->cms_widget('bannerOrder'),
                "bannerOrder_action" => $this->core->cms_widget_action('bannerOrder'), 

              );
              return $data;
          break;

           case "text":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'), 
              );
              return $data;
          break;
     
        default:
            return false;
    }
      
  }
 
}