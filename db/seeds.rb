
activities = Activity.create([{name: 'Pending', description: '',   closed: false},
                              {name: 'Hold',  description: '',     closed: false},
                              {name: 'Cancelled', description: '', closed: true},
                              {name: 'In-Flight', description: '', closed: false},
                              {name: 'Complete', description: '',  closed: false},
                              {name: 'Closed',  description: '',   closed: true}])

# Some bug in the create for booleans in sqlite3
activities[0].update_attribute(:closed, false)
activities[1].update_attribute(:closed, false)
activities[2].update_attribute(:closed, true)
activities[3].update_attribute(:closed, false)
activities[4].update_attribute(:closed, false)
activities[5].update_attribute(:closed, true)

sponsors = Sponsor.create([{initials:'SR'},
                           {initials:'MH'},
                           {initials:'DM'},
                           {initials:'MK'},
                           {initials:'MLF'}
                          ])

eow = Date.today.end_of_week - 2
dt = eow.weeks_ago(4)
endt = dt + 52.weeks

while dt < endt
  ReportPeriod.create({week_ending: dt})
  dt += 7.days
end

statii = Status.create([{name:'good', icon_url: 'good.png', sort_index: 1},
                        {name:'neutral', icon_url: 'neutral.png', sort_index: 2},
                        {name: 'bad', icon_url: 'bad.png', sort_index: 3}
                       ])

depts = Department.create([
                           {name: 'IT'}, {name: 'SID'}, {name: 'MBS'}
                          ])

types = ProjectType.create([{ name: "Moo"}, { name: "Woof!"}])


projects = Project.create([
                           {name:'SIRIS Interim', project_type_id: 1, 
                             activity_id: 4, sponsor_id: 1, department_id: 2},
                           {name:'Vessel KPIs', project_type_id: 2, 
                             activity_id: 5, sponsor_id: 1, department_id: 2},
                           {name:'Autoquotation', project_type_id: 1, 
                             activity_id: 4, sponsor_id: 2, department_id: 3}
                          ])

sr = StatusReport.create([{project_id: 1, highlight: "<ul>\r\n\t<li>Some</li>\r\n\t<li>Highlight</li>\r\n</ul>\r\n", issues_risks: "<ol>\r\n\t<li>Big Risk</li>\r\n\t<li>Little Risk</li>\r\n</...", next_steps: "<ol>\r\n\t<li>Do this, then...</li>\r\n\t<li>Do that</li>...", remarks: "<p>Iggle piggle, iggle onk says</p>\r\n\r\n<blockquote>...", status_id: 1, report_period_id: 1}, 
                          {project_id: 1, highlight: "<ul>\r\n\t<li>Some</li>\r\n\t<li>Highlight</li>\r\n</ul>\r\n", issues_risks: "<ol>\r\n\t<li>Big Risk</li>\r\n\t<li>Little Risk</li>\r\n</...", next_steps: "<ol>\r\n\t<li>Do this, then...</li>\r\n\t<li>Do that</li>...", remarks: "<p>Iggle piggle, iggle onk says</p>\r\n\r\n<blockquote>...", status_id: 2, report_period_id: 2},
                          {project_id: 1, highlight: "<ul>\r\n\t<li>Some</li>\r\n\t<li>Highlight\r\n\t<ul>\r\n\t\t<li>...", issues_risks: "<p><strong>OH NO It&#39;s gone totally <span style=...", next_steps: "<ol>\r\n\t<li>Do this, then...</li>\r\n\t<li>Do that</li>...", remarks: "<p>Iggle piggle, iggle onk says</p>\r\n\r\n<blockquote>...", status_id: 3, report_period_id: 3}
])




#Temp data for SSO testing
s1r = User.create([{ name:'hthngoc', email:'hthngoc@tma.com.vn',
                     password: 'nil', password_confirmation:'nil',
                     role: 'admin'},
                   { name:'pcg', email:'pcg@wallem.com',
                     password: 'nil', password_confirmation:'nil',
                     role: 'admin'} ,
                   { name:'sc', email:'sc@wallem.com',
                     password: 'nil', password_confirmation:'nil',
                     role: 'admin'},
                   { name:'rcwh', email:'rcwh@wallem.com',
                     password: 'nil', password_confirmation:'nil',
                     role: 'pm'},
                   { name:'lorh', email:'lorh@wallem.com',
                     password: 'nil', password_confirmation:'nil',
                     role: 'ro-full'}
                  ])
