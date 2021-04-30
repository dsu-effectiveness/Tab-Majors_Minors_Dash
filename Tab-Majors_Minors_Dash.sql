SELECT a.term_desc AS term,
       a.student_id AS student_id,
       b.term_start_date,
       a.term_id,
       a.level_id,
       a.student_type_desc AS student_type,
       CASE a.primary_major_college_desc
              WHEN 'Mathematics' THEN 'Coll of Sci, Engr & Tech'
              WHEN '* Natural Sciences' THEN 'Coll of Sci, Engr & Tech'
              WHEN '*Education/Family Studies/PE' THEN 'College of Education'
              WHEN 'Humanities & Social Sciences' THEN 'Coll of Humanities/Soc Sci'
              WHEN 'History/Political Science' THEN 'Coll of Humanities/Soc Sci'
              WHEN 'Computer Information Tech' THEN 'Coll of Sci, Engr & Tech'
              WHEN 'Technologies' THEN 'Coll of Sci, Engr & Tech'
              WHEN 'Nursing' THEN 'College of Health Sciences'
              ELSE a.primary_major_college_desc
              END AS major_college_desc,
       a.primary_major_desc AS major_desc,
       a.primary_program_primary_minor_desc AS minor
  FROM student_term_level a
LEFT JOIN term b
       ON a.term_id = b.term_id
    WHERE a.term_id::INT > 201540
      AND a.is_enrolled = TRUE
      AND a.primary_major_campus_id != 'XXX'

UNION ALL

SELECT a.term_desc AS term,
       a.student_id AS student_id,
       b.term_start_date,
       a.term_id,
       a.level_id,
       a.student_type_desc AS student_type,
       CASE a.secondary_major_college_desc
              WHEN 'Mathematics' THEN 'Coll of Sci, Engr & Tech'
              WHEN '* Natural Sciences' THEN 'Coll of Sci, Engr & Tech'
              WHEN '*Education/Family Studies/PE' THEN 'College of Education'
              WHEN 'Humanities & Social Sciences' THEN 'Coll of Humanities/Soc Sci'
              WHEN 'History/Political Science' THEN 'Coll of Humanities/Soc Sci'
              WHEN 'Computer Information Tech' THEN 'Coll of Sci, Engr & Tech'
              WHEN 'Technologies' THEN 'Coll of Sci, Engr & Tech'
              WHEN 'Nursing' THEN 'College of Health Sciences'
              ELSE a.secondary_major_college_desc
              END AS major_college_desc,
       a.secondary_major_desc AS major_desc,
       NULL AS minor
  FROM student_term_level a
LEFT JOIN term b
       ON a.term_id = b.term_id
    WHERE a.term_id::INT > 201540
      AND a.is_enrolled = TRUE
      AND a.primary_major_campus_id != 'XXX'
      AND a.secondary_major_desc IS NOT NULL
