-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 20, 2026 at 04:15 PM
-- Server version: 11.8.9-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u467644770_edu_tours`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_profiles`
--

CREATE TABLE `agent_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `referral_code` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `organization` varchar(191) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `commission_tier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `custom_commission_rate` decimal(5,2) DEFAULT NULL,
  `bank_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bank_details`)),
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_profiles`
--

INSERT INTO `agent_profiles` (`id`, `user_id`, `referral_code`, `phone`, `organization`, `bio`, `commission_tier_id`, `custom_commission_rate`, `bank_details`, `status`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'DEMOAGENT', NULL, 'Demo Recruiting Partners', NULL, 1, NULL, NULL, 'approved', NULL, '2026-07-31 12:29:03', '2026-07-31 12:29:03', '2026-07-31 12:29:03'),
(2, 5, 'BXHOOSIN', '2550002251', 'Zmyhlwwc LLC', NULL, 1, NULL, NULL, 'pending', NULL, NULL, '2026-09-01 00:01:35', '2026-09-01 00:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `student_id`, `package_id`, `agent_id`, `status`, `admin_notes`, `submitted_at`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(1, 6, 2, NULL, 'enrolled', 'your application is being worked on', '2026-09-20 13:50:57', 1, '2026-09-20 13:54:25', '2026-09-20 13:50:57', '2026-09-20 13:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `application_documents`
--

CREATE TABLE `application_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `document_type` varchar(191) NOT NULL,
  `file_path` varchar(191) NOT NULL,
  `original_name` varchar(191) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_documents`
--

INSERT INTO `application_documents` (`id`, `application_id`, `document_type`, `file_path`, `original_name`, `verified`, `verified_by`, `verified_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'passport', 'applications/1/passport-soSwVSJ0.pdf', 'KITEBI SECONDARY SCHOOL.pdf', 1, 1, '2026-09-20 13:54:19', '2026-09-20 13:50:57', '2026-09-20 13:54:19'),
(2, 1, 'high_school_documents', 'applications/1/high_school_documents-adK1z3Og.pdf', 'Scanned Documents-2.pdf', 1, 1, '2026-09-20 13:54:20', '2026-09-20 13:50:57', '2026-09-20 13:54:20'),
(3, 1, 'transcript', 'applications/1/transcript-CrGWWH3x.pdf', 'Scanned Documents-2.pdf', 1, 1, '2026-09-20 13:54:21', '2026-09-20 13:50:57', '2026-09-20 13:54:21'),
(4, 1, 'recommendation_letter', 'applications/1/recommendation_letter-uQglJLwj.pdf', 'KITEBI SECONDARY SCHOOL.pdf', 0, NULL, NULL, '2026-09-20 13:50:57', '2026-09-20 13:50:57'),
(5, 1, 'statement_of_purpose', 'applications/1/statement_of_purpose-eSpk4zv9.pdf', 'KITEBI SECONDARY SCHOOL.pdf', 0, NULL, NULL, '2026-09-20 13:50:57', '2026-09-20 13:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('edutours-career-and-consultanacy-cache-1b6453892473a467d07372d45eb05abc2031647a', 'i:3;', 1787746400),
('edutours-career-and-consultanacy-cache-1b6453892473a467d07372d45eb05abc2031647a:timer', 'i:1787746400;', 1787746400),
('edutours-career-and-consultanacy-cache-4e3420fa8693aa3ffff72f98d4f01676491be667', 'i:3;', 1787492704),
('edutours-career-and-consultanacy-cache-4e3420fa8693aa3ffff72f98d4f01676491be667:timer', 'i:1787492704;', 1787492704),
('edutours-career-and-consultanacy-cache-admin@scholarshiptest|197.239.5.128', 'i:1;', 1789463723),
('edutours-career-and-consultanacy-cache-admin@scholarshiptest|197.239.5.128:timer', 'i:1789463723;', 1789463723),
('edutours-career-and-consultancy-cache-c1dfd96eea8cc2b62785275bca38ac261256e278', 'i:5;', 1789912278),
('edutours-career-and-consultancy-cache-c1dfd96eea8cc2b62785275bca38ac261256e278:timer', 'i:1789912278;', 1789912278),
('edutours-career-and-consultancy-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}', 1789998658);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_logs`
--

CREATE TABLE `chatbot_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_message` text NOT NULL,
  `bot_reply` text NOT NULL,
  `source` varchar(20) NOT NULL DEFAULT 'ai',
  `escalated` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatbot_logs`
--

INSERT INTO `chatbot_logs` (`id`, `session_id`, `ip`, `user_message`, `bot_reply`, `source`, `escalated`, `created_at`, `updated_at`) VALUES
(1, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'hi', 'I do not have that one. Send a message through the contact form and the team will answer it properly, or check the Scholarships page for what is currently open.', 'fallback', 1, '2026-08-01 07:36:31', '2026-08-01 07:36:31'),
(2, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'scholarships', 'Open scholarship packages are listed on the Scholarships page with their country, level and price. Availability changes as intakes open and close, so that page is always the current list.', 'faq', 0, '2026-08-01 07:36:49', '2026-08-01 07:36:49'),
(3, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'how do i book a consultation', 'I do not have that one. Send a message through the contact form and the team will answer it properly, or check the Scholarships page for what is currently open.', 'fallback', 1, '2026-08-01 07:37:04', '2026-08-01 07:37:04'),
(4, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'where are you located', 'Consultations run online by video call, by phone, or in person at our Kampala office. You pick the mode on the booking form.', 'faq', 0, '2026-08-01 07:57:59', '2026-08-01 07:57:59'),
(5, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'scholarships', 'On scholarships we help you find funding you genuinely qualify for, then build a competitive application: essays, personal statement, and recommendation strategy. Deadlines and eligibility differ per award and per student, so we confirm those in a consultation.', 'faq', 0, '2026-08-01 07:58:20', '2026-08-01 07:58:20'),
(6, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'how do i book a consultaton', 'Use the booking form on the site. You fill in your details, pick your service, choose a date and time, and upload proof of payment. We contact you within 24 hours to confirm.', 'faq', 0, '2026-08-01 07:58:59', '2026-08-01 07:58:59'),
(7, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'What services do you offer?', 'We work in five areas: scholarship guidance, university admission support, visa and travel preparation, study tours, and general career consultation. Which one is closest to what you need?', 'faq', 0, '2026-08-01 08:26:40', '2026-08-01 08:26:40'),
(8, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'university admission', 'We shortlist universities and programmes that fit your grades, budget and goals, then guide the application through to the offer letter.', 'faq', 0, '2026-08-01 08:26:56', '2026-08-01 08:26:56'),
(9, '3c1ac3404cc88b6ca481a245380864e1', '127.0.0.1', 'how much is it to do study in China', 'Consultation fees are confirmed on the booking page. Payment is by bank transfer, Airtel Money or MTN Mobile Money, and you upload the proof with your booking.', 'faq', 0, '2026-08-01 08:27:19', '2026-08-01 08:27:19'),
(10, 'e7fbfa5d30c7c705c64653bddf45e7fb', '127.0.0.1', 'What does a consultation cost?', 'Use the booking form on the site. You fill in your details, pick your service, choose a date and time, and upload proof of payment. We contact you within 24 hours to confirm.', 'faq', 0, '2026-08-03 11:10:06', '2026-08-03 11:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `rate_applied` decimal(5,2) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `payment_reference` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_tiers`
--

CREATE TABLE `commission_tiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `rate_percent` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_tiers`
--

INSERT INTO `commission_tiers` (`id`, `name`, `description`, `rate_percent`, `created_at`, `updated_at`) VALUES
(1, 'Bronze', 'Default tier for new agents', 5.00, '2026-07-31 12:29:00', '2026-07-31 12:29:00'),
(2, 'Silver', 'Agents with a proven track record', 8.00, '2026-07-31 12:29:00', '2026-07-31 12:29:00'),
(3, 'Gold', 'Top-performing partner agents', 12.00, '2026-07-31 12:29:00', '2026-07-31 12:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `consultation_bookings`
--

CREATE TABLE `consultation_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `id_document_type` varchar(191) NOT NULL,
  `id_document_number` varchar(191) NOT NULL,
  `education_level` varchar(191) NOT NULL,
  `field_of_study` varchar(191) NOT NULL,
  `intended_study_level` varchar(191) DEFAULT NULL,
  `preferred_destination` varchar(191) DEFAULT NULL,
  `service_type` varchar(191) NOT NULL,
  `consultation_mode` varchar(191) NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` varchar(191) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `fee_amount` decimal(8,2) NOT NULL DEFAULT 15.00,
  `fee_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `proof_of_payment_path` varchar(191) NOT NULL,
  `academic_document_paths` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`academic_document_paths`)),
  `how_heard` varchar(191) DEFAULT NULL,
  `goals` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultation_bookings`
--

INSERT INTO `consultation_bookings` (`id`, `reference`, `first_name`, `last_name`, `email`, `phone`, `country`, `city`, `id_document_type`, `id_document_number`, `education_level`, `field_of_study`, `intended_study_level`, `preferred_destination`, `service_type`, `consultation_mode`, `preferred_date`, `preferred_time`, `payment_method`, `fee_amount`, `fee_currency`, `proof_of_payment_path`, `academic_document_paths`, `how_heard`, `goals`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BK-NYKZITHN', 'RACHEAL', 'EDITH', 'rechonankya@gmail.com', '+256757875053', 'Uganda', 'Kampala', 'national_id', 'CF0105210JNXZK', 'bachelors', 'medicine', 'masters', 'CHINA, TURKEY', 'scholarship', 'phone', '2026-08-04', '09:00 - 10:00 EAT', 'airtel_money', 15.00, 'USD', 'consultation-bookings/1/proof-of-payment-Ji0NV6ZR.pdf', '[\"consultation-bookings/1/academic-document-UooN6qNb.pdf\", \"consultation-bookings/1/academic-document-B46lyjZs.pdf\", \"consultation-bookings/1/academic-document-iQDTkv1m.pdf\"]', 'referral', 'I WANT TO KNOW HOW LONG IT TAKES TO PROCESS', 'pending', '2026-08-02 06:47:16', '2026-08-02 06:47:16'),
(2, 'BK-BVRYPIQS', 'Ketra', 'nasejje', 'ketranasejje7@gmail.com', '+2507584658', 'Rwanda', 'Kigali', 'national_id', 'CF04425885448', 'bachelors', 'NURS', 'masters', 'USA, Canada, China', 'general', 'online', '2026-08-24', '11:00 - 12:00 EAT', 'airtel_money', 15.00, 'USD', 'consultation-bookings/2/proof-of-payment-lOSxD4Dv.pdf', '[\"consultation-bookings\\/2\\/academic-document-hXoWjKRR.pdf\"]', 'social_media', 'MAIL_MAILER=smtp\nMAIL_HOST=smtp.hostinger.com\nMAIL_PORT=465\nMAIL_USERNAME=info@mail.edu-tours.com\nMAIL_PASSWORD=Edutours@1000\nMAIL_ENCRYPTION=ssl\nMAIL_FROM_ADDRESS=info@mail.edu-tours.com\nMAIL_FROM_NAME=\"Edutours\"', 'pending', '2026-08-23 13:45:16', '2026-08-23 13:45:16'),
(3, 'BK-FE1K7Y1V', 'Anthony', 'Kizito', 'joshuaedutours@gmail.com', '19152767771', 'United States', 'El Paso', 'national_id', 'fffffffffffff56565656565656565656', 'bachelors', 'medicine', 'masters', 'USA, CANADA,CHINA, TURKEY', 'scholarship', 'phone', '2026-08-26', '10:00 - 11:00 EAT', 'airtel_money', 15.00, 'USD', 'consultation-bookings/3/proof-of-payment-g69Argnd.jpeg', '[\"consultation-bookings\\/3\\/academic-document-PQj3GRPp.pdf\",\"consultation-bookings\\/3\\/academic-document-TL4dPazp.pdf\"]', 'google', 'I would like a consultation about the Rhodes Scholarship Application Review — Oxford.', 'pending', '2026-08-26 12:13:06', '2026-08-26 12:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `country`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Canada', 'destination-3.jpg', 0, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(2, 'United States', 'destination-4.jpg', 1, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(3, 'United Kingdom', 'destination-1.jpg', 2, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(4, 'China', 'destination-5.jpg', 3, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(5, 'India', 'destination-6.jpg', 4, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_events`
--

CREATE TABLE `gallery_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_events`
--

INSERT INTO `gallery_events` (`id`, `title`, `location`, `event_date`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'King\'s College, Buddo', 'Buddo, Uganda', NULL, 'Our team met students and staff at King\'s College, Buddo, to talk through study-abroad scholarship pathways.', 1, '2026-08-03 11:32:15', '2026-08-03 11:32:15'),
(2, 'Kisubi Schools, Elite High Entebbe & Mengo Senior School', 'Kisubi, Entebbe & Mengo, Uganda', NULL, 'Visits to Kisubi Schools, Elite High School Entebbe, and Mengo Senior School to introduce students to study-abroad opportunities.', 1, '2026-08-03 11:32:15', '2026-08-03 11:32:15'),
(3, ' Gayaza High School ', 'Gayaza, Uganda', NULL, 'We engaged with students of Gayaza High school during their Career\'s day ', 1, '2026-08-03 11:32:15', '2026-08-03 11:59:20'),
(4, 'School & Campus Outreach Visits', 'Uganda', NULL, 'Behind the scenes from our ongoing rounds of school and campus visits across the country.', 1, '2026-08-03 11:32:15', '2026-08-03 11:32:15'),
(5, 'Classroom Talks — Study Abroad Sessions', 'Uganda', NULL, 'EduTours has been to different classrooms across the country, leading students to a successful career.', 1, '2026-08-03 11:32:15', '2026-08-03 11:32:15'),
(6, 'Inter-School Study Abroad Fair', 'Uganda', NULL, 'Students from several schools stopped by our Study Abroad Scholarship booth to learn about opportunities in the USA, UK, Canada, India, and beyond.', 1, '2026-08-03 11:32:15', '2026-08-03 11:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_event_images`
--

CREATE TABLE `gallery_event_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gallery_event_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_event_images`
--

INSERT INTO `gallery_event_images` (`id`, `gallery_event_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(5, 5, 'photo_5888930046272455203_y.jpg', 0, '2026-08-03 11:47:01', '2026-08-03 11:47:01'),
(6, 6, 'photo_5890960968803009524_y.jpg', 0, '2026-08-03 11:47:01', '2026-08-03 11:47:01'),
(7, 1, 'photo_5890960968803009513_y.jpg', 0, '2026-08-03 11:54:51', '2026-08-03 11:54:51'),
(8, 1, 'photo_5890960968803009518_y.jpg', 1, '2026-08-03 11:54:51', '2026-08-03 11:54:51'),
(9, 1, 'photo_5890960968803009517_y.jpg', 2, '2026-08-03 11:54:51', '2026-08-03 11:54:51'),
(10, 2, 'photo_5888930046272455205_y.jpg', 0, '2026-08-03 11:56:08', '2026-08-03 11:56:08'),
(11, 2, 'photo_5888930046272455203_y.jpg', 1, '2026-08-03 11:56:08', '2026-08-03 11:56:08'),
(12, 3, 'photo_5890960968803009524_y.jpg', 0, '2026-08-03 11:59:21', '2026-08-03 11:59:21'),
(13, 3, 'photo_5890960968803009527_y.jpg', 1, '2026-08-03 11:59:21', '2026-08-03 11:59:21'),
(14, 3, 'photo_5890960968803009529_y.jpg', 2, '2026-08-03 11:59:21', '2026-08-03 11:59:21'),
(15, 3, 'photo_5890960968803009530_y.jpg', 3, '2026-08-03 11:59:21', '2026-08-03 11:59:21'),
(16, 3, 'photo_5890960968803009532_y.jpg', 4, '2026-08-03 11:59:21', '2026-08-03 11:59:21'),
(17, 4, 'photo_5888930046272455203_y.jpg', 0, '2026-08-03 12:00:16', '2026-08-03 12:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(191) NOT NULL DEFAULT 'Scholarship Platform',
  `site_logo` varchar(191) DEFAULT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `support_email` varchar(191) DEFAULT NULL,
  `support_phone` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `site_logo`, `currency`, `support_email`, `support_phone`, `created_at`, `updated_at`) VALUES
(1, 'Scholarship Platform', NULL, 'USD', 'info@mail.edu-tours.com', NULL, '2026-07-31 12:05:43', '2026-07-31 12:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_07_30_174924_create_permission_tables', 1),
(5, '2026_07_30_175029_add_status_to_users_table', 1),
(6, '2026_07_30_175030_create_commission_tiers_table', 1),
(7, '2026_07_30_175032_create_student_profiles_table', 1),
(8, '2026_07_30_175033_create_agent_profiles_table', 1),
(9, '2026_07_30_175036_create_scholarship_packages_table', 1),
(10, '2026_07_30_175037_create_applications_table', 1),
(11, '2026_07_30_175038_create_application_documents_table', 1),
(12, '2026_07_30_175039_create_commissions_table', 1),
(13, '2026_07_30_175040_create_payments_table', 1),
(14, '2026_07_30_175042_create_general_settings_table', 1),
(15, '2026_07_30_175043_create_email_templates_table', 1),
(16, '2026_07_30_175044_create_pages_table', 1),
(17, '2026_07_30_175045_create_support_tickets_table', 1),
(18, '2026_07_30_175046_create_support_messages_table', 1),
(19, '2026_07_30_181459_create_notifications_table', 1),
(20, '2026_08_01_000000_create_chatbot_logs_table', 2),
(21, '2026_08_02_092048_create_consultation_bookings_table', 3),
(22, '2026_08_02_112903_convert_scholarship_packages_level_to_array', 4),
(23, '2026_08_03_142618_create_gallery_events_table', 5),
(24, '2026_08_03_144543_create_gallery_event_images_table', 6),
(25, '2026_08_03_150424_create_destinations_table', 7),
(26, '2026_08_03_150425_create_testimonials_table', 7),
(27, '2026_08_06_164740_add_is_featured_to_scholarship_packages_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('139b1124-0337-4b51-90fd-7ddf1561da37', 'App\\Notifications\\ApplicationStatusChangedNotification', 'App\\Models\\User', 6, '{\"application_id\":1,\"message\":\"Your application status changed to Enrolled\",\"url\":\"https:\\/\\/edu-tours.com\\/student\\/applications\\/1\"}', NULL, '2026-09-20 13:54:07', '2026-09-20 13:54:07'),
('e9bab192-19ba-499e-84aa-4eab7ba14d7b', 'App\\Notifications\\ApplicationSubmittedNotification', 'App\\Models\\User', 1, '{\"application_id\":1,\"message\":\"NAVUBYA JESCA submitted an application for Canada Study Package.\",\"url\":\"https:\\/\\/edu-tours.com\\/admin\\/applications\\/1\"}', NULL, '2026-09-20 13:50:58', '2026-09-20 13:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `stripe_session_id` varchar(191) DEFAULT NULL,
  `stripe_payment_intent` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2026-07-31 12:29:00', '2026-07-31 12:29:00'),
(2, 'agent', 'web', '2026-07-31 12:29:00', '2026-07-31 12:29:00'),
(3, 'student', 'web', '2026-07-31 12:29:00', '2026-07-31 12:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_packages`
--

CREATE TABLE `scholarship_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `level` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `seats_available` int(10) UNSIGNED DEFAULT NULL,
  `application_deadline` date DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scholarship_packages`
--

INSERT INTO `scholarship_packages` (`id`, `name`, `slug`, `country`, `level`, `description`, `requirements`, `price`, `currency`, `seats_available`, `application_deadline`, `image`, `status`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'UK Postgraduate Placement Package', 'uk-undergraduate-placement-package', 'United Kingdom', '[\"masters\",\"postgraduate\"]', 'Full placement support for masters scholarship applicants to  UK universities.', '[\"passport\", \"transcript\", \"recommendation_letter\", \"photo\"]', 3000.00, 'USD', 30, '2026-12-31', NULL, 1, 0, '2026-07-31 12:29:02', '2026-08-02 09:06:17'),
(2, 'Canada Study Package', 'canada-postgraduate-placement-package', 'Canada', '[\"postgraduate\",\"undergraduate\",\"masters\",\"phd\"]', 'Placement support for applicants seeking education at Canadian institutions.', '[\"passport\", \"transcript\", \"recommendation_letter\", \"statement_of_purpose\", \"high_school_documents\"]', 2500.00, 'USD', 0, '2026-12-31', NULL, 1, 1, '2026-07-31 12:29:02', '2026-08-06 17:00:55'),
(3, 'USA Masters Placement Package', 'usa-phd-placement-package', 'United States', '[\"postgraduate\",\"masters\"]', 'End-to-end placement support for Masters scholarship applicants to US universities.', '[\"passport\", \"transcript\", \"recommendation_letter\", \"research_proposal\", \"photo\"]', 3000.00, 'USD', 15, '2026-12-31', NULL, 1, 1, '2026-07-31 12:29:02', '2026-08-06 17:00:46'),
(4, 'India Partial Scholarship ', 'india-undergraduate-partial-scholarship-5DtQ', 'India', '[\"undergraduate\",\"postgraduate\",\"masters\"]', 'For all degree seeking applicants in the fields of Engineering, Pharmacy, Nursing, Law, Humanities', '[\"passport\", \"transcript\", \"recommendation_letter\", \"photo\"]', 500.00, 'USD', 30, '2026-12-31', NULL, 1, 1, '2026-07-31 15:53:14', '2026-08-06 17:01:20'),
(5, 'China Study Package ', 'china-undergraduate-study-package-FeHL', 'China', '[\"undergraduate\",\"masters\",\"phd\",\"postgraduate\"]', 'Available for all degree seeking applicants in the fields of Engineering, Business, Pharmacy, Medicine', '[\"passport\", \"transcript\", \"recommendation_letter\", \"photo\"]', 1500.00, 'USD', 30, '2026-12-31', NULL, 1, 1, '2026-07-31 15:55:12', '2026-08-06 17:02:10'),
(6, 'Stipendium Hungaricum Scholarship (Fully Funded)', 'stipendium-hungaricum-scholarship-fully-funded-fabJ', 'Hungary', '[\"undergraduate\",\"masters\",\"phd\"]', 'The Hungarian Government established the Stipendium Hungaricum scholarship programme to promote the internationalisation of Hungarian higher education and to attract top international students from all around the world who can establish personal and professional links to Hungary while enjoying high-quality education in the heart of Europe.\nRequirements:\n\nFor Bachelor’s:\n	High school diploma (or equivalent)\n\n	Minimum academic performance (varies by country)\n\n	Proof of English/Hungarian proficiency (IELTS/TOEFL or equivalent if required)\nFor Master’s:\n	Bachelor’s degree (relevant field)\n\n	Minimum GPA (varies by university)\n\n	Language proficiency (depends on program)\nFor PhD:\nMaster’s degree (research proposal required)\nAcademic publications (advantageous)\nSupervisor acceptance (sometimes needed)\nScholarship Includes\nTUITION FEES\nMEDICAL INSURANCE\nMONTHLY STIPEND\nACCOMODATION', '[\"passport\", \"academic_transcripts_and_certificates\", \"proof_of_language_proficiency_englishhungarian\", \"motivation_letter\", \"recommendation_letters\", \"medical_certificate\", \"research_proposal_for_phd\"]', 300.00, 'USD', NULL, '2027-01-15', NULL, 1, 1, '2026-08-02 08:42:15', '2026-08-06 17:37:40'),
(7, 'Chevening Scholarship Essay Review (UK, Fully Funded)', 'chevening-scholarship-essay-review-uk-fully-funded-IDYc', 'United Kingdom', '[\"masters\"]', 'Chevening is the UK government\'s fully funded Master\'s scholarship,\ncovering tuition, a monthly living allowance and return flights. Your\nfour essays are the single most important part of the application —\nthis service makes sure they\'re ready.\n\nWHAT YOU GET\n- Full review of all four essays (up to 500 words each): Leadership &\n  Influence, Networking, Studying in the UK, and Career Plan\n- Line edits plus actionable comments on clarity, structure and impact\n- Positioning that draws out your achievements, leadership and goals\n- Story structure that reads as authentic to the selection committee\n- Up to two rounds of revisions per essay\n\nHOW IT WORKS\n1. Submit your CV, essay drafts and your chosen universities/courses,\n   plus any achievements you want emphasised.\n2. Once payment clears, review begins. If anything is missing, you\'ll\n   get an email explaining exactly what\'s needed.\n3. Feedback returns within 3 business days (weekends excluded).\n4. You revise, we finalise, and the polished version is delivered.\n\nWHY THIS SERVICE\n- Tailored to your own strengths and background, not a template\n- Aligned specifically to Chevening\'s assessment criteria\n- Professional, committee-ready writing standard\n- Collaborative — revisions until it genuinely fits you\n\nPLEASE NOTE\n- This is a document review service. It does not guarantee a\n  scholarship award.\n- All information shared is kept strictly confidential.\n- Two revision rounds per essay are included; further rounds are\n  charged separately.\n- If we don\'t hear from you for 3 business days, the essay is treated\n  as final.\n', '[\"cv\",\"leadership_and_influence_essay_draft\",\"networking_essay_draft\",\"studying_in_the_uk_essay_draft\",\"career_plan_essay_draft\",\"university_and_course_choices\",\"academic_transcript\"]', 300.00, 'USD', NULL, '2026-10-06', NULL, 1, 1, '2026-08-06 14:18:49', '2026-08-06 17:36:43'),
(8, 'Global Korea Scholarship Review — All Levels', 'global-korea-scholarship-review-all-levels-FxMq', 'South Korea', '[\"undergraduate\",\"masters\",\"phd\"]', 'GKS covers tuition, a monthly allowance, airfare, medical insurance and a full year of Korean language training, at undergraduate through doctoral level. Applications run through either the embassy track or the university track, and choosing the right one materially affects your odds.\n- Personal statement and study plan reviewed as a matched pair\n- Embassy versus university track strategy advice for your profile\n- Recommendation letter guidance for your referees', '[\"passport\",\"transcript\",\"recommendation_letter\",\"personal_statement\",\"study_plan\"]', 300.00, 'USD', NULL, '2027-02-28', NULL, 1, 0, '2026-08-06 15:47:22', '2026-08-06 15:47:22'),
(9, 'MEXT Scholarship Application Review', 'mext-scholarship-application-review-YgwJ', 'Japan', '[\"masters\",\"undergraduate\",\"phd\"]', 'MEXT funds undergraduate, Master\'s and doctoral study in Japan with full tuition, a monthly stipend, flights and preparatory Japanese language training. African applicants normally apply through the embassy track, which includes written examinations and an interview.\nThe research plan is the decisive document.\n- Field of study and research plan reviewed for the MEXT format\n- University and prospective supervisor shortlist reviewed\n- Supervisor contact emails drafted and reviewed\n- Interview and written exam preparation guidance', '[\"cv\",\"field_of_study_and_research_plan\",\"academic_transcripts\",\"degree_certificates\",\"recommendation_letters\",\"medical_certificate\",\"passport_copy\"]', 300.00, 'USD', NULL, '2027-05-15', NULL, 1, 0, '2026-08-06 15:50:49', '2026-08-06 15:50:49'),
(10, 'Turkiye Burslari Scholarship Review — All Levels', 'turkiye-burslari-scholarship-review-all-levels-nA4t', 'Turkey', '[\"undergraduate\",\"masters\",\"phd\"]', 'Turkiye Burslari is one of the most accessible fully funded scholarships or African students, covering tuition, monthly stipend, accommodation, health insurance, flights and a year of Turkish language training. It runs a single annual application for all levels, with a strong interview stage for shortlisted candidates.\n\n- Letter of intent reviewed for each of your university preferences\n- University and programme preference strategy reviewed\n- Research proposal reviewed (PhD)\n- Interview preparation notes based on your submitted application', '[\"cv\",\"letter_of_intent\",\"academic_transcripts\",\"national_exam_results\",\"passport_copy\",\"reference_letters\",\"research_proposal_phd_applicants\"]', 300.00, 'USD', NULL, '2027-02-20', NULL, 1, 1, '2026-08-06 15:53:16', '2026-08-06 17:37:49'),
(11, 'Chinese Government Scholarship Review — All Levels', 'chinese-government-scholarship-review-all-levels-lbRt', 'China', '[\"undergraduate\",\"masters\",\"phd\"]', 'The Chinese Government Scholarship funds undergraduate, Master\'s and\ndoctoral study at Chinese universities, covering tuition, accommodation, a monthly stipend and medical insurance. It is available to African applicants through embassy channels, university direct application and the Chinese University Programme. Application volume is high and documentation requirements are exacting.\n\n- Study plan reviewed and expanded to the required length by level\n  (undergraduate 200 words, Master\'s 500, PhD 800+)\n- Research proposal reviewed for supervisor and lab fit (PhD)\n- Full document checklist audit - incomplete files are rejected outright\n- Recommendation letter guidance for your referees', '[\"cv\",\"study_plan_or_research_proposal\",\"academic_transcripts\",\"two_recommendation_letters\",\"physical_examination_form\",\"passport_copy\",\"hsk_or_english_proficiency_certificate\"]', 300.00, 'USD', NULL, '2027-04-30', NULL, 1, 0, '2026-08-06 15:57:22', '2026-08-06 15:57:22'),
(12, 'Australia Awards Application Review', 'australia-awards-application-review-FaEU', 'Australia', '[\"undergraduate\",\"masters\",\"phd\"]', 'Australia Awards are long-term development scholarships funded by the Australian Government, with dedicated rounds for eligible African countries. They cover tuition, travel, a living allowance, health cover and an introductory academic programme.The core assessment is development impact - what you will change at home on return.\n- Development impact statement reviewed against DFAT priorities\n- Work experience mapped to your country\'s eligible sectors\n- Reintegration plan reviewed, which many applicants underestimate\n- CV aligned to Australia Awards format\n', '[\"cv\",\"development_impact_statement\",\"academic_transcripts\",\"work_experience_evidence\",\"referee_details\",\"ielts_score_report\"]', 300.00, 'USD', NULL, '2027-04-30', NULL, 1, 0, '2026-08-06 16:00:58', '2026-08-06 16:00:58'),
(13, 'Vanier Canada Graduate Scholarships (PhD)', 'vanier-canada-graduate-scholarships-phd-wIsx', 'Canada', '[\"phd\"]', 'Vanier awards CAD 50,000 per year for three years to doctoral students at Canadian universities. It is judged on three equal pillars: academic excellence, research potential, and leadership. You must be nominated by a Canadian university, so securing supervisor support comes first.\n- Research proposal reviewed for significance, methodology and feasibility\n- Leadership statement reviewed against Vanier\'s specific definition\n- Supervisor outreach emails drafted and reviewed\n- Publications and academic CV formatted to Canadian conventions', '[\"cv\",\"research_proposal\",\"leadership_statement\",\"academic_transcripts\",\"publications_list\",\"supervisor_correspondence\",\"referee_details\"]', 500.00, 'USD', NULL, '2026-10-01', NULL, 1, 0, '2026-08-06 16:03:41', '2026-08-06 16:03:41'),
(14, 'DAAD Scholarship Application Review — Germany', 'daad-scholarship-application-review-germany-SLdY', 'Germany', '[\"masters\",\"phd\"]', 'DAAD funds Master\'s and doctoral study in Germany through its EPOS programme and university-specific awards, covering a monthly stipend, travel, health insurance and often a German language course. Many DAAD courses are development-focused and require two years of relevant professional experience - a detail that catches applicants out.\n- Motivation letter reviewed against your chosen DAAD course\'s stated aims\n- Research proposal reviewed for methodology and supervisor fit (PhD)\n- CV converted to the DAAD-required format, which is strict\n- Work experience documentation reviewed against the two-year requirement', '[\"cv_in_europass_or_daad_format\",\"motivation_letter\",\"research_proposal_phd_applicants\",\"academic_transcripts\",\"work_certificates\",\"referee_letters\",\"language_certificate\"]', 300.00, 'USD', NULL, '2026-10-31', NULL, 1, 0, '2026-08-06 16:06:13', '2026-08-06 16:06:13'),
(15, 'Mastercard Foundation Scholars Application Review', 'mastercard-foundation-scholars-application-review-q8Nz', 'USA', '[\"undergraduate\",\"masters\"]', 'The Mastercard Foundation Scholars Program funds academically talented young Africans facing financial barriers, at partner universities across Africa, North America and Europe. It covers tuition, accommodation, books, travel and a stipend, and places heavy emphasis on giving back to your community. Each partner university applies its own process and timeline.\nWHAT YOU GET!!\n- A full review of your motivation or personal essay, up to 500 words,\n  built around the give-back commitment at the programme\'s centre\n- A full review of your leadership and community service statement,\n  turned into evidence rather than a list of titles\n- A full review of one university statement of purpose', '[\"cv\",\"motivation_or_personal_essay\",\"leadership_and_community_service_record\",\"academic_transcripts\",\"proof_of_financial_need\",\"referee_details\"]', 300.00, 'USD', 25, '2026-09-27', NULL, 1, 0, '2026-08-06 16:08:55', '2026-09-15 09:17:38'),
(16, 'Fulbright Foreign Student Application Review — USA', 'fulbright-foreign-student-application-review-usa-wB8z', 'USA', '[\"masters\",\"phd\"]', 'Fulbright is the US government\'s flagship exchange programme, funding Master\'s and doctoral study with tuition, living stipend, airfare and health cover. Each African country runs its own competition through the US Embassy, with its own deadline and priority fields. Selection balances academic merit with cultural exchange potential and intent to return home.\nWHAT YOU GET\n- A full review of your Study Objective essay, up to 1 page\n- A full review of your Personal Statement, up to 1 page\n- A full review of one university statement of purpose\n- Both essays checked for the return-home commitment panels look for\n- Your CV reformatted to US academic conventions\n- Interview preparation notes drawn from your own submitted answers', '[\"cv\",\"study_objective_essay\",\"personal_statement\",\"academic_transcripts\",\"referee_details\",\"toefl_or_ielts_score_report\"]', 350.00, 'USD', 15, '2027-03-20', NULL, 1, 0, '2026-08-06 16:14:12', '2026-08-06 16:31:08'),
(17, 'Gates Cambridge Scholarship Review', 'gates-cambridge-scholarship-review-RRxY', 'United Kingdom', '[\"masters\",\"phd\"]', 'Gates Cambridge funds outstanding postgraduate applicants from outside the UK to study at Cambridge, covering the full cost of study plus a maintenance allowance. Selection weighs academic excellence alongside a clear commitment to improving the lives of others - the social impact element is not optional.\nWHAT YOU GET\n- A full review of your Gates Cambridge statement, up to 3,000characters, against all four selection criteria\n- A full review of your research proposal, up to 500 words (PhD)\n- A full review of your Cambridge course statement of purpose\n- Your academic CV restructured to Cambridge conventions\n- Interview preparation notes drawn from your submitted material', '[\"cv\",\"gates_cambridge_statement\",\"research_proposal_phd_applicants\",\"academic_transcripts\",\"cambridge_course_choice\",\"referee_details\"]', 400.00, 'USD', 15, '2026-12-01', NULL, 1, 0, '2026-08-06 16:29:47', '2026-08-06 16:29:47'),
(18, 'Mastercard Foundation Scholars Application Review', 'mastercard-foundation-scholars-application-review-E32D', 'CANADA', '[\"masters\",\"undergraduate\",\"phd\"]', 'The Mastercard Foundation Scholars Program funds academically talented\nyoung Africans facing financial barriers, at partner universities across Africa, North America and Europe. It covers tuition, accommodation, books, travel and a stipend, and places heavy emphasis on giving back to your community. Each partner university applies its own process and timeline.\nWHAT YOU GET!!\n- A full review of your motivation or personal essay, up to 500 words,\n  built around the give-back commitment at the programme\'s centre\n- A full review of your leadership and community service statement,\n  turned into evidence rather than a list of titles\n- A full review of one university statement of purpose\n- Your financial need statement checked for clarity and completeness\n- Partner university selection reviewed against your profile', '[\"cv\",\"motivation_or_personal_essay\",\"leadership_and_community_service_record\",\"academic_transcripts\",\"proof_of_financial_need\",\"referee_details\"]', 300.00, 'USD', 25, '2026-08-30', NULL, 1, 0, '2026-08-06 16:34:35', '2026-08-06 16:34:35'),
(19, 'Rhodes Scholarship Application Review — Oxford', 'rhodes-scholarship-application-review-oxford-5e0E', 'United Kingdom', '[\"masters\",\"phd\"]', 'Rhodes is a fully funded postgraduate scholarship to the University of Oxford, covering all fees and a generous stipend. It runs dedicated constituencies for Southern Africa, West Africa, East Africa and Zimbabwe, alongside the Global constituency. Selection is exceptionally competitive and centres on character, leadership and commitment to service.\nWHAT YOU GET!!\n- Personal statement (approx. 1,000 words) reviewed line by line\n- Activities and leadership record shaped into a coherent narrative\n- Oxford course selection reviewed for fit and competitiveness\n- Interview preparation notes based on your submitted material', '[\"cv\",\"personal_statement\",\"academic_transcripts\",\"list_of_activities_and_leadership_roles\",\"referee_list\",\"proposed_oxford_course\"]', 400.00, 'USD', 10, '2026-07-31', NULL, 1, 0, '2026-08-06 16:38:05', '2026-08-06 16:38:05'),
(20, 'Commonwealth Scholarship Application Review — UK Masters & PhD', 'commonwealth-scholarship-application-review-uk-masters-phd-hNJ0', 'United Kingdom', '[\"masters\",\"phd\"]', 'Commonwealth Scholarships are funded by the UK\'s Foreign, Commonwealth & Development Office for candidates from low- and middle-income Commonwealth countries, including most of Africa. They cover tuition, airfare, a monthly stipend and thesis grants. Applications are judged heavily on development impact - how your study will benefit your home country.\nWHAT YOU GET !!\n- A full review of your Development Impact essay, up to 650 words\n- A full review of your Proposed Study in the UK essay, up to 425 words\n- A full review of your Career Plan essay, up to 750 words\n- A full review of your Personal Statement, up to 500 words\n- A full review of your Voluntary and Leadership Experience essay, up\n  to 500 words\n- A full review of one university statement of purpose\n- Your CV aligned to the Commonwealth selection criteria\n- Guidance on approaching referees and what to brief them on\n**Note: ** Most African applicants must apply through a national nominating agency, not directly', '[\"cv\",\"personal_statement\",\"academic_transcripts\",\"list_of_activities_and_leadership_roles\",\"referee_list\",\"proposed_oxford_course\"]', 450.00, 'USD', 10, '2026-12-15', NULL, 1, 0, '2026-08-06 16:40:51', '2026-08-06 16:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('16PB2Xli70Y3ZCe4uncCPX4xkcots8X6uOgV2hvl', NULL, '52.167.144.231', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3E2Zkk4TG5HOGxGaG56T2FLdUF4MWFyOURvVDI4RjJqbFBDY3lXOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vd3d3LmVkdS10b3Vycy5jb20vYmxvZy9wcm9zLW9mLXN0dWR5aW5nLWFicm9hZCI7czo1OiJyb3V0ZSI7czo5OiJibG9nLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1789920604),
('1UuXan0wDnGRLptpNL9xpSJZsWo2soilETjKBPr8', NULL, '102.86.22.123', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_6_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/153.0.8010.24 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTm9qYWdJbjMyTlR0Q2FlUjZITFhLaE9peElPWEhOOWtMWElNRUhXVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789907196),
('2Yotj2ayp8YOT5Q1wyNQHD5CkEtZsjMbDo6KpNh1', NULL, '5.250.181.113', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHoxVXVmNVpUallwSUZxeTY1cHNNeW8yUEhPSEdOYVVTaW05T3FEcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789902722),
('aEztreS0PHXH1cOkMzpFdh3gFUp8cAnEQwKWxJRH', NULL, '102.86.22.123', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_6_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/153.0.8010.24 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRERiM3JtbzRJZlRHS3VjckFUWlFFSEpqZE9idm9PU3A5ZVNENExEeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789907196),
('aIMBhsAlxIWxGDRWzPzCp7hw3v75ifsmvnNZud5R', NULL, '102.86.22.123', 'Mozilla/5.0 (iPhone; CPU iPhone OS 26_6_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/153.0.8010.24 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzRUa2tIdGFOejlPVnpJWkt2TWxxNGVLckZHVnZ3ODgyUTFDd0V1aSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789910647),
('DS9RuvTf5rf3DPuQMapNp6nGgSnghZTwz4eBr59i', NULL, '44.211.128.8', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1478.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGxaR0tHaTFlNmJJNnNKVHpJYVVaakFaZ3YzenBrS0FYMTk3bUlkOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789916980),
('E0ZOdgHMu1NS4cmYxW9Kwpj1fHZRbXUkrCph3x4F', NULL, '66.249.75.163', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.8010.47 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFdMTzNaMUxuVGV3TUlXQ2NVQXZnWjF1R3VWU21SNmZWVzIzc1dJciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTQ6Imh0dHBzOi8vd3d3LmVkdS10b3Vycy5jb20vc2Nob2xhcnNoaXBzL2NoZXZlbmluZy1zY2hvbGFyc2hpcC1lc3NheS1yZXZpZXctdWstZnVsbHktZnVuZGVkLUlEWWMiO3M6NToicm91dGUiO3M6MTc6InNjaG9sYXJzaGlwcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789918363),
('frzRVFV0sX2zKd14xggBXoWC9eUoo1s4NBm0PPd2', NULL, '2409:40c4:177:a43:744b:b025:b9fb:6af5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGRUWEtyekhmTldIczNYbjBZdnQ1NWVRand6WkJoSTZjNEtNTUhwVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789903168),
('HH78KcoTdj7behL5x8qJNBWz5kHOt7yeWe4q03a0', 1, '102.86.22.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRUd2bW5SVzd1T1diTVE5TzZya1ROcDd5dFR3Y3VmY3ZCQjZCT2IzRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbS9hZG1pbi9hcHBsaWNhdGlvbnMvMSI7czo1OiJyb3V0ZSI7czoyMzoiYWRtaW4uYXBwbGljYXRpb25zLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1789912465),
('iErEGRSvew44ab3Ud7TfkzVhVOztdRQGQFEdSir8', NULL, '102.86.22.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXV4TE5zSlBoZFhIejlIR2lVZ2NTdkd3UUhGeWlhcUZRUFVnOW1DbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789909812),
('p10AZ087T3wHy2PapZxNeeeeTgQ8msl6GqRXGlnA', NULL, '220.181.108.92', 'Mozilla/5.0 (Linux;u;Android 4.2.2;zh-cn;) AppleWebKit/534.46 (KHTML,like Gecko) Version/5.1 Mobile Safari/10600.6.3 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlp6MEYxcWo4OEw1U2sxaUE0ZlFLS2lheXdnTXJwNnQ4MVpaMzgxcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789910180),
('qBqe1MQjoACjjjerNnDSX10g1L3dovaEcuifJPrV', NULL, '2001:41d0:801:2000::4ec4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVVnNURoWDlDM2t0S3BNOUdhYUFKbGRXUVhRVWVBOXczNGkyWGVqSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LmVkdS10b3Vycy5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1789918758),
('RGJRbpoFZvWfiDNdGyBSdpfqT0tLwWPn3zrFSNG3', NULL, '102.86.22.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWRsRTNLSWVCNXJDemFwSGtlRDR2MWlWU3ZmVlFDMXFmaVF6dmhmcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789909662),
('rSNv7K7rS3fhvZ5bVdv3QoUPkKav0BcWyrnOk8gd', NULL, '2001:41d0:801:2000::4ec4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFJTMERoYmQzaGRVSmlJYU1ncjdCVGJPNDFEYWFCa2Fab1lnTllqOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vd3d3LmVkdS10b3Vycy5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1789918758),
('uDMjVxMx8IAWpuUYwQKqWU3aBvYxM0dCsiXdCiDW', 6, '102.86.22.123', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieTIxeUNWT3pTUHNnZzVxeHQxZlMwczNLYmg0MlN3RGtpUUU2VWsxVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbS9zdHVkZW50L2FwcGxpY2F0aW9ucy8xIjtzOjU6InJvdXRlIjtzOjI1OiJzdHVkZW50LmFwcGxpY2F0aW9ucy5zaG93Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Njt9', 1789912478),
('UyqJiEfKLYPyLSd57ywbVtOxIZXLvoRsWYB09IW3', NULL, '198.244.240.111', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWNVOGpBR2hVMkN2ZHh6UEE5bVlDUzF1MXo3NlVxWFNsdXAxRGhCQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vd3d3LmVkdS10b3Vycy5jb20vcmVnaXN0ZXIvYWdlbnQiO3M6NToicm91dGUiO3M6MTQ6InJlZ2lzdGVyLmFnZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789911739),
('WmkPp5oFiK8PsK8uNlj1S2x4Iq7Mm2L717Se0oCd', NULL, '198.244.183.201', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXJwWWk4anNQYThFaGtYZkdSa1YyS1BKVVYzVjBMWFpLd041QTJRciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vd3d3LmVkdS10b3Vycy5jb20vYmxvZy9wcm9zLW9mLXN0dWR5aW5nLWFicm9hZCI7czo1OiJyb3V0ZSI7czo5OiJibG9nLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1789905080),
('Xdcl78ieYmyWMk1JM6QBE0BpSlv6Rv89V4O5d7SW', NULL, '220.181.108.81', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVlpNVVuRm5DUHVPbGIwbUJNVjQ3eDB0RUFFNkJPS2FlMDMxQkhScyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789910811),
('YrPqv3WFlDlwAaG3erXjJhSyrz3SLhTPAXaMJyRi', NULL, '102.86.22.123', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUZ2RHYzQWtEVWd3V3R4UElaRDVGSW5aejM5cmprVEZ1dmVrdW1qcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789907210),
('z3fEsk47muJsGsBx9uMuEYPoBDqFpRvI2Uwm7TZI', NULL, '9.129.54.216', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko); compatible; ChatGPT-User/1.0; +https://openai.com/bot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzJ0ajhwOWl3MVVOa2k2ejhydnF6SFRKNnBLVTNpdXplTUM2amgwTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789916783),
('ZJuYqBZ0h7yUPuGTeY0IKx6AX7gtXlnIk5TULYfy', NULL, '2001:41d0:801:2000::4ec4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:101.0) Gecko/20100101 Firefox/101.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkc4QlA4alJ1d054amRFTlBEcjJXa3ZpVkNQWlRMbHZYMkkwdGxVZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789918758),
('zmhwtRPhg9jclkN5GaOtuH5HRpUNT8JckCeea99G', NULL, '2001:41d0:801:2000::4ec4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGl0N09pUHdRS1BzTkh5R3FiR2R1TVdmSHppeTlhc0lvNU5TNFdUYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vZWR1LXRvdXJzLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789918758);

-- --------------------------------------------------------

--
-- Table structure for table `student_profiles`
--

CREATE TABLE `student_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `nationality` varchar(191) DEFAULT NULL,
  `passport_number` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `guardian_phone` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_profiles`
--

INSERT INTO `student_profiles` (`id`, `user_id`, `date_of_birth`, `gender`, `nationality`, `passport_number`, `phone`, `address`, `guardian_name`, `guardian_phone`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, NULL, 'Nigerian', NULL, '+2348000000000', NULL, NULL, NULL, '2026-07-31 12:29:03', '2026-07-31 12:29:03'),
(2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26 12:09:16', '2026-08-26 12:09:16'),
(3, 6, '2001-10-01', 'female', 'UGANDAN', 'B0152498', '0778752025', 'KAMPALA', NULL, NULL, '2026-09-20 13:48:03', '2026-09-20 13:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'open',
  `priority` varchar(191) NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `program` varchar(191) NOT NULL,
  `place` varchar(191) NOT NULL,
  `flags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`flags`)),
  `quote` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `program`, `place`, `flags`, `quote`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nagawa Vicky', 'Master\'s, Tourism & Hospitality', 'Galgotias University, India', '[\"in\"]', 'Thanks to Edu-Tours that made my journey to India easy. Their dedicated support and expert guidance helped me secure an admission and settle smoothly. I\'m now living my academic dream.', 'vicky.jpeg', 0, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(2, 'Turyomugyendo Vicent', 'Master\'s, Mathematics', 'Marwadi University, India', '[\"in\"]', 'Edu-Tours changed my life! Their team helped me land a partial scholarship to pursue my Master\'s in India. If you are thinking of studying abroad, look no further.', 'TV.png', 1, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(3, 'Kirabo Mellisa', 'Bachelor\'s, Architecture', 'North China University of Technology, Beijing', '[\"cn\"]', 'I\'m forever grateful to Edu-Tours for helping me secure a partial scholarship for my Bachelor\'s in China. I\'m now on a path to achieving my career goals!', 'mellisa.png', 2, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(4, 'Stuart Philimon', 'Diploma, ICT → Master\'s, Polymer Engineering', 'Marwadi University, India → Chonnam National University, South Korea', '[\"in\", \"kr\"]', 'Edu-Tours opened doors I never thought possible — from securing my admission in India to advancing my education in South Korea. Their team supported me at every stage: applications, visas, and travel.', 'philly.png', 3, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(5, 'Semakula Oscar', 'Bachelor\'s, Pharmacy', 'R.K University, India', '[\"in\"]', 'Edu-Tours played a big role in helping me start my academic journey in India, from university admission to travel support. I\'m now pursuing my dream course in Pharmacy with confidence.', 'oscar.png', 4, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(6, 'Atwiine Julian', 'Master\'s, Development Economics', 'Université Clermont Auvergne, France', '[\"fr\"]', 'With Edu-Tours\'s help, I got a fully funded scholarship and full travel support to study in France. They made my dream a reality!', 'julian.png', 5, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(7, 'Nankya Edith Racheal', 'Master\'s, Computer Science', 'Arizona State University, USA', '[\"us\"]', NULL, 'racheal.png', 6, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(8, 'Isreal Victor Okwaput', 'Bachelor\'s, Law', 'Marwadi University, India', '[\"in\"]', NULL, 'victor.png', 7, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(9, 'Kimuli Peter', 'Master\'s, Economics', 'North China University of Technology, China', '[\"cn\"]', NULL, 'kimuli.png', 8, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27'),
(10, 'Ageno Prossy', 'Master\'s, Finance', 'University of Ottawa, Canada', '[\"ca\"]', NULL, 'prossy.jpeg', 9, 1, '2026-08-03 12:07:27', '2026-08-03 12:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Platform Admin', 'admin@scholarship.test', '2026-07-31 12:29:01', '$2y$12$q.d7rSl0/WCp2JFf3keIA.qkmh.vliqXsNXO/4FtUNkzPzFBVgkVm', 'active', 'SljnpOZffCVsJrdQ3b1A6yOIagr5Efznv16MoxaCwefFfJwCAMQhK1lBMNCc', '2026-07-31 12:29:01', '2026-08-02 09:07:44'),
(2, 'Demo Agent', 'agent@scholarship.test', '2026-07-31 12:29:02', '$2y$12$9EXl.8bg2qWhZBhvrCq/EuwokcCIOdyHZ5/j4Q1vnFD0SgiMOA76m', 'active', '98FFSkarUWxZvNUiXnKyZBaIfREUQDuEESiPgjOyl1GPhfFQES6FNBNGBp8k', '2026-07-31 12:29:02', '2026-07-31 12:29:02'),
(3, 'Demo Student', 'student@scholarship.test', '2026-07-31 12:29:03', '$2y$12$rAPqVcV5i1NaqUZPC8PR5.MrL134i01Ieq2T0xF4KSiBLSdA91X4a', 'active', 'ycyV6pwadpN1Jcz3jn2li2iJZT2WZjhlp4CH7P1gLDlDlrlwNAZTWFZSX8vU', '2026-07-31 12:29:03', '2026-07-31 12:29:03'),
(4, 'Anthony Kizito', 'joshuaedutours@gmail.com', NULL, '$2y$12$i58dqyYH0xyELR2RZc1nJONJukGz.gTgAvOfEJp1gqtJJoQGgA85u', 'active', NULL, '2026-08-26 12:09:16', '2026-08-26 12:09:16'),
(5, 'wVztnwvvNiPMmyuhfyPAHu', 'fu.luv.e.g.i.b.e.15.4@gmail.com', NULL, '$2y$12$qgzYz.2zCgk0C8mumo9DouxvxqmoDCOl94dYIiWax42oRvXNIL0Na', 'active', NULL, '2026-09-01 00:01:35', '2026-09-01 00:02:14'),
(6, 'NAVUBYA JESCA', 'navubyajesca2001@gmail.com', NULL, '$2y$12$KiaroGq5Iu7uKR2HnGT3T.6UwIEAjPr4ufp1j0/kZoiyqmGdH8/Ya', 'active', NULL, '2026-09-20 13:48:03', '2026-09-20 13:48:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_profiles`
--
ALTER TABLE `agent_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agent_profiles_user_id_unique` (`user_id`),
  ADD UNIQUE KEY `agent_profiles_referral_code_unique` (`referral_code`),
  ADD KEY `agent_profiles_commission_tier_id_foreign` (`commission_tier_id`),
  ADD KEY `agent_profiles_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_student_id_foreign` (`student_id`),
  ADD KEY `applications_package_id_foreign` (`package_id`),
  ADD KEY `applications_agent_id_foreign` (`agent_id`),
  ADD KEY `applications_reviewed_by_foreign` (`reviewed_by`);

--
-- Indexes for table `application_documents`
--
ALTER TABLE `application_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_documents_application_id_foreign` (`application_id`),
  ADD KEY `application_documents_verified_by_foreign` (`verified_by`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatbot_logs_session_id_index` (`session_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commissions_agent_id_foreign` (`agent_id`),
  ADD KEY `commissions_application_id_foreign` (`application_id`);

--
-- Indexes for table `commission_tiers`
--
ALTER TABLE `commission_tiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultation_bookings`
--
ALTER TABLE `consultation_bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `consultation_bookings_reference_unique` (`reference`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gallery_events`
--
ALTER TABLE `gallery_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_event_images`
--
ALTER TABLE `gallery_event_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_event_images_gallery_event_id_foreign` (`gallery_event_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_application_id_foreign` (`application_id`),
  ADD KEY `payments_student_id_foreign` (`student_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `scholarship_packages`
--
ALTER TABLE `scholarship_packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `scholarship_packages_slug_unique` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_profiles_user_id_unique` (`user_id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_messages_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent_profiles`
--
ALTER TABLE `agent_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `application_documents`
--
ALTER TABLE `application_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_tiers`
--
ALTER TABLE `commission_tiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `consultation_bookings`
--
ALTER TABLE `consultation_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_events`
--
ALTER TABLE `gallery_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery_event_images`
--
ALTER TABLE `gallery_event_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scholarship_packages`
--
ALTER TABLE `scholarship_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student_profiles`
--
ALTER TABLE `student_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_profiles`
--
ALTER TABLE `agent_profiles`
  ADD CONSTRAINT `agent_profiles_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `agent_profiles_commission_tier_id_foreign` FOREIGN KEY (`commission_tier_id`) REFERENCES `commission_tiers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `agent_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `applications_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `scholarship_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `applications_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `application_documents`
--
ALTER TABLE `application_documents`
  ADD CONSTRAINT `application_documents_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `application_documents_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commissions_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_event_images`
--
ALTER TABLE `gallery_event_images`
  ADD CONSTRAINT `gallery_event_images_gallery_event_id_foreign` FOREIGN KEY (`gallery_event_id`) REFERENCES `gallery_events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD CONSTRAINT `student_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD CONSTRAINT `support_messages_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
