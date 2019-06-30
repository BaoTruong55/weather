<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class api extends MY_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function ip_session() {
        if ($this->input->post('city') != '') {
            $data['city'] = $this->input->post('city');
            $data['ip'] = $this->input->ip_address();
            $_SESSION['user'] = $data;
        }
    }

    public function query($param = '') {
        $param = str_replace('?', '', urldecode($param));
        $data = prologquery($param);
        //debug
        // var_dump($data);
        // die();
        //end_debug  
        if (!empty($data['elements'])) {
            $elements = $data['elements'];
            $where = array();

            $where['place'] = isset($elements['place']) ? $elements['place'] : create_slg($_SESSION['user']['city']);
            $thoi_gian = isset($elements['time']) ? $elements['time'] : 'hom_nay';
            $dia_diem = ' ở ' . alias2city($where['place']);
            $where['ngay'] = homnao($thoi_gian);
            $thoi_gian = alias2string($thoi_gian);
            // //debug
            // var_dump($data);
            // die(); 
            // //end_debug 
            if ($data['root'] == 'query') {
                
                if (isset($elements['temperature']) && $elements['temperature'] == 'nhiet_do') {
                    $selectors = 'temperature';
                    $result = $this->db->select($selectors)->get_where('weather', $where)->row_array();
                    echo "Nhiệt độ $dia_diem $thoi_gian " . $result[$selectors];
                    //debug
                    // var_dump($result);
                    // die(); 
                    //end_debug
                }

                if (isset($elements['weather']) && $elements['weather'] == 'thoi_tiet') {
                    $selectors = 'weather';
                    $result = $this->db->select($selectors)->get_where('weather', $where)->row_array();
                   // $str_query = 'SELECT * FROM weather WHERE place = \''.$where["place"].'\''  ;
                    //$result = $this->db->query($str_query);
                    //debug
                    //var_dump($result->result());
                   // var_dump($result);
                    // foreach ($result->result() as $row)
                    // {
                    //     var_dump ( $row );
                    //     echo ("<br>");  
                    //     //echo( $row ["place"] )
                    // }
                    //die(); 
                    //end_debug
                    if (isset($result[$selectors])) {
                        echo "Thời tiết $dia_diem $thoi_gian " . $result[$selectors];
                    } else {
                        echo 'Không có kết quả nào';
                    }
                }
            } elseif ($data['root'] == 'yes_no') {
                $selectors = 'weather';
                $result = $this->db->select($selectors)->get_where('weather', $where)->row_array();
                $trang_thai = alias2string($elements['status']);
                if (isset($result[$selectors])) {
                    if (mb_strpos($result[$selectors], $trang_thai) !== FALSE) {
                        echo "Thời tiết $dia_diem $thoi_gian có " . $trang_thai;
                    } else {
                        echo "Thời tiết $dia_diem $thoi_gian không " . $trang_thai;
                    }
                } else {
                    echo 'Không có kết quả nào';
                }
            } else {
                // no results
                echo 'Không có kết quả nào';
            }
        } else {
            // no results
            echo 'Không có kết quả nào';
        }
    }

}
