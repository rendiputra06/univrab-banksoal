-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 08:47 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `try2_cia`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES
(1, 'login_info', 'Login details', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;">  <h1>Login Details</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Please use the following info to login your dashboard:</p>            <hr>            <p style="color: rgb(85, 85, 85); font-size: 14px;">Dashboard URL:&nbsp;<a href="{DASHBOARD_URL}" target="_blank">{DASHBOARD_URL}</a></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style="color: rgb(85, 85, 85);"><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(2, 'reset_password', 'Reset password', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "><div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Reset Password</h1>\n </div>\n <div style="padding: 20px; background-color: rgb(255, 255, 255); color:#555;">                    <p style="font-size: 14px;"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style="font-size: 14px;"> To initiate the password reset process, please click on the following link:</p>\n                    <p style="font-size: 14px;"><a href="{RESET_PASSWORD_URL}" target="_blank">Reset Password</a></p>\n                    <p style="font-size: 14px;"></p>\n                    <p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you''ve received this mail in error, it''s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you didn''t initiate the request, you don''t need to take any further action and can safely disregard this email.</span><br></p>\n<p style="font-size: 14px;"><br></p>\n<p style="font-size: 14px;">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '', 0),
(3, 'team_member_invitation', 'You are invited', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Account Invitation</h1>   </div>  <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don''t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(4, 'send_invoice', 'New invoice', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">  <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=""><span style="font-size: 14px; line-height: 20px;">Thank you for your business cooperation.</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVOICE_URL}" target="_blank">Show Invoice</a></span></p><p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="font-size: 14px; line-height: 20px;">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>  </div> </div></div>', '', 0),
(5, 'signature', 'Signature', 'Powered By: <a href="http://fairsketch.com/" target="_blank">fairsketch </a>', 'Powered By: <a href="http://univrab.ac.id">Universitas Abdurrab</a>', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style="background-color: #eeeeef; padding: 50px 0; ">    <div style="max-width:640px; margin:0 auto; ">  <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Account Invitation</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don''t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span><br></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p> <p style=""><br></p><p style="">Regards,</p><p style=""><span style="line-height: 18.5714px;">{USER_NAME}</span><br></p>   </div>  </div> </div>', '', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p></div></div></div>', '', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>   </div>  </div> </div>', '', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>  </div> </div></div>', '', 0),
(11, 'general_notification', 'Sistem Informasi Surat Univrab', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>{APP_TITLE}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">{EVENT_TITLE}</span></p><p style=""><span style="line-height: 18.5714px;">{EVENT_DETAILS}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;"></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>  </div> </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Universitas Abdurrab</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">{EVENT_TITLE}</span></p><p style=""><span style="line-height: 18.5714px;">{EVENT_DETAILS}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;"></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>  </div> </div></div>', 0),
(12, 'invoice_payment_confirmation', 'Payment received', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;">\r\n <tbody><tr>\r\n <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n <tbody><tr>\r\n <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;">\r\n                                        <tbody><tr>\r\n                                                <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign="top" style="padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;">\r\n                                                                                    <h2 style="display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n\r\n                                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign="top" style="padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;">\r\n                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style="padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                                    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align="center" valign="middle" style="font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                                                    <a href="{INVOICE_URL}" target="_blank" style="font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>', NULL, 0),
(13, 'message_received', '{SUBJECT}', '<meta content="text/html; charset=utf-8" http-equiv="Content-Type"> <meta content="width=device-width, initial-scale=1.0" name="viewport"> <style type="text/css"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id="message-container" align="center" border="0" cellpadding="0" cellspacing="0" style="background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;"> <tbody> <tr> <td valign="top"> <table align="center" border="0" cellpadding="0" cellspacing="0"> <tbody> <tr> <td height="50" width="600">&nbsp;</td> </tr> <tr> <td style="background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; " width="600"><h2 style="color:#fff; text-align:center;">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor="whitesmoke" style="background:#fff; font-family:Helvetica,Arial,sans-serif" valign="top" width="600"> <table align="center" border="0" cellpadding="0" cellspacing="0"> <tbody> <tr> <td height="10" width="560">&nbsp;</td> </tr> <tr> <td width="560"><p><span style="background-color: transparent;">{MESSAGE_CONTENT}</span></p> <p style="display:inline-block; padding: 10px 15px; background-color: #00b393;"><a href="{MESSAGE_URL}" style="text-decoration: none; color:#fff;" target="_blank">Reply Message</a></p> </td> </tr> <tr> <td height="10" width="560">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height="60" width="600">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(14, 'invoice_due_reminder_before_due_date', 'Invoice due reminder', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> <h2 style="display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;">Invoice Due Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><p> Hello,<br>We would like to remind you that invoice {INVOICE_ID} is due on {DUE_DATE}. Please pay the invoice within due date.&nbsp;</p><p></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><p>If you have already submitted the payment, please ignore this email.</p><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><a href="{INVOICE_URL}" target="_blank" style="font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(15, 'invoice_overdue_reminder', 'Invoice overdue reminder', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> <h2 style="display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;">Invoice Overdue Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><p> Hello,<br>We would like to remind you that you have an unpaid invoice {INVOICE_ID}. We kindly request you to pay the invoice as soon as possible.&nbsp;</p><p></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><p>If you have already submitted the payment, please ignore this email.</p><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><a href="{INVOICE_URL}" target="_blank" style="font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">View Invoice</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(16, 'recurring_invoice_creation_reminder', 'Recurring invoice creation reminder', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> <h2 style="display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;">Invoice Cration Reminder</h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><p> Hello,<br>We would like to remind you that a recurring invoice will be created on {NEXT_RECURRING_DATE}.</p><p></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%; text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-size: 16px; padding: 10px; text-size-adjust: 100%;"><a href="{INVOICE_URL}" target="_blank" style="font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;">View Invoice</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(17, 'project_task_deadline_reminder', 'Project task deadline reminder', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>{APP_TITLE}</h1></div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">  <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">This is to remind you that there are some tasks which deadline is {DEADLINE}.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">{TASKS_LIST}</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>  </div> </div></div>', '', 0),
(18, 'estimate_sent', 'New estimate', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"> <h2 style="display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;"><font color="#ffffff" face="Arial"><span style="letter-spacing: -1px;"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is the estimate. Please check the attachment.</p><p></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%; text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-size: 16px; padding: 10px; text-size-adjust: 100%;"><a href="{ESTIMATE_URL}" target="_blank" style="font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0);
INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES
(19, 'estimate_request_received', 'Estimate request received', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"> <h2 style="display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;"><font color="#ffffff" face="Arial"><span style="letter-spacing: -1px;"><b>ESTIMATE REQUEST #{ESTIMATE_REQUEST_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"><p style="color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;"><span style="background-color: transparent;">A new estimate request has been received from {CONTACT_FIRST_NAME}.</span><br></p><p style="color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;"></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%; text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-size: 16px; padding: 10px; text-size-adjust: 100%;"><a href="{ESTIMATE_REQUEST_URL}" target="_blank" style="font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;">Show Estimate Request</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(20, 'estimate_rejected', 'Estimate rejected', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"> <h2 style="display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;"><font color="#ffffff" face="Arial"><span style="letter-spacing: -1px;"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"><p style=""><font color="#606060" face="Arial"><span style="font-size: 15px;">The estimate #{ESTIMATE_ID} has been rejected.</span></font><br></p><p style="color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;"></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%; text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-size: 16px; padding: 10px; text-size-adjust: 100%;"><a href="{ESTIMATE_URL}" target="_blank" style="font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(21, 'estimate_accepted', 'Estimate accepted', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;"> <tbody><tr> <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody><tr> <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;"> <tbody><tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"> <h2 style="display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;"><font color="#ffffff" face="Arial"><span style="letter-spacing: -1px;"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <tbody> <tr> <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"> <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%"> <tbody><tr> <td valign="top" style="padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;"><p style=""><font color="#606060" face="Arial"><span style="font-size: 15px;">The estimate #{ESTIMATE_ID} has been accepted.</span></font><br></p><p style="color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;"></p></td></tr><tr><td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%; text-size-adjust: 100%;"><tbody><tr><td style="padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><tbody><tr><td align="center" valign="middle" style="font-size: 16px; padding: 10px; text-size-adjust: 100%;"><a href="{ESTIMATE_URL}" target="_blank" style="font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(22, 'new_client_greetings', 'Welcome!', '<div style="background-color: #eeeeef; padding: 50px 0; ">    <div style="max-width:640px; margin:0 auto; ">  <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Welcome to {COMPANY_NAME}</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span></p><p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Thank you for creating your account. </span></p><p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">We are happy to see you here.<br></span></p><hr><p style="color: rgb(85, 85, 85); font-size: 14px;">Dashboard URL:&nbsp;<a href="{DASHBOARD_URL}" target="_blank">{DASHBOARD_URL}</a></p><p style="color: rgb(85, 85, 85); font-size: 14px;"></p><p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Email: {CONTACT_LOGIN_EMAIL}</span><br></p><p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Password:&nbsp;{CONTACT_LOGIN_PASSWORD}</span></p><p style="color: rgb(85, 85, 85);"><br></p><p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(23, 'verify_email', 'Verify your email', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "><div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Account verification</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255); color:#555;"><p style="font-size: 14px;">To initiate the signup process, please click on the following link:<br></p><p style="font-size: 14px;"><br></p>', '', 0),
(24, 'notif_surat_masuk', 'Surat Masuk', '<div style="background-color: #eeeeef; padding: 50px 0; ">\n    <div style="max-width:640px; margin:0 auto; ">\n        <div style="color: #fff; text-align: center; background-color:#6d0505; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;">\n            <h1>{SYSTEM_NAME}</h1>\n        </div>\n        <div style="padding: 20px; background-color: rgb(255, 255, 255);">\n            <p><i style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Assalamu''alaikum Warahmatullaahi Wabarakaatuh</i><br></p>\n            <p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Yang Terhormat Bapak/Ibu {NAMA_PENERIMA},</span><br></p>\n            <p><span style="font-size: 14px; line-height: 20px;">Anda menerima Surat Masuk baru. </span><br></p>\n            <h4>Dari : {NAMA_PENGIRIM}</h4>\n            <h5>Perihal : {PERIHAL}</h5>\n            <br>\n            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{SURAT_URL}" target="_blank">Lihat Surat</a></span></p>\n\n            <br>\n            <p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Terima Kasih,</span><br></p>\n            <p><i style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Wassalamu''alaikum Warahmatullaahi Wabarakaatuh.</i><br></p>\n        </div>\n    </div>\n</div>', '', 0),
(25, 'notif_disposisi_masuk', 'Disposisi Masuk', '<div style="background-color: #eeeeef; padding: 50px 0; ">\n    <div style="max-width:640px; margin:0 auto; ">\n        <div style="color: #fff; text-align: center; background-color:#6d0505; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;">\n            <h1>{SYSTEM_NAME}</h1>\n        </div>\n        <div style="padding: 20px; background-color: rgb(255, 255, 255);">\n            <p><i style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Assalamu''alaikum Warahmatullaahi Wabarakaatuh</i><br></p>\n            <p><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Yang Terhormat Bapak/Ibu {NAMA_PENERIMA},</span><br></p>\n            <p><span style="font-size: 14px; line-height: 20px;">Anda menerima Surat Disposisi Masuk baru. </span><br></p>\n            <h4>Dari : {NAMA_PENGIRIM}</h4>\n            <h5>Isi Disposisi : {ISI}</h5>\n            <br>\n            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{DISPOSISI_URL}" target="_blank">Lihat Disposisi</a></span></p>\n        </div>\n    </div>\n</div>', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'member', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `logger`
--

CREATE TABLE `logger` (
  `id` bigint(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `keep_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logger`
--

INSERT INTO `logger` (`id`, `created_on`, `created_by`, `type`, `type_id`, `token`, `comment`, `keep_data`) VALUES
(9, '2022-07-17 15:10:53', 1, 'group', 10, 'create', 'Membuat Group Baru', NULL),
(10, '2022-07-17 15:29:24', 1, 'group', 3, 'delete', 'Menghapus Data Group', '{"id":"3","name":"publik","description":"Public"}'),
(11, '2022-07-17 15:31:59', 1, 'users', 12, 'delete', 'Menghapus Akun', '{"id":"12","ip_address":"::1","username":"1755201031","password":"$2y$08$\\/DFtqpKbGx66DTkLf6p9PeaVutoQMHdt\\/I9Ns\\/E5SPLY7yAGXDHCa","salt":null,"email":"budiman@gmail.com","activation_code":null,"active_code":null,"forgotten_password_code":null,"forgotten_password_time":null,"remember_code":null,"created_on":"1655799455","last_login":"1655957381","active":"0","activation":"0","first_name":"Budiman","last_name":"","company":"Universitas Abdurrab","phone":"--","img_name":"default.png"}'),
(12, '2022-07-17 15:40:08', 1, 'navi', 19, 'create', 'Membuat Menu baru', ''),
(13, '2022-07-17 15:40:31', 1, 'navi', 19, 'update', 'Mengubah data Menu', ''),
(14, '2022-07-17 15:40:48', 1, 'users', 19, 'delete', 'Menghapus Menu', '{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}'),
(15, '2022-07-17 15:45:29', 1, 'users', 1, 'update', 'Mengubah Profile', ''),
(16, '2023-03-20 02:46:25', 1, 'post', 1, 'login', '', ''),
(17, '2023-03-20 08:16:44', 1, 'post', 1, 'login', '', ''),
(18, '2023-03-21 02:25:22', 1, 'post', 1, 'login', '', ''),
(19, '2023-03-24 02:14:00', 1, 'post', 1, 'login', '', ''),
(20, '2023-03-24 02:45:33', 1, 'navi', 19, 'create', 'Membuat Menu baru', ''),
(21, '2023-03-24 02:45:55', 1, 'navi', 19, 'update', 'Mengubah data Menu', ''),
(22, '2023-03-24 02:50:02', 1, 'navi', 19, 'update', 'Mengubah data Menu', ''),
(23, '2023-03-24 02:52:44', 1, 'navi', 20, 'create', 'Membuat Menu baru', ''),
(24, '2023-03-24 02:53:20', 1, 'navi', 21, 'create', 'Membuat Menu baru', ''),
(25, '2023-03-24 03:05:00', 1, 'users', 21, 'delete', 'Menghapus Menu', '{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}'),
(26, '2023-03-24 03:07:02', 1, 'users', 20, 'delete', 'Menghapus Menu', '{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}'),
(27, '2023-03-24 04:16:23', 1, 'navi', 22, 'create', 'Membuat Menu baru', ''),
(28, '2023-03-24 04:23:44', 1, 'navi', 18, 'update', 'Mengubah data Menu', ''),
(29, '2023-03-24 04:24:11', 1, 'navi', 18, 'update', 'Mengubah data Menu', ''),
(30, '2023-03-24 04:24:30', 1, 'navi', 17, 'update', 'Mengubah data Menu', ''),
(31, '2023-03-24 04:24:46', 1, 'navi', 14, 'update', 'Mengubah data Menu', ''),
(32, '2023-03-24 06:38:24', 1, 'users', 16, 'create', 'Membuat Akun baru', ''),
(33, '2023-03-24 07:47:37', 1, 'users', 17, 'create', 'Membuat Akun baru', ''),
(34, '2023-03-24 07:49:07', 1, 'users', 17, 'update', 'Mengubah Data Akun', ''),
(35, '2023-03-28 02:01:12', 1, 'post', 1, 'login', '', ''),
(36, '2023-03-28 02:11:43', 17, 'post', 17, 'login', '', ''),
(37, '2023-03-28 02:21:55', 1, 'navi', 18, 'update', 'Mengubah data Menu', ''),
(38, '2023-03-28 03:00:23', 1, 'navi', 2, 'update', 'Mengubah data Menu', ''),
(39, '2023-03-28 03:02:04', 1, 'navi', 23, 'create', 'Membuat Menu baru', ''),
(40, '2023-03-28 03:02:34', 1, 'navi', 24, 'create', 'Membuat Menu baru', ''),
(41, '2023-03-28 03:05:25', 1, 'navi', 25, 'create', 'Membuat Menu baru', ''),
(42, '2023-04-03 03:33:25', 1, 'post', 1, 'login', '', ''),
(43, '2023-04-03 03:34:38', 1, 'navi', 25, 'update', 'Mengubah data Menu', ''),
(44, '2023-04-03 03:34:47', 1, 'users', 23, 'delete', 'Menghapus Menu', '{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}'),
(45, '2023-04-03 03:41:25', 1, 'navi', 25, 'update', 'Mengubah data Menu', ''),
(46, '2023-04-03 03:41:33', 1, 'navi', 25, 'update', 'Mengubah data Menu', ''),
(47, '2023-04-03 03:43:22', 1, 'navi', 26, 'create', 'Membuat Menu baru', ''),
(48, '2023-04-03 03:45:13', 1, 'users', 26, 'delete', 'Menghapus Menu', '{"conn_id":{"affected_rows":null,"client_info":null,"client_version":null,"connect_errno":null,"connect_error":null,"errno":null,"error":null,"error_list":null,"field_count":null,"host_info":null,"info":null,"insert_id":null,"server_info":null,"server_version":null,"stat":null,"sqlstate":null,"protocol_version":null,"thread_id":null,"warning_count":null},"result_id":{"current_field":null,"field_count":null,"lengths":null,"num_rows":null,"type":null},"result_array":[],"result_object":[],"custom_result_object":[],"current_row":0,"num_rows":null,"row_data":null}'),
(49, '2023-04-03 03:47:57', 1, 'post', 1, 'login', '', ''),
(50, '2023-04-04 03:02:01', 1, 'post', 1, 'login', '', ''),
(51, '2023-04-04 04:12:41', 1, 'post', 1, 'login', '', ''),
(52, '2023-04-04 08:22:34', 1, 'post', 1, 'login', '', ''),
(53, '2023-05-02 07:22:42', 1, 'post', 1, 'login', '', ''),
(54, '2023-05-09 04:07:02', 1, 'post', 1, 'login', '', ''),
(55, '2023-05-10 12:06:46', 1, 'post', 1, 'login', '', ''),
(56, '2023-09-27 08:11:05', 1, 'post', 1, 'login', '', ''),
(57, '2024-01-22 07:25:05', 1, 'post', 1, 'login', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `active` int(1) NOT NULL,
  `parent` int(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id`, `name`, `definition`) VALUES
(1, 'side menu', NULL),
(2, 'top menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `navi`
--

CREATE TABLE `navi` (
  `id` int(11) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `icon_color` varchar(50) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` smallint(6) NOT NULL,
  `parent` smallint(6) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `group_id` smallint(6) NOT NULL,
  `menu_type_id` char(2) NOT NULL,
  `active` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navi`
--

INSERT INTO `navi` (`id`, `label`, `type`, `icon_color`, `link`, `sort`, `parent`, `icon`, `group_id`, `menu_type_id`, `active`) VALUES
(1, 'Main Navigation', 'label', NULL, 'dashboard', 1, 0, NULL, 0, '1', '1'),
(2, 'Home', 'label', NULL, 'sdasd', 9, 0, 'menu', 1, '1', '1'),
(5, 'Menu', 'menu', NULL, 'menu', 7, 0, 'menu', 0, '1', '1'),
(14, 'Pengguna', 'menu', NULL, 'users', 5, 17, 'user', 1, '1', '1'),
(15, 'Administrator', 'label', NULL, '', 3, 0, 'settings', 1, '1', '1'),
(16, 'Groups', 'menu', NULL, 'users/group', 6, 17, 'users', 1, '1', '1'),
(17, 'Akun', 'menu', NULL, '', 4, 0, 'users', 1, '1', '1'),
(18, 'Pengaturan', 'menu', NULL, 'settings', 8, 0, 'settings', 1, '1', '1'),
(19, 'Beranda', 'menu', NULL, 'beranda', 9, 0, 'menu', 1, '2', '1'),
(22, 'Contoh', 'menu', NULL, 'welcome', 10, 0, 'menu', 1, '2', '1'),
(24, 'Dashboard', 'menu', NULL, 'beranda', 2, 0, 'menu', 1, '1', '1'),
(25, 'Home 2', 'menu', NULL, 'sdasd', 10, 0, 'menu', 1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `navi_groups`
--

CREATE TABLE `navi_groups` (
  `id` int(11) NOT NULL,
  `navi_id` int(11) NOT NULL,
  `group_id` mediumint(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `navi_groups`
--

INSERT INTO `navi_groups` (`id`, `navi_id`, `group_id`) VALUES
(5, 2, 1),
(7, 3, 1),
(8, 3, 2),
(9, 5, 1),
(10, 14, 1),
(11, 15, 1),
(12, 16, 1),
(13, 17, 1),
(14, 1, 1),
(15, 1, 2),
(16, 19, 2),
(19, 22, 2),
(20, 18, 1),
(22, 24, 1),
(23, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `kunci` varchar(255) DEFAULT NULL,
  `nilai` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `kunci`, `nilai`) VALUES
(1, 'system_name', 'Sistem Informasi'),
(2, 'system_title', 'Sistem Informasi'),
(3, 'system_email', 'rendisaputra@univrab.ac.id'),
(4, 'address', 'Jln Riau Ujung, Pekanbaru'),
(5, 'logo', 'logo-sm.svg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `sav_slug` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `active_code` varchar(6) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `activation` tinyint(1) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `full_name`, `sav_slug`, `username`, `password`, `salt`, `email`, `activation_code`, `active_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `activation`, `first_name`, `last_name`, `company`, `phone`, `img_name`) VALUES
(1, '::1', 'Administrator', NULL, 'admin', '$2y$08$OZAhQBvMflbiMiIP0awePe9i8gCoGopgwYkkvW0kjQmqD0jb/kJNm', NULL, 'stikom@unbin.ac.id', NULL, '2CC567', NULL, NULL, NULL, 1589403512, 1705908305, 1, 1, 'Admin', 'Istrator', 'STIKOM', '08121902288', '616802648f9a503268e975367e2c9f78.jpg'),
(3, '::1', 'Rendi Saputra', NULL, 'demouser', '$2y$08$njpz9WfhkfXjPKKA9e0QEORJM2NH5BC941yeDAi.e7qb3LU3.AkN.', NULL, 'rendi@gmail.com', NULL, 'E12E81', NULL, NULL, NULL, 1635170897, 1656303558, 1, 1, 'Rendi', 'Saputra', 'Universitas Abdurrab', '+6276138762', 'default.png'),
(14, '::1', 'Ari Muhammad', NULL, '1755201001', '$2y$08$HZSjRjLfaVUbmzv5HXptf.mNXttItwdsUSOY6OIvdddMWPXVw1HLO', NULL, 'ari.muhammad@gmail.com', NULL, NULL, NULL, NULL, NULL, 1655958397, 1656335491, 1, 0, 'Ari', 'Muhammad', 'Universitas Abdurrab', '--', 'default.png'),
(15, '::1', 'Arianda Brimi', NULL, '1755201002', '$2y$08$qTPOrBcVfSXxYyLw9xov/Ok3iaTLbcqXUszFd5rJ/PqeOQ//pY9xS', NULL, 'arianda@gmail.com', NULL, NULL, NULL, NULL, NULL, 1657985350, NULL, 1, 0, 'Arianda', 'Brimi', 'Universitas Abdurrab', '--', 'default.png'),
(17, '::1', 'Kevin Nababan', NULL, 'kevin', '$2y$08$qteOt9Dsh31BKeV0/ozGJOPIE9jXFugMf88Y44hvJg3XqdOE7j1Hm', NULL, 'kevin@gmail.com', NULL, NULL, NULL, NULL, NULL, 1679644057, 1679969503, 1, 0, 'Kevin', 'Nababan', 'Universitas Abdurrab', '--', 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(130, 3, 1),
(156, 1, 2),
(157, 14, 2),
(160, 15, 1),
(161, 16, 2),
(163, 17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_notif`
--

CREATE TABLE `user_notif` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `ket` text NOT NULL,
  `img_html` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notif`
--

INSERT INTO `user_notif` (`id`, `user_id`, `label`, `ket`, `img_html`, `status`, `waktu`) VALUES
(1, 1, 'Surat Masuk dari Staff IT', 'apapun bisa dimasukkan kedalam ket', '<img src="http://localhost/t2/rev/partial/images/users/avatar-6.jpg" class="rounded-circle avatar-sm" alt="user-pic">', '0', '2023-04-03 08:02:43'),
(2, 1, 'James Lemire', 'It will seem like simplified English', ' <img src="http://localhost/t2/rev/partial/images/users/avatar-3.jpg" class="rounded-circle avatar-sm" alt="user-pic">', '0', '2023-04-04 03:14:45'),
(3, 1, 'Your order is placed', 'If several languages ??coalesce the grammar', '<span class="avatar-title bg-primary rounded-circle font-size-16">\r\n                                    <i class="bx bx-cart"></i>\r\n                                </span>', '0', '2023-04-04 03:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `theme`, `create_at`) VALUES
(0, 1, 'light', '2023-03-28 02:39:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `logger`
--
ALTER TABLE `logger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navi`
--
ALTER TABLE `navi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navi_groups`
--
ALTER TABLE `navi_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navi_id` (`navi_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user_notif`
--
ALTER TABLE `user_notif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `logger`
--
ALTER TABLE `logger`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `navi`
--
ALTER TABLE `navi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `navi_groups`
--
ALTER TABLE `navi_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `user_notif`
--
ALTER TABLE `user_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
