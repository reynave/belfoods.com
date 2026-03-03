<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
class Model extends CI_Model {
  
  function __construct(){
    /* Call the Model constructor */
    parent::__construct();
  }
  
  function custom($theme="index"){
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

                "sales" => $this->core->cms_widget('sales'),
                "sales_action" => $this->core->cms_widget_action('sales'),

                "kreasiKilat" => $this->core->post(10, 'Kreasi Kilat'),
            );
            return $data;
            break;
          case "KreasiKilat":
              $data = array(
                "orderNow"   => $this->core->cms_widget('orderNow'),
                "orderNow_action" => $this->core->cms_widget_action('orderNow'),
                "kreasiKilatTitle" => $this->core->cms_label('kreasiKilatTitle'),

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