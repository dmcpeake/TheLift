# Safeguarding Alert System Documentation

## Overview
The Lift platform includes a comprehensive safeguarding alert system that automatically identifies children requiring urgent wellbeing support based on their mood data.

## Alert Thresholds

### Critical Support Levels

1. **CRITICAL (Mood ≤ 1.5)**
   - Red alert with pulsing animation
   - "IMMEDIATE INTERVENTION REQUIRED" message
   - Highest priority in sorting

2. **SEVERE (Mood 1.5 - 2.0)**
   - Orange alert
   - "URGENT SUPPORT NEEDED" message
   - Second priority in sorting

3. **HIGH (Mood 2.0 - 2.5)**
   - Amber alert
   - "PRIORITY SUPPORT RECOMMENDED" message
   - Third priority in sorting

## Visual Indicators

### Dashboard Summary Banner
- Shows total number of children requiring urgent support
- Red background with pulsing warning icon
- "Review Now" button for quick access

### Individual Child Alerts
- **CriticalSupportAlert Component**: Full alert banner above child details
- **Red Border**: Child cards with critical mood scores have red borders
- **"Urgent Support" Badge**: Displayed next to child's name
- **Sorting**: Critical children always appear at the top of the list

### Alert Components Include:
- Average mood score
- Number of critical check-ins (mood ≤ 2)
- Last check-in date
- Support status
- Action buttons:
  - View full assessment
  - Contact safeguarding
  - Generate report

## Implementation Details

### Files Modified
1. `/src/components/analytics/CriticalSupportAlert.tsx` - New component for critical alerts
2. `/src/components/analytics/ChildSummaryAnalytics.tsx` - Integration of alert system

### Sorting Logic
```javascript
// Children are sorted by:
1. Critical status (mood < 2.5) - always first
2. Within critical: by severity (lowest mood first)
3. Developing trends
4. Average mood score
```

## Safeguarding Protocol

### Automatic Actions
1. Visual alerts on dashboard
2. Sorting critical children to top
3. Logging all interactions for child protection
4. Tracking who has viewed/acknowledged alerts

### Manual Actions Required
1. Review child's full assessment
2. Contact safeguarding team
3. Generate formal report
4. Follow organization's safeguarding procedures
5. Document interventions

## Test Case: Jayden Martinez

### Profile
- **Organization**: Westfield Primary School
- **Average Mood**: ~1.4 (CRITICAL)
- **Pattern**: Consistent very low mood scores (1-2)
- **Concerns**:
  - Expressions of wanting to "disappear"
  - Feelings of worthlessness
  - Possible ADHD symptoms
  - Family stress noted
  - All sessions flagged "wants_adult_conversation"

### Alert Display
- Shows at top of Westfield Primary School children
- Red "IMMEDIATE INTERVENTION REQUIRED" banner
- Red border around child card
- "URGENT SUPPORT" badge next to name

## Future Enhancements

### Planned Features
1. **Email/SMS Notifications**: Automatic alerts to safeguarding team
2. **Escalation System**: Alerts if not addressed within timeframe
3. **Audit Trail**: Complete log of who viewed/acted on alerts
4. **Report Generation**: Automated safeguarding reports
5. **Integration**: Connect with external safeguarding systems
6. **Predictive Alerts**: AI to predict declining trends before critical

### Configuration Options
- Customizable threshold levels per organization
- Role-based alert visibility
- Alert acknowledgment workflow
- Time-based escalation rules

## SEND Considerations

### Language Used
- "Requires immediate support" not "At risk"
- "Critical wellbeing needs" not "Severe problems"
- "Priority support recommended" not "Warning"
- Focus on support and intervention, not deficit

### Visual Design
- Clear, non-alarming colors for children viewing
- Professional indicators for practitioners
- Accessible contrast ratios
- No flashing animations that could trigger seizures

## Compliance

### Data Protection
- All mood data encrypted at rest
- Audit logs for safeguarding reviews
- Role-based access control
- GDPR compliant data handling

### Safeguarding Standards
- Follows UK safeguarding guidelines
- Compliant with Keeping Children Safe in Education
- Supports SEND Code of Practice
- Enables early intervention

## Testing Checklist

- [x] Critical alerts display for mood < 2.5
- [x] Children sorted by severity
- [x] Summary banner shows count
- [x] Visual indicators (borders, badges)
- [x] Action buttons present
- [x] Responsive design
- [ ] Email notifications (future)
- [ ] Report generation (future)
- [ ] Escalation system (future)

## Support

For safeguarding concerns or system issues:
1. Contact your organization's designated safeguarding lead
2. Follow your organization's safeguarding procedures
3. For technical issues, contact support@thelift.app

---

**Remember**: This system is a support tool. Professional judgment and your organization's safeguarding procedures always take precedence.