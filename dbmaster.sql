-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.12.0.7122
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table belfoods.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `superadmin` int(3) NOT NULL DEFAULT 0,
  `name` varchar(225) NOT NULL DEFAULT '',
  `email` varchar(225) NOT NULL DEFAULT '',
  `password` varchar(225) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `status` int(10) NOT NULL DEFAULT 1,
  `presence` int(5) NOT NULL DEFAULT 1,
  `ilock` int(5) NOT NULL DEFAULT 0,
  `token` varchar(250) NOT NULL DEFAULT '',
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `input_by` varchar(250) NOT NULL DEFAULT 'mysql',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(250) NOT NULL DEFAULT 'mysql',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.account: ~2 rows (approximately)
INSERT INTO `account` (`id`, `superadmin`, `name`, `email`, `password`, `last_login`, `status`, `presence`, `ilock`, `token`, `input_date`, `input_by`, `update_date`, `update_by`) VALUES
	(1, 0, 'Admin', 'admin@admin.com', '25f9e794323b453885f5181f1b624d0b', '2017-01-01 10:00:00', 1, 1, 1, '45933c0655bb93e70fe7280734509dbc', '2017-01-01 00:00:00', 'mysql', '2017-01-01 00:00:00', 'mysql'),
	(2, 0, 'Admin', 'admin@belfoods.com', '25f9e794323b453885f5181f1b624d0b', '2017-01-01 10:00:00', 1, 1, 1, '0f78d16fb5cd8a722b0a3a2a5f37ef76', '2017-01-01 00:00:00', 'mysql', '2017-01-01 00:00:00', 'mysql');

-- Dumping structure for table belfoods.cms_content
CREATE TABLE IF NOT EXISTS `cms_content` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `id_pages` int(6) NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(250) NOT NULL DEFAULT '',
  `h1` text NOT NULL,
  `h2` text NOT NULL,
  `h3` text NOT NULL,
  `h4` text NOT NULL,
  `h5` text NOT NULL,
  `h6` text NOT NULL,
  `content` text NOT NULL,
  `embed` text NOT NULL,
  `publish_date` datetime NOT NULL DEFAULT '2019-01-01 00:00:00',
  `img` varchar(250) NOT NULL DEFAULT '',
  `metadata_description` varchar(250) NOT NULL DEFAULT '',
  `metadata_keywords` varchar(250) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT 1,
  `sorting` int(3) NOT NULL DEFAULT 999,
  `presence` int(1) NOT NULL DEFAULT 1,
  `created_by` varchar(250) NOT NULL DEFAULT 'admin',
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_content: ~19 rows (approximately)
INSERT INTO `cms_content` (`id`, `id_pages`, `name`, `url`, `title`, `h1`, `h2`, `h3`, `h4`, `h5`, `h6`, `content`, `embed`, `publish_date`, `img`, `metadata_description`, `metadata_keywords`, `status`, `sorting`, `presence`, `created_by`, `input_date`, `update_date`) VALUES
	(1, 1, 'New 03 Mar 2026, 13:56', 'new-03032026135609.html', '', '', '', '', '', '', '', '<p style="text-align: center;" data-mce-style="text-align: center;"><strong>Royal by Belfoods</strong> secara konsisten berinovasi dengan menghadirkan sajian produk premium berkualitas tinggi yang sesuai dengan tren terkini.<br> Kami percaya akan memberikan pengalaman yang lebih mewah dan berkualitas kepada konsumen.<br> Oleh karena itu, Royal by Belfoods akan semakin dikenal sebagai merek yang dapat diandalkan dan memberikan <br>produk-produk berkualitas tinggi yang tetap mengikuti tren. <strong>Nikmati kelezatan serta kualitas produk yang premium!</strong></p>', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 13:56:09', '2026-03-03 13:56:09'),
	(2, 2, 'New 03 Mar 2026, 16:31', 'new-03032026163141.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 16:31:41', '2026-03-03 16:31:41'),
	(3, 2, 'New 03 Mar 2026, 16:31', 'new-03032026163141.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 16:31:41', '2026-03-03 16:31:41'),
	(4, 2, 'New 03 Mar 2026, 16:32', 'new-03032026163217.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 16:32:17', '2026-03-03 16:32:17'),
	(5, 2, 'New 03 Mar 2026, 16:36', 'new-03032026163603.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 16:36:03', '2026-03-03 16:36:03'),
	(6, 2, 'resep bento', 'resep-bento.html', 'resep bento', '', '', '', '', '', '', '<p>tes123</p>', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 16:36:04', '2026-03-03 16:36:04'),
	(7, 2, 'Judul baru', 'judul-baru.html', 'Judul baru', '', '', '', '', '', '', '<p class="text-muted small mb-3">Untuk 4 porsi</p><h2 class="h4 mb-3">Bahan</h2><ul class="list-unstyled mb-4"><li>500 gr BELFOODS CHICKEN NUGGET &amp; DRUMMIES</li><li>Minyak goreng secukupnya</li><li>4 lembar nori, potong 5 cm</li></ul><h3 class="h5 mb-2">Butter Rice</h3><ul class="list-unstyled mb-4"><li>3 sdm mentega</li><li>3 siung bawang putih, cincang</li><li>1 butir telur, kocok</li><li>500 gr nasi pulen</li><li>½ sdt garam</li><li>¼ sdt merica bubuk</li></ul><h2 class="h4 mb-3">Cara Membuat</h2><ol class="ps-3"><li class="mb-2">Goreng BELFOODS CHICKEN NUGGET &amp; DRUMMIES dengan minyak panas hingga kuning keemasan, lalu tiriskan.</li><li class="mb-2">Butter rice: Panaskan mentega, tumis bawang putih hingga harum. Masukkan telur, aduk hingga bergumpal. Tambahkan nasi, garam, dan merica, lalu aduk hingga rata.</li><li class="mb-2">Ambil selembar nori, ratakan butter rice di atasnya. Letakkan BELFOODS CHICKEN NUGGET &amp; DRUMMIES di tengah, gulung sambil dipadatkan.</li><li>Sajikan dalam boks bento bersama sayuran dan buah segar sesuai selera.</li></ol>', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 16:36:06', '2026-03-03 16:36:06'),
	(8, 14, 'New 03 Mar 2026, 17:22', 'new-03032026172229.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:22:29', '2026-03-03 17:22:29'),
	(9, 14, 'New 03 Mar 2026, 17:22', 'new-03032026172230.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:22:30', '2026-03-03 17:22:30'),
	(10, 14, 'New 03 Mar 2026, 17:22', 'new-03032026172231.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:22:31', '2026-03-03 17:22:31'),
	(11, 14, 'New 03 Mar 2026, 17:26', 'new-03032026172618.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:26:18', '2026-03-03 17:26:18'),
	(12, 15, 'New 03 Mar 2026, 17:26', 'new-03032026172622.html', '', '', '', '', '', '', '', '<p>test</p>', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:26:22', '2026-03-03 17:26:22'),
	(13, 8, 'New 03 Mar 2026, 17:33', 'new-03032026173326.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:33:26', '2026-03-03 17:33:26'),
	(14, 8, 'New 03 Mar 2026, 17:33', 'new-03032026173327.html', '', 'sdfasdfasdf', 'sdfasdfasdf', '', '', '', '', '<p>asdfasdf</p>', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:33:27', '2026-03-03 17:33:27'),
	(15, 16, 'Belfoods Catcher Privacy Policy', 'belfoods-catcher-privacy-policy.html', 'Belfoods Catcher Privacy Policy', '', '', '', '', '', '', '<p><strong>Effective Date: August 10, 2019</strong></p><p>We are dedicated to protecting Your Information and providing You with a safe, efficient and customized experience. For this commitment, We have created this Privacy Policy to let You know what Information We collect when You use the Services, why We collect this Information and how We use the collected Information. The defined terms used in this Privacy Policy shall have the same meaning as specified in the Terms of Service.</p><p>1. ABOUT THIS PRIVACY POLICY (the “Privacy Policy” or the “Policy”)</p><p>1.1 This Policy represents an agreement between You (“You” or “Your”) and PT.Belfoods Indonesia (“Belfoods”, “We”, “Us” or “Our”). This Policy sets out the ways that We use the personal information which We may gather in providing You with games, software, updates, add-ons (including virtual goods and virtual currency) and services that are offered to You by Us as well as any Belfoods website which You access to avail of any of the above (collectively, the “Services”).</p><p>1.2 References to Belfoods in these Terms shall include any Belfoods affiliates which shall include subsidiaries, parent companies and any other entities under common ownership. Where You receive or participate in a Service provided directly by Belfoods, Belfoods is the data controller of Your personal data.</p><p>1.3 Where You access the Services through a third party website or platform (such as Windows Store, App Store and Google Play Store) please be aware that the privacy policies of those websites and applications will also apply to You. Payments are processed through third party payment providers. You will also be subject to these third party terms and You should review them carefully.</p><p>1.4 Please note that if You follow a link to any third party website, We do not accept any responsibility or liability for such a website, its policies, nor do We endorse such websites.</p><p>2. AGREEING TO THESE TERMS</p><p>2.1. By accessing or using the Services, You are agreeing to the terms of this Privacy Policy. This is Our entire and exclusive Privacy Policy and it supersedes any earlier version.</p><p>2.2. This Privacy Policy should be read in conjunction with Our Terms of Service and any additional applicable terms brought to Your attention when You access the Services. Where You access and use the Services, You will also be bound by Our Terms of Service.</p><p>2.3. Where You access the Services through a third party platform or where You download the Services as an app, You will be subject to the terms of use and privacy policy of that third party platform and You should also review those terms carefully.</p><p>2.4. We reserve the right to amend this Privacy Policy at any time and You shall be notified of any such amendment via the platform through which You access the Services and/or by Us publishing the modified Privacy Policy on any platform through which You access the Services. We recommend that You revisit this Privacy Policy on a regular basis. For the avoidance of doubt, Your continued use of the Services shall be interpreted as deemed acceptance of any modifications to the Privacy Policy.</p><p>2.5. If You have any questions regarding the Privacy Policy, please contact us at belfoods.indo@gmail.com</p><p>3. COLLECTING INFORMATION FROM YOU</p><p>3.1. Depending on the nature of the Services which You use, We may, in accordance with this Privacy Policy, collect information and/or personal data, including but not limited to, Your first and last name, gender, date of birth, profile picture or its URL, residential address, email address, phone number or other contact information and certain technical information (the “Information”). We may also collect:<br>Your screen name (user ID);<br>Technical or other details about any device which You use to access the Services: Internet and/or network connection (including Your IP address, Media Access Control (MAC); operating system, browser type or other software; hardware (including computer hardware or mobile model); mobile device details (including Your mobile device type and number; mobile carrier details; and unique mobile device ID) or other technical details.<br>Details of Your use of the Services including, but not limited to: traffic data, location/geographical data, the Service resources that You access, the time You spend on the Services, crash reports and reasons for connection drops.<br>Data that You provide to Us via any third party application which You use to access the Services or which You make publicly available on such a platform, by SMS, via player forums, data stored in Services log files or by contacting Us.<br>Information provided when You report a problem with any of the Services.<br>We may also ask You to complete surveys that We use for research purposes, although You do not have to respond to them.</p><p>3.2. By accessing or using the Services, You are authorizing Us to collect, store and use Your Information. You can control the amount of Information You are authorizing Us to collect, store and use by altering Your privacy settings on the mobile device or platform through which You access the Services or Your user profile any third party platform. You can find out more about these settings, and how to control them, on the mobile device or platform where You access the Services from.</p><p>3.3. We may collect, store and use in accordance with this Privacy Policy certain Information where You provide such Information either (i) directly to Us; or (ii) through Your use of a third party platform, which may, upon Your acceptance, provide this Information to Us through its application programming interface. We may also receive Information from Our third party service providers. We will have access to any Information You provide to such third party service providers, and We will use that Information to provide You with the Services and as otherwise set out in this Privacy Policy.</p><p>3.4. By accessing or using the Services via Your mobile phone, or other mobile device, You are authorising Us to collect its identifier and IP address. We may also collect the name You have associated with Your mobile phone or other mobile device, device type, telephone number, country, and any other information You choose to provide. We may also access Your contacts to enable You to invite friends to join You on the Services if You request that we do this on Your behalf.</p><p>3.5. We receive and store the information that You provide, including Your telephone number, when You sign up to have SMS notifications sent directly to Your mobile phone. These messages notify You of in-game activity within the Services and may allow You to access the Services from Your mobile device.</p><p>3.6. With Your consent, We may send push notifications to Your mobile device to provide Service updates and other relevant messages. You can manage push notifications within the settings of Your mobile device.</p><p>3.7. Should You purchase a licence to use Virtual Items through a third party platform, and that purchase is processed by a third party (e.g. Apple Inc. where You have made a purchase on an iOS device), We may receive payment information which You provide to that third party but only in order to allow us to provide You with the licence to use Virtual Items. Any purchases which You make through a third party in this manner may be subject to their policies and it is Your sole responsibility to ensure Your compliance with those policies. We do not collect, nor do we have access to any of Your billing or credit information. That data is collected and stored by third party payment service providers (for example, the platform through which You are accessing the Services).</p><p>3.8. We may collect this data through Our Services or third party services connected with them (including in particular Facebook and Google Analytics).</p><p>4. OUR USE OF YOUR INFORMATION</p><p>4.1 We use information held about You in some of the following ways:</p><p>• To provide You with the Services.<br>• To ensure that content from Our Services is presented in the most effective manner for You and for Your computer or other device from which You access the Services.<br>• To provide You with information or services that You request from Us or which We feel may interest You, if You have consented to be contacted for such purposes.<br>• To perform Our obligations from any contracts entered into with You.<br>• To allow You to participate in interactive features of Our Services, if You choose.<br>• To notify You about changes to Our Services.<br>• To provide You with support and other administrative services.<br>• To prevent fraud and provide safe and secure Services.<br>• To comply with our own legal obligations.</p><p>4.2. Please remember that using the Services may reveal information relating to You which is publically available on the platform that You are using to access the Services (for example, Your screen name, Your profile picture and the content of Your communications to other users).</p><p>4.3. We are not responsible for the activities of other users or other third parties to whom You choose to provide Your personal information (whether via Our Services or otherwise).</p><p>4.4. If Your account is closed, we are obliged to store the Information which is saved in our database for a period of time to allow us to comply with applicable laws. Please note that it is not possible to delete Your Information prior to the expiry of applicable statutory retention periods and in order for us to comply with our legal obligations.</p><p>4.5. We may disclose Your Information, and the contents of all Your online communications, if required to do so by law, or if We believe in good faith that such action is necessary to: (i) comply with any applicable laws or regulations or any legal process served on Us, the Services or in circumstances where We are under a substantially similar legal obligation; (ii) protect and defend Our rights or property; (iii) act to protect the personal safety of users of the Services or the public; or (iv) if, in Our sole determination, You are found to have cheated or attempted to defraud Us or any other user of the Services in any way, or if We suspect You of any fraudulent activity.</p><p>4.6. We may further provide Your Information to any third parties and data processors providing services to Us, including but not limited to, payment processing, data analysis, email delivery, hosting services, customer service and to assist Us in our marketing efforts. We take all measures to ensure that Our arrangements with third party service providers and data processors protect the privacy of Your Information and that such third parties do not use Your Information for any other purpose than to provide services to Us.</p><p>4.7. We can share Your Information with third party service providers and data processors with regards to promoting their services. You can contact us any time You want to withdraw of this promotion services. We will not actively share Your Information with third party advertisers for their direct marketing purposes unless You give Us Your consent. We may, however, share (i) aggregated information (information about You and other users collectively, but not specifically identifiable to You); (ii) anonymous information; and (iii) certain technical information to develop and deliver targeted advertising in the Services and on the websites of third parties. We may also allow advertisers to collect these types of information within the Services by using tracking technologies like browser cookies and web beacons. Our collection, use, and disclosure of anonymous or aggregated information are not subject to any of the restrictions in this Privacy Policy.</p><p>4.8. You may be offered the option of importing Your contact list or address book contacts, either automatically or manually, into the Services in order to enable You to (i) locate any of Your contacts who are also users of the Services; and/or (ii) invite Your contacts to become users of the Services. Should You opt to import Your contact list or address book contacts, You are authorizing Us to store Your contact details on Our databases for these purposes, unless You expressly revoke this authorization. For the avoidance of doubt, any passwords which You provide to Us to facilitate this import shall not be stored by Us.</p><p>4.9. You may contact Us at belfoods.indo@gmail.com if You:<br>• (i) want to confirm the accuracy of the Information We have collected about You;<br>• (ii) would like to update Your Information; and/or (iii) have any complaint regarding Our use of Your Information. If requested, We will (i) update Your Information, provided that You provide evidence as We may reasonably require for such changes, or (ii) mark any Information to prohibit future use for marketing purposes.</p><p>4.10. For the avoidance of doubt, nothing in this Privacy Policy shall prevent Us from retaining Your Information where We are required to do so by law. If You have sent or posted content on the Service, We may not be able to delete it.</p><p>5. COOKIES AND AUTOMATED INFORMATION COLLECTION</p><p>5.1. By accessing or using the Services You authorize Us to collect certain technical information in order to (i) analyses usage of the Services; (ii) provide a more personalized experience; and (iii) manage advertising. We, and our third party service providers, may use server log files or web log files and tracking technologies to collect and analyses certain types of technical information, including but not limited to, cookies, IP addresses, device type, device identifiers, browser types, browser language, URLs, domain names, landing pages, game state, the date and time of usage of the Service, and other similar information.</p><p>5.2. We may also use other technologies, including but not limited to, web bugs, tracking pixels and cookies. Web bugs allow Us to know if a certain page was visited or whether an email was opened, while tracking pixels allow Us to advertise more efficiently by excluding current users from certain promotional messages, identifying the source of a new installation or delivering ads to You on other websites. Cookies allow Us to improve the quality of the Services, make recommendations, and make the Services easier to use for You. A cookie is a small text file recorded on Your hard drive that identifies You as a unique user and contains certain information about Your particular login session and/or Your use of the Services. Please note that companies delivering advertisements within the Services may also use cookies or other technologies, and those practices are subject to their own policies.</p><p>6. PROTECTION OF MINORS</p><p>6.1. The Services provided by Belfoods (including the game Belfoods Catcher) may only be played by a person over the age of 9+.</p><p>7. SAFETY MEASURES TO PROTECT YOUR INFORMATION</p><p>7.1. Further technical security measures: In order to prevent illegal manipulation by third parties and to identify and prevent any form of misuse, We record the IP addresses of all computers used to access the line-up on the Services. In addition, all Your Information are protected from unauthorized access by a firewall (a computer that is fitted with complex security technology specifically designed to shield Our network from the internet). Additionally, We use reliable internal data protection mechanisms combined with a restrictive security system. However, no website or internet transmission is completely secure, and We cannot guarantee that unauthorized access, hacking, data loss, or other breaches will never occur. We thus urge You to take steps to keep Your Information safe, and to log out of Your platform account after use. If Your platform account is hacked, this may lead to unauthorized use of the Services, so be careful to keep Your account information secure.</p><p>7.2. Although We strive to protect Your Information, We cannot guarantee the security of Your Information while it is being transmitted to Us; any transmission is at Your own risk. Once We have received Your Information, We have procedures and security features in place to try to prevent unauthorized access.</p><p>8. DISCLAIMER</p><p>8.1. You expressly agree that the Services are provided on an “as is” basis without warranties of any kind. We are not responsible for events beyond Our direct control. Because of the complex and constantly changing nature of Our technology and business, We cannot guarantee, nor do We represent, that there will be an error-free performance regarding the privacy of Your Information, and We will not be liable for any indirect, incidental, consequential or punitive damages relating to the use or release of Your Information.</p><p>8.2. We cannot ensure the protection of any Information that You provide to a third party websites that links to or from the Services, since these third party websites are owned and operated independently of Us. Any Information collected by these third parties is not governed by this Privacy Policy but by the privacy policy, if any, of such third party. If You have questions about a third party’s information practices, please read its privacy policy. We assume no responsibility or liability whatsoever for the practices, actions or policies of such third parties, and We are not responsible for the content or privacy practices of such online sites.</p><p>9. INTERNATIONAL TRANSFERS</p><p>9.1. Your Information collected by Us may be stored and processed in any country in which We or Our affiliates, suppliers, ESPs or agents maintain facilities. By using the Service, You expressly consent to any transfer of Information outside of Your country. Nevertheless, We take steps to ensure that Our agents, affiliates and suppliers comply with Our standards of privacy regardless of their location.</p><p>10. MERGERS AND OTHER EVENTS REQUIRING TRANSFER</p><p>10.1. If We should ever file for bankruptcy, or become insolvent, or be acquired by a third party, merge with a third party, sell all or part of Our assets, or transfer substantially all or part of Our relevant assets to a third party, We are entitled to share Your Information You have provided through the Services to potential and subsequent business and merger partners. By agreeing to the Terms of Service, You hereby give Your consent to such transfer of this Information.</p><p>Contacting Us</p><p>If you have any questions about this Policy, please contact us at belfoods.indo@gmail.com</p><p>Last Edited on 2019 08-08</p>', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-03 17:52:33', '2026-03-03 17:52:33'),
	(16, 15, 'New 06 Mar 2026, 13:43', 'new-06032026134301.html', '', '', '', '', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-06 13:43:01', '2026-03-06 13:43:01'),
	(17, 4, 'New 06 Mar 2026, 14:20', 'new-06032026142014.html', '', 'asdfadsf', 'asdfasdfadsf', 'https://www.youtube.com/embed/zJVh2Lm5ia8?si=RKauKpOK5FQbtyT', '', '', '', '<p>asfasdf</p>', '', '2019-01-01 00:00:00', 'https://cdn.sanity.io/images/krc73rcv/production/e2243e72a05111c1f32730f6101940ce3c59a25b-4000x5328.jpg?w=450&auto=format&dpr=2', '', '', 1, 999, 1, 'admin', '2026-03-06 14:20:14', '2026-03-06 14:20:14'),
	(18, 5, 'abc', 'abc.html', 'abc', ' Heading 1', 'sales@belfoods.com', '081200000001', '', '', '', '', '', '2019-01-01 00:00:00', '', '', '', 1, 999, 1, 'admin', '2026-03-06 15:31:52', '2026-03-06 15:31:52'),
	(19, 17, 'New 06 Mar 2026, 15:51', 'new-06032026155134.html', '', '', '', '', '', '', '', '<p>Kunjungi toko online resmi kami — banyak promo menanti!</p><ul class="list-unstyled mb-2"><li><a href="#" class="fw-bold" data-mce-href="#">BliBli</a>&nbsp; &nbsp;promo eksklusif &amp; penawaran paket</li><li><a href="#" class="fw-bold" data-mce-href="#">Shopee</a>&nbsp; &nbsp;diskon harian &amp; voucher</li><li><a href="#" class="fw-bold" data-mce-href="#">Tokopedia</a>&nbsp; &nbsp;pilih produk dengan gratis ongkir</li></ul><p class="mb-0"><strong>Gratis ongkir</strong> tersedia di e-commerce tertentu. Cek syarat &amp; ketentuan di masing?masing platform.</p>', '', '2019-01-01 00:00:00', 'https://belfoods.com/id/public/banner/4.jpg', '', '', 1, 999, 1, 'admin', '2026-03-06 15:51:34', '2026-03-06 15:51:34');

-- Dumping structure for table belfoods.cms_content_column
CREATE TABLE IF NOT EXISTS `cms_content_column` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `id_pages` int(6) NOT NULL DEFAULT 1,
  `name` int(1) NOT NULL DEFAULT 1,
  `url` int(1) NOT NULL DEFAULT 1,
  `title` int(1) NOT NULL DEFAULT 1,
  `h1` int(1) NOT NULL DEFAULT 1,
  `h2` int(1) NOT NULL DEFAULT 1,
  `h3` int(1) NOT NULL DEFAULT 1,
  `content` int(1) NOT NULL DEFAULT 1,
  `embed` int(1) NOT NULL DEFAULT 1,
  `publish_date` int(1) NOT NULL DEFAULT 1,
  `img` int(1) NOT NULL DEFAULT 1,
  `metadata_description` int(1) NOT NULL DEFAULT 1,
  `metadata_keywords` int(1) NOT NULL DEFAULT 1,
  `related_content` int(1) NOT NULL DEFAULT 1,
  `status` int(2) NOT NULL DEFAULT 1,
  `presence` int(1) NOT NULL DEFAULT 1,
  `created_by` varchar(250) NOT NULL DEFAULT 'admin',
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_content_column: ~0 rows (approximately)

-- Dumping structure for table belfoods.cms_label
CREATE TABLE IF NOT EXISTS `cms_label` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `href` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_label: ~2 rows (approximately)
INSERT INTO `cms_label` (`id`, `name`, `content`, `href`) VALUES
	(164, 'footer', '<p>@2026 <a data-mce-href="https://belfoods.com/id/belfoods-catcher-privacy-policy.html" href="https://belfoods.com/id/belfoods-catcher-privacy-policy.html">Belfoods Catcher Privacy Policy</a></p>', ''),
	(167, 'kreasiKilatTitle', 'Masak Sat Set Untuk Keluarga 123', ''),
	(168, 'widgetAboutTitle', 'Add Text Here..!123', '');

-- Dumping structure for table belfoods.cms_label_log
CREATE TABLE IF NOT EXISTS `cms_label_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id_origin` int(8) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `href` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_label_log: ~0 rows (approximately)

-- Dumping structure for table belfoods.cms_pages
CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pages` int(6) NOT NULL DEFAULT 0,
  `ilock` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `post` int(6) NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `themes` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(250) NOT NULL DEFAULT '',
  `metadata_description` varchar(250) NOT NULL DEFAULT '',
  `metadata_keywords` varchar(250) NOT NULL DEFAULT '',
  `pages_note1` text NOT NULL,
  `pages_note2` text NOT NULL,
  `pages_note3` text NOT NULL,
  `sorting` int(3) NOT NULL DEFAULT 999,
  `idefault` int(1) NOT NULL DEFAULT 0,
  `href` varchar(250) NOT NULL DEFAULT '',
  `href_target_blank` int(1) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `img` varchar(250) NOT NULL DEFAULT '',
  `background` varchar(250) NOT NULL DEFAULT '',
  `data_hidden` text NOT NULL,
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_pages: ~17 rows (approximately)
INSERT INTO `cms_pages` (`id`, `id_pages`, `ilock`, `status`, `post`, `name`, `url`, `themes`, `title`, `metadata_description`, `metadata_keywords`, `pages_note1`, `pages_note2`, `pages_note3`, `sorting`, `idefault`, `href`, `href_target_blank`, `presence`, `img`, `background`, `data_hidden`, `input_date`, `update_date`) VALUES
	(1, 0, 1, 1, 0, 'Home', 'home', 'home', ' 123123123123', '123123123 234234234', '5dsfasfasdf', '', '', '', 0, 1, '', 0, 1, '', '', '', '2000-00-00 00:00:00', '2019-10-30 16:19:51'),
	(2, 0, 0, 1, 0, 'Kreasi Kilat', 'kreasi-kilat', 'KreasiKilat', 'Kreasi Kilat', '', '', '', '', '', 1, 0, '', 0, 1, '', '', '', '2026-03-02 15:12:52', '2026-03-03 16:23:55'),
	(3, 0, 0, 1, 0, 'Katalog Produk', 'katalog-produk', 'index', 'Katalog Produk', '', '', '', '', '', 2, 0, '', 0, 1, '', '', '', '2026-03-02 15:12:54', '2026-03-03 14:10:51'),
	(4, 0, 0, 1, 0, 'Tentang Belfoods', 'tentang-belfoods', 'about', 'Tentang Belfoods', '', '', '', '', '', 3, 0, '', 0, 1, '', '', '', '2026-03-02 15:13:30', '2026-03-06 15:11:06'),
	(5, 0, 0, 1, 0, 'Kontak Kami', 'kontak-kami', 'sales', 'Kontak Kami', '', '', '', '', '', 5, 0, '', 0, 1, '', '', '', '2026-03-02 15:13:59', '2026-03-06 15:22:39'),
	(6, 2, 0, 1, 0, 'Resep Inspiratif-150846', 'resep-inspiratif', 'index', 'Resep Inspiratif', '', '', '', '', '', 999, 0, '', 0, 0, '', '', '', '2026-03-02 15:41:04', '2026-03-02 15:41:20'),
	(7, 2, 0, 2, 0, 'Event dan Promo-150844', 'event-dan-promo', 'index', 'Event dan Promo', '', '', '', '', '', 999, 0, '', 0, 0, '', '', '', '2026-03-02 15:41:05', '2026-03-03 14:15:23'),
	(8, 3, 0, 1, 0, 'Royal', 'royal', 'product', 'Royal', '', '', '', '', '', 999, 0, '', 0, 1, 'https://belfoods.com/id/public/pages/ROYAL_ProductWeb.png', '', '', '2026-03-02 15:41:40', '2026-03-03 17:27:44'),
	(9, 3, 0, 1, 0, 'Belfoods', 'belfoods', 'product', 'Belfoods', '', '', '', '', '', 999, 0, '', 0, 1, 'https://belfoods.com/id/public/pages/BELFOODS_ProductWeb.png', '', '', '2026-03-02 15:41:41', '2026-03-03 17:27:49'),
	(10, 3, 0, 1, 0, 'Uenaaak', 'uenaaak', 'product', 'Uenaaak...!', '', '', '', '', '', 999, 0, '', 0, 1, 'https://belfoods.com/id/public/pages/UENAAAK_ProductWeb.png', '', '', '2026-03-02 15:41:41', '2026-03-03 17:27:53'),
	(11, 3, 0, 1, 0, 'Bonanza', 'bonanza', 'product', 'Bonanza', '', '', '', '', '', 999, 0, '', 0, 1, 'https://belfoods.com/id/public/pages/BNZ_ProductWeb.png', '', '', '2026-03-02 15:41:42', '2026-03-03 17:27:57'),
	(12, 3, 0, 1, 0, 'Ayam Nanas', 'ayam-nanas', 'product', 'Ayam Nanas', '', '', '', '', '', 999, 0, '', 0, 1, 'https://belfoods.com/id/public/pages/BNZ_ProductWeb1.png', '', '', '2026-03-03 14:11:04', '2026-03-03 17:28:01'),
	(13, 0, 0, 1, 0, 'Artikel', 'artikel', 'index', 'Artikel', '', '', '', '', '', 4, 0, '', 0, 1, '', '', '', '2026-03-03 14:14:32', '2026-03-03 14:14:43'),
	(14, 13, 0, 1, 0, 'Event', 'event', 'blog', 'Event', '', '', '', '', '', 999, 0, '', 0, 1, '', '', '', '2026-03-03 15:10:01', '2026-03-03 17:20:26'),
	(15, 13, 0, 1, 0, 'Promo', 'promo', 'blog', 'Promo', '', '', '', '', '', 999, 0, '', 0, 1, '', '', '', '2026-03-03 15:10:01', '2026-03-03 17:20:30'),
	(16, 0, 0, 2, 0, 'Privacy Policy', 'privacy-policy', 'text', 'Privacy Policy', '', '', '', '', '', 999, 0, '', 0, 1, '', '', '', '2026-03-03 17:47:57', '2026-03-03 17:48:41'),
	(17, 0, 0, 2, 0, 'Order', 'order', 'order', 'Order', '', '', '', '', '', 999, 0, '', 0, 1, '', '', '', '2026-03-06 15:09:12', '2026-03-06 15:09:59');

-- Dumping structure for table belfoods.cms_pages_log
CREATE TABLE IF NOT EXISTS `cms_pages_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_origin` int(11) NOT NULL DEFAULT 0,
  `id_pages` int(6) NOT NULL DEFAULT 0,
  `ilock` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `post` int(6) NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `themes` varchar(250) NOT NULL DEFAULT '',
  `title` varchar(250) NOT NULL DEFAULT '',
  `metadata_description` varchar(250) NOT NULL DEFAULT '',
  `metadata_keywords` varchar(250) NOT NULL DEFAULT '',
  `pages_note1` text NOT NULL,
  `pages_note2` text NOT NULL,
  `pages_note3` text NOT NULL,
  `sorting` int(3) NOT NULL DEFAULT 999,
  `idefault` int(1) NOT NULL DEFAULT 0,
  `href` varchar(250) NOT NULL DEFAULT '',
  `href_target_blank` int(1) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `img` varchar(250) NOT NULL DEFAULT '',
  `background` varchar(250) NOT NULL DEFAULT '',
  `data_hidden` text NOT NULL,
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_pages_log: ~0 rows (approximately)

-- Dumping structure for table belfoods.cms_widget
CREATE TABLE IF NOT EXISTS `cms_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(250) NOT NULL DEFAULT '',
  `href` text NOT NULL,
  `h1` text NOT NULL,
  `h2` text NOT NULL,
  `h3` text NOT NULL,
  `h4` text NOT NULL,
  `img` text NOT NULL,
  `content` text NOT NULL,
  `sorting` int(5) NOT NULL DEFAULT 999,
  `status` int(1) NOT NULL DEFAULT 1,
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_widget: ~14 rows (approximately)
INSERT INTO `cms_widget` (`id`, `section`, `href`, `h1`, `h2`, `h3`, `h4`, `img`, `content`, `sorting`, `status`, `input_date`, `update_date`) VALUES
	(150, 'banner', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', 'https://belfoods.com/id/public/banner/4.jpg', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2026-03-02 15:03:55'),
	(161, 'banner', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(165, 'infoHome', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(166, 'widget', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(167, 'videoHome', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(168, 'sales', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(169, 'orderNow', '', 'Order Now!', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', 'https://belfoods.com/id/order', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2026-03-06 15:37:46'),
	(170, 'bannerAds', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(171, 'bannerAds', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(173, 'widgetAbout', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(174, 'widgetAbout', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(175, 'widgetAbout', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(176, 'onlineShop', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(177, 'onlineShop', '', 'Add Text 1 Here !', 'Add Text 2 Here !', 'Add Text 3 Here !', 'Add Text 4 Here !', '', 'Add Content Here !', 0, 1, '2017-01-01 00:00:00', '2017-01-01 00:00:00');

-- Dumping structure for table belfoods.cms_widget_log
CREATE TABLE IF NOT EXISTS `cms_widget_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_origin` int(11) NOT NULL DEFAULT 0,
  `id_content` int(6) NOT NULL DEFAULT 0,
  `section` varchar(250) NOT NULL DEFAULT '',
  `href` text NOT NULL,
  `h1` text NOT NULL,
  `h2` text NOT NULL,
  `h3` text NOT NULL,
  `h4` text NOT NULL,
  `img` text NOT NULL,
  `content` text NOT NULL,
  `sorting` int(5) NOT NULL DEFAULT 999,
  `status` int(1) NOT NULL DEFAULT 1,
  `input_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.cms_widget_log: ~0 rows (approximately)

-- Dumping structure for table belfoods.global_setting
CREATE TABLE IF NOT EXISTS `global_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table belfoods.global_setting: ~18 rows (approximately)
INSERT INTO `global_setting` (`id`, `name`, `value`) VALUES
	(1, 'embed_code', ''),
	(2, 'header_code', ''),
	(10, 'footer', 'belfoods.com'),
	(101, 'smtp_host', 'mail.belfoods.com'),
	(102, 'smtp_port', '25'),
	(103, 'smtp_user', 'admin@belfoods.com'),
	(104, 'smtp_pass', 'admin123'),
	(105, 'smtp_to', 'user@belfoods.com'),
	(106, 'smtp_name', 'Sales '),
	(110, 'subject', 'Email from contact Us CMS 5'),
	(112, 'smtp_timeout', '10'),
	(170, 'user', 'adminbiz'),
	(177, 'key', '12ul3Xz8WI-hHeh06cD1Z-Wo6TouEHuh-VIhcIbTEV4-LJkrGOm2Pq-0OUMS6bSDJ-dqv5GRR9Iy-44djYFZREp-Ys7egftRwL-YzfwnDlYqR'),
	(178, 'token', '(0cd!kd#*^lvM.-2=+'),
	(200, 'ecatalog', '0'),
	(201, 'catalogue', 'cat'),
	(202, 'product', 'product'),
	(203, 'cart', 'cart');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
