import 'package:flutter/material.dart';

class ProfileData {
  static const String name = 'Omayma Ittaqi';

  static const List<String> taglines = [
    'Crafting high-quality Flutter apps with precision',
    'Turning UI/UX visions into seamless mobile experiences',
    'Building scalable, user-focused digital products',
    'Passionate about performance and clean architecture',
  ];

  static const String location = 'Laayoune, Morocco';
  static const String phone = '+212 641808195';
  static const String email = 'omaymaittaqi@gmail.com';

  // Social links
  static const String linkedin = 'https://www.linkedin.com/in/omayma-ittaqi/';
  static const String github = 'https://github.com/omaymaitta';
  static const String gitlab = 'https://gitlab.com/omaymaitta';
  static const String MyBookshelfRepo =
      'https://github.com/omaymaitta/BibliothequeNumerique';

  static const String profileSummary =
      'Motivated developer passionate about Flutter, building user-centered, high-quality applications. Eager to contribute to innovative, impact-driven products.';

  // ===================== EXPERIENCE =====================
  static const experiences = [
    Experience(
      title: 'Full Stack Developer',
      org: 'Technology & Telecom',
      location: 'Safi, Morocco · Remote',
      start: '09/2023',
      end: 'Present', // still working
      bullets: [
        'Developed and maintained cross-platform applications (Web, Android, iOS) using Flutter/Dart.',
        'Designed, optimized, and continuously improved responsive web interfaces (HTML, CSS, JavaScript, PHP) in production, including bug fixes and new feature development.',
        'Integrated REST APIs and Firebase (Auth and Cloud Messaging) with push notifications, error reporting, and offline caching.',
        'Actively contributed to the full development cycle: requirements analysis, design, coding, testing, and deployment.',
        'Collaborated within an Agile team and used Git/GitHub daily for version control.',
      ],
        icon: ''
    ),

    // Existing experience
    Experience(
      title: 'Flutter App Developer - End of studies internship',
      org: 'Technology & Telecom',
      location: 'Safi, Morocco · Remote',
      start: '03/2023',
      end: '08/2023',
      bullets: [
        'Designed and developed a cross-platform mobile and web application for real-time prediction of public transport schedules using Flutter/Dart for the frontend and Node.js/Express for the backend.',
        'Integrated Google Maps APIs to provide dynamic route visualization, stop locations, and live vehicle tracking.',
        'Implemented internationalization i18n to support multiple languages, ensuring a localized experience for a diverse user base.',
        'Added offline caching and graceful retry mechanisms to ensure smooth user experience under poor or intermittent network connectivity.',
        'Created RESTful API and developed comprehensive documentation with Swagger/OpenAPI.',
        'Followed clean architecture and modular design principles to make the codebase scalable, maintainable, and easy to extend.',
      ],
        icon: ''
    ),
    Experience(
      title: 'Backend & DevOps Intern - Internship',
      org: 'OCP Group',
      location: 'Laayoune, Morocco · Remote',
      start: '07/2022',
      end: '08/2022',
      bullets: [
        'Developed a web-based administration and management platform using Python/Django.',
        'Implemented network automation workflows using Ansible, automating configuration and deployment of network devices and services to reduce manual errors.',
        'Built a role-based access control system to manage permissions and enhance platform security.',
        'Developed automated deployment scripts and Ansible playbooks to streamline environment setup and server provisioning.'
      ],
      icon: ''
    ),
    Experience(
      title: 'Java Developer Intern - Internship',
      org: 'Regional Direction of H.C.P',
      location: 'Laayoune, Morocco',
      start: '07/2021',
      end: '07/2021',
      bullets: [
        'Developed a desktop application in JavaFX to manage and track building permit requests within the region.',
        'Designed a relational database schema using MySQL to store permit applications, applicant data, and approval statuses.',
        'Implemented features for creating, updating, approving, and archiving permit records, streamlining administrative workflows.',
        'Added statistical analysis and data visualization modules to generate insights on submitted permits'
      ],
        icon: ''
    ),
    Experience(
      title: 'Web Developer Intern - Internship',
      org: 'Higher school of technology',
      location: 'Laayoune, Morocco',
      start: '07/2020',
      end: '07/2020',
      bullets: [
        'Designed and developed a web site for linear regression analysis using HTML, CSS, PHP and JavaScript, with R integration for performing advanced statistical computations.',
        'Implemented a data input system allowing users to either manually enter data directly on the website or upload datasets in Excel or CSV format.',
        'Built a dynamic visualization module to display regression results.'
      ],
        icon: ''
    ),
    Experience(
      title: 'Web Developer Intern - Internship',
      org: 'Urban Agency',
      location: 'Laayoune, Morocco',
      start: '07/2019',
      end: '07/2019',
      bullets: [
        'Designed and developed a web site for linear regression analysis using HTML, CSS, PHP and JavaScript, with R integration for performing advanced statistical computations.',
        'Implemented a data input system allowing users to either manually enter data directly on the website or upload datasets in Excel or CSV format.',
        'Built a dynamic visualization module to display regression results.'
      ],
        icon: ''
    ),
  ];

  // ===================== PROJECTS =====================
  static const projects = [
    Project(
      name: 'My BookShelf',
      role: 'Semester Project',
      date: '06/2022',
      summary:
      'An Android application to help users organize and read their digital books and documents with ease.',
      link: 'https://github.com/omaymaitta/BibliothequeNumerique',
      image: 'lib/assets/projects/MyBookShelf.jpg',
    ),
    Project(
      name: 'Simple Weather App',
      role: 'Personal Project',
      date: '05/2022',
      summary:
      'A lightweight Android application to display weather information for any city.',
      link: 'https://github.com/omaymaitta/MeteoAPI',
      image: 'lib/assets/projects/meteo-logo.png',
    ),
    Project(
      name: 'Backend Web Application',
      role: 'Internship Project at OCP Group',
      date: '07/2022 - 08/2022',
      summary: 'Web-based administration and management platform to automate network operations (Python/Django).',
      link: 'https://github.com/omaymaitta/OcpNetworkApp',
      image: 'lib/assets/projects/OCP-logo.png',
    ),
    Project(
      name: 'LS-Agency - Car Rental Management System',
      role: 'Professional Project',
      date: '2023 - 2025',
      summary: 'Mobile application built with Flutter to manage clients, vehicles, reservations, invoices, payments, refunds, and financial operations',
      link: 'https://play.google.com/store/apps/details?id=ma.tt.locasmart.lsagency&pcampaignid=web_share',
      image: 'lib/assets/projects/lsAgency.png',
    ),
  ];

  // ===================== EDUCATION =====================
  static const education = [
    Education(
      program: 'Engineering Degree in Software Engineering and Distributed Computer Systems',
      place: 'Higher Teacher Training University for Technical Education',
      location: 'Mohammedia, Morocco',
      endDate: '2023',
    ),
    Education(
      program: 'University Diploma in Computer Science',
      place: 'Higher school of technology',
      location: 'Laayoune, Morocco',
      endDate: '2020',
    )
  ];

  // ===================== COURSES =====================
  static const courses = [
    Course(
      title: 'title',
      provider: 'Provider',
      date: '01/2025',
      image: 'lib/assets/courses/img.png',
    )
  ];

  // ===================== CERTIFICATES =====================
  static const certificates = [
    Certificate(
      title: 'Certificate title',
      provider: 'Provider',
      date: '01/2025',
    ),
  ];

  // ===================== SOFT SKILLS =====================
  static const softSkills = [
    'Problem Solving',
    'Communication',
    'Teamwork',
    'Adaptability',
    'Work Under Pressure',
    'Quick Learner',
  ];

  // ===================== LANGUAGES =====================
  static const languages = [
    Language(name: 'Arabic', level: 5),
    Language(name: 'English', level: 4),
    Language(name: 'Frensh', level: 3),
    Language(name: 'Spanish', level: 2),
  ];
}

// ===================== MODELS =====================
class Experience {
  final String title, org, location, start, end, icon;
  final List<String> bullets;
  const Experience({
    required this.title,
    required this.org,
    required this.location,
    required this.start,
    required this.end,
    required this.bullets,
    required this.icon
  });
}

class Project {
  final String name, role, date, summary;
  final String? link, gitlabLink, image;
  const Project({
    required this.name,
    required this.role,
    required this.date,
    required this.summary,
    this.link,
    this.gitlabLink,
    this.image,
  });
}

class Education {
  final String program, place, location, endDate;
  const Education({
    required this.program,
    required this.place,
    required this.location,
    required this.endDate,
  });
}

class Course {
  final String title, provider, date;
  final String? image;
  const Course({
    required this.title,
    required this.provider,
    required this.date,
    this.image,
  });
}

class Certificate {
  final String title, provider, date;
  const Certificate({
    required this.title,
    required this.provider,
    required this.date,
  });
}

class Language {
  final String name;
  final int level; // 1–>5
  const Language({required this.name, required this.level});
}
