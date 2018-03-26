<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
if ( ! function_exists('currentDate'))
{
	function currentDate()
	{
		$currentDate = date('Y-m-d');
		return $currentDate;
	}
}

if(!function_exists("encrypt"))
{
    function encrypt($str = '')
    {
        $key = '1239JJasu!&&#@nas1Issj';
        return md5($str.$key);
    }
}

function dateSQL( $date )
{
    $tahun = substr($date, 6, 4);
    $bulan = substr($date, 3, 2);
    $hari  = substr($date, 0, 2);
    return $tahun.'-'.$bulan.'-'.$hari;
}

function dateHuman( $date )
{
    $hari = substr($date, 8, 2);
    $bulan = substr($date, 5, 2);
    $tahun  = substr($date, 0, 4);

    return $hari.'/'.$bulan.'/'.$tahun;
}

function namaHariIndo($day){
    switch ($day) {
        case 'Sun' : $hari = "Minggu"; break;
        case 'Mon' : $hari = "Senin"; break;
        case 'Tue' : $hari = "Selasa"; break;
        case 'Wed' : $hari = "Rabu"; break;
        case 'Thu' : $hari = "Kamis"; break;
        case 'Fri' : $hari = "Jum'at"; break;
        case 'Sat' : $hari = "Sabtu"; break;
    }
    
    return $hari;
}

function getUsername()
{
    $CI =& get_instance();
    return $CI->session->login['user'];
}