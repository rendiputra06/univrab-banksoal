<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('_ent')) {
    function _ent($string = null)
    {
        return htmlentities($string);
    }
}

function convert_setting_data($data)
{
    $result = array();
    foreach ($data as $row) {
        $result[$row->kunci] = $row->nilai;
    }
    return $result;
}

/**
 * get the defined config value by a key
 * @param string $key
 * @return config value
 */
if (!function_exists('get_setting')) {

    function get_setting($key = "")
    {
        $ci = get_instance();
        return $ci->config->item($key);
    }
}
/**
 * create a encoded id for sequrity pupose 
 * 
 * @param string $id
 * @param string $salt
 * @return endoded value
 */
if (!function_exists('encode_id')) {

    function encode_id($id, $salt)
    {
        $ci = get_instance();
        $ci->load->library('encryption');
        $id = $ci->encryption->encrypt($id . $salt);
        $id = str_replace("=", "~", $id);
        $id = str_replace("+", "_", $id);
        $id = str_replace("/", "-", $id);
        return $id;
    }
}

/**
 * decode the id which made by encode_id()
 * 
 * @param string $id
 * @param string $salt
 * @return decoded value
 */
if (!function_exists('decode_id')) {

    function decode_id($id, $salt)
    {
        $ci = get_instance();
        $id = str_replace("_", "+", $id);
        $id = str_replace("~", "=", $id);
        $id = str_replace("-", "/", $id);
        $ci->load->library('encryption');
        $id = $ci->encryption->decrypt($id);

        if ($id && strpos($id, $salt) != false) {
            return str_replace($salt, "", $id);
        } else {
            return "";
        }
    }
}

if (!function_exists('decode_password')) {

    function decode_password($data = "", $salt = "")
    {
        if ($data && $salt) {
            if (strlen($data) > 100) {
                //encoded data with encode_id
                //return with decode
                return decode_id($data, $salt);
            } else {
                //old data, return as is
                return $data;
            }
        }
    }
}

/**
 * check the array key and return the value 
 * 
 * @param array $array
 * @return extract array value safely
 */
if (!function_exists('get_array_value')) {

    function get_array_value($array, $key)
    {
        if (is_array($array) && array_key_exists($key, $array)) {
            return $array[$key];
        }
    }
}

if (!function_exists('send_app_mail')) {

    function send_app_mail($to, $subject, $message, $optoins = array())
    {
        $email_config = array(
            'charset' => 'utf-8',
            'mailtype' => 'html'
        );

        //check mail sending method from settings
        if (get_setting("email_protocol") === "smtp") {
            $email_config["protocol"] = "smtp";
            $email_config["smtp_host"] = get_setting("email_smtp_host");
            $email_config["smtp_port"] = get_setting("email_smtp_port");
            $email_config["smtp_user"] = get_setting("email_smtp_user");
            $email_config["smtp_pass"] = decode_password(get_setting('email_smtp_pass'), "email_smtp_pass");
            $email_config["smtp_crypto"] = get_setting("email_smtp_security_type");

            if (!$email_config["smtp_crypto"]) {
                $email_config["smtp_crypto"] = "tls"; //for old clients, we have to set this by defaultsssssssss
            }

            if ($email_config["smtp_crypto"] === "none") {
                $email_config["smtp_crypto"] = "";
            }
        }

        $ci = get_instance();
        $ci->load->library('email');
        $ci->email->initialize($email_config);
        $ci->email->clear(true); //clear previous message and attachment
        $ci->email->set_newline("\r\n");
        $ci->email->set_crlf("\r\n");
        $ci->email->from(get_setting("email_sent_from_address"), get_setting("email_sent_from_name"));
        $ci->email->to($to);
        $ci->email->subject($subject);
        $ci->email->message($message);

        //add attachment
        $attachments = get_array_value($optoins, "attachments");
        if (is_array($attachments)) {
            foreach ($attachments as $value) {
                $file_path = get_array_value($value, "file_path");
                $file_name = get_array_value($value, "file_name");
                $ci->email->attach(trim($file_path), "attachment", $file_name);
            }
        }

        //check reply-to
        $reply_to = get_array_value($optoins, "reply_to");
        if ($reply_to) {
            $ci->email->reply_to($reply_to);
        }

        //check cc
        $cc = get_array_value($optoins, "cc");
        if ($cc) {
            $ci->email->cc($cc);
        }

        //check bcc
        $bcc = get_array_value($optoins, "bcc");
        if ($bcc) {
            $ci->email->bcc($bcc);
        }

        //send email
        if ($ci->email->send()) {
            return $email_config;
        } else {
            //show error message in none production version
            if (ENVIRONMENT !== 'production') {
                show_error($ci->email->print_debugger());
            }
            return false;
        }
    }
}

/**
 * Format a timestamp to display its age (5 days ago, in 3 days, etc.).
 *
 * @param   int     $timestamp
 * @param   int     $now
 * @return  string
 */
if (!function_exists('timetostr')) {
    function timetostr($timestamp, $now = null)
    {
        $age = ($now ?: time()) - $timestamp;
        $future = ($age < 0);
        $age = abs($age);

        $age = (int)($age / 60);        // minutes ago
        if ($age == 0) return $future ? "momentarily" : "just now";

        $scales = [
            ["minute", "minutes", 60],
            ["hour", "hours", 24],
            ["day", "days", 7],
            ["week", "weeks", 4.348214286],     // average with leap year every 4 years
            ["month", "months", 12],
            ["year", "years", 10],
            ["decade", "decades", 10],
            ["century", "centuries", 1000],
            ["millenium", "millenia", PHP_INT_MAX]
        ];

        foreach ($scales as list($singular, $plural, $factor)) {
            if ($age == 0)
                return $future
                    ? "in less than 1 $singular"
                    : "less than 1 $singular ago";
            if ($age == 1)
                return $future
                    ? "in 1 $singular"
                    : "1 $singular ago";
            if ($age < $factor)
                return $future
                    ? "in $age $plural"
                    : "$age $plural ago";
            $age = (int)($age / $factor);
        }
    }
}
